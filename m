Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39020.1795601001386293642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 02:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=A0KsdW3N;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2651BC2BB3C
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 55CA260480
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76AED11E69C2F;
	Wed, 25 Nov 2026 11:03:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795600998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZgJFXBODjjoI7SdyOldse8Qyyoc8z9Kp5utzwfe/U4s=;
	b=A0KsdW3NgfW6G6XEKX2K+6DU0TppmZeCdANXhZqftyuC1yo65/eAuor6LS86Uf42um2aGd
	kGK6GwtRGK1c4VFgQyqdeJaSg/IAaWClZYuenb28Yr+kLqcP2+zhjWdU8bljZcJiG9mX4C
	b92pf3kekky9LnUmVXf+GyTVDZU30qzbWrxNp5kj96G8KPHsPHFqxlTeK6LoqvqVhknmRM
	JiTwfexS5zlXp++apkwqCKxtWR7yx6OVTFt6e1XtHujoQUZltoGSfxR5w4VQK3FC1SWW4p
	NXfPtqkIPN4R9KMLMeeyXXE2iOt/0zhlA4t9nuCDOOVeP7KcivK7lM6aTZxqDQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 25 Nov 2026 11:03:05 +0100
Subject: [PATCH 1/2] zstd: upgrade 1.5.7 -> 1.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-zstd-1-6-0-v1-1-95f50c6b9de6@bootlin.com>
References: <20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com>
In-Reply-To: <20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3274;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ULPX3yf2kox2x5BS8XTD52ci0lWOBHLzr41tk7SMjp4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrBrJavetOsxKFQ+j8kcqgoBFQ7Sr5CubeGWIhL
 amB+e+j3mWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawayWgAKCRDRgEFAKaOo
 Nso9EACzI1UO2MTv6PJJGGJtR7vzavBRUJHgPtQubxawAWtWG1LSuI7WjmiSRBZ/sCRmSPL4FWG
 L+fsRNpYvb9T/ZlsTEwHVYtBqZu4JW6PLhZmcQ7XfYRM0npvkrL7cwvXfNUFDZnF4rMvqQPScUN
 bTWt//8TrCa3xb/8SeySPGy62X8f1B14IOAkWA21fJepd/RNtdCrnKGHihdTc42UiSBh2Kfscof
 HXzvQV81Fdw74qoZpnZ+l0bMBCKboRK53cI+NfjbwCBCEWzKks21n6hAyb7ObWxd3j6dJ8RMdYB
 Wz9hR6j9FPafJPFn+d9pyclrQP4TS1rFrVK7WBkOMCUWcFyZm4+I3ruCKumFd/JrlB0corNswOr
 bWBWcoSzwEoTVSNfdkpPWrlpxWV67h73ZyuovVE98+kTE6HtXBv0cKMCkl5mJR0Qf8IN09e7pc2
 B9BLs5bQ2Wj1llBAgyCIdY6jdDlhXAwA23PgZryC3qg/CP7AktG5V0GQ/mH1xyM+b2BWToMg7EK
 qgXXi+yXVpUrwmcG2tKTx1Lqp8V4vKSbfILMtooYRsgU5OnWlEvHooVr/re7UWEdJ3yxgbN4z6o
 lUifLOZpzeGGf4oiRaxiJqhoMy8OWyeKpbEfWtpaFn2bA+zLmAG6nkUDJ6Ox3Fi2vqY3J5v+uak
 dFt9lHrKrLfy7rA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251177

Changelog summary:

 This release comes mid-way through an effort that was initially meant to
 bring you the next version of Zstandard. Instead, it was refocused on
 answering the avalanche of reports received in the past few weeks.
 Thankfully, most of them are minor (or duplicates), but one of them is
 going to be published as a CVE, and that is why we are publishing this
 early release today.

Full changelog:
https://github.com/meta/zstd/releases/tag/v1.6.0

Verified that ptests passed on qemux86-64, and fix an issue with zstd's
usage of dd not being compatible with the one provided by busybox.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch  | 4 ++--
 meta/recipes-extended/zstd/{zstd_1.5.7.bb => zstd_1.6.0.bb}          | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch b/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
index d7559f7269..6163201bf2 100644
--- a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 5182d7671cb65346b55d3ff8eda6388f876a7431 Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
 Date: Thu, 27 Aug 2026 12:00:00 +0000
 Subject: [PATCH] cli-tests: skip zstd --max level when memory is insufficient
@@ -15,7 +15,7 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/cli-tests/compression/levels.sh b/tests/cli-tests/compression/levels.sh
-index b8230f2..7846d3e 100755
+index b8230f2a3..7846d3ec0 100755
 --- a/tests/cli-tests/compression/levels.sh
 +++ b/tests/cli-tests/compression/levels.sh
 @@ -16,8 +16,8 @@ zstd --fast=10 file -o file-f10.zst -q
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.6.0.bb
similarity index 94%
rename from meta/recipes-extended/zstd/zstd_1.5.7.bb
rename to meta/recipes-extended/zstd/zstd_1.6.0.bb
index 4c3b377c14..6e4e07050a 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https;tag=
            file://0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch \
            "
 
-SRCREV = "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
+SRCREV = "916e8e70b33317d469a41ee837e47317807815c8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
@@ -81,4 +81,5 @@ do_install_ptest() {
     rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/levels.sh.stderr.exact
 }
 
-RDEPENDS:${PN}-ptest += "bash grep less python3-core python3-modules"
+# we need coreutils' dd for the cli-tests because busybox's dd doesn't support "status=none"
+RDEPENDS:${PN}-ptest += "bash grep less python3-core python3-modules coreutils"

-- 
2.56.0

