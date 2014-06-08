Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 274246A87C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jun 2014 11:54:30 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id n15so2446760lbi.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jun 2014 04:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=57x/SBG3D86Oq9p4U8fKAivuk1FsAOmkzKWMIeaMFFo=;
	b=eEMd932h4A/127OSfp8R9uBlXqrdqpxne8ssoP0j3adUVOu17yV6wrzUDks6DHDgCw
	C5s22KtEbKu6N/epzX+3Hv2vVyr6eyfpzGH5V6Zd7+IyCWiBLQ1t7sx8sXtdAlMme8Mu
	LcE0VWxOJ3j9OZPRw0fAmgNBc9TPR8aWO0h2e8t2ibZ1ZKBSv1AMvEpy5FZi9yljU843
	VnNniVvqEiF8MpbDVxuklHMqPW9Zub8YFZjQRCL/s7JOXKVIpYRvWzHvcfhha2Ay1f6U
	0MhQYN0gDlaf7k26p5natf3lWmFErL+SgTfxnA+5bfmJ/JD3vNmlrp2/bBeLBTvtnRqY
	80mQ==
X-Received: by 10.152.207.74 with SMTP id lu10mr12982716lac.28.1402228470958; 
	Sun, 08 Jun 2014 04:54:30 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by mx.google.com with ESMTPSA id
	aa1sm14795924lbd.12.2014.06.08.04.54.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jun 2014 04:54:30 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jun 2014 13:52:56 +0200
Message-Id: <1402228376-17520-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] default-distrovars.inc: Remove unused variable 'LIMIT_BUILT_LOCALES'
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
X-List-Received-Date: Sun, 08 Jun 2014 11:54:39 -0000

This variable is a left-over from early glibc recipes.
It is not referenced anymore in oe-core, and its functionality
has been replaced with 'GLIBC_GENERATE_LOCALES'.

Also remove the reference to it in local.conf.sample.extended.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta/conf/distro/include/default-distrovars.inc | 1 -
 meta/conf/local.conf.sample.extended            | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 0bc3adc..1bc8e46 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -5,7 +5,6 @@ KERNEL_CONSOLE ?= "ttyS0"
 KEEPUIMAGE ??= "yes"
 
 IMAGE_LINGUAS ?= "en-us en-gb"
-LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index a1f2464..1032bde 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -27,12 +27,10 @@
 # Set GLIBC_GENERATE_LOCALES to the locales you wish to generate should you not
 # wish to perform the time-consuming step of generating all LIBC locales.
 # NOTE: If removing en_US.UTF-8 you will also need to uncomment, and set
-# appropriate values for IMAGE_LINGUAS and LIMIT_BUILT_LOCALES
+# appropriate value for IMAGE_LINGUAS.
 # WARNING: this may break localisation!
 #GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
-# See message above as to whether setting these is required
 #IMAGE_LINGUAS ?= "en-gb"
-#LIMIT_BUILT_LOCALES ?= "POSIX en_GB"
 
 # The following are used to control options related to debugging.
 #
-- 
1.9.3


