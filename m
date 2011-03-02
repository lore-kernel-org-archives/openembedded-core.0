Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqO6-00072e-F9
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:03:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Mar 2011 10:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="893055736"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2011 10:00:20 -0800
Message-Id: <aa2bdf7c26486961e040c95f17789064968eb9c0.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Fri, 25 Feb 2011 12:47:12 -0600
Date: Wed, 02 Mar 2011 10:00:19 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:48 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 06/26] documentation/poky-ref-manual/ref-images.xml: Update to Images Appendix
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
X-List-Received-Date: Wed, 02 Mar 2011 18:03:03 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

Added command 'ls meta*/recipes*/images/*.bb' as the command to see the
supported images.  Also added poky-image-lsb as an image and noted
that poky-image-sdk has becom poky-image-sato-dev.

These fixes are in response to alpha testing for release 1.0 Yocto.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/poky-ref-manual/ref-images.xml |   59 +++++++++++++++-----------
 1 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/documentation/poky-ref-manual/ref-images.xml b/documentation/poky-ref-manual/ref-images.xml
index b74b523..9477883 100644
--- a/documentation/poky-ref-manual/ref-images.xml
+++ b/documentation/poky-ref-manual/ref-images.xml
@@ -5,62 +5,71 @@
     <title>Reference: Images</title>
 
     <para>
-        Poky has several standard images covering most people's standard needs. A full 
-        list of image targets can be found by looking in the directories 
-        <filename class="directory">  meta/recipes-core/images/</filename>, 
-        <filename class="directory">  meta/recipes-extended/images/</filename>, 
-        <filename class="directory">  meta/recipes-sato/images/</filename> and 
-        <filename class="directory">  meta/recipes-tbd/meta/</filename>. The standard 
-        images are listed below along with details of what they contain:
+        Poky has several standard images covering most people's standard needs. 
+        Use the following command to list the supported images:
+        <literallayout class='monospaced'>
+     $ ls meta*/recipes*/images/*.bb
+        </literallayout>
+        Images are listed below along with details of what they contain:
     </para>
 
     <itemizedlist>
             <listitem>
                 <para>
-                    <emphasis>poky-image-minimal</emphasis> - A small image, just enough 
-                    to allow a device to boot
+                    <emphasis>poky-image-minimal</emphasis> - A small image just capable 
+                    of allowing a device to boot.
                 </para>
             </listitem>
             <listitem>
                 <para>
-                    <emphasis>poky-image-base</emphasis> - console only image with full
-                    support of target device hardware
+                    <emphasis>poky-image-base</emphasis> - A console-only image that fully 
+                    supports the target device hardware. 
                 </para>
             </listitem>
             <listitem>
                 <para>
-                    <emphasis>poky-image-core</emphasis> - X11 image with simple apps like
-                    terminal, editor and file manager
+                    <emphasis>poky-image-core</emphasis> - An X11 image with simple 
+                    applications such as terminal, editor, and file manager.
                 </para>
             </listitem>
             <listitem>
                 <para>
-                    <emphasis>poky-image-sato</emphasis> - X11 image with Sato theme and
-                    Pimlico applications. Also contains terminal, editor and file manager.
+                    <emphasis>poky-image-sato</emphasis> - An X11 image with Sato theme and
+                    Pimlico applications. 
+                    The image also contains terminal, editor, and file manager.
                 </para>
             </listitem>
             <listitem>
                 <para>
-                    <emphasis>poky-image-sdk</emphasis> - X11 image like poky-image-sato but
-                    also include native toolchain and libraries needed to build applications 
-                    on the device itself. Also includes testing and profiling tools and debug
-                    symbols.
+                    <emphasis>poky-image-sato-dev</emphasis> - An X11 image similar to 
+                    poky-image-sato but
+                    also includes a native toolchain and libraries needed to build applications 
+                    on the device itself. The image also includes testing and profiling tools 
+                    as well as debug symbols.  This image was formerly poky-image-sdk.
                 </para>
             </listitem>
             <listitem>
                 <para>
-                    <emphasis>meta-toolchain</emphasis> - This generates a tarball containing
-                    a standalone toolchain which can be used externally to Poky. It is self
-                    contained and unpacks to the <filename class="directory">/opt/poky</filename>
-                    directory. It also contains a copy of QEMU and the scripts necessary to run 
+                    <emphasis>poky-image-lsb</emphasis> - An image suitable for implementations 
+                    that conform to Linux Standard Base (LSB).
+                </para>
+            </listitem>
+            <listitem>
+                <para>
+                    <emphasis>meta-toolchain</emphasis> - This image generates a tarball 
+                    that contains a stand-alone toolchain that can be used externally to Poky. 
+                    The tarball is self-contained and unpacks to the 
+                    <filename class="directory">/opt/poky</filename> directory. 
+                    The tarball also contains a copy of QEMU and the scripts necessary to run 
                     poky QEMU images.
                 </para>
             </listitem>
             <listitem>
                 <para>
-                    <emphasis>meta-toolchain-sdk</emphasis> - This includes everything in 
+                    <emphasis>meta-toolchain-sdk</emphasis> - This image includes everything in 
                     meta-toolchain but also includes development headers and libraries
-                    forming a complete standalone SDK. See the <link linkend='platdev-appdev-external-sdk'> 
+                    to form a complete standalone SDK. 
+                    See the <link linkend='platdev-appdev-external-sdk'> 
                     External Development Using the Poky SDK</link> section for more information.
                 </para>
             </listitem>
-- 
1.7.1



