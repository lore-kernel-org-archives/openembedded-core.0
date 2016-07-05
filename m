Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66B6073181
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 06:43:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u656ht0B018202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2016 23:43:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jul 2016 23:43:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 23:43:49 -0700
Message-ID: <a1b1ba5f809eb2e790f363dc4703fd084782dfca.1467700975.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1467700975.git.liezhi.yang@windriver.com>
References: <cover.1467700975.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] tzcode: update to 2016e
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
X-List-Received-Date: Tue, 05 Jul 2016 06:43:54 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

V2: typo in title (jet lagged)
Changes to code

zic now outputs a dummy transition at time 2**31 - 1 in zones
whose POSIX-style TZ strings contain a '<'.  This mostly works
around Qt bug 53071 <https://bugreports.qt.io/browse/QTBUG-53071>.
(Thanks to Zhanibek Adilbekov for reporting the Qt bug.)

Changes affecting documentation and commentary

tz-link.htm says why governments should give plenty of notice for
time zone or DST changes, and refers to Matt Johnson's blog post.
tz-link.htm mentions Tzdata for Elixir.  (Thanks to Matt Johnson.)

(From OE-Core master rev: 5f3340e5c966f4233e0cd4ec468b20a1fd5a7346)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb}    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb} (67%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016d.bb b/meta/recipes-extended/tzcode/tzcode-native_2016e.bb
similarity index 67%
rename from meta/recipes-extended/tzcode/tzcode-native_2016d.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016e.bb
index 647ce2d..1e0f298 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016e.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "06fc6fc111cd8dd681abdc5326529afd"
-SRC_URI[tzcode.sha256sum] = "a8f33d6f87aef7e109e4769fc7f6e63637d52d07ddf6440a1a50df3d9a34e0ca"
-SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
-SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
+SRC_URI[tzcode.md5sum] = "6e6d3f0046a9383aafba8c2e0708a3a3"
+SRC_URI[tzcode.sha256sum] = "57d8c4fcd5e8a90657d0e298eac5effb1a642119c92308db68d13a4612fa459e"
+
+SRC_URI[tzdata.md5sum] = "43f9f929a8baf0dd2f17efaea02c2d2a"
+SRC_URI[tzdata.sha256sum] = "ba00f899f18dc4048d7fa21f5e1fdef434496084eedc06f6caa15e5ecdb6bd81"
 
 S = "${WORKDIR}"
 
-- 
2.8.0


