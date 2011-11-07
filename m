Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNN7P-0000Rj-Q1
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 12:12:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA7B5jWZ000604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 03:05:45 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 7 Nov 2011 03:05:45 -0800
Message-ID: <211a5266e0de338e1e20938a5c1db5be869aa015.1320664163.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1320664163.git.xiaofeng.yan@windriver.com>
References: <cover.1320664163.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 7 Nov 2011 18:59:36 +0800
Date: Mon, 7 Nov 2011 19:13:40 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OE_core][PATCH 2/2] distro_tracking_fields.inc: update libarchive to 2.8.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 11:12:02 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Modified the status of libarchive

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 998eabf..0eb253f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4615,7 +4615,10 @@ RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_STATUS_pn-directfb = "red"
 RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
-RECIPE_STATUS_pn-libarchive  = "red"
+RECIPE_STATUS_pn-libarchive  = "green"
+RECIPE_LATEST_VERSION_pn-libarchive = "2.8.5"
+RECIPE_LATEST_RELEASE_DATE_pn-libarchive = "Sept 3, 2011"
+RECIPE_LAST_UPDATE_pn-libarchive = "Nov 7, 2011"
 RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-xserver-kdrive  = "red"
-- 
1.7.0.4



