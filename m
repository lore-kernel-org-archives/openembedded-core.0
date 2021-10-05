Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B339C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 09:40:15 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.23338.1633426811070192791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 02:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mv0FfG/V;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id w13so4889215vsa.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7LLpYjiXgclsjxriq1dF6oqkzlbCS9zOGfA3lW+lpM=;
        b=mv0FfG/V03jwlb3vzF1Ntm6KR1RIDFB2aIKNuxvs0DEKWM/E8QUp9oTGCyWdwG1Cwf
         81p1R0pGQIR12s7Us+d7Hb6QDrUfKZ0bDXm7InjSR9iADfta7cO0T7MW2W84TMKnyTHJ
         qYpr/ET9nqdCaT2AAVcjSqvvpzW0pOoiIwbApWdRuRTnGAuCuwdr5sWmv/yJnQYThHZ6
         UYf8H0J07boos0ozgwVJ1MxEaJEQEBGH+oxX3aWPCtrAKCDCCtByjfz/s3EkMWmMlYHN
         XwiUl8oEhrF9hIfo8P2su1w2uka1UWSSPOMaw7laijtIrFuuj0Fh8Tdf9LIeXwfJvleP
         V12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7LLpYjiXgclsjxriq1dF6oqkzlbCS9zOGfA3lW+lpM=;
        b=sOltjtkAnYsxtSIiEcuyKWNIDS2800GDYGxZWZ3Kj7UpbSewPELe3xF/4YmTZTYQ6o
         /DhkNJMokO0gkBcmtlpNEPJo4bYOEPQBWs0XgncBuXhjAQYUay6gKMenocL1cl3BdcyV
         z0yZeNtfnvoTumvrgB0LAUe4RKPc3cWTSatke9gcie3WmEOUq8P/COsWUgAkCLsnoSDT
         Ge6/6M8S5K4Zo6HhICHAqrWFTvt0m6xFjIvDX2lolMbiubxRdUnuBBMXukn31p1RmUi5
         qCR/SG6qEoDx4Q46Mr/CoX6DhSPdYvc4vfJcRtv17hvJczKkdMLwG+kqhlnugWUmZSnW
         vJcQ==
X-Gm-Message-State: AOAM530uM7qVsjpe9kJpgtj30EbkAIupC7XHjIZVrYnX7VPO3S+pkL03
	CYJ2UTMODREx7U+D+Kbmeo3Dyl7inALPz0aRfR8=
X-Google-Smtp-Source: 
 ABdhPJxtICm5XULWxpwB4t3h5J/7eVqm9IekNkAM5NB3lc7+BsMbPqz+Dh4UqXFffRzP9TLrLDl3fdCMgSwbTATRCSg=
X-Received: by 2002:a67:5cc1:: with SMTP id
 q184mr16597222vsb.13.1633426810118;
 Tue, 05 Oct 2021 02:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211005084141.136784-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20211005084141.136784-1-alexandre.belloni@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Oct 2021 11:39:58 +0200
Message-ID: 
 <CANNYZj8cuHmWne7yQT55sO2g5Nr=GVBwDFyYfojhLKe=yOKvjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libevent,btrfs-tools: fix Upstream-Status tag
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c8a6d905cd97d025"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 09:40:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156639

--000000000000c8a6d905cd97d025
Content-Type: text/plain; charset="UTF-8"

The first two should say Backport and Inappropriate [oe-core specific
...explanation]

Definitions here:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

Alex

On Tue, 5 Oct 2021 at 10:41, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  ...1-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch | 2 +-
>  ...003-test-mark-util-monotonic_prc_fallback-as-retriable.patch | 2 +-
>  ...test-retriable-tests-are-marked-failed-only-when-all-a.patch | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git
> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> index d7188881da8d..f57089e963fe 100644
> ---
> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> +++
> b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> @@ -18,7 +18,7 @@ add an explicit include of const.h to pickup the macro:
>  This is safe for older kernel's as well, since the header still
>  exists, and is valid to include.
>
> -Upstream-status: OE Specific [mips64 + musl + libc-headers]
> +Upstream-Status: OE Specific [mips64 + musl + libc-headers]
>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>  ---
> diff --git
> a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> index 8a2c78983e1d..519bccf8d794 100644
> ---
> a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> +++
> b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] test: mark util/monotonic_prc_fallback as
> retriable
>
>  Refs: #1193
>
> -Upstream-status: Backported
> +Upstream-Status: Backported
>  ---
>   test/regress_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git
> a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
> b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
> index ae7db0b7aa85..e453c80d7fcd 100644
> ---
> a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
> +++
> b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] test: retriable tests are marked failed
> only when all
>
>  Fixes: #1193
>
> -Upstream-status: Pending
> +Upstream-Status: Pending
>
>  Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
>  ---
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156638):
> https://lists.openembedded.org/g/openembedded-core/message/156638
> Mute This Topic: https://lists.openembedded.org/mt/86088669/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c8a6d905cd97d025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div></div><div></div><div>The first two should=
 say Backport and Inappropriate [oe-core specific ...explanation]</div><div=
><br></div><div>Definitions here:</div><div><a href=3D"https://www.openembe=
dded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:=
_Upstream-Status">https://www.openembedded.org/wiki/Commit_Patch_Message_Gu=
idelines#Patch_Header_Recommendations:_Upstream-Status</a></div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 5 Oct 2021 at 10:41, Alexandre Belloni &lt;<=
a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@=
bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0...1-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch | 2 +=
-<br>
=C2=A0...003-test-mark-util-monotonic_prc_fallback-as-retriable.patch | 2 +=
-<br>
=C2=A0...test-retriable-tests-are-marked-failed-only-when-all-a.patch | 2 +=
-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools=
-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btr=
fs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-wi=
th-.patch<br>
index d7188881da8d..f57089e963fe 100644<br>
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-includ=
e-linux-const.h-to-fix-build-with-.patch<br>
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-includ=
e-linux-const.h-to-fix-build-with-.patch<br>
@@ -18,7 +18,7 @@ add an explicit include of const.h to pickup the macro:<b=
r>
=C2=A0This is safe for older kernel&#39;s as well, since the header still<b=
r>
=C2=A0exists, and is valid to include.<br>
<br>
-Upstream-status: OE Specific [mips64 + musl + libc-headers]<br>
+Upstream-Status: OE Specific [mips64 + musl + libc-headers]<br>
<br>
=C2=A0Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
=C2=A0---<br>
diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-util-mon=
otonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libe=
vent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch<br>
index 8a2c78983e1d..519bccf8d794 100644<br>
--- a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_=
prc_fallback-as-retriable.patch<br>
+++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_=
prc_fallback-as-retriable.patch<br>
@@ -5,7 +5,7 @@ Subject: [PATCH] test: mark util/monotonic_prc_fallback as =
retriable<br>
<br>
=C2=A0Refs: #1193<br>
<br>
-Upstream-status: Backported<br>
+Upstream-Status: Backported<br>
=C2=A0---<br>
=C2=A0 test/regress_util.c | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tes=
ts-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/=
libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch<=
br>
index ae7db0b7aa85..e453c80d7fcd 100644<br>
--- a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-=
marked-failed-only-when-all-a.patch<br>
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-=
marked-failed-only-when-all-a.patch<br>
@@ -6,7 +6,7 @@ Subject: [PATCH] test: retriable tests are marked failed on=
ly when all<br>
<br>
=C2=A0Fixes: #1193<br>
<br>
-Upstream-status: Pending<br>
+Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@boot=
lin.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
=C2=A0---<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156638): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156638" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156638</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86088669/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86088669/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c8a6d905cd97d025--

