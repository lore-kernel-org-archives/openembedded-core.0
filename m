Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6FA73172
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 06:43:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u656huU4026568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2016 23:43:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jul 2016 23:43:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 23:43:50 -0700
Message-ID: <5fcd798ab39a117bedc07e2e66dc4f6c073122e3.1467700975.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1467700975.git.liezhi.yang@windriver.com>
References: <cover.1467700975.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] tzdata: update to 2016e
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
X-List-Received-Date: Tue, 05 Jul 2016 06:43:55 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

Changes affecting future time stamps

Africa/Cairo observes DST in 2016 from July 7 to the end of October.
Guess October 27 and 24:00 transitions. (Thanks to Steffen Thorsen.)
For future years, guess April's last Thursday to October's last
Thursday except for Ramadan.

Changes affecting past time stamps

Locations while uninhabited now use '-00', not 'zzz', as a
placeholder time zone abbreviation.  This is inspired by Internet
RFC 3339 and is more consistent with numeric time zone
abbreviations already used elsewhere.  The change affects several
arctic and antarctic locations, e.g., America/Cambridge_Bay before
1920 and Antarctica/Troll before 2005.

Asia/Baku's 1992-09-27 transition from +04 (DST) to +04 (non-DST) was
at 03:00, not 23:00 the previous day.  (Thanks to Michael Deckers.)

(From OE-Core master rev: ddcf128e76ed0678ce42416531f4ecb309c57439)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016d.bb b/meta/recipes-extended/tzdata/tzdata_2016e.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016d.bb
rename to meta/recipes-extended/tzdata/tzdata_2016e.bb
index 7b64c85..1c32d2a 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016e.bb
@@ -8,8 +8,8 @@ DEPENDS = "tzcode-native"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
-SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
+SRC_URI[tzdata.md5sum] = "43f9f929a8baf0dd2f17efaea02c2d2a"
+SRC_URI[tzdata.sha256sum] = "ba00f899f18dc4048d7fa21f5e1fdef434496084eedc06f6caa15e5ecdb6bd81"
 
 inherit allarch
 
-- 
2.8.0


