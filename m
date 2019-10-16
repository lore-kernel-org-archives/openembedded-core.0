Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85F897F34E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 08E1618422
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:44 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id VABZciAKe1Ze
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:43 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id AF6A818442
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 960D01E07D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A45D1E07C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 7E3D72CE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x9GGUfXe018437
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x9GGUfxH018436
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Oct 2019 18:30:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 18:30:28 +0200
Message-Id: <559ff12282eab242ef4cd03a2c3b2a8351233335.1571243326.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1571243326.git.pkj@axis.com>
References: <cover.1571243326.git.pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [warrior][PATCH 4/8] package_rpm.bbclass: Remove a misleading bb.note()
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
X-List-Received-Date: Wed, 16 Oct 2019 16:30:44 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

It should have been removed in 3db9d865 (classes/package_rpm.bbclass:
Enhance diagnostic messages) when it was split in two new notes.

Also change the casing of two other notes to align them with the other
notes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1a64cb271a..b1b13e2a5a 100644
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


