Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB0A78967
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 08:36:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2L8aakj013499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 01:36:36 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 21 Mar 2018 01:36:35 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2018 16:36:23 +0800
Message-ID: <1521621384-24620-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521621384-24620-1-git-send-email-yi.zhao@windriver.com>
References: <1521621384-24620-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 2/3] less: update to 530
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
X-List-Received-Date: Wed, 21 Mar 2018 08:36:35 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/less/{less_529.bb => less_530.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_529.bb => less_530.bb} (89%)

diff --git a/meta/recipes-extended/less/less_529.bb b/meta/recipes-extended/less/less_530.bb
similarity index 89%
rename from meta/recipes-extended/less/less_529.bb
rename to meta/recipes-extended/less/less_530.bb
index c86f754..c07b121 100644
--- a/meta/recipes-extended/less/less_529.bb
+++ b/meta/recipes-extended/less/less_530.bb
@@ -27,8 +27,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "32018b53a1f7319ab54349baf80e6aa8"
-SRC_URI[sha256sum] = "dba42cd4c38174b7bd0d426d8a39df2be6bcc1ec18946a4642713290f6bf9a0b"
+SRC_URI[md5sum] = "6a39bccf420c946b0fd7ffc64961315b"
+SRC_URI[sha256sum] = "503f91ab0af4846f34f0444ab71c4b286123f0044a4964f1ae781486c617f2e2"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.7.4


