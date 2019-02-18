Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id D0D9A7C89B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 84C9A40BB6;
	Mon, 18 Feb 2019 22:49:23 +0000 (UTC)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id M5rM7b1tpYIR; Mon, 18 Feb 2019 22:49:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6909340B57;
	Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2E3B516B4D2;
	Mon, 18 Feb 2019 17:49:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 17:49:04 -0500
Message-Id: <a0636205b00d22f8c643eefe163a5dc0af7c5529.1550529998.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
In-Reply-To: <cover.1550529998.git.denys@ti.com>
References: <cover.1550529998.git.denys@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/6] hdparm: upgrade 9.56 -> 9.58
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
X-List-Received-Date: Mon, 18 Feb 2019 22:57:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.56.bb => hdparm_9.58.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.56.bb => hdparm_9.58.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.56.bb b/meta/recipes-extended/hdparm/hdparm_9.58.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.56.bb
rename to meta/recipes-extended/hdparm/hdparm_9.58.bb
index 17932ad..e47deda 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.56.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.58.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "7900608e32834f65d2654fdb696e71a0"
-SRC_URI[sha256sum] = "6ff9ed695f1017396eec4101f990f114b7b0e0a04c5aa6369c0394053d16e4da"
+SRC_URI[md5sum] = "4652c49cf096a64683c05f54b4fa4679"
+SRC_URI[sha256sum] = "9ae78e883f3ce071d32ee0f1b9a2845a634fc4dd94a434e653fdbef551c5e10f"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.7.4


