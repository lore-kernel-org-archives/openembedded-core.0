Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26945C35280
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.1851.1649873299219866762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 11:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LrCME6dw;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: kergoth@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id s14so2607656plk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version;
        bh=waLf9K+0MpMACjxapPlsdd3/yYYrZbK8S5QLA7LQyJE=;
        b=LrCME6dwr0RxI7G0gSH0vWJkKFEe6AotQPrtyjj6ktfZ44hZPg4xnunMytGaZRrmhQ
         iV/FmA+K48eBnMglmr5aKEP2MwZ11hBdG+CrT4++2KWMab5+T+c0NV13D4nb6GwvmO4g
         WCxRD4YBVjELnFw7ABpgAqrD9BkYDhQbVe2xYpnLl7mHyTPL1CvBlwpoSlwkIKb+kEXw
         mfoC5E4U6FVP1L5xHB4AJ96cqaW8HESPxsWNHRdz9Q05uFdUB+Gqo+Btpbk5MKWl2WID
         mSF28xwKae/7vrCyb479PGaiwtdNj0vxdxUJ44igWQzdQqsI+lZR84xBH9yDycwpUUwR
         h66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version;
        bh=waLf9K+0MpMACjxapPlsdd3/yYYrZbK8S5QLA7LQyJE=;
        b=zVsQQHwJxyDdlFLunWTxma5gK3ZpbAO9biLmgSrZ3abw16hchI0hOG9c7qTsdJ/PUJ
         2yhPy9ylrPyyvOgXFvPiIxDv1bpf+rH39NvpEuct6wBx3dmfJjNqevN4Qu9uklCKP/Vf
         XuVLiUlHe6JcNOdiTYc6eb8K87/oSrOgqU+FIrNh19FqQFuBf7lPofEjhlPeSub85d16
         MCjysaZI8EKxR9nwdtUM9tbJpSdYuh0MYM+DFLxDXFdlNPUSPPN529vvBNDqIycMgWkP
         YYf1YqYk6JkE8gDM9HqQCTlkvwx0E0kTSoyGdQdAjnag3RV+ZW2wxSr8gwhh9zPr3Zoe
         KkHA==
X-Gm-Message-State: AOAM531hrBvCY6KQJl9skJwl5v41JQz2CDZ7zzi8d2CTpB8gdHOIutqC
	5Sd08UOQ0PGyMjBcPhwwVkNGrbX/4mpCaA==
X-Google-Smtp-Source: 
 ABdhPJyojCznJelEt7hP/SxHLAdqo9ugBxE4szlD4YcL+6/JoslLd0lr5r7bBc+A2/46aDG3HIPdzA==
X-Received: by 2002:a17:903:41c2:b0:158:83f7:f8a9 with SMTP id
 u2-20020a17090341c200b0015883f7f8a9mr10697823ple.146.1649873298301;
        Wed, 13 Apr 2022 11:08:18 -0700 (PDT)
Received: from [192.168.1.50] (ip70-188-217-212.ph.ph.cox.net.
 [70.188.217.212])
        by smtp.gmail.com with ESMTPSA id
 oa16-20020a17090b1bd000b001c72b632222sm3937872pjb.32.2022.04.13.11.08.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Apr 2022 11:08:17 -0700 (PDT)
Date: Wed, 13 Apr 2022 11:07:57 -0700
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Message-ID: <4845061c-b8d2-43e7-b426-71bb4d803776@Spark>
In-Reply-To: 
 <8c3060148a98b280c93b7eb5da65699f1c6745aa.camel@linuxfoundation.org>
References: <20220413160033.8456-1-kergoth@gmail.com>
 <8c3060148a98b280c93b7eb5da65699f1c6745aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] license: add 'any_incompatible'
 function
X-Readdle-Message-ID: 4845061c-b8d2-43e7-b426-71bb4d803776@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6257118a_6b8b4567_3ae9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164356

--6257118a_6b8b4567_3ae9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

