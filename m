Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0E167FDAE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 14:49:02 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id h32so809803uah.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 06:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E7huHJRyPLcLdM1pn3fTdj7tv5pRv8uPP1HhMqf9tHE=;
	b=u0d1wvIq873vy1OROQpY56rjCc4lTD1XUre9WlbnZFmzvbLAkZsdUaF5T1FJtoZqM6
	pfA6qesc1zLS11dRKEFSsx9cAkFBkW+DBVz/SeH/UoyNTFVUPBDmdynUGWG5KyfMGjFU
	7G8mlffehZ8SeaM5Tztvh/l9WWweZQL6v/CY34mFcaN8qv2+rZSmzgX8CgyjclWdT2HM
	ySsI+zpFNXh3JfKIe0Be5/t6JMkxv1CfVO8MqGwhHaAsjMJHAprGrV9D/2u667U7Hb/l
	NA9GgQ6k4Qc1Kiyvu6JWKZIh+ftwXE2xavEp43qr4f2ryeWTZO88H8vOGZajdzpUEAeP
	8y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E7huHJRyPLcLdM1pn3fTdj7tv5pRv8uPP1HhMqf9tHE=;
	b=mg43zgIn3EyL1UGpl9L/2mrWTO+WjJ1h02EZg8BqFkDHeAi8vOtWqSnn4BhTDhBL4Q
	f6/lMdUGlc2pFxz8+nzarKB3oKg/7RzZ4Tc7djvUK5jkjlyUNLyP4HGFACYwIz3FQ1Jl
	fVPM7No3YGcUPDvcHzuqILvo807Hhutb8Xvdn/15z3eOYzKttJwzSi5yKU/Bi0FUkICX
	k1YXI6vQNwj5dpRu78Bl/HsBeoIcGa06OA5vWY2yPkTy9Ou5pKDnzqyPra3sflrmkquP
	PSdVB0wJk54HLXAcYSNloos088bJAhikrJvqm6v8WWphtvlhodLmV2YWJ2tFQO0kO9MN
	k2RQ==
X-Gm-Message-State: APjAAAUuEtBzVPRGLnZZYT9RPnhrH6he42UrUyDMQYA4txeQxrhqP1xt
	bIdChs/QOt6HWvEMppL6rEO7gLMUxLUQd5fZP+OxVK65
X-Google-Smtp-Source: APXvYqzqh8oALi6DWh10T4LQmZ7opXyRucSg+/JIfoTb1prgWY4PtD2jxQaBoOeFRZ0KbQGTmYPaZDI9aON2Gvm4xyQ=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr2230805uae.89.1578667743605; 
	Fri, 10 Jan 2020 06:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-7-alex.kanavin@gmail.com>
	<c03bd9ff0e73c5bde8ae080d0ce057b90094c691.camel@linuxfoundation.org>
In-Reply-To: <c03bd9ff0e73c5bde8ae080d0ce057b90094c691.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Jan 2020 15:48:51 +0100
Message-ID: <CANNYZj_+jFzzcEN2_M2BogB06TZw_HtD35ZTSxWDGYKXCFNUrg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/28] acl/attr: update to latest upstream releases
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
X-List-Received-Date: Fri, 10 Jan 2020 14:49:03 -0000
Content-Type: multipart/alternative; boundary="0000000000001376d5059bca3abb"

--0000000000001376d5059bca3abb
Content-Type: text/plain; charset="UTF-8"

This was because ptests shipped a Makefile without stripping build paths
out. I'll resend with a fix.

Alex

