Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1UFVfl-0008O6-Cs
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 21:19:50 +0100
Received: by mail-ob0-f182.google.com with SMTP id va7so252306obc.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 13:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=kAvVPsB1g7tACUFyguKoKQ09q02jylAQw0+M3HbQQHw=;
	b=PA+AQjJTQ/JFG52KdEofd9NA7ac4Vl+XZFebIpj2oM6St6Q+EwnwvGkMv4lTWOdaV0
	S2tiV+nt9xso+GKlpLJ2+79e0KNqzqOsmFHgc5nKWoazMHOY64Amt+RLxCJa1P95+jwi
	U2YXFdKfhcO2QqjJjeVFIi7dm0Gj+cCEMbYHI0jiHUsfXboPbk3D52EFLhuxrg8EtYW6
	KcdFmo4hg8SI/uKRXIoUNZEIkRE9iNPmPkE5V/nUiEHMLQcf7fn98EltrL9FBuDVFY3i
	lz8lryrn3AAiqv8kwR9BydyCe11nZihRzXVKuFQgi+ZNI7s+l2Y8SwJYQcHiliUGex24
	0vBA==
MIME-Version: 1.0
X-Received: by 10.182.144.6 with SMTP id si6mr13391379obb.38.1363118585181;
	Tue, 12 Mar 2013 13:03:05 -0700 (PDT)
Received: by 10.76.75.197 with HTTP; Tue, 12 Mar 2013 13:03:05 -0700 (PDT)
In-Reply-To: <196712EC-5C47-410B-AF25-605049A35CF3@gmail.com>
References: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
	<196712EC-5C47-410B-AF25-605049A35CF3@gmail.com>
Date: Tue, 12 Mar 2013 22:03:05 +0200
Message-ID: <CAJ2CSBvmyxsjNE9Wx3r64gGSTy-3QO+phRDYPjzrN9Skub15MA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQm8gdAS4yqjBmh0APECPVe/hMBAmyzY2eX/rjd7LvHkD9efo5mhf3nb+y7ZYycXvauPLQ5q
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Patch V3] Coreutils 6.9 depends on libattr
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 20:19:59 -0000
Content-Type: multipart/alternative; boundary=14dae9398ead0e8b6f04d7bfc7c9

--14dae9398ead0e8b6f04d7bfc7c9
Content-Type: text/plain; charset=UTF-8

I'm gonna take out the attr dependency altogether on advice from Saul and
Richard


On Tue, Mar 12, 2013 at 7:57 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Mar 12, 2013, at 2:56 AM, Alex DAMIAN <alexandru.damian@intel.com>
> wrote:
>
> > From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >
> > We have a build dependency, so list it out.
> >
> > Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> > ---
> > meta/recipes-core/coreutils/coreutils_6.9.bb |    1 +
> > 1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bbb/meta/recipes-core/coreutils/
> coreutils_6.9.bb
> > index c0778ba..f712692 100644
> > --- a/meta/recipes-core/coreutils/coreutils_6.9.bb
> > +++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
> > @@ -9,6 +9,7 @@ LICENSE = "GPLv2+"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> >
> file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
> > PR = "r5"
> > +DEPENDS = "attr"
>
> isn't it needed on native recipe too ?
>
> > DEPENDS_class-native = "gettext-native"
> >
> > inherit autotools gettext
> > --
> > 1.7.10.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--14dae9398ead0e8b6f04d7bfc7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m gonna take out the attr dependency altogether on a=
dvice from Saul and Richard</div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On Tue, Mar 12, 2013 at 7:57 PM, Khem Raj <span dir=3D"=
ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><br>
On Mar 12, 2013, at 2:56 AM, Alex DAMIAN &lt;<a href=3D"mailto:alexandru.da=
mian@intel.com">alexandru.damian@intel.com</a>&gt; wrote:<br>
<br>
&gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.co=
m">alexandru.damian@intel.com</a>&gt;<br>
&gt;<br>
&gt; We have a build dependency, so list it out.<br>
&gt;<br>
&gt; Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian=
@intel.com">alexandru.damian@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-core/coreutils/<a href=3D"http://coreutils_6.9.bb" target=
=3D"_blank">coreutils_6.9.bb</a> | =C2=A0 =C2=A01 +<br>
&gt; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_6=
.9.bb" target=3D"_blank">coreutils_6.9.bb</a> b/meta/recipes-core/coreutils=
/<a href=3D"http://coreutils_6.9.bb" target=3D"_blank">coreutils_6.9.bb</a>=
<br>

&gt; index c0778ba..f712692 100644<br>
&gt; --- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_6.9.bb" =
target=3D"_blank">coreutils_6.9.bb</a><br>
&gt; +++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_6.9.bb" =
target=3D"_blank">coreutils_6.9.bb</a><br>
&gt; @@ -9,6 +9,7 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499f7aba=
abaa882bbe \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
file://src/ls.c;beginline=3D4;endline=3D16;md5=3D15ed60f67b1db5fedd5dbc37cf=
8a9543&quot;<br>
&gt; PR =3D &quot;r5&quot;<br>
&gt; +DEPENDS =3D &quot;attr&quot;<br>
<br>
</div>isn&#39;t it needed on native recipe too ?<br>
<div class=3D"im"><br>
&gt; DEPENDS_class-native =3D &quot;gettext-native&quot;<br>
&gt;<br>
&gt; inherit autotools gettext<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
</blockquote></div><br></div>

--14dae9398ead0e8b6f04d7bfc7c9--
