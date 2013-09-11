Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D38D6C00A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 05:38:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8B5ckdM017150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 22:38:46 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 10 Sep 2013 22:38:44 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 13:38:28 +0800
Message-ID: <15d59c63aa3f07f344f941bc5ca0f51f65b0b0cd.1378877737.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1378877737.git.kai.kang@windriver.com>
References: <cover.1378877737.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/1] midori: excluded from mips64 temporarily
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
X-List-Received-Date: Wed, 11 Sep 2013 05:38:43 -0000
Content-Type: text/plain

Exclude midori from mips64 temporarily. Becuase midori depends on
webkit-gtk which could not build for mips64 with 64bits userspace now.

[YOCTO #5141]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/midori/midori_0.5.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato/midori/midori_0.5.5.bb
index 32bfcb6..7c233cb 100644
--- a/meta/recipes-sato/midori/midori_0.5.5.bb
+++ b/meta/recipes-sato/midori/midori_0.5.5.bb
@@ -10,6 +10,10 @@ SRC_URI = "http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.tar.bz2 \
 SRC_URI[md5sum] = "b99e87d4b73a4732ed1c1e591f0242ac"
 SRC_URI[sha256sum] = "ca69382a285222a86028abebd73fed1976735883027ff0adc094b627789bbd62"
 
+# midori depends on webkit-gtk, and webkit-gtk can NOT be built on
+# MIPS64 with 64 bits userspace. So remove it from mips64 temporarily.
+COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+
 inherit gtk-icon-cache pkgconfig vala pythonnative
 
 do_configure() {
-- 
1.8.1.2


