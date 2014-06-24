Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4180865F15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 05:47:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5O5lLcP013267
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 22:47:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 23 Jun 2014 22:47:20 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 13:46:52 +0800
Message-ID: <32d290d42caa640bf7ffffcce090af389735c082.1403588766.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403588766.git.Chong.Lu@windriver.com>
References: <cover.1403588766.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus-test: fix incorrect checksum
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
X-List-Received-Date: Tue, 24 Jun 2014 05:47:26 -0000
Content-Type: text/plain

Modify checksum to match new version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.8.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.2.bb b/meta/recipes-core/dbus/dbus-test_1.8.2.bb
index 9c7b749..e19d2e9 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.2.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.8.2.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "b02e9c95027a416987b81f9893831061"
-SRC_URI[sha256sum] = "7085a0895a9eb11a952394cdbea6d8b4358e17cb991fed0e8fb85e2b9e686dcd"
+SRC_URI[md5sum] = "d6f709bbec0a022a1847c7caec9d6068"
+SRC_URI[sha256sum] = "5689f7411165adc953f37974e276a3028db94447c76e8dd92efe910c6d3bae08"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
1.9.1


