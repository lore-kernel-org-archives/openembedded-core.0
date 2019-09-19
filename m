Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30C447FE69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5F8DF1853A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:28 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id vHUx_bJtUdGG
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:27 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 91E5E184D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:27 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 506921A0B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:27 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43A311A0AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:27 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:27 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 3564F1C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:27 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x8JGZRXa016472
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:35:27 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x8JGZRSH016471
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Sep 2019 18:35:27 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 18:35:19 +0200
Message-Id: <20190919163520.16429-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] package_rpm.bbclass: Remove a misleading bb.note()
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
X-List-Received-Date: Thu, 19 Sep 2019 16:35:28 -0000
Content-Transfer-Encoding: 8bit

It should have been removed in 3db9d865 (classes/package_rpm.bbclass:
Enhance diagnostic messages) when it was split in two new notes.

Also change the casing of two other notes to align them with the other
notes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package_rpm.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a605a57ecc..9145717f98 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -409,7 +409,6 @@ python write_specfile () {
             if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
                 bb.note("Not creating empty RPM package for %s" % splitname)
             else:
-                bb.note("Creating RPM package for %s" % splitname)
                 spec_files_top.append('%files')
                 if extra_pkgdata:
                     package_rpm_extra_pkgdata(splitname, spec_files_top, localdata)
@@ -418,7 +417,7 @@ python write_specfile () {
                     bb.note("Creating RPM package for %s" % splitname)
                     spec_files_top.extend(file_list)
                 else:
-                    bb.note("Creating EMPTY RPM Package for %s" % splitname)
+                    bb.note("Creating empty RPM package for %s" % splitname)
                 spec_files_top.append('')
             continue
 
@@ -510,7 +509,7 @@ python write_specfile () {
                 bb.note("Creating RPM package for %s" % splitname)
                 spec_files_bottom.extend(file_list)
             else:
-                bb.note("Creating EMPTY RPM Package for %s" % splitname)
+                bb.note("Creating empty RPM package for %s" % splitname)
             spec_files_bottom.append('')
 
         del localdata
-- 
2.21.0


