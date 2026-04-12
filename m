Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC46E6400A
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 09:36:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.234295.1775986577873134494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 02:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=saAqibMO;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7645adbdso88128f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775986576; x=1776591376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lbUqerlDNGgFRisq+5JeayB/S5Uzc/cCkp16ImZ2jJ4=;
        b=saAqibMOvyRbacipz7S/KuGkdyuhKqFJoXR2WQxFaWfehM86s5/t3igcvzk/KR+gOl
         LCzGFBDFUwLFDLRi37IJX2blixKtU7vkNaBm3pkV9Kh/mnTbWZsIDJgwGpo2cX15kpFE
         zfm95pAka2aEiCUZOEayPBrnkdoy8ElPRH0ERUj1Iq5VnrUPvTGTU4tC93RE5CpA8QRH
         I27Cob5ZHDqz9XGMciKgUdQc0YzZLg2e1a+3TzAke/w/nxdpUxg6L2fTjBcqcThrih1z
         cC3bzh4xPCNn0KC8lbW3wxxPLyF1FhTVuQisS6nuXc83ma0REKQsLSfZDMuyZYvdVDO0
         mWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775986576; x=1776591376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbUqerlDNGgFRisq+5JeayB/S5Uzc/cCkp16ImZ2jJ4=;
        b=RcEKvGJVip04CCp5yT6nZKshym0s4i15ig1G5EbNBM2DTlAx5n+3K2DjifZ0ny43aJ
         wFE2ODEknPceFtnWoXg80zbg0B5Gm3Q6HEMp3Z2wzJS+atpYLtNaGohXvLU/n54ooucj
         dHJ7+JrjXI8VTjOB6xQPf1fbmSXvSicVWbDrxLiNBfGLqU+k7g/VvwgFhbPYwfKjWqvd
         DFNELrbpYh4z6fC3jnb8tWJb/tDaDKF9RTF3xUiwojJeVMNTe7Ag1dgh+eIIKUsKusZr
         8TAC9l+yK+lR/ZJ29i/0fuOC++WpWZ7vN+EwUjlq5wmEguC0cgEDv+pvSvW9X37EH+uf
         vEhg==
X-Gm-Message-State: AOJu0YyhHsB/TdTMZCDzh2x8t60BTJgaVn7uIC7S/Pj+QpRvmKjmvXih
	PD1DYeh/v2R3z3+q3O3fqb/HzOe55o3gB1i+ubOFRdNMYOfLTez+4cZWxA36hQ==
X-Gm-Gg: AeBDiet7ILp8ETA72h0yO0nmP6OslmM9BVF5Kg9W/evg4MKTcu5EV2iJ1NGLrCVwFKe
	/c+RqSN8AkzBIjQVI33HqwUPtE3gMdHosquETyM8IhWRT69R6DlR7yjnH1Z8DzMoHCdJGgPTq62
	IPPW+s6g8BS4lpuJ+wnA3E8RWya4zKRtVzgK0y/CLcRNiqdk8fe080f2bhT4VQmN+o3iKZ4yAuS
	UzKqwYq6idNhiWEKIZBOfBy3aCYtzchSWRQKkZT4GYQaEkLK50ikGL7mU/rwPX3BbdgfwNKK5AB
	OMAziaAALZaoYH3WRMjsmJmZLNfV2mPHw3zJB8LZUbmKe3bPjdq3GktCGb1VSdFbqwelGVMar7Q
	RfAJ6aog14xphj1afg1cN40dIA7zFE05HMFXilgV3HVu3IFiOpnMLvoNyaqKxmBD+9oI+Yp2rOZ
	xnIttaForEYJc+yn5Uzfm5Jk0S9MQ5L2OsT161k945j5mR03WW6M7Nd2jx8hB3IuINlwmE4Jk86
	aggVPfYDw==
X-Received: by 2002:a05:6000:2282:b0:43d:58d0:ba1b with SMTP id ffacd0b85a97d-43d642b9855mr13539491f8f.42.1775986575733;
        Sun, 12 Apr 2026 02:36:15 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6fc9d525sm6476622f8f.36.2026.04.12.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 02:36:15 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] ovmf: backport a fix for build with gcc-16
Date: Sun, 12 Apr 2026 11:36:10 +0200
Message-ID: <20260412093610.805271-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 09:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235057

From: Martin Jansa <martin.jansa@gmail.com>

Fixes build on host with gcc-16:

StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not us=
ed [-Werror=3Dunused-but-set-variable=3D]
  113 |   UINTN       Item;
      |               ^~~~

and

EfiRom.c: In function =E2=80=98main=E2=80=99:
EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qualifie=
r from pointer target type [-Werror=3Ddiscarded-qualifiers]
   78 |       if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->File=
Name, DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {
      |                 ^

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...Tools-StringFuncs-fix-gcc-16-warning.patch | 42 ++++++++++++++++++
 ...aseTools-EfiRom-fix-compiler-warning.patch | 44 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-c=
ompiler-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-gcc=
-16-warning.patch b/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
new file mode 100644
index 0000000000..a465dede9c
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-gcc-16-war=
ning.patch
@@ -0,0 +1,42 @@
+From 015c26aea52a54e96319887ea542870b4804fb91 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 29 Jan 2026 09:23:32 +0100
+Subject: [PATCH] BaseTools/StringFuncs: fix gcc 16 warning
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
+
+Upstream-Status: Backport [edk2-stable202602 https://github.com/tianocore/=
edk2/commit/3597306191297b504683b83fe7750e49c6a2e836]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
diff --git a/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compiler=
-warning.patch b/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-comp=
iler-warning.patch
new file mode 100644
index 0000000000..7aaafe6efb
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compiler-warnin=
g.patch
@@ -0,0 +1,44 @@
+From 4d2bdadcd6d45f6708b1b4827b0dc9b6e4b8edd2 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 8 Dec 2025 10:28:50 +0100
+Subject: [PATCH] BaseTools/EfiRom: fix compiler warning
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
+
+Upstream-Status: Backport [edk2-stable202602 https://github.com/tianocore/=
edk2/commit/9af06ef3cbb052b142f9660c2c01e7aeb401300c]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index ec6c3b516c..8b13ed1936 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,6 +26,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps;ta
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
            file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instruct=
i.patch \
+           file://0006-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
+           file://0007-BaseTools-EfiRom-fix-compiler-warning.patch \
            "
=20
 PV =3D "edk2-stable202511"

