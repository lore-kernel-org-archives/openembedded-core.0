Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55928C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 10:05:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.50765.1704362703879671657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 02:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2zHsJhx;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28c7c9b19f1so204486a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704362703; x=1704967503; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gz43lBDAfceUmbsKFaxAKRxIVKIYj4FHyfhazMCOGOU=;
        b=Q2zHsJhxMB2kMgbYiqYHCXEe+ESwZO9W38qtcitK2b1TEn7vZ2IzMe812MTnEFZQTS
         rEGlW0rm49IxPa4M5FUydz4Iganjht8uipA6ysN01wyEiqVAMWp6Ge4tlepm1vWU88J4
         wPdzrxXQsOdz1ER9BqSJi12RURyjrXYTznpPgEoOv8w4JZmzJqKgNgWOiTTfdM6CqUsB
         cqqGbGOmfqdoqqG2lOqaRQP1v/+nAwjnDy0h+EJcPnliPNafbm7IrcGHrud8Ov7MbALU
         5EbC1pTfBKo0y7zlsBMR/e84QZtoKK6TsC8/+KvGgPDjFvpX0xYV1mZ/D96wMerfvCPy
         fGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704362703; x=1704967503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gz43lBDAfceUmbsKFaxAKRxIVKIYj4FHyfhazMCOGOU=;
        b=Sqcbjg7eYPdxRlE6VR94IvVPyteSo8JCqhhYGIIsEd8uQ3YqF4T76L/UoR9oCCN7I4
         Sg7mek1R67l3mwl7XcHZ56Qww53V6prZInKCTtqH2FUjLdEJXx0pDnhaepnPYiGbAUt2
         NxcZ+bLQteRGJWG4d5lUnA+2/P1MEfHrUMmzAgpCaRN+E5N19qzZ8Wps4zsfZjMqDZLW
         6PrGWK2vFoj7OTe4Sv/DP8ZH5lqSa4I5c4HQ1xw0DTNRqk6wYkFvOEKnn2+qnpI7nlMG
         96N7QnPoKlmoFyplvlYmeoKbXdzAUQnDbxHMa6tu6G/pJBkTTU+iw4EcBlhSaXDCPkDG
         PF0A==
X-Gm-Message-State: AOJu0YyL9nxDpnOL+5//f9dm2rTSVRo00bmYy6Gqf9Eqqsia3ETsdlI1
	EC+/ZsqiFtwVRaOC86Kbb4AIczgdgiXCTO7WTqQ=
X-Google-Smtp-Source: AGHT+IEc9vaudhl1VS21uO1Kf/jRGJmcAl5x6L9PHKkMwR7sq9Ar3bhK9u3ckdYo5PXxUF01mjMi+kwmkoZIP8uk/6Q=
X-Received: by 2002:a17:90a:db02:b0:28a:c616:ff1c with SMTP id
 g2-20020a17090adb0200b0028ac616ff1cmr268691pjv.97.1704362703076; Thu, 04 Jan
 2024 02:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20240103123052.711083-1-liu.ming50@gmail.com> <20240104094952d0f43a9f@mail.local>
In-Reply-To: <20240104094952d0f43a9f@mail.local>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 4 Jan 2024 11:04:50 +0100
Message-ID: <CALatG=5S8YL2co919A+RiNvXScO9aN0=mnSNRCoxRrQoppbAEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub: fs/fat: Don't error when mtime is 0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007c43ab060e1bdd32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193312

--0000000000007c43ab060e1bdd32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alexandre:

Sorry, my bad, will resend it.

//Ming Liu

Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2024=E5=B9=B41=
=E6=9C=884=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:49=E5=AF=AB=E9=
=81=93=EF=BC=9A

