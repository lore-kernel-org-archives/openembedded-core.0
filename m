Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BACD6E746
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 08:53:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1A8roat008549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 00:53:50 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 00:53:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2014 16:53:47 +0800
Message-ID: <c5ee50d48c41d084887911553092daf62f8d7e3c.1392022374.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392022374.git.Qi.Chen@windriver.com>
References: <cover.1392022374.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sysstat: upgrade to 10.2.1
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
X-List-Received-Date: Mon, 10 Feb 2014 08:53:49 -0000
Content-Type: text/plain

Upgrade sysstat to stable release 10.2.1.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{sysstat_10.2.0.bb => sysstat_10.2.1.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_10.2.0.bb => sysstat_10.2.1.bb} (40%)

diff --git a/meta/recipes-extended/sysstat/sysstat_10.2.0.bb b/meta/recipes-extended/sysstat/sysstat_10.2.1.bb
similarity index 40%
rename from meta/recipes-extended/sysstat/sysstat_10.2.0.bb
rename to meta/recipes-extended/sysstat/sysstat_10.2.1.bb
index 5be68a0..654457d 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.2.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.2.1.bb
@@ -2,5 +2,5 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI[md5sum] = "7a6e3df08590385113a27a76ce64a6ff"
-SRC_URI[sha256sum] = "2e0fee87cec7f56ba121c320327843278e2bda30bacd54851628eab0ba09429a"
+SRC_URI[md5sum] = "039dcd235dfcfb3d4acc0a05730f9512"
+SRC_URI[sha256sum] = "3bfd1b4c5b99314585709c092096234b6e181741729f601d18d0ed7f0612612a"
-- 
1.7.9.5


