Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ty3Ph-0006b8-GO
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 17:43:12 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 08:26:20 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so1201219wib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 08:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=92wTryR7muY0AVy5EHKmK36GRu/g6o1Euv4D/P2M8OY=;
	b=WcLSGWa6dnyFusIjPgvfI0pH3cXAcDtkOiQMTPIhXhPRDsYPBJBcMOFYbkNtNKjOTU
	hKR+0785FrojSC4eKUiiPjxuYjjrtIBPkHzXdjQN5IC0UUEIeByapKKfyZzqvIPE0K58
	l8q2Wgv6dXFB7yql5HC6iqI/QN52jttMHKvrKibgHX0+vfvZtVhMjul3C6Lq0w+K4pSV
	4x+w1RtXmZoKlLotO/KUBJvTd2g9rcaeLxLqrC6Ct3kpaB2s+vMu956n080BzbUeSETG
	LaG6xd2E+KATFE8U9tLbFqLi1GBSxqXltQwVsBRju7UrhMLPbn5Jp0nkFr+utl0Z8kiY
	o5IA==
X-Received: by 10.180.90.106 with SMTP id bv10mr3650728wib.12.1358958447032;
	Wed, 23 Jan 2013 08:27:27 -0800 (PST)
X-Received: by 10.180.90.106 with SMTP id bv10mr3650713wib.12.1358958446849;
	Wed, 23 Jan 2013 08:27:26 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm30300597wia.10.2013.01.23.08.27.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Jan 2013 08:27:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 16:24:15 +0000
Message-Id: <1358958255-16099-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlQ8EXSv8fx866Pr84Y+zT4wPPRv/hfTRBgTu4hq4/rUeNpO/fiS4cUZd99DzcMwtbZ8BAFpaDi1f75Jv3/FOseDUHSbFj8EsfH/GQlasM+y2LF21AIV5iwkKMy7bGWipHhQPq21FYH/OYNxgACt1mK3Cn4m5Tr6nOLqMNrNd0b7pK3f8bRVW1tofbGODAuodoCQmRp
Subject: [PATCH] meta: remove all mention of PCMCIA_MANAGER
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 16:43:13 -0000

Nothing appears to use this anymore, and it's been a very long time since there
was anyone expressing an interest in the alternatives.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf                          |    1 -
 meta/conf/distro/include/default-distrovars.inc |    2 --
 meta/conf/documentation.conf                    |    2 --
 meta/conf/machine/include/qemu.inc              |    1 -
 4 files changed, 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2dc50ca..ad03bdb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -707,7 +707,6 @@ DL_DIR ?= "${TOPDIR}/downloads"
 SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?= "tar.gz"
 INITRAMFS_FSTYPES ?= "cpio.gz"
-PCMCIA_MANAGER ?= "pcmciautils"
 DEFAULT_TASK_PROVIDER ?= "packagegroup-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 IMAGE_ROOTFS_SIZE ?= "65536"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f073547..1169ca5 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -4,8 +4,6 @@ OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
 KEEPUIMAGE ??= "yes"
 
-PCMCIA_MANAGER ?= "pcmciautils"
-
 IMAGE_LINGUAS ?= "en-us en-gb"
 LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index e8a1811..0e7c395 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -109,8 +109,6 @@ T[doc]       = "Temporary directory within the WORKDIR."
 GROUP_locale[doc] = "Locale generation of the GNU libc implementation"
 ENABLE_BINARY_LOCALE_GENERATION[doc] = "Enable the use of qemu to generate locale information during build time on the host instead of runtime on the target. If you have trouble with qemu-native you should make this an empty var. @group locale"
 
-PCMCIA_MANAGER[doc] = "Specify which package(s) to install to handle PCMCIA slots (currently, pcmciautils)."
-
 SYSVINIT_ENABLED_GETTYS[doc] = "Specify which VTs should be running a getty, the default is 1"
 
 IPK_FEED_URIS[doc] = "List of ipkg feed records to put into generated image."
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index de694bd..f68bf32 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,4 +1,3 @@
-PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-- 
1.7.10.4