It=E2=80=99s just an example, but you=E2=80=99re right, I=E2=80=99ll chan=
ge to a better one. Thanks=21

--
Christopher Larson
chris=5Flarson=40mentor.com, chris.larson=40siemens.com, kergoth=40gmail.=
com
Principal Software Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens =
Digital Industries Software
On Apr 13, 2022, 10:44 AM -0700, Richard Purdie <richard.purdie=40linuxfo=
undation.org>, wrote:
> On Wed, 2022-04-13 at 16:00 +0000, Christopher Larson wrote:
> > This function returns True if any of the specified packages are skipp=
ed due to
> > incompatible license.
> >
> > License exceptions are obeyed. The user may specify the package's lic=
ense for
> > cross-recipe checks.
> >
> > This allows for additions to packagegroups only for non-incompatible =
builds. =46or
> > example:
> >
> > RDEPENDS=5F=24=7BPN=7D +=3D =22=24=7B=40'dbench' if not any=5Fincompa=
tible(d, 'dbench', 'GPL-3.0-only') else ''=7D=22
> >
> > Signed-off-by: Christopher Larson <chris=5Flarson=40mentor.com>
> > ---
> > meta/classes/license.bbclass =7C 38 +++++++++++++++++++
> > .../packagegroups/packagegroup-base.bb =7C 2 +
> > 2 files changed, 40 insertions(+)
> >
> > v2 changes: fixed string packages logic, corrected reference to
> > apply=5Fpkg=5Flicense=5Fexception, and avoided use of =24=7B=40=7D in=
 the function docstring
