Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60577C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 19:04:48 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.10553.1647716687609642663
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gBjhIFn9;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v2so9255273qtc.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxKMR/g2vorDKo91A/Vo7EXNHl6p0oJJVhGBZkFoWCo=;
        b=gBjhIFn9j6S7U70lQsFWEVddyyyQhFI/MdVj2uam8f1HhXa59Xi+LwRQR0VcW9NFSj
         PpF1SWxWB6Q95231giIFQDJgoXttvxONWTtwHPbBtqgqAJkvq0VF6fhbRijLKGuX/AmO
         LEVF+pYOx70Uu38H6wXVVaKL4LTm9YEzhQfv7AJUitfzxUxC0V1miUa8P4ZCHx4r1bQe
         hSMugYXjnWcErJMkSE3+r+zySLN8M3KdaX5hZLC8Z+07Kl73ncf8WbxMnK7J7MrfoeV4
         HGv9Sv0EIEycFP/Ogx9RGwpoAVfHLlMHHOtnu1AkkpK4iSeIFlX79hZOv1Ydn1uLg2Qf
         peeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxKMR/g2vorDKo91A/Vo7EXNHl6p0oJJVhGBZkFoWCo=;
        b=L/xPPeOWxBF4qrfASbyURTHUtqDPaGx59Eo/IJyWP1XOWSfxHAgTnXx1DJ/skLRRSd
         Y16zqJEPN+79rYiIQadjd2RVsTj86zvTUJNZbZ64TC5x1EFhxIBsi2Xfxn3e99XoCRzY
         /zVMUO4xaul9elkztuSpvIBancgGLUJXd07KLnT8fHIGFv+sSQDGtaVprPBCUkqdWQIE
         hkTSMfC/2K9yjYVstuQWKgff1s/mfYnAZVSGpGWdjWMMuqfd4dD7zGy6nJLqAu6OD0Z1
         ZguemIBHieUKZQpZYgyXC/1GcBEfSqZhCbXTgtW0A1i8ru/gCpvSgqy4IB8YlSHs3AYf
         XTPw==
X-Gm-Message-State: AOAM532fIA+evX+WiuIp19eXUm+EfAeZ6tyLUim96gOIk0CiC4gwTz55
	+2Khf7CkGAhezMoM98xtmllDfxmacV8a7IQolVw=
X-Google-Smtp-Source: 
 ABdhPJzRrA0/YutV6LEl8h39Ta+X2j1o3SPw9xIagd3K4Q7UJ/3MkN4TdP265ZMI+TmlfBWaJnl9NJar0Gd1KwRhMXE=
X-Received: by 2002:a05:622a:1052:b0:2e1:fe6b:377d with SMTP id
 f18-20020a05622a105200b002e1fe6b377dmr8407659qte.229.1647716686543; Sat, 19
 Mar 2022 12:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220319165538.510074-1-bero@lindev.ch>
In-Reply-To: <20220319165538.510074-1-bero@lindev.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Mar 2022 12:04:35 -0700
Message-ID: 
 <CAMKF1sp+EZYNYN2SG6tO12iyoFuYnQ=Dr_s_YGdVjRbhAH2XjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-core/ovmf: Fix build with gcc 12
To: bero@lindev.ch
Cc: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>,
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cabe4b05da96efe6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 19:04:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163473

--000000000000cabe4b05da96efe6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just disable Werror with appropriate comments describing why we are
Doing it until the issues are fixed

On Sat, Mar 19, 2022 at 9:55 AM Bernhard Rosenkr=C3=A4nzer via
lists.openembedded.org <bero=3Dlindev.ch@lists.openembedded.org> wrote:

