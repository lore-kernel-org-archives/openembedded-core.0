Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7342365F2A
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 21:35:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2014 14:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,807,1400050800"; d="scan'208";a="554234796"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2014 14:35:50 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	darren.hart@intel.com, Openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:39:56 -0700
Message-Id: <56edbd5eccdf7ebf4255142b52bf88b5a30f5040.1407274547.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1407274547.git.nitin.a.kamble@intel.com>
References: <cover.1407274547.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] INITRD var: documentation changes
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
X-List-Received-Date: Tue, 05 Aug 2014 21:35:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The use of the INITRD variable is changed in a recent commit. Instead of
specifying a single filesystem image, it specifies a list of file system
images. Reflecting this change in the documentation.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 documentation/ref-manual/ref-classes.xml   | 4 ++--
 documentation/ref-manual/ref-variables.xml | 2 +-
 meta/conf/documentation.conf               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index e7e9942..91dbfda 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -881,7 +881,7 @@
         <itemizedlist>
             <listitem><para>
                 <link linkend='var-INITRD'><filename>INITRD</filename></link>:
-                Indicates a filesystem image to use as an initrd (optional).
+                Indicates a list of filesystem images to concatenate and use as an initrd (optional).
                 </para></listitem>
             <listitem><para>
                 <link linkend='var-ROOTFS'><filename>ROOTFS</filename></link>:
@@ -2864,7 +2864,7 @@
         The class supports the following variables:
         <itemizedlist>
             <listitem><para><emphasis><link linkend='var-INITRD'><filename>INITRD</filename></link>:</emphasis>
-                Indicates a filesystem image to use as an initial RAM disk
+                Indicates a list of filesystem images to concatenate and use as an initial RAM disk
                 (initrd).
                 This variable is optional.</para></listitem>
             <listitem><para><emphasis><link linkend='var-ROOTFS'><filename>ROOTFS</filename></link>:</emphasis>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index b4d6e71..7808de6 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -4020,7 +4020,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
         <glossentry id='var-INITRD'><glossterm>INITRD</glossterm>
             <glossdef>
                 <para>
-                    Indicates a filesystem image to use as an initial RAM
+                    Indicates a list of filesystem images to concatenate and use as an initial RAM
                     disk (<filename>initrd</filename>).
                 </para>
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 31fbd6c..eb36de0 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -225,7 +225,7 @@ INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binar
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
 INHERIT_DISTRO[doc] = "Lists classes that will be inherited at the distribution level. It is unlikely that you want to edit this variable."
 INITRAMFS_FSTYPES[doc] = "Defines the format for the output image of an initial RAM disk (initramfs), which is used during boot."
-INITRD[doc] = "Indicates list of filesystem images to concatenate and use as an initial RAM disk (initrd)."
+INITRD[doc] = "Indicates a list of filesystem images to concatenate and use as an initial RAM disk (initrd)."
 INITSCRIPT_NAME[doc] = "The filename of the initialization script as installed to ${sysconfdir}/init.d."
 INITSCRIPT_PACKAGES[doc] = "A list of the packages that contain initscripts. This variable is used in recipes when using update-rc.d.bbclass. The variable is optional and defaults to the PN variable."
 INITSCRIPT_PARAMS[doc] = "Specifies the options to pass to update-rc.d. The variable is mandatory and is used in recipes when using update-rc.d.bbclass."
-- 
1.8.1.4


