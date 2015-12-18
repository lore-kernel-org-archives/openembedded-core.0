Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 11803731CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 23:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 758D02E181
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lDKoqmDyBDuN
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 350832E18E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 120841220
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 10EFAED
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0458E3E3C9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id tBINs3rW017947
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id tBINs3nv017946
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Dec 2015 00:54:03 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 00:53:52 +0100
Message-Id: <2058386927894a15c7088ab3a2c63cee05ed7ba7.1450482563.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
Subject: [PATCHv2 6/6] useradd-staticids.bbclass: Remove unnecessary spaces
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
X-List-Received-Date: Fri, 18 Dec 2015 23:54:07 -0000

This removes unnecessary spaces inserted before semicolons in the
modified USERADD_PARAM_${PN} and GROUPADD_PARAM_${PN} variables. This
should not affect the handling of the variables as the only one that
actually sees the semicolons is the code in useradd.bbclass that uses
cut to split the variables at them, and any whitespace preceeding or
following the semicolons will be properly ignored.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 4e0ab1b..a9b506d 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -152,7 +152,7 @@ def update_useradd_static_config(d):
                 if newgroup:
                     groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
                     if groupadd:
-                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
+                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s; %s" % (groupadd, newgroup))
                     else:
                         d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
 
@@ -191,7 +191,7 @@ def update_useradd_static_config(d):
 
             newparams.append(newparam)
 
-        return " ;".join(newparams).strip()
+        return ";".join(newparams).strip()
 
     # We parse and rewrite the groupadd components
     def rewrite_groupadd(params):
@@ -269,7 +269,7 @@ def update_useradd_static_config(d):
 
             newparams.append(newparam)
 
-        return " ;".join(newparams).strip()
+        return ";".join(newparams).strip()
 
     # Load and process the users and groups, rewriting the adduser/addgroup params
     useradd_packages = d.getVar('USERADD_PACKAGES', True)
-- 
2.1.0


