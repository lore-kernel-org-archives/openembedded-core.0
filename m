Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B58771A37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 07:54:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3H7sUle018050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 00:54:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Apr 2017 00:54:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Apr 2017 00:54:28 -0700
Message-ID: <20170417075428.31171-2-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170417075428.31171-1-liezhi.yang@windriver.com>
References: <20170417075428.31171-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gplv2] [PATCH] layer.conf: add dl layer to LAYERRECOMMENDS
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
X-List-Received-Date: Mon, 17 Apr 2017 07:54:30 -0000
Content-Type: text/plain

This is a Wind River specific patch and not generally applicable.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index f5601bb..6a660f8 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -12,4 +12,4 @@ BBFILE_PRIORITY_gplv2 = "1"
 # cause compatibility issues with other layers
 LAYERVERSION_gplv2 = "1"
 
-LAYERDEPENDS_gplv2 = "core"
+LAYERRECOMMENDS_gplv2-layer = "meta-gplv2-dl"
-- 
2.10.2


