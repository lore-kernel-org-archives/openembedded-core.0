Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A16EE49A6
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:12:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9362.1692619923411974322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3401F143D;
	Mon, 21 Aug 2023 05:12:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC9B13F762;
	Mon, 21 Aug 2023 05:12:01 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] linux/cve-exclusions: update CVE_STATUS exclusions
Date: Mon, 21 Aug 2023 13:11:59 +0100
Message-Id: <20230821121159.3924600-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821121159.3924600-1-ross.burton@arm.com>
References: <20230821121159.3924600-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 12:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186436

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 42 +++++++++++++++++--
 .../linux/cve-exclusion_6.4.inc               | 42 +++++++++++++++++--
 2 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 2441788008a..499785f6d2d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,5 +1,5 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-09 15:51:19.757857 for version 6.1.43
+# Generated at 2023-08-21 12:41:13.991251 for version 6.1.43
=20
 CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
=20
@@ -4451,6 +4451,8 @@ CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixe=
d after version 6.1rc1"
=20
 CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed after version 6.0rc4=
"
=20
+# CVE-2022-40982 has no known resolution
+
 CVE_STATUS[CVE-2022-41218] =3D "cpe-stable-backport: Backported in 6.1.4=
"
=20
 CVE_STATUS[CVE-2022-41222] =3D "fixed-version: Fixed after version 5.14r=
c1"
@@ -4635,7 +4637,7 @@ CVE_STATUS[CVE-2023-1192] =3D "cpe-stable-backport:=
 Backported in 6.1.33"
=20
 CVE_STATUS[CVE-2023-1195] =3D "fixed-version: Fixed after version 6.1rc3=
"
=20
-# CVE-2023-1206 has no known resolution
+CVE_STATUS[CVE-2023-1206] =3D "cpe-stable-backport: Backported in 6.1.43=
"
=20
 CVE_STATUS[CVE-2023-1249] =3D "fixed-version: Fixed after version 5.18rc=
1"
=20
@@ -4691,7 +4693,11 @@ CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixe=
d after version 5.19rc4"
=20
 CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed after version 6.0rc1=
"
=20
-# CVE-2023-20593 has no known resolution
+# CVE-2023-20569 has no known resolution
+
+# CVE-2023-20588 has no known resolution
+
+CVE_STATUS[CVE-2023-20593] =3D "cpe-stable-backport: Backported in 6.1.4=
1"
=20
 CVE_STATUS[CVE-2023-20928] =3D "fixed-version: Fixed after version 6.0rc=
1"
=20
@@ -4709,6 +4715,10 @@ CVE_STATUS[CVE-2023-2124] =3D "cpe-stable-backport=
: Backported in 6.1.33"
=20
 CVE_STATUS[CVE-2023-21255] =3D "cpe-stable-backport: Backported in 6.1.3=
1"
=20
+# CVE-2023-21264 needs backporting (fixed from 6.4rc5)
+
+# CVE-2023-21400 has no known resolution
+
 CVE_STATUS[CVE-2023-2156] =3D "cpe-stable-backport: Backported in 6.1.26=
"
=20
 CVE_STATUS[CVE-2023-2162] =3D "cpe-stable-backport: Backported in 6.1.11=
"
@@ -4777,6 +4787,8 @@ CVE_STATUS[CVE-2023-2598] =3D "fixed-version: only =
affects 6.3rc1 onwards"
=20
 # CVE-2023-26242 has no known resolution
=20
+# CVE-2023-2640 has no known resolution
+
 CVE_STATUS[CVE-2023-26544] =3D "cpe-stable-backport: Backported in 6.1.3=
"
=20
 CVE_STATUS[CVE-2023-26545] =3D "cpe-stable-backport: Backported in 6.1.1=
3"
@@ -4867,6 +4879,8 @@ CVE_STATUS[CVE-2023-32258] =3D "cpe-stable-backport=
: Backported in 6.1.29"
=20
 CVE_STATUS[CVE-2023-32269] =3D "cpe-stable-backport: Backported in 6.1.1=
1"
=20
+# CVE-2023-32629 has no known resolution
+
 CVE_STATUS[CVE-2023-3268] =3D "cpe-stable-backport: Backported in 6.1.28=
"
=20
 CVE_STATUS[CVE-2023-3269] =3D "cpe-stable-backport: Backported in 6.1.37=
"
@@ -4905,6 +4919,8 @@ CVE_STATUS[CVE-2023-34255] =3D "cpe-stable-backport=
: Backported in 6.1.33"
=20
 CVE_STATUS[CVE-2023-34256] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
=20
+# CVE-2023-34319 has no known resolution
+
 CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed after version 5.18rc=
5"
=20
 CVE_STATUS[CVE-2023-35001] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
@@ -4965,3 +4981,23 @@ CVE_STATUS[CVE-2023-38432] =3D "cpe-stable-backpor=
t: Backported in 6.1.36"
=20
 CVE_STATUS[CVE-2023-3863] =3D "cpe-stable-backport: Backported in 6.1.39=
"
=20
+CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport: Backported in 6.1.42=
"
+
+# CVE-2023-4010 has no known resolution
+
+# CVE-2023-4128 needs backporting (fixed from 6.5rc5)
+
+CVE_STATUS[CVE-2023-4132] =3D "cpe-stable-backport: Backported in 6.1.39=
"
+
+# CVE-2023-4133 needs backporting (fixed from 6.3)
+
+# CVE-2023-4134 needs backporting (fixed from 6.5rc1)
+
+CVE_STATUS[CVE-2023-4147] =3D "cpe-stable-backport: Backported in 6.1.43=
"
+
+# CVE-2023-4155 has no known resolution
+
+# CVE-2023-4194 needs backporting (fixed from 6.5rc5)
+
+# CVE-2023-4273 needs backporting (fixed from 6.5rc5)
+
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.4.inc
index 98e9ee25a5b..b9210724bf0 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -1,5 +1,5 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-09 15:51:30.073765 for version 6.4.9
+# Generated at 2023-08-21 12:41:33.545124 for version 6.4.9
=20
 CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed after version 2.6.12=
