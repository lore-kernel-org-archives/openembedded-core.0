Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6C86CC79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 17:41:20 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id z2so27751wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 09:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8O4MILSFdFyvFljmP7YYri1wDb2zmc0wH9DQlnPSQik=;
	b=ju/7c++KZbQIcryj+GmUWYKuZ3fM/SE/92hPjHd+J8KClLX27KQcSXQVWMzDAKSYPV
	Hl1JwSSLGrJN9SnwshZhq74DYnNhW4Tqp02s95T6mhw/7vlTG2bAsvUVgFeGGmG+b55y
	jyMDRWLa7uNMw7ZU9elSCiNprH1adfwWeSsFflVhec+VxKTvS2EieHbH3rp+TC0KDjLm
	V5mZt+bJDZTNnwdPcQip+BLfS4JqWH7HVZNglouJHCnYq9d8T6HMD0dWx8DvpuvelnJr
	5EySzR3/jNYcKvwYZSkQYWlhx3AfG0gkDfZFJdiu3rkIBXaAhPyZYKsSOnuuCG/NLwdb
	7ykQ==
X-Gm-Message-State: ALoCoQmRj0egzkzZlWI2RcXzvNbIRdPzUNrMVMzhpUsLsgJPk0T/CZn0Vq/IULTFmy9Iqfb2ZopV
X-Received: by 10.180.109.201 with SMTP id hu9mr12891022wib.59.1386265279172; 
	Thu, 05 Dec 2013 09:41:19 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hv5sm8294879wib.2.2013.12.05.09.41.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 09:41:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 17:41:16 +0000
Message-Id: <1386265276-20664-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] documentation.conf: update for new image testing variables
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
X-List-Received-Date: Thu, 05 Dec 2013 17:41:20 -0000

IMAGETEST is now TEST_IMAGE, and TEST_SCEN and TEST_SERIALIZE don't exist
anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/documentation.conf |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 6666648..a40b0b8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -118,7 +118,6 @@ IMAGE_LINGUAS[doc] = "Specifies the list of locales to install into the image du
 IMAGE_OVERHEAD_FACTOR[doc] = "Defines a multiplier that the build system applies to the initial image size for cases when the multiplier times the returned disk usage value for the image is greater than the sum of IMAGE_ROOTFS_SIZE and IMAGE_ROOTFS_EXTRA_SPACE."
 IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."
 IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
-IMAGETEST[doc] = "Enable test booting of virtual machine images under the qemu emulator after any root filesystems are created and run tests against those images."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
@@ -262,8 +261,7 @@ TARGET_PREFIX[doc] = "The prefix for the cross compile toolchain. E.g arm-linux-
 TARGET_SYS[doc] = "The target system is composed out of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
 TCLIBC[doc] = "Specifies which variant of the GNU standard C library (libc) to use during the build process. You can select eglibc or uclibc."
 TCMODE[doc] = "The toolchain selector. It selects the external toolchain built using the OpenEmbedded build system or a few supported combinations of the upstream GCC or CodeSourcery Labs toolchain."
-TEST_SCEN[doc] = "Controls which tests are run against virtual images if testing is enabled with IMAGETEST."
-TEST_SERIALIZE[doc] = "Controls the time taken by the sanity tests."
+TEST_IMAGE[doc] = "Enable test booting of virtual machine images under the qemu emulator after any root filesystems are created and run tests against those images."
 TIME[doc] = "The time the build was started HMS"
 TMPDIR[doc] = "This variable is the temporary directory the OpenEmbedded build system uses when it does its work building images. By default, the TMPDIR variable is named tmp within the Build Directory."
 TOPDIR[doc] = "This variable is the Build Directory. BitBake automatically sets this variable. The OpenEmbedded build system uses the Build Directory when building images."
-- 
1.7.10.4


