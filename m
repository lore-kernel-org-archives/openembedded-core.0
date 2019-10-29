Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CAD827FB21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a15so577137wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nySQ/H3xDz6KELGcKtKc0U+fJEb6LxzBJ0NBkMqAQIc=;
	b=ITi6Ze3OSflrya+lxSuPvm1KlAGdRMq4+CMiZpMcIhG4WpK3e1JAVtRjNjv1MD0/lx
	mKyS1cCCuk0xjILFfCbEHDVfv0sA1Ih7cElTHAeJ7/+MYxd2da/gDeKilfDWbnrUdUL+
	qPaoKmp0L7I5T+k+WeNKYKE4NVXcIflKTZ6GOIt58gz4dpbYSFS1HVo9M7ZlrzdMXd2a
	x+kFCq4DYX0KrQvxL2VHdrGEHaM0exGVrbBBpZMfoO3emuuWLEJeXxiyC82RTcvwLEdO
	qP1RHrz7By/VVdqxGU5e19YcDh3SNva/7uD46V7gRmoerz2/3ywlFm7jHoFk/OeWVEDY
	Vt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nySQ/H3xDz6KELGcKtKc0U+fJEb6LxzBJ0NBkMqAQIc=;
	b=UOa4ghjv7Bpb2C5vGmCMpXR/3HIXNWvlW983JnlWZXSx50tot3Xy91qI5OeARsHLeq
	zd49DxMH2XAgn/cExWVeRagkKgOFJnxYpuwgLhRI91DFCpyaRvZ2rkR61kI0+spFena5
	VSu8Xu9jA5bUQ7DsqLGUCEQB4MFDHRsWCsz9gAfUCm/KHJkLAHUoJOiJ5TAjMJ5X/qgV
	vZOAYQMyfnojfkifU9QAczE1TOr9OILOsL9RzAzSIyHyko1Mzp5TrjVNBUjlhWmemxSH
	RXrSyM0JYZcC1SIO+9kNkI5bTRH8063Gry8O05NN60rG17etQYStTEdLzHrL8i7lCxdD
	oY/w==
X-Gm-Message-State: APjAAAXV6ipF0lF0M+SsKEtvvsk4695mQX81SWUC6FSJgEyVKSloulXo
	rBFGjrdCYWHAJkaEXchlcPQLNCw4jjA=
X-Google-Smtp-Source: APXvYqwZHNM7tXodjMhaBDN3f71WcI0rXltspAflibi5IsxZm9k/T/Gzi8Qc8dgURPRC9ptwOMQFOQ==
X-Received: by 2002:adf:e651:: with SMTP id b17mr17711075wrn.191.1572342471302;
	Tue, 29 Oct 2019 02:47:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:23 +0100
Message-Id: <8cb696bf7b8c6eb689339d3435f0e49e1a3ddb48.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 10/19] libcroco: Fix two CVEs
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:51 -0000

From: Muminul Islam <misla011@fiu.edu>

CVE: CVE-2017-8834 CVE-2017-8871

Signed-off-by: Muminul Islam <muislam@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libcroco/libcroco/CVE-2017-8834_71.patch       | 38 ++++++++++++++++++++++
 meta/recipes-support/libcroco/libcroco_0.6.12.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch
new file mode 100644
index 0000000..cdfc9cf
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch
@@ -0,0 +1,38 @@
+From 38bdf8e956218dd6a72942229cf39ef8e45dd28f Mon Sep 17 00:00:00 2001
+From: Mike Gorse <mgorse@alum.wpi.edu>
+Date: Thu, 2 May 2019 10:54:43 -0500
+Subject: [PATCH] cr_utils_read_char_from_utf8_buf: move past invalid UTF-8
+Reply-To: muislam@microsoft.com; Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+
+Otherwise, the offending character is never consumed, possibly leading
+to an infinite loop.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=782647
+
+CVE: CVE-2017-8834 CVE-2017-8871
+
+Upstream-Status: Backport
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+Upstream commit: https://bug782647.bugzilla-attachments.gnome.org/attachment.cgi?id=374219
+---
+ src/cr-utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/cr-utils.c b/src/cr-utils.c
+index 2420cec..6cf4849 100644
+--- a/src/cr-utils.c
++++ b/src/cr-utils.c
+@@ -505,6 +505,7 @@ cr_utils_read_char_from_utf8_buf (const guchar * a_in,
+ 
+         } else {
+                 /*BAD ENCODING */
++                nb_bytes_2_decode = 1;
+                 goto end;
+         }
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index f95a583..85a120d 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -18,6 +18,7 @@ inherit gnomebase gtk-doc binconfig-disabled
 
 SRC_URI += "file://CVE-2017-7960.patch \
             file://CVE-2017-7961.patch \
+            file://CVE-2017-8834_71.patch \
             "
 
 SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
-- 
2.7.4


