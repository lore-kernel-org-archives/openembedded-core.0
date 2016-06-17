Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 109A1731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 89BCB181D1;
	Fri, 17 Jun 2016 16:59:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TQMIdIyxbHKW; Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id C6451181B9;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B04BD19F8;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id A2D341BB0;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 959E8FCE;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HEx4nu009531;
	Fri, 17 Jun 2016 16:59:04 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HEx4Ob009530;
	Fri, 17 Jun 2016 16:59:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 16:58:59 +0200
Message-Id: <bd9788b15b7c83a4355f9d4a7c4443cc8e6863b4.1466175510.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466175510.git.pkj@axis.com>
References: <cover.1466175510.git.pkj@axis.com>
In-Reply-To: <cover.1466175510.git.pkj@axis.com>
References: <cover.1466175510.git.pkj@axis.com>
Subject: [PATCHv2 1/5] Update the documentation of USERADD_ERROR_DYNAMIC and USERADDEXTENSION
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
X-List-Received-Date: Fri, 17 Jun 2016 14:59:08 -0000

Suggested-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 0252757..0b31566 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -14381,16 +14381,18 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
 
         <glossentry id='var-USERADD_ERROR_DYNAMIC'><glossterm>USERADD_ERROR_DYNAMIC</glossterm>
             <info>
-               USERADD_ERROR_DYNAMIC[doc] = "Forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files."
+               USERADD_ERROR_DYNAMIC[doc] = "Forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in any of the files listed in USERADD_UID_TABLES and USERADD_GID_TABLES."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
 <!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
-                    Forces the OpenEmbedded build system to produce an error
-                    if the user identification (<filename>uid</filename>) and
-                    group identification (<filename>gid</filename>) values
-                    are not defined in <filename>files/passwd</filename>
-                    and <filename>files/group</filename> files.
+
+                    Forces the OpenEmbedded build system to produce an error if
+                    the user identification (<filename>uid</filename>) and group
+                    identification (<filename>gid</filename>) values are not
+                    defined in any of the files listed
+                    in <link linkend='var-USERADD_UID_TABLES'><filename>USERADD_UID_TABLES</filename></link>
+                    and <link linkend='var-USERADD_GID_TABLES'><filename>USERADD_GID_TABLES</filename></link>.
                 </para>
 
                 <para>
@@ -14562,17 +14564,16 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
 
         <glossentry id='var-USERADDEXTENSION'><glossterm>USERADDEXTENSION</glossterm>
             <info>
-               USERADDEXTENSION[doc] = "When set to "useradd-staticids", causes the OpenEmbedded build system to base all user and group additions on a static passwd and group files found in BBPATH."
+               USERADDEXTENSION[doc] = "When set to 'useradd-staticids', causes the OpenEmbedded build system to base all user and group additions on files listed in USERADD_UID_TABLES and USERADD_GID_TABLES."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
 <!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When set to "useradd-staticids", causes the
                     OpenEmbedded build system to base all user and group
-                    additions on a static
-                    <filename>passwd</filename> and
-                    <filename>group</filename> files found in
-                    <link linkend='var-BBPATH'><filename>BBPATH</filename></link>.
+                    additions on files listed
+                    in <link linkend='var-USERADD_UID_TABLES'><filename>USERADD_UID_TABLES</filename></link>
+                    and <link linkend='var-USERADD_GID_TABLES'><filename>USERADD_GID_TABLES</filename></link>.
                 </para>
 
                 <para>
-- 
2.9.0


