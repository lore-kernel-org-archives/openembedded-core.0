Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 999C17951A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:00:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N80rxu019900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:00:54 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:00:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:24 +0800
Message-ID: <cb546bf04954d5465c7c4435ca383e28d9da42e7.1535011774.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011774.git.liezhi.yang@windriver.com>
References: <cover.1535011774.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] dbus-test: 1.12.8 -> 1.12.10
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
X-List-Received-Date: Thu, 23 Aug 2018 08:00:52 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/dbus/{dbus-test_1.12.8.bb => dbus-test_1.12.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.8.bb => dbus-test_1.12.10.bb} (95%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.8.bb b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.8.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.10.bb
index f33fbaf..e3ee608 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.8.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "2764bf150e5aa8005b7bc0d6c388756a"
-SRC_URI[sha256sum] = "e2dc99e7338303393b6663a98320aba6a63421bcdaaf571c8022f815e5896eb3"
+SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
+SRC_URI[sha256sum] = "4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.7.4


