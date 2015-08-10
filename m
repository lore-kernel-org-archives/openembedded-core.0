Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBE17671F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 20:00:32 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so8294959igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9w0dHV/PI8wXrVjmTBxGh8GhvaI8r5t8LTW0T38c2EQ=;
	b=pPJCXg5ZdnRv1lZ3WX7Ttfeo3qYxFscWZb1Tz/nUBPnwBrsMLndi5W0Oz4aqtkk0hJ
	7LjcT6G7D/BImG3oVwaPm07EWk2bhEYuh9+X80Pb2xn5wcjVxVLSQzIWZh+YoKtRyUek
	LHgVg1l2s1sSg5fptPtFGYjB3W+K8oI/PAIYTCEjUx7PBeXTWfiNm0fyVTq5ur74nT3P
	YiTVt7Qe4MZDQCbL/ry4PdxuXueKzXovWo6YxCa/DBG9kqYbCktDJX4gPlXlexY5knpZ
	Ef7xX8kLLQnEuXZoVS/QpkfArmertEdJGGl3ZbOSN+ABK+8eBxf+cWqB6W0en8BqIdNC
	5+ow==
X-Received: by 10.50.111.83 with SMTP id ig19mr12402214igb.82.1439236832626;
	Mon, 10 Aug 2015 13:00:32 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	i13sm13857273ioe.4.2015.08.10.13.00.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Aug 2015 13:00:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 13:00:23 -0700
Message-Id: <1439236824-13191-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] local.conf.sample: fix trailing whitespace
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
X-List-Received-Date: Mon, 10 Aug 2015 20:00:35 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/local.conf.sample | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 3ae24ab..a398a15 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -2,11 +2,11 @@
 # This file is your local configuration file and is where all local user settings
 # are placed. The comments in this file give some guide to the options a new user
 # to the system might want to change but pretty much any configuration option can
-# be set in this file. More adventurous users can look at local.conf.extended 
+# be set in this file. More adventurous users can look at local.conf.extended
 # which contains other examples of configuration which can be placed in this file
 # but new users likely won't need any of them initially.
 #
-# Lines starting with the '#' character are commented out and in some cases the 
+# Lines starting with the '#' character are commented out and in some cases the
 # default values are provided as comments to show people example syntax. Enabling
 # the option is a question of removing the # character and making any change to the
 # variable as required.
@@ -72,8 +72,8 @@ MACHINE ??= "qemux86"
 #
 # Package Management configuration
 #
-# This variable lists which packaging formats to enable. Multiple package backends 
-# can be enabled at once and the first item listed in the variable will be used 
+# This variable lists which packaging formats to enable. Multiple package backends
+# can be enabled at once and the first item listed in the variable will be used
 # to generate the root filesystems.
 # Options are:
 #  - 'package_deb' for debian style deb files
@@ -87,7 +87,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 # SDK/ADT target architecture
 #
 # This variable specifies the architecture to build SDK/ADT items for and means
-# you can build the SDK packages for architectures other than the machine you are 
+# you can build the SDK packages for architectures other than the machine you are
 # running the build on (i.e. building i686 packages on an x86_64 host).
 # Supported values are i686 and x86_64
 #SDKMACHINE ?= "i686"
@@ -95,7 +95,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 #
 # Extra image configuration defaults
 #
-# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
 #  "dbg-pkgs"       - add -dbg packages for all installed packages
@@ -120,7 +120,7 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # Additional image features
 #
 # The following is a list of additional classes to use when building images which
-# enable extra features. Some available options which can be included in this variable 
+# enable extra features. Some available options which can be included in this variable
 # are:
 #   - 'buildstats' collect build statistics
 #   - 'image-mklibs' to reduce shared library files size for an image
@@ -142,8 +142,8 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 #
 # Interactive shell configuration
 #
-# Under certain circumstances the system may need input from you and to do this it 
-# can launch an interactive shell. It needs to do this since the build is 
+# Under certain circumstances the system may need input from you and to do this it
+# can launch an interactive shell. It needs to do this since the build is
 # multithreaded and needs to be able to handle the case where more than one parallel
 # process may require the user's attention. The default is iterate over the available
 # terminal types to find one that works.
@@ -181,13 +181,13 @@ BB_DISKMON_DIRS = "\
 #
 # Shared-state files from other locations
 #
-# As mentioned above, shared state files are prebuilt cache data objects which can 
+# As mentioned above, shared state files are prebuilt cache data objects which can
 # used to accelerate build time. This variable can be used to configure the system
 # to search other mirror locations for these objects before it builds the data itself.
 #
 # This can be a filesystem directory, or a remote url such as http or ftp. These
-# would contain the sstate-cache results from previous builds (possibly from other 
-# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the 
+# would contain the sstate-cache results from previous builds (possibly from other
+# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
 # cache locations to check for the shared objects.
 # NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
 # at the end as shown in the examples below. This will be substituted with the
-- 
1.9.1


