Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 655C0607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 01:10:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3P1Afn4001417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 18:10:41 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Apr 2016 18:10:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Apr 2016 18:10:34 -0700
Message-ID: <117a1d7d39935ef79c43b21513879b1dd90ec0bb.1461546574.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461546574.git.liezhi.yang@windriver.com>
References: <cover.1461546574.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] tzdata: update to 2016d
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
X-List-Received-Date: Mon, 25 Apr 2016 01:10:41 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

Changes affecting future time stamps

America/Caracas switches from -0430 to -04 on 2016-05-01 at 02:30.
(Thanks to Alexander Krivenyshev for the heads-up.)

Asia/Magadan switches from +10 to +11 on 2016-04-24 at 02:00.
(Thanks to Alexander Krivenyshev and Matt Johnson.)

New zone Asia/Tomsk, split off from Asia/Novosibirsk. It covers
Tomsk Oblast, Russia, which switches from +06 to +07 on 2016-05-29
at 02:00.  (Thanks to Stepan Golosunov.)

Changes affecting past time stamps

New zone Europe/Kirov, split off from Europe/Volgograd.  It covers
Kirov Oblast, Russia, which switched from +04/+05 to +03/+04 on
1989-03-26 at 02:00, roughly a year after Europe/Volgograd made
the same change.  (Thanks to Stepan Golosunov.)

Russia and nearby locations had daylight-saving transitions on
1992-03-29 at 02:00 and 1992-09-27 at 03:00, instead of on
1992-03-28 at 23:00 and 1992-09-26 at 23:00.  (Thanks to Stepan
Golosunov.)

Many corrections to historical time in Kazakhstan from 1991
through 2005.  (Thanks to Stepan Golosunov.)  Replace Kazakhstan's
invented time zone abbreviations with numeric abbreviations.

(From OE-Core master rev: 10194ca3d8c2f4d8648a685c5c239a33d944b6fe)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016c.bb => tzdata_2016d.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016c.bb => tzdata_2016d.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016c.bb b/meta/recipes-extended/tzdata/tzdata_2016d.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016c.bb
rename to meta/recipes-extended/tzdata/tzdata_2016d.bb
index c342a02..7b64c85 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016c.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016d.bb
@@ -8,8 +8,8 @@ DEPENDS = "tzcode-native"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "0330ccd16140d3b6438a18dae9b34b93"
-SRC_URI[tzdata.sha256sum] = "8700d981e6f2007ac037dabb5d2b12f390e8629bbc30e564bc21cf0c069a2d48"
+SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
+SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
 
 inherit allarch
 
-- 
2.8.0