> Hello,
>
> Your patch has a declared charset of 'y' which is not a thing and git am
> fails with:
>
> error: cannot convert from y to UTF-8
> fatal: could not parse patch
>
> You got the following prompt:
>
> The following files are 8bit, but do not declare a
> Content-Transfer-Encoding.
> something.patch
> Which 8bit encoding should I declare [UTF-8]?
>
> At that point, you pressed y but you should simply press enter. Please
> resend.
>
>
> On 03/01/2024 13:30:52+0100, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > A issue was found when I run "runqemu genericx86-64 ovmf", grub failed
> > to boot, it's a known issue has been fixed in grub upstream, backport
> > the fix.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  ...1-fs-fat-Don-t-error-when-mtime-is-0.patch | 70 +++++++++++++++++++
> >  meta/recipes-bsp/grub/grub2.inc               |  1 +
> >  2 files changed, 71 insertions(+)
> >  create mode 100644
> meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
> >
> > diff --git
> a/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.pat=
ch
> b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.pat=
ch
> > new file mode 100644
> > index 0000000000..a5fbd58f46
> > --- /dev/null
> > +++
> b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.pat=
ch
> > @@ -0,0 +1,70 @@
> > +From e43f3d93b28cce852c110c7a8e40d8311bcd8bb1 Mon Sep 17 00:00:00 2001
> > +From: Robbie Harwood <rharwood@redhat.com>
> > +Date: Fri, 15 Jul 2022 16:13:02 -0400
> > +Subject: [PATCH] fs/fat: Don't error when mtime is 0
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +In the wild, we occasionally see valid ESPs where some file modificati=
on
> > +times are 0. For instance:
> > +
> > +    =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  EFI
> > +    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  BOOT
> > +    =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]=
  BOOTX64.EFI
> > +    =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 [Dec 31  1979]=
  fbx64.efi