> From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.com>
>
> edk2 doesn't compile with gcc 12 - due to 2 legitimate bugs (trying to
> use a file handle as if it were a string) and 2 new warnings in code
> using -Werror (they need further investigation to determine if they're
> legitimate bugs or false positives; in the mean time we can keep things
> building by disabling the warnings for the particular lines triggering
> them).
>
> The proper fixes have already been submitted upstream at
> https://github.com/tianocore/edk2/pull/2602
> Will not submit the workarounds for the warnings upstream for now.
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <
> bernhard.rosenkraenzer.ext@huawei.com>
> ---
>  ...nfusion-between-file-handle-and-name.patch | 44 +++++++++++++++++++
>  ...orkaround-for-gcc-12-build-failure-2.patch | 33 ++++++++++++++
>  ...-workaround-for-gcc-12-build-failure.patch | 28 ++++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb            |  3 ++
>  4 files changed, 108 insertions(+)
>  create mode 100644
> meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-handle-and-na=
me.patch
>  create mode 100644
> meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure-2.pa=
tch
>  create mode 100644
> meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure.patc=
h
>
> diff --git
> a/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-handle-and-=
name.patch
> b/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-handle-and-=
name.patch
> new file mode 100644
> index 0000000000..98023f93c2
> --- /dev/null
> +++
> b/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-handle-and-=
name.patch
> @@ -0,0 +1,44 @@
> +From 74e7ad4e400ea3f942805e70df4d3ed6990759f3 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Bernhard=3D20Rosenkr=3DC3=3DA4nzer?=3D <bero@lindev.ch=
>
> +Date: Tue, 8 Mar 2022 18:56:23 +0100
> +Subject: [PATCH] GenFfs: Don't treat a file handle as a string
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The current code tries to print the file handle as a string on error.
> +Do what it is meant to do instead: Print the file name.
> +
> +Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/2602]
> +Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
> +---
> + BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
> + BaseTools/Source/C/GenSec/GenSec.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c
> b/BaseTools/Source/C/GenFfs/GenFfs.c
> +index 949025c33325..06e009e279ce 100644
> +--- a/BaseTools/Source/C/GenFfs/GenFfs.c
> ++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
> +@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment=
)
> +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer =3D=3D NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of
> %s", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of
> %s", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> +diff --git a/BaseTools/Source/C/GenSec/GenSec.c
> b/BaseTools/Source/C/GenSec/GenSec.c
> +index d54a4f9e0a7d..1ad92de1d50e 100644
> +--- a/BaseTools/Source/C/GenSec/GenSec.c
> ++++ b/BaseTools/Source/C/GenSec/GenSec.c
> +@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32
> *Alignment)
> +   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer =3D=3D NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of
> %s", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of
> %s", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> diff --git
> a/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure-2.=
patch
> b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure-2.=
patch
> new file mode 100644
> index 0000000000..e7b7269d82
> --- /dev/null
> +++
> b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure-2.=
patch
> @@ -0,0 +1,33 @@
> +From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.com>
> +Date: Fri, 18 Mar 2022 17:28:47 +0100
> +Subject: [PATCH] Disable gcc >=3D 12 stringop-overflow warning
> +
> +gcc 12 warns about a stringop-overflow with SetDevicePathEndNode
> +potentially copying 4 bytes to an area of 1 byte.
> +Since edk2 is built with -Werror, this breaks the build.
> +
> +It is not immedaitely clear whether this is a false warning or if
> +SetDevicePathEndNode is being used incorrectly somewhere, but since
> +the code seems to work, ignore the warning for the time being to
> +keep things buildable.
> +
> +This should be investigated properly at some point.
> +
> +Upstream-Status: Inappropriate [Workaround to keep things going, should
> be fixed properly]
> +Signed-off-by: Bernhard Rosenkr=C3=A4nzer <
> bernhard.rosenkraenzer.ext@huawei.com>
> +
> +diff --git a/BaseTools/Source/C/DevicePath/DevicePathUtilities.c
> b/BaseTools/Source/C/DevicePath/DevicePathUtilities.c
> +index 2ffefa8cee..32c02bdf82 100644
> +--- a/BaseTools/Source/C/DevicePath/DevicePathUtilities.c
> ++++ b/BaseTools/Source/C/DevicePath/DevicePathUtilities.c
> +@@ -318,7 +318,10 @@ SetDevicePathEndNode (
> +   )
> + {
> +   ASSERT (Node !=3D NULL);
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wstringop-overflow"
> +   memcpy (Node, &mUefiDevicePathLibEndDevicePath, sizeof
> (mUefiDevicePathLibEndDevicePath));
> ++#pragma GCC diagnostic pop
> + }
> +
> + /**
> diff --git
> a/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure.pa=
tch
> b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure.pa=
tch
> new file mode 100644
> index 0000000000..048112e3fc
> --- /dev/null
> +++
> b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure.pa=
tch
> @@ -0,0 +1,28 @@
> +From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.com>
> +Date: Fri, 18 Mar 2022 17:28:47 +0100
> +Subject: [PATCH] Disable gcc >=3D 12 dangling-pointer warning
> +
> +gcc 12 warns about a pointer into outStream being preserved after
> outStream
> +goes out of scope. Since edk2 is built with -Werror, this breaks the
> build.
> +
> +This exact use happens to work with all compilers currently used,
> +so ignore the warning for the time being to keep things buildable.
> +
> +Upstream-Status: Inappropriate [Workaround to keep things going, should
> be fixed properly]
> +Signed-off-by: Bernhard Rosenkr=C3=A4nzer <
> bernhard.rosenkraenzer.ext@huawei.com>
> +
> +diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> +index 4e9b499f8d..5f0e75eeda 100644
> +--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> ++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> +@@ -2825,7 +2825,10 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp,
> BoolInt reInit,
> +
> +   nowPos64 =3D p->nowPos64;
> +   RangeEnc_Init(&p->rc);
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wdangling-pointer"
> +   p->rc.outStream =3D &outStream.vt;
> ++#pragma GCC diagnostic pop
> +
> +   if (desiredPackSize =3D=3D 0)
> +     return SZ_ERROR_OUTPUT_EOF;
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/
> ovmf_git.bb
> index b15d40eac8..5f255b46b2 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -21,6 +21,9 @@ SRC_URI =3D "gitsm://
> github.com/tianocore/edk2.git;branch=3Dmaster;protocol=3Dhttps \
>             file://0003-ovmf-Update-to-latest.patch \
>             file://0005-debug-prefix-map.patch \
>             file://0006-reproducible.patch \
> +           file://edk2-fix-confusion-between-file-handle-and-name.patch =
\
> +           file://edk2-workaround-for-gcc-12-build-failure.patch \
> +           file://edk2-workaround-for-gcc-12-build-failure-2.patch
>             "
>
>  PV =3D "edk2-stable202202"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163472):
> https://lists.openembedded.org/g/openembedded-core/message/163472
> Mute This Topic: https://lists.openembedded.org/mt/89892121/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cabe4b05da96efe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Just disable Werror with appropriate comments describing =
why we are</div><div dir=3D"auto">Doing it until the issues are fixed=C2=A0=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sat, Mar 19, 2022 at 9:55 AM Bernhard Rosenkr=C3=A4nzer via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;bero=3D<a=
 href=3D"mailto:lindev.ch@lists.openembedded.org">lindev.ch@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Bernha=
rd Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bernhard.rosenkraenzer.ext@huawe=
i.com" target=3D"_blank">bernhard.rosenkraenzer.ext@huawei.com</a>&gt;<br>
<br>
edk2 doesn&#39;t compile with gcc 12 - due to 2 legitimate bugs (trying to<=
br>
use a file handle as if it were a string) and 2 new warnings in code<br>
using -Werror (they need further investigation to determine if they&#39;re<=
br>
legitimate bugs or false positives; in the mean time we can keep things<br>
building by disabling the warnings for the particular lines triggering<br>
them).<br>
<br>
The proper fixes have already been submitted upstream at<br>
<a href=3D"https://github.com/tianocore/edk2/pull/2602" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/tianocore/edk2/pull/2602</a><br>
Will not submit the workarounds for the warnings upstream for now.<br>
<br>
Signed-off-by: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bernhard.ro=
senkraenzer.ext@huawei.com" target=3D"_blank">bernhard.rosenkraenzer.ext@hu=
awei.com</a>&gt;<br>
---<br>
=C2=A0...nfusion-between-file-handle-and-name.patch | 44 ++++++++++++++++++=
+<br>
=C2=A0...orkaround-for-gcc-12-build-failure-2.patch | 33 ++++++++++++++<br>
=C2=A0...-workaround-for-gcc-12-build-failure.patch | 28 ++++++++++++<br>
=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 ++<br>
=C2=A04 files changed, 108 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-bet=
ween-file-handle-and-name.patch<br>
=C2=A0create mode 100644 meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gc=
c-12-build-failure-2.patch<br>
=C2=A0create mode 100644 meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gc=
c-12-build-failure.patch<br>
<br>
diff --git a/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-ha=
ndle-and-name.patch b/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-betwee=
n-file-handle-and-name.patch<br>
new file mode 100644<br>
index 0000000000..98023f93c2<br>
--- /dev/null<br>
+++ b/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-handle-an=
d-name.patch<br>
@@ -0,0 +1,44 @@<br>
+From 74e7ad4e400ea3f942805e70df4d3ed6990759f3 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Bernhard=3D20Rosenkr=3DC3=3DA4nzer?=3D &lt;<a href=3D"ma=
ilto:bero@lindev.ch" target=3D"_blank">bero@lindev.ch</a>&gt;<br>
+Date: Tue, 8 Mar 2022 18:56:23 +0100<br>
+Subject: [PATCH] GenFfs: Don&#39;t treat a file handle as a string<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+The current code tries to print the file handle as a string on error.<br>
+Do what it is meant to do instead: Print the file name.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/tianocore/edk2/p=
ull/2602" rel=3D"noreferrer" target=3D"_blank">https://github.com/tianocore=
/edk2/pull/2602</a>]<br>
+Signed-off-by: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bero@linde=
v.ch" target=3D"_blank">bero@lindev.ch</a>&gt;<br>
+---<br>
+ BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-<br>
+ BaseTools/Source/C/GenSec/GenSec.c | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFf=
s/GenFfs.c<br>
+index 949025c33325..06e009e279ce 100644<br>
+--- a/BaseTools/Source/C/GenFfs/GenFfs.c<br>
++++ b/BaseTools/Source/C/GenFfs/GenFfs.c<br>
+@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)<=
br>
+=C2=A0 =C2=A0PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);<br>
+=C2=A0 =C2=A0if (PeFileBuffer =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);<br>
+-=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;memory can=
not be allocated=C2=A0 of %s&quot;, InFileHandle);<br>
++=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;memory can=
not be allocated=C2=A0 of %s&quot;, InFile);<br>
+=C2=A0 =C2=A0 =C2=A0return EFI_OUT_OF_RESOURCES;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle=
);<br>
+diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSe=
c/GenSec.c<br>
+index d54a4f9e0a7d..1ad92de1d50e 100644<br>
+--- a/BaseTools/Source/C/GenSec/GenSec.c<br>
++++ b/BaseTools/Source/C/GenSec/GenSec.c<br>
+@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment=
)<br>
+=C2=A0 =C2=A0PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);<br>
+=C2=A0 =C2=A0if (PeFileBuffer =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0fclose (InFileHandle);<br>
+-=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;memory can=
not be allocated=C2=A0 of %s&quot;, InFileHandle);<br>
++=C2=A0 =C2=A0 Error(NULL, 0, 4001, &quot;Resource&quot;, &quot;memory can=
not be allocated=C2=A0 of %s&quot;, InFile);<br>
+=C2=A0 =C2=A0 =C2=A0return EFI_OUT_OF_RESOURCES;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle=
);<br>
diff --git a/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-f=
ailure-2.patch b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-bui=
ld-failure-2.patch<br>
new file mode 100644<br>
index 0000000000..e7b7269d82<br>
--- /dev/null<br>
+++ b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure-=
2.patch<br>
@@ -0,0 +1,33 @@<br>
+From: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bernhard.rosenkraen=
zer.ext@huawei.com" target=3D"_blank">bernhard.rosenkraenzer.ext@huawei.com=
</a>&gt;<br>
+Date: Fri, 18 Mar 2022 17:28:47 +0100<br>
+Subject: [PATCH] Disable gcc &gt;=3D 12 stringop-overflow warning<br>
+<br>
+gcc 12 warns about a stringop-overflow with SetDevicePathEndNode<br>
+potentially copying 4 bytes to an area of 1 byte.<br>
+Since edk2 is built with -Werror, this breaks the build.<br>
+<br>
+It is not immedaitely clear whether this is a false warning or if<br>
+SetDevicePathEndNode is being used incorrectly somewhere, but since<br>
+the code seems to work, ignore the warning for the time being to<br>
+keep things buildable.<br>
+<br>
+This should be investigated properly at some point.<br>
+<br>
+Upstream-Status: Inappropriate [Workaround to keep things going, should be=
 fixed properly]<br>
+Signed-off-by: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bernhard.r=
osenkraenzer.ext@huawei.com" target=3D"_blank">bernhard.rosenkraenzer.ext@h=
uawei.com</a>&gt;<br>
+<br>
+diff --git a/BaseTools/Source/C/DevicePath/DevicePathUtilities.c b/BaseToo=
ls/Source/C/DevicePath/DevicePathUtilities.c<br>
+index 2ffefa8cee..32c02bdf82 100644<br>
+--- a/BaseTools/Source/C/DevicePath/DevicePathUtilities.c<br>
++++ b/BaseTools/Source/C/DevicePath/DevicePathUtilities.c<br>
+@@ -318,7 +318,10 @@ SetDevicePathEndNode (<br>
+=C2=A0 =C2=A0)<br>
+ {<br>
+=C2=A0 =C2=A0ASSERT (Node !=3D NULL);<br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wstringop-overflow&quot;<br>
+=C2=A0 =C2=A0memcpy (Node, &amp;mUefiDevicePathLibEndDevicePath, sizeof (m=
UefiDevicePathLibEndDevicePath));<br>
++#pragma GCC diagnostic pop<br>
+ }<br>
+ <br>
+ /**<br>
diff --git a/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-f=
ailure.patch b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build=
-failure.patch<br>
new file mode 100644<br>
index 0000000000..048112e3fc<br>
--- /dev/null<br>
+++ b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure.=
patch<br>
@@ -0,0 +1,28 @@<br>
+From: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bernhard.rosenkraen=
zer.ext@huawei.com" target=3D"_blank">bernhard.rosenkraenzer.ext@huawei.com=
</a>&gt;<br>
+Date: Fri, 18 Mar 2022 17:28:47 +0100<br>
+Subject: [PATCH] Disable gcc &gt;=3D 12 dangling-pointer warning<br>
+<br>
+gcc 12 warns about a pointer into outStream being preserved after outStrea=
m<br>
+goes out of scope. Since edk2 is built with -Werror, this breaks the build=
.<br>
+<br>
+This exact use happens to work with all compilers currently used,<br>
+so ignore the warning for the time being to keep things buildable.<br>
+<br>
+Upstream-Status: Inappropriate [Workaround to keep things going, should be=
 fixed properly]<br>
+Signed-off-by: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bernhard.r=
osenkraenzer.ext@huawei.com" target=3D"_blank">bernhard.rosenkraenzer.ext@h=
uawei.com</a>&gt;<br>
+<br>
+diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c<br>
+index 4e9b499f8d..5f0e75eeda 100644<br>
+--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c<br>
++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c<br>
+@@ -2825,7 +2825,10 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Boo=
lInt reInit,<br>
+ <br>
+=C2=A0 =C2=A0nowPos64 =3D p-&gt;nowPos64;<br>
+=C2=A0 =C2=A0RangeEnc_Init(&amp;p-&gt;rc);<br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wdangling-pointer&quot;<br>
+=C2=A0 =C2=A0p-&gt;rc.outStream =3D &amp;outStream.vt;<br>
++#pragma GCC diagnostic pop<br>
+ <br>
+=C2=A0 =C2=A0if (desiredPackSize =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0return SZ_ERROR_OUTPUT_EOF;<br>
diff --git a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">ovmf_git.bb</a> b/meta/recipes-core/ovmf/<a hr=
ef=3D"http://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_git.bb<=
/a><br>
index b15d40eac8..5f255b46b2 100644<br>
--- a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a><br>
+++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a><br>
@@ -21,6 +21,9 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/ti=
anocore/edk2.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/tianocore/edk2.git;branch=3Dmaster;protocol=3Dhttps=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-ovmf-Update-to-latest=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-debug-prefix-map.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-reproducible.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://edk2-fix-confusion-between=
-file-handle-and-name.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://edk2-workaround-for-gcc-12=
-build-failure.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://edk2-workaround-for-gcc-12=
-build-failure-2.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PV =3D &quot;edk2-stable202202&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163472): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163472" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163472</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89892121/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89892121/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cabe4b05da96efe6--

