Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 37BDF60053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 22:28:59 +0000 (UTC)
Received: by igrv9 with SMTP id v9so61798660igr.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bKxGrlV1AEtbPYt0AwpRmZ3hoR0uMsGUN+QhG/2DbOY=;
	b=ASpPUgaQsMZZSta5p6Z2zNjIxEuwalrvHV9Na6K6Ui+6XD328o03HV8HUVBZ8XAUUm
	W5a1wcNb+tAbUn1PxHEu5ihJAKkxVk7JKrBRbriVNIl2Pf1BmyrHAJclbaOgH8NNrg1v
	aXECtoKIl529fToWvmoISNuBg/S8vmzwPrF9vNmzf7BjZrkdoh2x9xE5SzHIB0jhuK2c
	d1dAr6i02O0l9TAVWHda0rNFpvuuKM9wsuFU45KLW3dwu5VsemcxKyZMiqnVFn1Plyjr
	T/pTJ3ZqN7RjotCqV4vXgvBueH3WEzpXjx0NsFLa88QRHU/0VkN3v4+AibyhyrtY3vPC
	0iXw==
X-Received: by 10.43.10.194 with SMTP id pb2mr6621icb.31.1435703340148;
	Tue, 30 Jun 2015 15:29:00 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id p4sm224239igg.20.2015.06.30.15.28.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jun 2015 15:28:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 15:28:48 -0700
Message-Id: <1435703330-15892-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] gcc: update i586 TARGET_ARCH tests to also handle i686
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
X-List-Received-Date: Tue, 30 Jun 2015 22:29:05 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc          | 1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 04c701a..d63c07f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -34,6 +34,7 @@ def get_gcc_multiarch_setting(bb, d):
     target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     multiarch_options = {
         "i586":    "--enable-targets=all",
+        "i686":    "--enable-targets=all",
         "powerpc": "--enable-targets=powerpc64",
         "mips":    "--enable-targets=all",
         "sparc":   "--enable-targets=all",
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 6134097..dcd0819 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -120,6 +120,7 @@ python gcc_multilib_setup() {
     gcc_target_config_files = {
         'x86_64'    : ['gcc/config/i386/t-linux64'],
         'i586'      : ['gcc/config/i386/t-linux64'],
+        'i686'      : ['gcc/config/i386/t-linux64'],
         'mips'      : ['gcc/config/mips/t-linux64'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
@@ -128,6 +129,7 @@ python gcc_multilib_setup() {
     gcc_header_config_files = {
         'x86_64'    : ['gcc/config/i386/linux64.h'],
         'i586'      : ['gcc/config/i386/linux64.h'],
+        'i686'      : ['gcc/config/i386/linux64.h'],
         'mips'      : ['gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
-- 
1.9.1


