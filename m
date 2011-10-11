Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RDXk0-00072u-Vr
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 10:31:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B8PU03019308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 01:25:30 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 11 Oct 2011 01:25:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2011 16:25:29 +0800
Message-ID: <ab7c12d54b2e4c470c51cf203e7ae63f6bf544e1.1318321409.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1318321409.git.liezhi.yang@windriver.com>
References: <cover.1318321409.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Fix typos in local.conf.sample and local.conf.sample.extended
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Oct 2011 08:31:13 -0000
Content-Type: text/plain

Fixes bug [YOCTO #1667]

Fix typos in local.conf.sample and local.conf.sample.extended:

differernt -> different
chages -> changes
complation -> compilation
egde -> edge
"an an" -> "as an"
images's -> image's

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-yocto/conf/local.conf.sample          |   10 +++++-----
 meta-yocto/conf/local.conf.sample.extended |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index 0c24208..da3f8df 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -53,7 +53,7 @@ MACHINE ??= "qemux86"
 #
 # Where to place downloads
 #
-# During a first build the system will download many differernt source code tarballs
+# During a first build the system will download many different source code tarballs
 # from various upstream projects. This can take a while, particularly if your network
 # connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
 # can preserve this directory to speed up this part of subsequent builds. This directory
@@ -71,7 +71,7 @@ MACHINE ??= "qemux86"
 # and this option determines where those files are placed.
 #
 # You can wipe out TMPDIR leaving this directory intact and the build would regenerate
-# from these files if no chages were made to the configuration. If changes were made
+# from these files if no changes were made to the configuration. If changes were made
 # to the configuration, only shared state files where the state was still valid would
 # be used (done using checksums).
 #
@@ -84,7 +84,7 @@ MACHINE ??= "qemux86"
 #
 # This option specifies where the bulk of the building work should be done and
 # where BitBake should place its temporary files and output. Keep in mind that
-# this includes the extraction and complation of many applications and the toolchain
+# this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
 #
 # The default is a tmp directory under TOPDIR.
@@ -100,9 +100,9 @@ MACHINE ??= "qemux86"
 # these defaults.
 #
 DISTRO ?= "poky"
-# As an exable of a subclass there is a "bleeding" egde policy configuration 
+# As an example of a subclass there is a "bleeding" edge policy configuration
 # where many versions are set to the absolute latest code from the upstream 
-# source control systems. This is just mentioned here an an example, its not
+# source control systems. This is just mentioned here as an example, its not
 # useful to most new users.
 # DISTRO ?= "poky-bleeding"
 
diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
index a42774c..9b50aba 100644
--- a/meta-yocto/conf/local.conf.sample.extended
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -2,7 +2,7 @@
 # certain recipes.
 #BBMASK = ""
 
-# eglibc configurability is used to reduce minimal images's size.
+# eglibc configurability is used to reduce minimal image's size.
 # the all supported eglibc options are listed in DISTRO_FEATURES_LIBC
 # and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
 # and DISTRO_FEATURES definitions to local.conf to enable the options.
@@ -78,7 +78,7 @@
 # The default is "default"
 # Use "external-MODE" to use the precompiled external toolchains where MODE
 # is the type of external toolchain to use e.g. eabi. You need to ensure 
-# the toolchain you want to use is included in an an appropriate layer
+# the toolchain you want to use is included in an as appropriate layer
 # TCMODE = "external-eabi"
 
 # mklibs library size optimization is more useful to smaller images,
-- 
1.7.1



