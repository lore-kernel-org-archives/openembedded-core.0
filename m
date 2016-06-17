Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5267318E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 08E55181D7;
	Fri, 17 Jun 2016 16:59:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 4CI-3mWE9hfv; Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id DCFC8181D5;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C7A8D1BB3;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id C669E1BB0;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id C4AFA1065;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HEx4Cp009550;
	Fri, 17 Jun 2016 16:59:04 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HEx4eb009549;
	Fri, 17 Jun 2016 16:59:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 16:59:03 +0200
Message-Id: <99f8e13269f04ca879ac6f4ad1a047fdcde08c63.1466175510.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466175510.git.pkj@axis.com>
References: <cover.1466175510.git.pkj@axis.com>
In-Reply-To: <cover.1466175510.git.pkj@axis.com>
References: <cover.1466175510.git.pkj@axis.com>
Subject: [PATCHv2 5/5] Update the documentation of USERADD_ERROR_DYNAMIC
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
X-List-Received-Date: Fri, 17 Jun 2016 14:59:07 -0000

Document that USERADD_ERROR_DYNAMIC can now take "error" or "warn" as
values, to either cause an exception or a warning in case no numeric
UID/GID can be determined for a user or group.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 0b31566..c2a5f29 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -14381,18 +14381,20 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
 
         <glossentry id='var-USERADD_ERROR_DYNAMIC'><glossterm>USERADD_ERROR_DYNAMIC</glossterm>
             <info>
-               USERADD_ERROR_DYNAMIC[doc] = "Forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in any of the files listed in USERADD_UID_TABLES and USERADD_GID_TABLES."
+               USERADD_ERROR_DYNAMIC[doc] = "If set to 'error', forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in any of the files listed in USERADD_UID_TABLES and USERADD_GID_TABLES. If set to 'warn', a warning will be issued instead."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
 <!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
 
-                    Forces the OpenEmbedded build system to produce an error if
-                    the user identification (<filename>uid</filename>) and group
-                    identification (<filename>gid</filename>) values are not
-                    defined in any of the files listed
+                    If set to "error", forces the OpenEmbedded build system to
+                    produce an error if the user identification
+                    (<filename>uid</filename>) and group identification
+                    (<filename>gid</filename>) values are not defined in any of
+                    the files listed
                     in <link linkend='var-USERADD_UID_TABLES'><filename>USERADD_UID_TABLES</filename></link>
-                    and <link linkend='var-USERADD_GID_TABLES'><filename>USERADD_GID_TABLES</filename></link>.
+                    and <link linkend='var-USERADD_GID_TABLES'><filename>USERADD_GID_TABLES</filename></link>. If
+                    set to "warn", a warning will be issued instead.
                 </para>
 
                 <para>
@@ -14408,7 +14410,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
                     your <filename>local.conf</filename> file as
                     follows:
                     <literallayout class='monospaced'>
-     USERADD_ERROR_DYNAMIC = "1"
+     USERADD_ERROR_DYNAMIC = "error"
                     </literallayout>
                     Overriding the default behavior implies you are going to
                     also take steps to set static <filename>uid</filename> and
-- 
2.9.0


