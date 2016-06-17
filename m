Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id C28C4731D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 0F1602E21B;
	Fri, 17 Jun 2016 15:41:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id IMBn+Db69+TG; Fri, 17 Jun 2016 15:41:19 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 0668B2E1FE;
	Fri, 17 Jun 2016 15:41:19 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E4A891BB3;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D91BB1BB1;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id D6740DFA;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HDfIbc001970;
	Fri, 17 Jun 2016 15:41:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HDfIeA001969;
	Fri, 17 Jun 2016 15:41:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:41:06 +0200
Message-Id: <51eca68a76e67e8d18b7fdf2e5d3509338704f71.1466170741.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
Subject: [PATCH 4/4] Update the documentation of USERADD_ERROR_DYNAMIC
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
X-List-Received-Date: Fri, 17 Jun 2016 13:41:21 -0000

Document that USERADD_ERROR_DYNAMIC can now take "error" or "warn" as
values, to either cause an exception or a warning in case no numeric
UID/GID can be determined for a user or group.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 0252757..f825f6c 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -14381,16 +14381,19 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
 
         <glossentry id='var-USERADD_ERROR_DYNAMIC'><glossterm>USERADD_ERROR_DYNAMIC</glossterm>
             <info>
-               USERADD_ERROR_DYNAMIC[doc] = "Forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files."
+               USERADD_ERROR_DYNAMIC[doc] = "If set to 'error', forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files. If set to 'warn', a warning will be issued instead."
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
+                    If set to "error", forces the OpenEmbedded build system to
+                    produce an error if the user identification
+                    (<filename>uid</filename>) and group identification
+                    (<filename>gid</filename>) values are not defined
+                    in <filename>files/passwd</filename>
+                    and <filename>files/group</filename> files. If set to
+                    "warn", a warning will be issued instead.
                 </para>
 
                 <para>
@@ -14406,7 +14409,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
                     your <filename>local.conf</filename> file as
                     follows:
                     <literallayout class='monospaced'>
-     USERADD_ERROR_DYNAMIC = "1"
+     USERADD_ERROR_DYNAMIC = "error"
                     </literallayout>
                     Overriding the default behavior implies you are going to
                     also take steps to set static <filename>uid</filename> and
@@ -14562,7 +14565,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
 
         <glossentry id='var-USERADDEXTENSION'><glossterm>USERADDEXTENSION</glossterm>
             <info>
-               USERADDEXTENSION[doc] = "When set to "useradd-staticids", causes the OpenEmbedded build system to base all user and group additions on a static passwd and group files found in BBPATH."
+               USERADDEXTENSION[doc] = "When set to 'useradd-staticids', causes the OpenEmbedded build system to base all user and group additions on a static passwd and group files found in BBPATH."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-- 
2.9.0