> > +    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 [Jun 27 02:41]  fedora
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  BOOTX6=
4.CSV
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  fonts
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03:35]  fw
> > +    =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03=
:35]
> fwupd-359c1169-abd6-4a0d-8bce-e4d4713335c1.cap
> > +    =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03=
:34]
> fwupd-9d255c4b-2d88-4861-860d-7ee52ade9463.cap
> > +    =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 [Mar 14 03=
:34]
> fwupd-b36438d8-9128-49d2-b280-487be02d948b.cap
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  fwupdx=
64.efi
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [May 10 10:47]  grub.c=
fg
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Jun  3 12:38]  grub.c=
fg.new.new
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [May 10 10:41]  grub.c=
fg.old
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Jun 27 02:41]  gruben=
v
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  grubx6=
4.efi
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  mmx64.=
efi
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  shim.e=
fi
> > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  shimx6=
4.efi
> > +    =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 [Dec 31  1979]  shimx6=
4-fedora.efi
> > +    =E2=94=94=E2=94=80=E2=94=80 [Dec 31  1979]  FSCK0000.REC
> > +
> > +    5 directories, 17 files
> > +
> > +This causes grub-probe failure, which in turn causes grub-mkconfig
> > +failure. They are valid filesystems that appear intact, and the Linux
> > +FAT stack is able to mount and manipulate them without complaint.
> > +
> > +The check for mtime of 0 has been present since
> > +20def1a3c3952982395cd7c3ea7e78638527962b (fat: support file
> > +modification times).
> > +
> > +Upstream-Status: Backport [
> https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3De43f3d93b28cce852=
c110c7a8e40d8311bcd8bb1
> ]
> > +
> > +Signed-off-by: Robbie Harwood <rharwood@redhat.com>
> > +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> > +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > +---
> > + grub-core/fs/fat.c | 3 ---
> > + 1 file changed, 3 deletions(-)
> > +
> > +diff --git a/grub-core/fs/fat.c b/grub-core/fs/fat.c
> > +index 0951b2e63..c5efed724 100644
> > +--- a/grub-core/fs/fat.c
> > ++++ b/grub-core/fs/fat.c
> > +@@ -1027,9 +1027,6 @@ grub_fat_dir (grub_device_t device, const char
> *path, grub_fs_dir_hook_t hook,
> > +                                       grub_le_to_cpu16
> (ctxt.dir.w_date),
> > +                                       &info.mtime);
> > + #endif
> > +-      if (info.mtimeset =3D=3D 0)
> > +-    grub_error (GRUB_ERR_OUT_OF_RANGE,
> > +-                "invalid modification timestamp for %s", path);
> > +
> > +       if (hook (ctxt.filename, &info, hook_data))
> > +     break;
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-bsp/grub/grub2.inc
> b/meta/recipes-bsp/grub/grub2.inc
> > index f594e7d3a4..1215b24668 100644
> > --- a/meta/recipes-bsp/grub/grub2.inc
> > +++ b/meta/recipes-bsp/grub/grub2.inc
> > @@ -44,6 +44,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
> >
>  file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
> >             file://CVE-2023-4692.patch \
> >             file://CVE-2023-4693.patch \
> > +           file://0001-fs-fat-Don-t-error-when-mtime-is-0.patch \
> >  "
> >
> >  SRC_URI[sha256sum] =3D
> "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193286):
> https://lists.openembedded.org/g/openembedded-core/message/193286
> > Mute This Topic: https://lists.openembedded.org/mt/103500707/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000007c43ab060e1bdd32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Alexandre:<div><br></div><div>Sorry, my bad, will rese=
nd it.</div><div><br></div><div>//Ming Liu</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; =E6=96=BC 2024=E5=B9=B41=E6=9C=884=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=
=B8=8A=E5=8D=8810:49=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello,<br>
<br>
Your patch has a declared charset of &#39;y&#39; which is not a thing and g=
it am<br>
fails with:<br>
<br>
error: cannot convert from y to UTF-8<br>
fatal: could not parse patch<br>
<br>
You got the following prompt:<br>
<br>
The following files are 8bit, but do not declare a Content-Transfer-Encodin=
g.<br>
something.patch<br>
Which 8bit encoding should I declare [UTF-8]?<br>
<br>
At that point, you pressed y but you should simply press enter. Please<br>
resend.<br>
<br>
<br>
On 03/01/2024 13:30:52+0100, Ming Liu wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; A issue was found when I run &quot;runqemu genericx86-64 ovmf&quot;, g=
rub failed<br>
&gt; to boot, it&#39;s a known issue has been fixed in grub upstream, backp=
ort<br>
&gt; the fix.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...1-fs-fat-Don-t-error-when-mtime-is-0.patch | 70 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-bsp/grub/grub2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 71 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-bsp/grub/files/0001-fs-fat-Don-t=
-error-when-mtime-is-0.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-=
mtime-is-0.patch b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when=
-mtime-is-0.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a5fbd58f46<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-i=
s-0.patch<br>
&gt; @@ -0,0 +1,70 @@<br>
&gt; +From e43f3d93b28cce852c110c7a8e40d8311bcd8bb1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Robbie Harwood &lt;<a href=3D"mailto:rharwood@redhat.com" targe=
t=3D"_blank">rharwood@redhat.com</a>&gt;<br>
&gt; +Date: Fri, 15 Jul 2022 16:13:02 -0400<br>
&gt; +Subject: [PATCH] fs/fat: Don&#39;t error when mtime is 0<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +In the wild, we occasionally see valid ESPs where some file modificat=
ion<br>
&gt; +times are 0. For instance:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 E=
FI<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 [Dec =
31=C2=A0 1979]=C2=A0 BOOT<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=A0=E2=94=9C=
=E2=94=80=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 BOOTX64.EFI<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=A0=E2=94=94=
=E2=94=80=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 fbx64.efi<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 [Jun =
27 02:41]=C2=A0 fedora<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 BOOTX64.CSV<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 fonts<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Mar 14 03:35]=C2=A0 fw<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=
=A0=E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03:35]=C2=A0 fwupd-359c1169-abd6-4a0=
d-8bce-e4d4713335c1.cap<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=
=A0=E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03:34]=C2=A0 fwupd-9d255c4b-2d88-486=
1-860d-7ee52ade9463.cap<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=82=C2=A0 =C2=
=A0=E2=94=94=E2=94=80=E2=94=80 [Mar 14 03:34]=C2=A0 fwupd-b36438d8-9128-49d=
2-b280-487be02d948b.cap<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 fwupdx64.efi<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [May 10 10:47]=C2=A0 grub.cfg<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Jun=C2=A0 3 12:38]=C2=A0 grub.cfg.new.new<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [May 10 10:41]=C2=A0 grub.cfg.old<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Jun 27 02:41]=C2=A0 grubenv<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 grubx64.efi<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 mmx64.efi<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 shim.efi<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 shimx64.efi<br>
&gt; +=C2=A0 =C2=A0 =E2=94=82=C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80=
=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 shimx64-fedora.efi<br>
&gt; +=C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 [Dec 31=C2=A0 1979]=C2=A0 F=
SCK0000.REC<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 5 directories, 17 files<br>
&gt; +<br>
&gt; +This causes grub-probe failure, which in turn causes grub-mkconfig<br=
>
&gt; +failure. They are valid filesystems that appear intact, and the Linux=
<br>
&gt; +FAT stack is able to mount and manipulate them without complaint.<br>
&gt; +<br>
&gt; +The check for mtime of 0 has been present since<br>
&gt; +20def1a3c3952982395cd7c3ea7e78638527962b (fat: support file<br>
&gt; +modification times).<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.savannah.gnu.org/cg=
it/grub.git/commit/?id=3De43f3d93b28cce852c110c7a8e40d8311bcd8bb1" rel=3D"n=
oreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/grub.git/com=
mit/?id=3De43f3d93b28cce852c110c7a8e40d8311bcd8bb1</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Robbie Harwood &lt;<a href=3D"mailto:rharwood@redhat.c=
om" target=3D"_blank">rharwood@redhat.com</a>&gt;<br>
&gt; +Reviewed-by: Daniel Kiper &lt;<a href=3D"mailto:daniel.kiper@oracle.c=
om" target=3D"_blank">daniel.kiper@oracle.com</a>&gt;<br>
&gt; +Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" t=
arget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + grub-core/fs/fat.c | 3 ---<br>
&gt; + 1 file changed, 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/grub-core/fs/fat.c b/grub-core/fs/fat.c<br>
&gt; +index 0951b2e63..c5efed724 100644<br>
&gt; +--- a/grub-core/fs/fat.c<br>
&gt; ++++ b/grub-core/fs/fat.c<br>
&gt; +@@ -1027,9 +1027,6 @@ grub_fat_dir (grub_device_t device, const char =
*path, grub_fs_dir_hook_t hook,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_=
le_to_cpu16 (ctxt.dir.w_date),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
info.mtime);<br>
&gt; + #endif<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (info.mtimeset =3D=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 grub_error (GRUB_ERR_OUT_OF_RANGE,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;invali=
d modification timestamp for %s&quot;, path);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hook (ctxt.filename, &amp;info, hook_d=
ata))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +-- <br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/g=
rub2.inc<br>
&gt; index f594e7d3a4..1215b24668 100644<br>
&gt; --- a/meta/recipes-bsp/grub/grub2.inc<br>
&gt; +++ b/meta/recipes-bsp/grub/grub2.inc<br>
&gt; @@ -44,6 +44,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/grub/grub-${PV}.tar.=
gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fs-ext2-Ign=
ore-checksum-seed-incompat-feature.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-4692.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-4693.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fs-fat-Don-t-err=
or-when-mtime-is-0.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;23b64b4c741569f9426ed2e3d0e6780796f=
ca081bee4c99f62aa3f53ae803f5f&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#193286): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/193286" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/193286</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10350070=
7/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103500707/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000007c43ab060e1bdd32--

