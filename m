Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3FC6C149
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 05:22:32 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id q14so10236214itc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 22:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eWAb/xWwXr0uW8We+eOyngERIQcbh1jprj1kWigFycw=;
	b=epQepSw1nyW2Hz5JRiMG2vZni4V40WisLde/pRY0ZV0Rsyldeji7Hd/k9SjL18hfNO
	jh4teJVRceDPD5q3LoDTdFBgaicGeGpBliHmEnEZtsIHUK/UNsyWs0XpqrGVXfO39P3G
	LxP2vJFoClg37VxMmbVdCK+17qdW0sfFIz6j3VnnhqeTRTcRl4b6JvJ4DarqlOubcy/V
	wuV1fAyQrtnUhPe9E37T75cgE6eG0Y1MXV4feqnWVxAaOt3tsZGsGSFOueRYr1AZYRBe
	cU2qH7OcM2DDMW+lyv6kKRdi+PPD4ZPgrjmyTHS2m3sHNul2dHO3STudSHgLig3r4t+h
	Uudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eWAb/xWwXr0uW8We+eOyngERIQcbh1jprj1kWigFycw=;
	b=tqSjh0BVBuvJ7WOu38WHkWFv54Fxi2G9DmzjIBPhuVMBmASE8lUv4uI1X4F91zntpp
	iyz56Qm/oDSB0iP2CYJn2+TwrRB+WO00IgL7vxDlOnFpMTe1YQATERvzPS9prKJH5y1e
	5dveJtSeTB+Ul/C11YvbBmwgTE4bwSEQXeC8S7B5es2pr6XUtyXFb3ADOlhoSGNQ5w01
	INvK5l0xQ0984T8OZ6px0IOUXSLvvo6LWKKBVX6qHi7U9JS2MDqo2Zu9PCzAqlFpgvlc
	BeUT+Yi+DgGr+c6xZXLqHX0sNwoau4kLINELz84aDl/Qa5OG6sXTs9eM5H2O5Z3tL8gk
	TXSQ==
X-Gm-Message-State: APjAAAWmqEsNbGPhH+sFbnFi7pauD6CTdbubHZjbKdBLFoTJrcBHO3BL
	G/uzMw9Et672jMv4R3JDe7mJGfCzjRxcDzqISr8=
X-Google-Smtp-Source: APXvYqya3/G4tWPBWaKb7llniBrdf8FK4QVoUiKytohN16lraFh5DII750kbr+Wc/XYldCAEOIMq4yXzhimnHZixCsw=
X-Received: by 2002:a24:a43:: with SMTP id 64mr13302362itw.100.1560144153964; 
	Sun, 09 Jun 2019 22:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<7c1f46d8510f95fe7a35127196bd496935efe384.1559950879.git.timothy.t.orling@linux.intel.com>
	<566287162a0ddfec6fa1935244b9fff9d530039a.camel@intel.com>
In-Reply-To: <566287162a0ddfec6fa1935244b9fff9d530039a.camel@intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 9 Jun 2019 22:22:23 -0700
Message-ID: <CANx9H-DPbvU7VFpT9j1uD2G8whK5b9h13MK=0Qq0sJ5LgW+Ydg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] serf: switch to python3-scons-native
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
X-List-Received-Date: Mon, 10 Jun 2019 05:22:33 -0000
Content-Type: multipart/alternative; boundary="0000000000001882d5058af15ef7"

--0000000000001882d5058af15ef7
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 9, 2019 at 10:10 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> This is causing on CentOS 7:
>
> | DEBUG: Executing shell function do_compile
> | scons: *** SCons version 3.0.5 does not run under Python version
> 3.4.8.
> | Python 2.7 or >= 3.5 is required.
>
> Looks like it's using host python which is at 3.4.8 in this case.
>

Hmmm. Host contamination is bad. We should make sure it is using
python3native.


> Thanks,
>
> Anuj
>
> On Fri, 2019-06-07 at 16:47 -0700, Tim Orling wrote:
> > SCons has supported python3 since v3.0.0, use it.
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > ---
> >  meta/recipes-support/serf/serf_1.3.9.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-
> > support/serf/serf_1.3.9.bb
> > index 65a8114bb4..706c86be47 100644
> > --- a/meta/recipes-support/serf/serf_1.3.9.bb
> > +++ b/meta/recipes-support/serf/serf_1.3.9.bb
> > @@ -14,7 +14,7 @@ SRC_URI[sha256sum] =
> > "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> >
> > -DEPENDS = "python-scons-native openssl apr apr-util util-linux
> > expat"
> > +DEPENDS = "python3-scons-native openssl apr apr-util util-linux
> > expat"
> >
> >  do_compile() {
> >       ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE}
> > PREFIX=${prefix} \
> > --
> > 2.20.1
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001882d5058af15ef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 9, 2019 at 10:10 PM Mittal, Anuj &lt;<a href=3D=
"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">This is causing on CentOS 7:<br>
<br>
| DEBUG: Executing shell function do_compile<br>
| scons: *** SCons version 3.0.5 does not run under Python version<br>
3.4.8.<br>
| Python 2.7 or &gt;=3D 3.5 is required.<br>
<br>
Looks like it&#39;s using host python which is at 3.4.8 in this case.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Hmmm. Host conta=
mination is bad. We should make sure it is using python3native.</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Thanks,<br>
<br>
Anuj<br>
<br>
On Fri, 2019-06-07 at 16:47 -0700, Tim Orling wrote:<br>
&gt; SCons has supported python3 since v3.0.0, use it.<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux=
.intel.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=
=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb=
" rel=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a> b/meta/recipes-<br=
>
&gt; support/serf/<a href=3D"http://serf_1.3.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">serf_1.3.9.bb</a><br>
&gt; index 65a8114bb4..706c86be47 100644<br>
&gt; --- a/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=
=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a><br>
&gt; +++ b/meta/recipes-support/serf/<a href=3D"http://serf_1.3.9.bb" rel=
=3D"noreferrer" target=3D"_blank">serf_1.3.9.bb</a><br>
&gt; @@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D<br>
&gt; &quot;549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS =3D &quot;python-scons-native openssl apr apr-util util-linux=
<br>
&gt; expat&quot;<br>
&gt; +DEPENDS =3D &quot;python3-scons-native openssl apr apr-util util-linu=
x<br>
&gt; expat&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MA=
KE}<br>
&gt; PREFIX=3D${prefix} \<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000001882d5058af15ef7--
