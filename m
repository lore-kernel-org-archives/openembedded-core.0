Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCA297147B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 07:50:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAO7oFnO026334
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Nov 2014 23:50:15 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 23 Nov 2014 23:50:15 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 15:49:36 +0800
Message-ID: <695c1768459f4164feae5255ecae76796e9b184b.1416815305.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416815305.git.Chong.Lu@windriver.com>
References: <cover.1416815305.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] upstream_tracking.inc: update entries for dbus
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
X-List-Received-Date: Mon, 24 Nov 2014 07:50:14 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-yocto/conf/distro/include/upstream_tracking.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index 350326b..d2aba6f 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -46,7 +46,7 @@ RECIPE_UPSTREAM_VERSION_pn-cups = "1.6.2"
 RECIPE_UPSTREAM_DATE_pn-cups = "Mar 18, 2013"
 CHECK_DATE_pn-cups = "Jun 11, 2013"
 RECIPE_NO_UPDATE_REASON_pn-db= "API compatibility issue"
-RECIPE_NO_UPDATE_REASON_pn-dbus = "D-BUS 1.7.x is the development version, not stable."
+RECIPE_NO_UPDATE_REASON_pn-dbus = "D-BUS 1.9.x is the development version, not stable."
 RECIPE_NO_UPDATE_REASON_pn-docbook-sgml-dtd-3.1-native = "PRS Reports Incorrectly"
 RECIPE_NO_UPDATE_REASON_pn-docbook-sgml-dtd-4.1-native = "PRS Reports Incorrectly"
 RECIPE_NO_UPDATE_REASON_pn-docbook-sgml-dtd-4.5-native = "PRS Reports Incorrectly"
-- 
1.9.1


