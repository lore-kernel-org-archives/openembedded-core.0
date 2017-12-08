Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 655BA785E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:02:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB8522xB010760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Dec 2017 21:02:03 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 7 Dec 2017 21:02:01 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Dec 2017 13:03:14 +0800
Message-ID: <78e9cfb4af9354ee9b907359f5f5069026dc5175.1512709294.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1512709294.git.Qi.Chen@windriver.com>
References: <cover.1512709294.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dbus-test: upgrade to 1.12.2
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
X-List-Received-Date: Fri, 08 Dec 2017 05:02:02 -0000
Content-Type: text/plain

Upgrade dbus-test to 1.12.2 as dbus has been upgraded to this version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.20.bb b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.10.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.2.bb
index eeadb7d..c3891a3 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "94c991e763d4f9f13690416b2dcd9411"
-SRC_URI[sha256sum] = "e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48"
+SRC_URI[md5sum] = "3361456cadb99aa6601bed5b48964254"
+SRC_URI[sha256sum] = "272bb5091770b047c8188b926d5e6038fa4fe6745488b2add96b23e2d9a83d88"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
1.9.1


