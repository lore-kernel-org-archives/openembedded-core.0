Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0F3175475
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 02:19:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4B2JVCh010629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 19:19:46 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 10 May 2018 19:19:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2018 10:20:19 +0800
Message-ID: <166de6977d1080f8826e09b07188bf63bc114963.1526004301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526004301.git.Qi.Chen@windriver.com>
References: <cover.1526004301.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] dbus-test: upgrade to 1.12.8
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
X-List-Received-Date: Fri, 11 May 2018 02:19:55 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus-test_1.12.2.bb => dbus-test_1.12.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.2.bb => dbus-test_1.12.8.bb} (95%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.2.bb b/meta/recipes-core/dbus/dbus-test_1.12.8.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.2.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.8.bb
index dce047a..f33fbaf 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.2.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.8.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "3361456cadb99aa6601bed5b48964254"
-SRC_URI[sha256sum] = "272bb5091770b047c8188b926d5e6038fa4fe6745488b2add96b23e2d9a83d88"
+SRC_URI[md5sum] = "2764bf150e5aa8005b7bc0d6c388756a"
+SRC_URI[sha256sum] = "e2dc99e7338303393b6663a98320aba6a63421bcdaaf571c8022f815e5896eb3"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
1.9.1