> > to avoid bitbake expanding it and recursing.
> >
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbcl=
ass
> > index 0c637e966e..41993b7227 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > =40=40 -320,6 +320,44 =40=40 def incompatible=5Flicense(d, dont=5Fwan=
t=5Flicenses, package=3DNone):
> >
> > return incompatible=5Fpkg=5Flicense(d, dont=5Fwant=5Flicenses, licens=
e)
> >
> > +def any=5Fincompatible(d, packages, licensestring=3DNone):
> > + =22=22=22Return True if any of the packages are skipped due to inco=
mpatible license.
> > +
> > + License exceptions are obeyed. The user may specify the package's l=
icense
> > + for cross-recipe checks.
> > +
> > + This allows for additions to packagegroups only for non-incompatibl=
e builds.
> > +
> > + =46or example: 'dbench' if not any=5Fincompatible(d, 'dbench', 'GPL=
-3.0-only') else ''
> > + =22=22=22
> > + import oe.license
> > +
> > + if isinstance(packages, str):
> > + packages =3D packages.split()
> > +
> > + bad=5Flicenses =3D (d.getVar(=22INCOMPATIBLE=5FLICENSE=22) or =22=22=
).split()
> > + if not bad=5Flicenses:
> > + return =46alse
> > + bad=5Flicenses =3D expand=5Fwildcard=5Flicenses(d, bad=5Flicenses)
> > +
> > + if licensestring is None:
> > + licensestring =3D d.getVar(=22LICENSE:%s=22 % package) if package e=
lse None
> > + if not licensestring:
> > + licensestring =3D d.getVar(=22LICENSE=22)
> > +
> > + exceptions =3D (d.getVar(=22INCOMPATIBLE=5FLICENSE=5FEXCEPTIONS=22)=
 or =22=22).split()
> > + for pkg in packages:
> > + remaining=5Fbad=5Flicenses =3D oe.license.apply=5Fpkg=5Flicense=5Fe=
xception(
> > + pkg, bad=5Flicenses, exceptions
> > + )
> > +
> > + incompatible=5Flic =3D incompatible=5Fpkg=5Flicense(
> > + d, remaining=5Fbad=5Flicenses, licensestring
> > + )
> > + if incompatible=5Flic:
> > + return True
> > + return =46alse
> > +
> > def check=5Flicense=5Fflags(d):
> > =22=22=22
> > This function checks if a recipe has any LICENSE=5F=46LAGS that
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/m=
eta/recipes-core/packagegroups/packagegroup-base.bb
> > index 7489ef61b0..1c97d03c21 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > =40=40 -14,6 +14,8 =40=40 PACKAGES =3D ' =5C
> > packagegroup-distro-base =5C
> > packagegroup-machine-base =5C
> > =5C
> > + =24=7B=40=22dbench=22 if not any=5Fincompatible(d, =22dbench=22, =22=
GPL-3.0-only=22) else =22=22=7D =5C
> > + =5C
> > =24=7B=40bb.utils.contains(=22MACHINE=5F=46EATURES=22, =22acpi=22, =22=
packagegroup-base-acpi=22, =22=22,d)=7D =5C
> > =24=7B=40bb.utils.contains(=22MACHINE=5F=46EATURES=22, =22alsa=22, =22=
packagegroup-base-alsa=22, =22=22, d)=7D =5C
> > =24=7B=40bb.utils.contains(=22MACHINE=5F=46EATURES=22, =22apm=22, =22=
packagegroup-base-apm=22, =22=22, d)=7D =5C
>
> I suspect you didn't mean to include this piece since dbench isn't in c=
ore=3F
>
> Cheers,
>
> Richard
>

--6257118a_6b8b4567_3ae9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>It=E2=80=99s just an example, but you=E2=80=99re ri=
ght, I=E2=80=99ll change to a better one. Thanks=21</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div dir=3D=22auto=22>--</div>
<div dir=3D=22auto=22>Christopher Larson</div>
<div dir=3D=22auto=22>chris=5Flarson=40mentor.com, chris.larson=40siemens=
.com, kergoth=40gmail.com</div>
<div dir=3D=22auto=22><span style=3D=22color: var(--textColor); backgroun=
d-color: var(--backgroundColor);=22>Principal Software Engineer,&=23160;<=
/span><span style=3D=22color: var(--textColor); background-color: var(--b=
ackgroundColor);=22>Embedded Linux Solutions,&=23160;</span><span style=3D=
=22color: var(--textColor); background-color: var(--backgroundColor);=22>=
Siemens Digital Industries Software</span><br /></div>
</div>
<div name=3D=22messageReplySection=22>On Apr 13, 2022, 10:44 AM -0700, Ri=
chard Purdie &lt;richard.purdie=40linuxfoundation.org&gt;, wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22border-left-color: grey; border-=
left-width: thin; border-left-style: solid; margin: 5px 5px;padding-left:=
 10px;=22>On Wed, 2022-04-13 at 16:00 +0000, Christopher Larson wrote:<br=
 />
<blockquote type=3D=22cite=22>This function returns True if any of the sp=
ecified packages are skipped due to<br />
incompatible license.<br />
<br />
License exceptions are obeyed. The user may specify the package's license=
 for<br />
cross-recipe checks.<br />
<br />
This allows for additions to packagegroups only for non-incompatible buil=
ds. =46or<br />
example:<br />
<br />
RDEPENDS=5F=24=7BPN=7D +=3D =22=24=7B=40'dbench' if not any=5Fincompatibl=
e(d, 'dbench', 'GPL-3.0-only') else ''=7D=22<br />
<br />
Signed-off-by: Christopher Larson &lt;chris=5Flarson=40mentor.com&gt;<br =
/>
---<br />
meta/classes/license.bbclass =7C 38 +++++++++++++++++++<br />
.../packagegroups/packagegroup-base.bb =7C 2 +<br />
2 files changed, 40 insertions(+)<br />
<br />
v2 changes: fixed string packages logic, corrected reference to<br />
apply=5Fpkg=5Flicense=5Fexception, and avoided use of =24=7B=40=7D in the=
 function docstring<br />
to avoid bitbake expanding it and recursing.<br />
<br />
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass<=
br />
index 0c637e966e..41993b7227 100644<br />
--- a/meta/classes/license.bbclass<br />
+++ b/meta/classes/license.bbclass<br />
=40=40 -320,6 +320,44 =40=40 def incompatible=5Flicense(d, dont=5Fwant=5F=
licenses, package=3DNone):<br />
<br />
return incompatible=5Fpkg=5Flicense(d, dont=5Fwant=5Flicenses, license)<b=
r />
<br />
+def any=5Fincompatible(d, packages, licensestring=3DNone):<br />
+ =22=22=22Return True if any of the packages are skipped due to incompat=
ible license.<br />
+<br />
+ License exceptions are obeyed. The user may specify the package's licen=
se<br />
+ for cross-recipe checks.<br />
+<br />
+ This allows for additions to packagegroups only for non-incompatible bu=
ilds.<br />
+<br />
+ =46or example: 'dbench' if not any=5Fincompatible(d, 'dbench', 'GPL-3.0=
-only') else ''<br />
+ =22=22=22<br />
+ import oe.license<br />
+<br />
+ if isinstance(packages, str):<br />
+ packages =3D packages.split()<br />
+<br />
+ bad=5Flicenses =3D (d.getVar(=22INCOMPATIBLE=5FLICENSE=22) or =22=22).s=
plit()<br />
+ if not bad=5Flicenses:<br />
+ return =46alse<br />
+ bad=5Flicenses =3D expand=5Fwildcard=5Flicenses(d, bad=5Flicenses)<br /=
>
+<br />
+ if licensestring is None:<br />
+ licensestring =3D d.getVar(=22LICENSE:%s=22 % package) if package else =
None<br />
+ if not licensestring:<br />
+ licensestring =3D d.getVar(=22LICENSE=22)<br />
+<br />
+ exceptions =3D (d.getVar(=22INCOMPATIBLE=5FLICENSE=5FEXCEPTIONS=22) or =
=22=22).split()<br />
+ for pkg in packages:<br />
+ remaining=5Fbad=5Flicenses =3D oe.license.apply=5Fpkg=5Flicense=5Fexcep=
tion(<br />
+ pkg, bad=5Flicenses, exceptions<br />
+ )<br />
+<br />
+ incompatible=5Flic =3D incompatible=5Fpkg=5Flicense(<br />
+ d, remaining=5Fbad=5Flicenses, licensestring<br />
+ )<br />
+ if incompatible=5Flic:<br />
+ return True<br />
+ return =46alse<br />
+<br />
def check=5Flicense=5Fflags(d):<br />
=22=22=22<br />
This function checks if a recipe has any LICENSE=5F=46LAGS that<br />
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb<br />
index 7489ef61b0..1c97d03c21 100644<br />
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb<br />
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb<br />
=40=40 -14,6 +14,8 =40=40 PACKAGES =3D ' =5C<br />
packagegroup-distro-base =5C<br />
packagegroup-machine-base =5C<br />
=5C<br />
+ =24=7B=40=22dbench=22 if not any=5Fincompatible(d, =22dbench=22, =22GPL=
-3.0-only=22) else =22=22=7D =5C<br />
+ =5C<br />
=24=7B=40bb.utils.contains(=22MACHINE=5F=46EATURES=22, =22acpi=22, =22pac=
kagegroup-base-acpi=22, =22=22,d)=7D =5C<br />
=24=7B=40bb.utils.contains(=22MACHINE=5F=46EATURES=22, =22alsa=22, =22pac=
kagegroup-base-alsa=22, =22=22, d)=7D =5C<br />
=24=7B=40bb.utils.contains(=22MACHINE=5F=46EATURES=22, =22apm=22, =22pack=
agegroup-base-apm=22, =22=22, d)=7D =5C<br /></blockquote>
<br />
I suspect you didn't mean to include this piece since dbench isn't in cor=
e=3F<br />
<br />
Cheers,<br />
<br />
Richard<br />
<br /></blockquote>
</div>
</body>
</html>

--6257118a_6b8b4567_3ae9--


