Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A15C575894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:58:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B5whf5012766
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:58:43 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:58:43 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:58:42 +0800
Message-ID: <1d174a5cce5a019bf45380eef95ebf64ed3a51fa.1452491844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452491844.git.Qi.Chen@windriver.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] sysstat: upgrade to 11.2.0
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
X-List-Received-Date: Mon, 11 Jan 2016 05:58:42 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sysstat/{sysstat_11.1.5.bb => sysstat_11.2.0.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.1.5.bb => sysstat_11.2.0.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.1.5.bb b/meta/recipes-extended/sysstat/sysstat_11.2.0.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.1.5.bb
rename to meta/recipes-extended/sysstat/sysstat_11.2.0.bb
index bff8616..7a8eb96 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.1.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.2.0.bb
@@ -4,6 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "4d8e6e72d057189a1660462a678d9ada"
-SRC_URI[sha256sum] = "feb3a90d86ffd69cf5b88144a8876ae05bd42384f559676f08100671589fa2bb"
-
+SRC_URI[md5sum] = "e8b615775ad98780e3f0675b91eddb19"
+SRC_URI[sha256sum] = "9806b9a662568796d3fb93ecd01ecea10d815e668337a646494953bff4bc4155"
-- 
1.9.1


