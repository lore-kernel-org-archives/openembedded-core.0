Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UHXWw-0005TB-Fd
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 11:43:04 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 18 Mar 2013 11:25:07 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 9F8E6288B02;
	Mon, 18 Mar 2013 11:25:07 +0100 (CET)
From: <maxin.john@enea.com>
To: <cazfi74@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Mar 2013 11:24:45 +0100
Message-ID: <1363602285-16371-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org, "Maxin
	B. John" <maxin.john@enea.com>
Subject: [PATCH] harfbuzz: update the license information
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
X-List-Received-Date: Mon, 18 Mar 2013 10:43:10 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

harfbuzz is using the 'Modern Variants' of MIT License:
https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT#Modern_Variants

So, we can update the LICENSE as 'MIT'.

Fixes this warning:
WARNING: harfbuzz: No generic license file exists for: Old-MIT in any provider
WARNING: harfbuzz: No generic license file exists for: UCDN in any provider
WARNING: harfbuzz: No generic license file exists for: HarfBuzz-old in any provider

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
index 19269f1..93e0e41 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.12.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 
-LICENSE = "Old-MIT & UCDN & ICU & HarfBuzz-old"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
                     file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
                     file://src/hb-icu-le/COPYING;md5=0ac60acf068e2cc9facdf86169a9c13e \
-- 
1.7.5.4



