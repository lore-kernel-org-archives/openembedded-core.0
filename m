Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RJicH-0000H7-46
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 11:20:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9S9EgWi027955
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 02:14:42 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 28 Oct 2011 02:14:42 -0700
Message-ID: <6f0b96b7ef399fd7c78b2135a71b010e2613ae26.1319793342.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1319793342.git.xiaofeng.yan@windriver.com>
References: <cover.1319793342.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 28 Oct 2011 17:09:58 +0800
Date: Fri, 28 Oct 2011 17:21:38 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libarchive: modify the status of updating
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
X-List-Received-Date: Fri, 28 Oct 2011 09:20:46 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

update to 2.8.5

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1f3540e..12c8fc0 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4615,7 +4615,10 @@ RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_STATUS_pn-directfb = "red"
 RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
-RECIPE_STATUS_pn-libarchive  = "red"
+RECIPE_STATUS_pn-libarchive  = "green"
+RECIPE_LATEST_VERSION_pn-libarchive = "2.8.5"
++RECIPE_LATEST_RELEASE_DATE_pn-libarchive = "Sept 3, 2011"
++RECIPE_LAST_UPDATE_pn-libarchive = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-xserver-kdrive  = "red"
-- 
1.7.0.4



