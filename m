Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pvaui-0005pQ-TH
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:43:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Mar 2011 11:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="397767415"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by azsmga001.ch.intel.com with ESMTP; 04 Mar 2011 11:42:17 -0800
Message-Id: <2f24addbd02039fb9b6489c90c5d1c687c0d0698.1299267630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299267630.git.sgw@linux.intel.com>
References: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 09:19:39 -0600
Date: Fri, 04 Mar 2011 11:42:17 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 10/13] documentation/kernel-manual: Kernel manual Style changes
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
X-List-Received-Date: Fri, 04 Mar 2011 19:43:55 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

Modifications to the figure image (figures/kernel-title.png),
the heading styles (style.css), and the numbering system with
TOC display (yocto-project-kernel-manual-customization.xsl).

I updated the title image to display the manual title using
color #00557D, which coordinates with the Yocto Project website
color scheme.  I also updated the style sheet to use this same
color for the section headings.  This helps to set them off better
from the text.  Finally, I flipped the switch back on for this
manual to create chapter-specific table of contents sections
prior to each chapter and to include a all-inclusive TOC at the
beginning of the book.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 .../kernel-manual/figures/kernel-title.png         |  Bin 14334 -> 14305 bytes
 documentation/kernel-manual/style.css              |   30 ++++++++++----------
 .../yocto-project-kernel-manual-customization.xsl  |    2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/documentation/kernel-manual/figures/kernel-title.png b/documentation/kernel-manual/figures/kernel-title.png
index d81ec8ae13b4924da2efbc15e0b0da58343496aa..965264ccc5f6d7fa3cf85b9c1edca78e136ceaf1 100644
GIT binary patch
literal 14305
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

literal 14334
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

diff --git a/documentation/kernel-manual/style.css b/documentation/kernel-manual/style.css
index 35ed9f3..33a01d1 100644
--- a/documentation/kernel-manual/style.css
+++ b/documentation/kernel-manual/style.css
@@ -56,7 +56,7 @@ body {
 
 h1,h2,h3,h4,h5,h6,h7 {
   font-family: Arial, Sans;
-  color:#999999;
+  color: #00557D;
   clear: both;
 }
 
@@ -79,9 +79,8 @@ h2.subtitle {
 h2 {
   margin: 2em 0em 0.66em 0em;
   padding: 0.5em 0em 0em 0em;
-  font-size: 2em;
+  font-size: 1.5em;
   font-weight: bold;
-  color: black;
 }
 
 h3.subtitle {
@@ -94,29 +93,29 @@ h3.subtitle {
 h3 {
   margin: 1em 0em 0.5em 0em;
   padding: 1em 0em 0em 0em;
-  font-size: 150%;
+  font-size: 140%;
   font-weight: bold;
-  color: black;
-  border-bottom: 2px solid black;
 }
 
 h4 {
   margin: 1em 0em 0.5em 0em;
   padding: 1em 0em 0em 0em;
-  font-size: 130%;
-  border-bottom: 1px solid black;
+  font-size: 120%;
+  font-weight: bold;
 }
 
 h5 {
   margin: 1em 0em 0.5em 0em;
   padding: 1em 0em 0em 0em;
-  font-size: 120%;
+  font-size: 110%;
+  font-weight: bold;
 }
 
 h6 {
   margin: 1em 0em 0em 0em;
   padding: 1em 0em 0em 0em;
-  font-size: 100%;
+  font-size: 80%;
+  font-weight: bold;
 }
 
 .authorgroup {
@@ -124,12 +123,12 @@ h6 {
   background-repeat: no-repeat;
   padding-top: 256px;
   background-image: url("figures/kernel-title.png");
-  background-position: top;
+  background-position: left top;
   margin-top: -256px;
   padding-right: 50px;
-  margin-left: 50px;
+  margin-left: 0px;
   text-align: right;
-  width: 700px;
+  width: 740px;
 }
 
 h3.author {
@@ -137,6 +136,7 @@ h3.author {
   padding: 0em 0em 0em 0em;
   font-weight: normal;
   font-size: 100%;
+  color: #333;
   clear: both;
 }
 
@@ -159,6 +159,7 @@ h3.author {
 .list-of-examples,
 .list-of-figures {
   padding: 1.33em 0em 2.5em 0em;
+  color: #00557D;
 }
 
 .toc p,
@@ -246,7 +247,6 @@ div.legalnotice p.legalnotice-title {
 p {
   line-height: 1.5em;
   margin-top: 0em;
-  color: black; font-size: 100%;
   
 }
 
@@ -946,7 +946,7 @@ table {
 
 .tip,
 .note {
-   background: #91ae35;
+   background: #666666;
    color: #fff;   
    padding: 20px;
    margin: 20px;
diff --git a/documentation/kernel-manual/yocto-project-kernel-manual-customization.xsl b/documentation/kernel-manual/yocto-project-kernel-manual-customization.xsl
index 8e6ea34..8eb6905 100644
--- a/documentation/kernel-manual/yocto-project-kernel-manual-customization.xsl
+++ b/documentation/kernel-manual/yocto-project-kernel-manual-customization.xsl
@@ -3,6 +3,6 @@
   
   <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/docbook.xsl" />
 
-  <xsl:param name="generate.toc" select="'article nop'"></xsl:param>
+<!--  <xsl:param name="generate.toc" select="'article nop'"></xsl:param>  -->
 
 </xsl:stylesheet>
-- 
1.7.1.1



