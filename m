Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DFA873010
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 03:13:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1M3DRXF001271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 19:13:27 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Feb 2017 19:13:26 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2017 11:13:43 +0800
Message-ID: <6f50dc0edc4a4433131f012209da7686eab1208b.1487733094.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1487733094.git.Qi.Chen@windriver.com>
References: <cover.1487733094.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/4] sysstat: upgrade to 11.5.4
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
X-List-Received-Date: Wed, 22 Feb 2017 03:13:27 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.5.3.bb => sysstat_11.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.3.bb => sysstat_11.5.4.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.5.3.bb b/meta/recipes-extended/sysstat/sysstat_11.5.4.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.5.3.bb
rename to meta/recipes-extended/sysstat/sysstat_11.5.4.bb
index bb6a671..7ff363b 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.5.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.5.4.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "5986da64af934d8cecc7bca7ebe43752"
-SRC_URI[sha256sum] = "f8229d14819e2d461ede83894648e03c8a2ad14a1ba200d68cda9816c42f41ea"
+SRC_URI[md5sum] = "f16ae8edd462f5199ee033f7c0e2c197"
+SRC_URI[sha256sum] = "1e1008656575e70486b456e79775e98d3b8732d7e2cb408559209bd0318e0807"
-- 
1.9.1


