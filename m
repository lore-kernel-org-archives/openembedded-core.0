Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5A27318A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u671bDwq007698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:37:05 -0700
Message-ID: <715d528e5b1b92a5c1ee9001205e8c3059ff7163.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] wget: 1.17.1 -> 1.18
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:12 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/{wget_1.17.1.bb => wget_1.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.17.1.bb => wget_1.18.bb} (53%)

diff --git a/meta/recipes-extended/wget/wget_1.17.1.bb b/meta/recipes-extended/wget/wget_1.18.bb
similarity index 53%
rename from meta/recipes-extended/wget/wget_1.17.1.bb
rename to meta/recipes-extended/wget/wget_1.18.bb
index dca5d1f..c969b98 100644
--- a/meta/recipes-extended/wget/wget_1.17.1.bb
+++ b/meta/recipes-extended/wget/wget_1.18.bb
@@ -2,7 +2,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "a6a908c9ae0e6a4194c628974cc3f05a"
-SRC_URI[sha256sum] = "029fbb93bdc1c0c5a7507b6076a6ec2f8d34204a85aa87e5b2f61a9405b290f5"
+SRC_URI[md5sum] = "fc2debd8399e3b933a9b226794e2a886"
+SRC_URI[sha256sum] = "a00a65fab84cc46e24c53ce88c45604668a7a479276e037dc2f558e34717fb2d"
 
 require wget.inc
-- 
2.9.0


