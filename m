Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D69BA7F31E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:47:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7U8kvu7005748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2019 01:47:07 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 30 Aug 2019 01:46:47 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 04:45:41 -0400
Message-ID: <1567154741-251463-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-realtime][PATCH] layer.conf: add openembedded-layer to LAYERDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 08:47:34 -0000
Content-Type: text/plain

latencytop.bb depends on gtk+ which exists at openembedded-layer.

So we should add openembedded-layer to LAYERDEPENDS, otherwise
"yocto-check-layer-wrapper meta-realtime --dependency 'cat mylist'"
will fail with "NO PROVIDE gtk+ ..."

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index cb24358..72ae7ad 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -16,4 +16,4 @@ BBFILE_PRIORITY_realtime = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_realtime = "1"
 LAYERSERIES_COMPAT_realtime = "thud warrior"
-LAYERDEPENDS_realtime = "core"
+LAYERDEPENDS_realtime = "core openembedded-layer"
-- 
2.8.1


