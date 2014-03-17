Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF3226F09E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 06:42:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2H6g24r006375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 23:42:02 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 16 Mar 2014 23:42:01 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Mar 2014 14:41:58 +0800
Message-ID: <f228c093f2cd9e1c29aabdfb463c1f6934edd63b.1395038473.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395038473.git.Chong.Lu@windriver.com>
References: <cover.1395038473.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tar: add knob whether acl.h are checked
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
X-List-Received-Date: Mon, 17 Mar 2014 06:42:01 -0000
Content-Type: text/plain

Previously, it still was checked when there was no sys/acl.h in sysroots directory.
Add knob to decide whether acl.h are checked or not.

Fixed by using PACKAGECONFIG to check acl, with default disabled set.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/tar/tar.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index 358384a..30a1373 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -26,6 +26,8 @@ do_install_extra () {
 
 PACKAGES =+ "${PN}-rmt"
 
+PACKAGECONFIG[acl] = "--with-posix-acls, --without-posix-acls, acl,"
+
 FILES_${PN}-rmt = "${base_sbindir}/rmt*"
 
 inherit update-alternatives
-- 
1.8.1.2


