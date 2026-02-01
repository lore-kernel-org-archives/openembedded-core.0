Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20478D172CA
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29058.1769951567353759956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aLDQPWZD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fiXDo1Ns;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c19559afe-31db5c68-52d3-496e-bddb-15aeef036d95-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ENHQY4Igp7VFV58Xw9g/vIf83x2syQTFlT0X8/6RRIM=;
	b=aLDQPWZDnNB81deuqJIzTyHJZvyXhuONUoeM5O4XAEqGLt+VRfJrtMcXJVyZgFhe
	r7ge1cxRoy1t20iVtP3XPNTBcm8K64sxxMd7nQcPAsleRjhPUp4P0bpQGy/1YeI4T/T
	/lDsxcA9TDdsaVBlrfiN15g6F3H0IYdG5C0A95Z0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ENHQY4Igp7VFV58Xw9g/vIf83x2syQTFlT0X8/6RRIM=;
	b=fiXDo1NsTLpL6jWh9CujWsDeMhrgub+rsB0/ZKweSf0tBxpzb57a66wHAW2F9FBB
	krj236YRC7MhWUFTGIftBuj5bsJIaromkWbqAyobvrQ+jJoelxIuF4zjFlw8/67aEGO
	evH3EHMD+fIrPkKufgCyLIE+IgWMnGvwxXu7lCAE=
Content-Type: multipart/mixed; boundary="===============3166033670965015046=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to bd3356ac13f411b521b16b11da12cec5150e917c
 SUCCEEDED
Message-ID: <0101019c19559afe-31db5c68-52d3-496e-bddb-15aeef036d95-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230276

--===============3166033670965015046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *bd3356ac13f411b521b16b11da12cec5150e917c* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From e7a7ab8f5dc10c33300b1c72ecff52490cf81313 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 07:54:26 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 81d1814191..4aedd2b7d2 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "103f8b437f5e791e0aef9d5c372521a5d675fabb"
+SRCREV = "bd3356ac13f411b521b16b11da12cec5150e917c"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============3166033670965015046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13

--===============3166033670965015046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 100552288 to 100575680 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3124483 to 3129109 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3682488 to 3686584 (+0%)
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+103f8b437f to 0+git0+bd3356ac13

--===============3166033670965015046==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBlN2E3YWI4ZjVkYzEwYzMzMzAwYjFjNzJlY2ZmNTI0OTBjZjgxMzEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNzo1NDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z24vZ25fZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIKaW5kZXggODFkMTgxNDE5MS4u
NGFlZGQyYjdkMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCkBAIC03LDcgKzcsNyBA
QCBERVBFTkRTICs9ICJuaW5qYS1uYXRpdmUiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ24uZ29vZ2xlc291cmNlLmNvbS9nbjtwcm90b2NvbD1odHRw
czticmFuY2g9bWFpbiIKLVNSQ1JFViA9ICIxMDNmOGI0MzdmNWU3OTFlMGFlZjlkNWMzNzI1MjFh
NWQ2NzVmYWJiIgorU1JDUkVWID0gImJkMzM1NmFjMTNmNDExYjUyMWIxNmIxMWRhMTJjZWM1MTUw
ZTkxN2MiCiBQViA9ICIwK2dpdCIKIAogQkJfR0lUX1NIQUxMT1cgPSAiIgotLSAKMi40Ny4xCgo=

--===============3166033670965015046==--

