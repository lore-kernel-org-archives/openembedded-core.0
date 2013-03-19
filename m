Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UHw3A-0007Kd-4w
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 13:53:57 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Mar 2013 13:37:05 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 0C1B2288B02;
	Tue, 19 Mar 2013 13:37:06 +0100 (CET)
From: <maxin.john@enea.com>
To: <elizabeth.flanagan@intel.com>, <cazfi74@gmail.com>
Date: Tue, 19 Mar 2013 13:37:04 +0100
Message-ID: <1363696624-51163-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v2] harfbuzz: update the license information
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 12:54:21 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

harfbuzz is using the 'Modern Variants' of MIT License:
https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT#Modern_Variants

We can update the LICENSE as 'MIT & ICU'.

Fixes this warning:
WARNING: harfbuzz: No generic license file exists for: Old-MIT in any provider
WARNING: harfbuzz: No generic license file exists for: UCDN in any provider
WARNING: harfbuzz: No generic license file exists for: HarfBuzz-old in any provider

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
index 19269f1..fadd076 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 
-LICENSE = "Old-MIT & UCDN & ICU & HarfBuzz-old"
+LICENSE = "MIT & ICU"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
                     file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
                     file://src/hb-icu-le/COPYING;md5=0ac60acf068e2cc9facdf86169a9c13e \
-- 
1.7.5.4



