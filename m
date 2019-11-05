Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 21EFD7F973
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:49 +0000 (UTC)
IronPort-SDR: iN5y/gbF/ymhvS5csHYTHy3TQtIKLH0p4V3LTeVzxJLdH+TikS/71U01bco9CdKO6mtN7CRl07
	1+kjjkmX7cKQmQ7nxTTeaZ9xNXxa40stFrXcFOzEGHCH8NE4tLQW6MdJ1b42X3IQDH2A3nLIhY
	MOZdBApvht/2kj5Vyd5kpdoeej7wCAlPNWuOKdTFitTBUjWJ0f4zkolvo1cjzjnPzBlqF4Qije
	U4VJkAAfoK6IN6/gXqNFsbc5yQJHEkZbMtkFZTAkAPO8+SqsXPY3I0TBq8oCaP3oaZB6JF1ZkQ
	4bo=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2115963"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:35 +0100
Message-Id: <718ca23f1ae8dd519f5ae19d26c436d9435b6055.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 5/9] package_rpm.bbclass: Remove a misleading bb.note()
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:50 -0000
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


