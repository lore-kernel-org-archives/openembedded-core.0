Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BFCE98FDC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:22:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.130848.1775737350753972299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 05:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GVAm//nh;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488c2690057so8328525e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775737349; x=1776342149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zf+Lw2ijUFmxce+zYBVM30IZGwon7WzNpIIb2fRUWfc=;
        b=GVAm//nhkJ/n/VtLdIcL4C7m9KggEGa84QiU6FLc7ggNlh9Zul5VXaeNrkHy1upOEv
         Uua5h4VIzXKfLyJ7sABxTcEN6ndNgjAx6z/JMe2yTigZSCiNj+Hk3cXS777Pg3ioAK1k
         zNgZvIyxKiPC09gj1nDNNO+72RaDUuqV7+DyLenzposzGB20UIRu4WOo8hvjHDkE39CC
         h1vXobofetaiRniJDKIkdlyhsJr04a+TL8/kHrRkCH23IeGBp2csD1EhpmXXzQfa5ET9
         2hZeBFc+wL9LZ6MtcewsNHPSI9dqEQQsez8O4QSZY/JYPjkSLh2a1u5shBAGyx6BOa4e
         QA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775737349; x=1776342149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf+Lw2ijUFmxce+zYBVM30IZGwon7WzNpIIb2fRUWfc=;
        b=joFPZynXroBUsWZM0708op3zG0Dc1tyv3625i3IzVnm5whKNQ1CvwYdePYnyPR0/p4
         ipJd1HsIIiT1jpsbm8Zym0cXssysQNYrMOyPqr8QpB0w2APx48qeRj7ZD7vrnpk3Wa4F
         qcmimc/jVYMUPwhuQ7hS2boFsmpEKmYVaJWVGVxPiKzLkFTAxBXeyyyQ1JfAwbTJIYDF
         eXo1UZAMjaON8fjHjzYn/6Kr5wEndKhZgdFgL9l42A+pwWNsSKTM7rCK7ZUv/lgp/1Xb
         YlU3ip/tWygCa8HU4xKNapB5QR5O9YN8tQBYliy4YanA8X5CgDyeiul7wHzWOouAzydW
         Sklg==
X-Gm-Message-State: AOJu0YwF2/slAkbO0OedDcOwpDRQCVWq34We8D379l7746xuvqRGRPkV
	5qFsVfyYkwb6LlHjimJ6syG6GqmG4uQ04y+Zdzmb2C8Tq5xPUxqBIsQMJT52wA==
X-Gm-Gg: AeBDiesQVLtAg2zH0M9hp/uZIrbSwkXCsEmutELBPfukVtS6Pryy8JaB80COWkKFh6n
	MqxJTiYvbUOySF+lULcURge1e5gR81XUKu+E2nUpA3bCi6kFm/oGO3Zh0HKOGv3ooG6BJ2xkpkK
	1+5dltMYuq9B9x22UhltH4VtcQurOOzCpKjOguE3m4eIaLXkvg81KhtfEP0nV617UbHDffXNmSQ
	/qrSvtKWxCLpGxunq+FGiqwVlbVTLbQeR4eROadydFAmHo69T2+A3fF7q+OmJnyvUTJvYmlx3Ak
	FYy5z6rJb0Y/MNPVUOr+bSZyA+d1jiotk0sDaF2L9mXgWEm/kk2n2zDENxUcAbI8yRd2nW43AUp
	Hha/H6dUoJU98Xle4NAux8Xo04kK00JhSdRaXlzdl3ngpHr2mnYrSfXH7Y360TyXFYxPz0kE0hc
	PE4wY7SA4/DxPuJczP+4P1WUI=
X-Received: by 2002:a05:600c:1f1a:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488ccf63aa9mr48338485e9.8.1775737348647;
        Thu, 09 Apr 2026 05:22:28 -0700 (PDT)
Received: from term011.lan (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17a6d7sm35985385e9.3.2026.04.09.05.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 05:22:28 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] ovmf: Fix build with GCC 16 and GLIBC 2.43
Date: Thu,  9 Apr 2026 14:22:25 +0200
Message-ID: <20260409122225.1069828-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234912

Backport two patches from master to fix native build with
GCC 16 and GLIBC 2.43

commit 3597306191297b504683b83fe7750e49c6a2e836
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Thu Jan 29 09:23:32 2026 +0100

    BaseTools/StringFuncs: fix gcc 16 warning

    StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
    StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but no=
