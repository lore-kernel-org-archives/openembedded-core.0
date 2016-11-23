Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB79719B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 17:42:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uANHgCie029960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:42:12 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 23 Nov 2016 09:42:11 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 11:42:09 -0600
Message-ID: <20161123174209.211349-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161123174209.211349-1-mark.hatle@windriver.com>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Wed, 23 Nov 2016 17:42:11 -0000
Content-Type: text/plain

This is a Wind River specific patch and not generally applicable.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 24b4df0..a94e524 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -11,6 +11,8 @@ BBFILE_PRIORITY_core = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_core = "9"
 
+LAYERRECOMMENDS_core = "oe-core-dl-2-2"
+
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
 # Set a variable to get to the top of the metadata location
-- 
2.9.3