On Fri, 10 Jan 2020 at 12:02, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > The latest release use standard autotools, so drop all
> > the build system related hacks and patches.
> >
> > Ptests have been rewritten, with 100% pass rate for both.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../0001-test-patch-out-failing-bits.patch    |  63 ++
> >  ...dcode-the-build-path-into-a-helper-l.patch |  24 +
> >  ...file-libacl-should-depend-on-include.patch |  51 --
> >  ...-order-of-expected-output-of-getfacl.patch | 198 ------
> >  meta/recipes-support/attr/acl/configure.ac    |  49 --
> >  meta/recipes-support/attr/acl/run-ptest       |  60 +-
> >  .../acl/test-fix-directory-permissions.patch  |  37 -
> >  .../test-fix-insufficient-quoting-of.patch    | 100 ---
> >  ...-SELinux-machines-for-root-testcases.patch |  84 ---
> >  meta/recipes-support/attr/acl_2.2.52.bb       |  52 --
> >  meta/recipes-support/attr/acl_2.2.53.bb       |  64 ++
> >  meta/recipes-support/attr/attr.inc            |  41 +-
> >  .../0001-Use-stdint-types-consistently.patch  |  69 --
> >  .../attr/attr/attr-Missing-configure.ac.patch |  63 --
> >  .../attr/attr/dont-use-decl-macros.patch      |  56 --
> >  meta/recipes-support/attr/attr/run-ptest      |   3 +
> >  meta/recipes-support/attr/attr_2.4.47.bb      |  15 -
> >  meta/recipes-support/attr/attr_2.4.48.bb      |   6 +
> >  meta/recipes-support/attr/ea-acl.inc          |  52 --
> >  ...option-to-enable-disable-static-libr.patch |  70 --
> >  ...e-attr.5-man-page-moved-to-man-pages.patch | 240 -------
> >
>
> Fails build reproducibility in ptest:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/610
>
> Cheers,
>
> Richard
>
>

--0000000000001376d5059bca3abb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This was because ptests shipped a Makefile without st=
ripping build paths out. I&#39;ll resend with a fix.</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, 10 Jan 2020 at 12:02, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:<br>
&gt; The latest release use standard autotools, so drop all<br>
&gt; the build system related hacks and patches.<br>
&gt; <br>
&gt; Ptests have been rewritten, with 100% pass rate for both.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-test-patch-out-failing-bits.patch=C2=A0 =C2=A0 |=C2=A0 =
63 ++<br>
&gt;=C2=A0 ...dcode-the-build-path-into-a-helper-l.patch |=C2=A0 24 +<br>
&gt;=C2=A0 ...file-libacl-should-depend-on-include.patch |=C2=A0 51 --<br>
&gt;=C2=A0 ...-order-of-expected-output-of-getfacl.patch | 198 ------<br>
&gt;=C2=A0 meta/recipes-support/attr/acl/<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 |=C2=A0 49=
 --<br>
&gt;=C2=A0 meta/recipes-support/attr/acl/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 60 +-<br>
&gt;=C2=A0 .../acl/test-fix-directory-permissions.patch=C2=A0 |=C2=A0 37 -<=
br>
&gt;=C2=A0 .../test-fix-insufficient-quoting-of.patch=C2=A0 =C2=A0 | 100 --=
-<br>
&gt;=C2=A0 ...-SELinux-machines-for-root-testcases.patch |=C2=A0 84 ---<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://acl_2.2.52.bb" rel=
=3D"noreferrer" target=3D"_blank">acl_2.2.52.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 52 --<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://acl_2.2.53.bb" rel=
=3D"noreferrer" target=3D"_blank">acl_2.2.53.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 64 ++<br>
&gt;=C2=A0 meta/recipes-support/attr/attr.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 41 +-<br>
&gt;=C2=A0 .../0001-Use-stdint-types-consistently.patch=C2=A0 |=C2=A0 69 --=
<br>
&gt;=C2=A0 .../attr/attr/attr-Missing-configure.ac.patch |=C2=A0 63 --<br>
&gt;=C2=A0 .../attr/attr/dont-use-decl-macros.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 56 --<br>
&gt;=C2=A0 meta/recipes-support/attr/attr/run-ptest=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://attr_2.4.47.bb" rel=
=3D"noreferrer" target=3D"_blank">attr_2.4.47.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 15 -<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://attr_2.4.48.bb" rel=
=3D"noreferrer" target=3D"_blank">attr_2.4.48.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 meta/recipes-support/attr/ea-acl.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 52 --<br>
&gt;=C2=A0 ...option-to-enable-disable-static-libr.patch |=C2=A0 70 --<br>
&gt;=C2=A0 ...e-attr.5-man-page-moved-to-man-pages.patch | 240 -------<br>
&gt; <br>
<br>
Fails build reproducibility in ptest:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/build=
s/610" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/86/builds/610</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000001376d5059bca3abb--
