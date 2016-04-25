Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38DFF70022
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 01:10:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3P1AepN019284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 18:10:41 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Apr 2016 18:10:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Apr 2016 18:10:33 -0700
Message-ID: <51757b6c6264fed95c6cd8e6026bdebe88d94e6c.1461546574.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461546574.git.liezhi.yang@windriver.com>
References: <cover.1461546574.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] tzcode: update to 2016d
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
X-List-Received-Date: Mon, 25 Apr 2016 01:10:42 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

they keep the versions in-sync. changes are all in data.

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

(From OE-Core master rev: db8223e4dd2e513a656aedfae217d94e053c2366)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tzcode/{tzcode-native_2016c.bb => tzcode-native_2016d.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016c.bb => tzcode-native_2016d.bb} (68%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016c.bb b/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
similarity index 68%
rename from meta/recipes-extended/tzcode/tzcode-native_2016c.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016d.bb
index 06b92ea..647ce2d 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016c.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "ffb82ab0b588138759902b4627a6a80d"
-SRC_URI[tzcode.sha256sum] = "344b1bd486935bca2b7baa47db3b99b32211c45f31ec0d1ead8bacd103c5a416"
-SRC_URI[tzdata.md5sum] = "0330ccd16140d3b6438a18dae9b34b93"
-SRC_URI[tzdata.sha256sum] = "8700d981e6f2007ac037dabb5d2b12f390e8629bbc30e564bc21cf0c069a2d48"
+SRC_URI[tzcode.md5sum] = "06fc6fc111cd8dd681abdc5326529afd"
+SRC_URI[tzcode.sha256sum] = "a8f33d6f87aef7e109e4769fc7f6e63637d52d07ddf6440a1a50df3d9a34e0ca"
+SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
+SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
 
 S = "${WORKDIR}"
 
-- 
2.8.0


