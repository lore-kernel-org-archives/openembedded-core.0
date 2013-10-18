Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3498C6CFE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 18:53:40 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2312076eei.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8bErE/8LhyRMQJ2ThgggPHOpbn2A1sWUom2obYSAq90=;
	b=lgQxJfzpzeySJGANfRHMuGgIYblgtm9bWsBemhdYVIaWk5EYZeUgAx+SdyO413MzDf
	44EqMCPqOvZcWkuBdGsyvpmoH6T8z8majhbNF0WlMe3cZ1lQCNsluiN98spvRBIlMX9f
	RU8vBr8TpQthep2LY+SXAdAnCPAYIF1rrOBtHTGuglATbu6x+cYu7jQX7yeYs16c5gpl
	atDc/PCEKvSF/6ruhR4dDN8zd/LbaZwm1zoiU72rrX3q8dpCXudB3o3kAMye+DdXp0b6
	LIe35He98Yix7qKLe+u09XbC3PrrQdUOVQ40BTxT7dEsL8W17wcyvcLBMsM9MKMZ43sa
	UZFg==
MIME-Version: 1.0
X-Received: by 10.14.225.199 with SMTP id z47mr6618930eep.24.1382122420784;
	Fri, 18 Oct 2013 11:53:40 -0700 (PDT)
Received: by 10.14.118.15 with HTTP; Fri, 18 Oct 2013 11:53:40 -0700 (PDT)
Received: by 10.14.118.15 with HTTP; Fri, 18 Oct 2013 11:53:40 -0700 (PDT)
In-Reply-To: <1382108082.29912.550.camel@ted>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
	<1382018386-25389-11-git-send-email-david.nystrom@enea.com>
	<1382108082.29912.550.camel@ted>
Date: Fri, 18 Oct 2013 20:53:40 +0200
Message-ID: <CAAKB1h1-3sJUxEjh+6gOCamkY544m7s37KpyuiEw_SHyNH4+Kg@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/11] nativesdk-packagegroup-sdk-host: Add new DISTRO_FEATURE, sdk-pms
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 18:53:41 -0000
Content-Type: multipart/alternative; boundary=047d7b66fc0fed521a04e908733e

--047d7b66fc0fed521a04e908733e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 18 Oct 2013 16:54, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:
>
> On Thu, 2013-10-17 at 15:59 +0200, David Nystr=F6m wrote:
> > Added a new distro feature called sdk-pms, since smartpm rdepends
> > on the python runtime.
> > This to avoid bloating the SDK tarball for those who does not
> > want it.
> >
> > Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> > ---
> >  meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 3
++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/
nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/
nativesdk-packagegroup-sdk-host.bb
> > index e298ff4..1f45c4c 100644
> > --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.b=
b
> > +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.b=
b
> > @@ -16,7 +16,8 @@ RDEPENDS_${PN} =3D "\
> >      nativesdk-qemu-helper \
> >      nativesdk-pseudo \
> >      nativesdk-unfs-server \
> > -    nativesdk-opkg \
> > +    ${@base_contains('DISTRO_FEATURES', 'sdk-pms',
'nativesdk-opkg','', d)} \
> > +    ${@base_contains('DISTRO_FEATURES', 'sdk-pms',
'nativesdk-smartpm','', d)} \
> >      nativesdk-libtool \
> >      nativesdk-autoconf \
> >      nativesdk-automake \
>
> I think we need to keep a list of DISTRO_FEATURES somewhere along with a
> definition about what the feature is supposed to do. For example this is
> clearly about power management, right? :)
>
> Along with this addition could you start a list somewhere documenting
> this?

Sure, where would be a good place to start this ?
In the Reference manual ?

Br,
David

>
> Cheers,
>
> Richard
>
>

--047d7b66fc0fed521a04e908733e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 18 Oct 2013 16:54, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br>
&gt;<br>
&gt; On Thu, 2013-10-17 at 15:59 +0200, David Nystr=F6m wrote:<br>
&gt; &gt; Added a new distro feature called sdk-pms, since smartpm rdepends=
<br>
&gt; &gt; on the python runtime.<br>
&gt; &gt; This to avoid bloating the SDK tarball for those who does not<br>
&gt; &gt; want it.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: David Nystr=F6m &lt;<a href=3D"mailto:david.nystro=
m@enea.com">david.nystrom@enea.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0meta/recipes-core/packagegroups/<a href=3D"http://nativesdk-pa=
ckagegroup-sdk-host.bb">nativesdk-packagegroup-sdk-host.bb</a> | 3 ++-<br>
&gt; &gt; =A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://na=
tivesdk-packagegroup-sdk-host.bb">nativesdk-packagegroup-sdk-host.bb</a> b/=
meta/recipes-core/packagegroups/<a href=3D"http://nativesdk-packagegroup-sd=
k-host.bb">nativesdk-packagegroup-sdk-host.bb</a><br>

&gt; &gt; index e298ff4..1f45c4c 100644<br>
&gt; &gt; --- a/meta/recipes-core/packagegroups/<a href=3D"http://nativesdk=
-packagegroup-sdk-host.bb">nativesdk-packagegroup-sdk-host.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/packagegroups/<a href=3D"http://nativesdk=
-packagegroup-sdk-host.bb">nativesdk-packagegroup-sdk-host.bb</a><br>
&gt; &gt; @@ -16,7 +16,8 @@ RDEPENDS_${PN} =3D &quot;\<br>
&gt; &gt; =A0 =A0 =A0nativesdk-qemu-helper \<br>
&gt; &gt; =A0 =A0 =A0nativesdk-pseudo \<br>
&gt; &gt; =A0 =A0 =A0nativesdk-unfs-server \<br>
&gt; &gt; - =A0 =A0nativesdk-opkg \<br>
&gt; &gt; + =A0 =A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;sdk-pms=
&#39;, &#39;nativesdk-opkg&#39;,&#39;&#39;, d)} \<br>
&gt; &gt; + =A0 =A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;sdk-pms=
&#39;, &#39;nativesdk-smartpm&#39;,&#39;&#39;, d)} \<br>
&gt; &gt; =A0 =A0 =A0nativesdk-libtool \<br>
&gt; &gt; =A0 =A0 =A0nativesdk-autoconf \<br>
&gt; &gt; =A0 =A0 =A0nativesdk-automake \<br>
&gt;<br>
&gt; I think we need to keep a list of DISTRO_FEATURES somewhere along with=
 a<br>
&gt; definition about what the feature is supposed to do. For example this =
is<br>
&gt; clearly about power management, right? :)<br>
&gt;<br>
&gt; Along with this addition could you start a list somewhere documenting<=
br>
&gt; this?</p>
<p dir=3D"ltr">Sure, where would be a good place to start this ?<br>
In the Reference manual ?</p>
<p dir=3D"ltr">Br,<br>
David</p>
<p dir=3D"ltr">&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
</p>

--047d7b66fc0fed521a04e908733e--
