Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A26EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 13:55:47 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.13818.1686664537328812995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 06:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oWJ0dLYD;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-559b0ddcd4aso3304678eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686664536; x=1689256536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dMybHgUKgzPmratvBqSTSq6AVD49uqLOwpQoq1XUVLA=;
        b=oWJ0dLYD3NUaiSDJ+pjBMaJkPKhse/XEhjy3IlzSgMCgKQMrOhVeQU/xQE5Csnjei5
         I7HVPR/MvJIsmIRenC+sIyDpg7qDv4jrRS2K06GmyuSQV5NjuhMHd6K8FtXbbpG9iarb
         HebaxRVLF1oYdt0+fV8ZC9qn+l2sY4/AIXgsct7vQ66XznVSdkXJVukS1W8rNXRd4FIS
         Y2cSim60IlUvwr8uVI16gIBth4TXaFbIKgzKonDfnA97Iy1cpSX5ye9qK9ryVo/ikjTj
         KYtOiXQCrzuebbGyV358lB3fLIVKAaCedluAeNN1u6d1AqiX/jjnH8BzCEhXf/km4hQW
         RFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664536; x=1689256536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMybHgUKgzPmratvBqSTSq6AVD49uqLOwpQoq1XUVLA=;
        b=l9u78eJRftVGNkHsK1zgvL8ggZyvVdcJGOmkBmRi/U9NTlCWI8maNnvCj7csyfG/N4
         DImYvBub6lsN3WjGaVXhgZ35Ojff6Y0LWDYxxzpfqaZgyaW28OBGpwlB2D4S+iTZrkNT
         2IRoYbcZdOeCs9o7gGJAUAxYpwRKZRn4zMsYcI5f0ePFjzpFiObGyc7HNkwkpgaijM0F
         WvfrKzxGAqM5LNrhywkqXYBC0DjcOid6OBPE3s/jje8EFp0R0e1ICVPxYWbAwk1ycZki
         3wpj3vdwFA9nqkf39AfaF8aBlhPbfPB5Dx9ojBmOf5T7Hm4ZL/TTIIjLzKZ9dBDleyL9
         c52w==
X-Gm-Message-State: AC+VfDwzR3FdmrjAbsYSmf/BgcQT0zQWisB9cHjkcZ1KJE3TKuidl/4F
	gRWEAFxEDZ78ojzmFkjBNgDMLrS95gNpyWnF2o6kLhKm
X-Google-Smtp-Source: ACHHUZ6tcpXiHnVKC5lqhuj06DOArotYSxeRtJcMfWI8X2nwyA/PFDLUWxMBBhpFBpv9H0tk2y7E1wbHiCqewQrkpD4=
X-Received: by 2002:a4a:d241:0:b0:555:7682:7644 with SMTP id
 e1-20020a4ad241000000b0055576827644mr7549008oos.2.1686664536316; Tue, 13 Jun
 2023 06:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230612181054.674846-1-raj.khem@gmail.com> <A617FA16-34E1-4971-90D8-E696887211D0@arm.com>
In-Reply-To: <A617FA16-34E1-4971-90D8-E696887211D0@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2023 06:55:25 -0700
Message-ID: <CAMKF1spAoEU6V6RRnDpFQgAFSuR1t=Qk9d0kM4=KvzZU7Kg8bQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] parted: Add missing libuuid to linker cmdline
 for libparted-fs-resize.so
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008adf1905fe033017"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 13:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182715

--0000000000008adf1905fe033017
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Exactly I can rebase and send v2

On Tue, Jun 13, 2023 at 3:30 AM Ross Burton <Ross.Burton@arm.com> wrote:

> On 12 Jun 2023, at 19:10, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > diff --git a/meta/recipes-extended/parted/parted_3.5.bb
> b/meta/recipes-extended/parted/parted_3.5.bb
> > index f403840d3c2..b269c143b41 100644
> > --- a/meta/recipes-extended/parted/parted_3.5.bb
> > +++ b/meta/recipes-extended/parted/parted_3.5.bb
> > @@ -9,6 +9,7 @@ DEPENDS =3D "ncurses util-linux virtual/libiconv"
> > SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
> >            file://fix-doc-mandir.patch \
> >            file://autoconf-2.73.patch \
>   ^^^^
>
> Doesn=E2=80=99t apply cleanly as this patch doesn=E2=80=99t exist in mast=
er.  I guess
> these build on top of a series testing the new autoconf?
>
> Ross

--0000000000008adf1905fe033017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Exactly I can rebase and send v2</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 13, 2023=
 at 3:30 AM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Bur=
ton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 12 Ju=
n 2023, at 19:10, Khem Raj via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;raj.khem=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/parted/<a href=3D"http://parted_3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">parted_3.5.bb</a> b/meta/recipes-=
extended/parted/<a href=3D"http://parted_3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">parted_3.5.bb</a><br>
&gt; index f403840d3c2..b269c143b41 100644<br>
&gt; --- a/meta/recipes-extended/parted/<a href=3D"http://parted_3.5.bb" re=
l=3D"noreferrer" target=3D"_blank">parted_3.5.bb</a><br>
&gt; +++ b/meta/recipes-extended/parted/<a href=3D"http://parted_3.5.bb" re=
l=3D"noreferrer" target=3D"_blank">parted_3.5.bb</a><br>
&gt; @@ -9,6 +9,7 @@ DEPENDS =3D &quot;ncurses util-linux virtual/libiconv&=
quot;<br>
&gt; SRC_URI =3D &quot;${GNU_MIRROR}/parted/parted-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-doc-mandir.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autoconf-2.73.patch \<=
br>
=C2=A0 ^^^^<br>
<br>
Doesn=E2=80=99t apply cleanly as this patch doesn=E2=80=99t exist in master=
.=C2=A0 I guess these build on top of a series testing the new autoconf?<br=
>
<br>
Ross</blockquote></div></div>

--0000000000008adf1905fe033017--