rc2"
=20
@@ -4451,6 +4451,8 @@ CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixe=
d after version 6.1rc1"
=20
 CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed after version 6.0rc4=
"
=20
+# CVE-2022-40982 has no known resolution
+
 CVE_STATUS[CVE-2022-41218] =3D "fixed-version: Fixed after version 6.2rc=
1"
=20
 CVE_STATUS[CVE-2022-41222] =3D "fixed-version: Fixed after version 5.14r=
c1"
@@ -4635,7 +4637,7 @@ CVE_STATUS[CVE-2023-1192] =3D "fixed-version: Fixed=
 after version 6.4rc1"
=20
 CVE_STATUS[CVE-2023-1195] =3D "fixed-version: Fixed after version 6.1rc3=
"
=20
-# CVE-2023-1206 has no known resolution
+CVE_STATUS[CVE-2023-1206] =3D "cpe-stable-backport: Backported in 6.4.8"
=20
 CVE_STATUS[CVE-2023-1249] =3D "fixed-version: Fixed after version 5.18rc=
1"
=20
@@ -4691,7 +4693,11 @@ CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixe=
d after version 5.19rc4"
=20
 CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed after version 6.0rc1=
"
=20
-# CVE-2023-20593 has no known resolution
+# CVE-2023-20569 has no known resolution
+
+# CVE-2023-20588 has no known resolution
+
+CVE_STATUS[CVE-2023-20593] =3D "cpe-stable-backport: Backported in 6.4.6=
"
=20
 CVE_STATUS[CVE-2023-20928] =3D "fixed-version: Fixed after version 6.0rc=
1"
=20
@@ -4709,6 +4715,10 @@ CVE_STATUS[CVE-2023-2124] =3D "fixed-version: Fixe=
d after version 6.4rc1"
=20
 CVE_STATUS[CVE-2023-21255] =3D "fixed-version: Fixed after version 6.4rc=
4"
=20
+CVE_STATUS[CVE-2023-21264] =3D "fixed-version: Fixed after version 6.4rc=
5"
+
+# CVE-2023-21400 has no known resolution
+
 CVE_STATUS[CVE-2023-2156] =3D "fixed-version: Fixed after version 6.3"
=20
 CVE_STATUS[CVE-2023-2162] =3D "fixed-version: Fixed after version 6.2rc6=
"
@@ -4777,6 +4787,8 @@ CVE_STATUS[CVE-2023-2598] =3D "fixed-version: Fixed=
 after version 6.4rc1"
=20
 # CVE-2023-26242 has no known resolution
=20
+# CVE-2023-2640 has no known resolution
+
 CVE_STATUS[CVE-2023-26544] =3D "fixed-version: Fixed after version 6.2rc=
1"
=20
 CVE_STATUS[CVE-2023-26545] =3D "fixed-version: Fixed after version 6.2"
@@ -4867,6 +4879,8 @@ CVE_STATUS[CVE-2023-32258] =3D "fixed-version: Fixe=
d after version 6.4rc1"
=20
 CVE_STATUS[CVE-2023-32269] =3D "fixed-version: Fixed after version 6.2rc=
7"
=20
+# CVE-2023-32629 has no known resolution
+
 CVE_STATUS[CVE-2023-3268] =3D "fixed-version: Fixed after version 6.4rc1=
"
=20
 CVE_STATUS[CVE-2023-3269] =3D "cpe-stable-backport: Backported in 6.4.1"
@@ -4905,6 +4919,8 @@ CVE_STATUS[CVE-2023-34255] =3D "fixed-version: Fixe=
d after version 6.4rc1"
=20
 CVE_STATUS[CVE-2023-34256] =3D "fixed-version: Fixed after version 6.4rc=
2"
=20
+# CVE-2023-34319 has no known resolution
+
 CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed after version 5.18rc=
5"
=20
 CVE_STATUS[CVE-2023-35001] =3D "cpe-stable-backport: Backported in 6.4.4=
"
@@ -4965,3 +4981,23 @@ CVE_STATUS[CVE-2023-38432] =3D "fixed-version: Fix=
ed after version 6.4"
=20
 CVE_STATUS[CVE-2023-3863] =3D "cpe-stable-backport: Backported in 6.4.4"
=20
+CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport: Backported in 6.4.7"
+
+# CVE-2023-4010 has no known resolution
+
+# CVE-2023-4128 needs backporting (fixed from 6.5rc5)
+
+CVE_STATUS[CVE-2023-4132] =3D "cpe-stable-backport: Backported in 6.4.4"
+
+CVE_STATUS[CVE-2023-4133] =3D "fixed-version: Fixed after version 6.3"
+
+CVE_STATUS[CVE-2023-4134] =3D "cpe-stable-backport: Backported in 6.4.4"
+
+CVE_STATUS[CVE-2023-4147] =3D "cpe-stable-backport: Backported in 6.4.8"
+
+# CVE-2023-4155 has no known resolution
+
+# CVE-2023-4194 needs backporting (fixed from 6.5rc5)
+
+# CVE-2023-4273 needs backporting (fixed from 6.5rc5)
+
--=20
2.34.1


