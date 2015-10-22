Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1960E75D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 00:17:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 21 Oct 2015 17:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,179,1444719600"; d="scan'208";a="799692494"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 21 Oct 2015 17:17:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 17:11:11 -0700
Message-Id: <1445472671-24263-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ref-manual: Updated ADT Installer Extras
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
X-List-Received-Date: Thu, 22 Oct 2015 00:17:38 -0000

opkg 0.3.0 requires also libarchive.

[YOCTO#8308]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 documentation/ref-manual/introduction.xml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/introduction.xml b/documentation/ref-manual/introduction.xml
index 5148acb..e9309ef 100644
--- a/documentation/ref-manual/introduction.xml
+++ b/documentation/ref-manual/introduction.xml
@@ -250,7 +250,7 @@
                         Packages needed if you are going to be using the
                         <ulink url='&YOCTO_DOCS_ADT_URL;#using-the-adt-installer'>Application Development Toolkit (ADT) Installer</ulink>:
                         <literallayout class='monospaced'>
-     $ sudo apt-get install autoconf automake libtool libglib2.0-dev
+     $ sudo apt-get install autoconf automake libtool libglib2.0-dev libarchive-dev
                         </literallayout></para></listitem>
                     <listitem><para><emphasis>OpenEmbedded Self-Test (<filename>oe-selftest</filename>):</emphasis>
                         Packages needed if you are going to run
@@ -294,7 +294,7 @@
                         Packages needed if you are going to be using the
                         <ulink url='&YOCTO_DOCS_ADT_URL;#using-the-adt-installer'>Application Development Toolkit (ADT) Installer</ulink>:
                         <literallayout class='monospaced'>
-     $ sudo dnf install autoconf automake libtool glib2-devel
+     $ sudo dnf install autoconf automake libtool glib2-devel libarchive-devel
                         </literallayout></para></listitem>
                     <listitem><para><emphasis>OpenEmbedded Self-Test (<filename>oe-selftest</filename>):</emphasis>
                         Packages needed if you are going to run
@@ -337,7 +337,7 @@
                         Packages needed if you are going to be using the
                         <ulink url='&YOCTO_DOCS_ADT_URL;#using-the-adt-installer'>Application Development Toolkit (ADT) Installer</ulink>:
                         <literallayout class='monospaced'>
-     $ sudo zypper install autoconf automake libtool glib2-devel
+     $ sudo zypper install autoconf automake libtool glib2-devel libarchive-devel
                         </literallayout></para></listitem>
                     <listitem><para><emphasis>OpenEmbedded Self-Test (<filename>oe-selftest</filename>):</emphasis>
                         Packages needed if you are going to run
@@ -392,7 +392,7 @@
                         Packages needed if you are going to be using the
                         <ulink url='&YOCTO_DOCS_ADT_URL;#using-the-adt-installer'>Application Development Toolkit (ADT) Installer</ulink>:
                         <literallayout class='monospaced'>
-     $ sudo dnf install autoconf automake libtool glib2-devel
+     $ sudo dnf install autoconf automake libtool glib2-devel libarchive-devel
                         </literallayout></para></listitem>
                     <listitem><para><emphasis>OpenEmbedded Self-Test (<filename>oe-selftest</filename>):</emphasis>
                         Packages needed if you are going to run
-- 
1.9.1