t used [-Werror=3Dunused-but-set-variable=3D]
      113 |   UINTN       Item;
          |               ^~~~

    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Mon Dec 8 10:28:50 2025 +0100

    BaseTools/EfiRom: fix compiler warning

    New warning after updating gcc:

    EfiRom.c: In function =E2=80=98main=E2=80=99:
    EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qual=
ifier from pointer target type [-Werror=3Ddiscarded-qualifiers]

    The assigned value is not used, so fix the warning by just removing it.

    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
---
 ...Tools-StringFuncs-fix-gcc-16-warning.patch | 43 ++++++++++++++++++
 ...aseTools-EfiRom-fix-compiler-warning.patch | 45 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  2 +
 3 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-c=
ompiler-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-fix-gcc=
-16-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
new file mode 100644
index 0000000000..38c26224df
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-fix-gcc-16-war=
ning.patch
@@ -0,0 +1,43 @@
+From 3597306191297b504683b83fe7750e49c6a2e836 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 29 Jan 2026 09:23:32 +0100
+Subject: [PATCH 1/2] BaseTools/StringFuncs: fix gcc 16 warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
+StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not u=
sed [-Werror=3Dunused-but-set-variable=3D]
+  113 |   UINTN       Item;
+      |               ^~~~
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Upstream-Status: Backport
+---
+ BaseTools/Source/C/Common/StringFuncs.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/Common/StringFuncs.c b/BaseTools/Source/C/=
Common/StringFuncs.c
+index 53e44365e9..df02d9c808 100644
+--- a/BaseTools/Source/C/Common/StringFuncs.c
++++ b/BaseTools/Source/C/Common/StringFuncs.c
+@@ -110,7 +110,6 @@ SplitStringByWhitespace (
+   CHAR8       *EndOfSubString;=0D
+   CHAR8       *EndOfString;=0D
+   STRING_LIST *Output;=0D
+-  UINTN       Item;=0D
+ =0D
+   String =3D CloneString (String);=0D
+   if (String =3D=3D NULL) {=0D
+@@ -120,7 +119,7 @@ SplitStringByWhitespace (
+ =0D
+   Output =3D NewStringList ();=0D
+ =0D
+-  for (Pos =3D String, Item =3D 0; Pos < EndOfString; Item++) {=0D
++  for (Pos =3D String; Pos < EndOfString;) {=0D
+     while (isspace ((int)*Pos)) {=0D
+       Pos++;=0D
+     }=0D
+--=20
+2.53.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-compiler=
-warning.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-comp=
iler-warning.patch
new file mode 100644
index 0000000000..f463103661
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-compiler-warnin=
g.patch
@@ -0,0 +1,45 @@
+From 9af06ef3cbb052b142f9660c2c01e7aeb401300c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 8 Dec 2025 10:28:50 +0100
+Subject: [PATCH 2/2] BaseTools/EfiRom: fix compiler warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+New warning after updating gcc:
+
+EfiRom.c: In function =E2=80=98main=E2=80=99:
+EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qualifi=
er from pointer target type [-Werror=3Ddiscarded-qualifiers]
+
+The assigned value is not used, so fix the warning by just removing it.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Upstream-Status: Backport
+---
+ BaseTools/Source/C/EfiRom/EfiRom.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/EfiRom/EfiRom.c b/BaseTools/Source/C/EfiRo=
m/EfiRom.c
+index fa7bf0e62e..6e903b3504 100644
+--- a/BaseTools/Source/C/EfiRom/EfiRom.c
++++ b/BaseTools/Source/C/EfiRom/EfiRom.c
+@@ -44,7 +44,6 @@ Returns:
+   FILE_LIST *FList;=0D
+   UINT32    TotalSize;=0D
+   UINT32    Size;=0D
+-  CHAR8     *Ptr0;=0D
+ =0D
+   SetUtilityName(UTILITY_NAME);=0D
+ =0D
+@@ -75,7 +74,7 @@ Returns:
+   //=0D
+   if (mOptions.DumpOption =3D=3D 1) {=0D
+     if (mOptions.FileList !=3D NULL) {=0D
+-      if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->FileName, =
DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {=0D
++      if (strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OU=
TPUT_EXTENSION) !=3D NULL) {=0D
+         DumpImage (mOptions.FileList);=0D
+         goto BailOut;=0D
+       } else {=0D
+--=20
+2.53.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index ec6c3b516c..107dcf0359 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,6 +26,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps;ta
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
            file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instruct=
i.patch \
+           file://0001-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
+           file://0002-BaseTools-EfiRom-fix-compiler-warning.patch \
            "
=20
 PV =3D "edk2-stable202511"
--=20
2.53.0


