Return-Path: <Arturo.Buzarra@digi.com>
X-Greylist: delayed 766 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Jul 2019 12:54:24 UTC
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.212])
	by mail.openembedded.org (Postfix) with ESMTP id 6671471BEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 12:54:24 +0000 (UTC)
Received: from [67.219.246.101] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.us-east-1.aws.symcld.net id 2A/25-14179-305FA3D5;
	Fri, 26 Jul 2019 12:41:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsXi5LtOQJf5q1W
	swc42OYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP3scWsBf+5K5Yu6mZpYDzB1cXIxSEksJpR
	4mnbbnYIZw2jxLy+WawQzkZGiUc7/zJ2MXJysAnoSXz7Mou5i5GDQwTIvvpPFCQsLOAicebhY
	rAwi4CqRNc3X5Awr4C1xOM5F5lAbAkBeYnOHbtZIOKCEidnPgGzmYHizVtnM0PYEhIHX7wAGy
	MkoCLx/IktRKuCxLX3i9knMPLNQtI9C0n3LCTdCxiZVzGaJRVlpmeU5CZm5ugaGhjoGhoa6Rr
	pGpob6SVW6SbplRbrpiYWl+ga6iWWF+sVV+Ym56To5aWWbGIEBmJKAdOaHYwvZr7RO8QoycGk
	JMorp28VK8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd+kHoJxgUWp6akVaZg4wKmDSEhw8SiK8f
	F+A0rzFBYm5xZnpEKlTjK4cb9YuWcTM8RZMrt0OItvu3QWS7SBSiCUvPy9VSpy3/TNQswBIc0
	ZpHtxoWERfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMywtyAk9mXgncBa+AjmMCOi5MCuy
	4kkSElFQDE2fx4asGmjqvVyhLJwgsVjy7pIOv7d2rj1k7w+d/dtnLHroq3Hgp171vsyoenX5z
	f98LtcnfbkstyJl9cLe/YNOm71fkSpcozg3OjA64rzDx/JvoLJX2FQ6+AsovAxxvpvps25LYw
	PRmtttyHTNB6/dmbFf+qfeHfjp0Jp2r9ORvb82keSV3u21+JB2Jlr/u1majXPxgGbt+eHDeb/
	5v3XOPC/vvMM+OSgrc2H+C1/vb5FfiVwOSkw6t/cPLvWLGKXXeiaecw0t4ap/92BEw7X1lWdR
	u2wnHnmk/vyi8K4bv+ovwPD//UCEhfhtpB8UjjlKxbnESGTvYz7zSPaDosPPixLUnDn/gaJns
	+3nhByWW4oxEQy3mouJEACb/fw1jAwAA
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-9.tower-385.messagelabs.com!1564144898!966582!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12259 invoked from network); 26 Jul 2019 12:41:39 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-9.tower-385.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 26 Jul 2019 12:41:39 -0000
Received: from MTK-SMS-XCH04.digi.com (10.10.8.198) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 26 Jul 2019 07:41:39 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH04.digi.com
	(10.10.8.198) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 26 Jul 2019 07:41:38 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.468.0; Fri, 26 Jul 2019 14:41:36 +0200
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2019 14:41:25 +0200
Message-ID: <20190726124125.6238-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [meta-oe][thud] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Fri, 26 Jul 2019 12:54:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit c6e963f9e078b728911afed38d31ed234a384154 ("lvm2: Add RDEPEND
on lvm2 to lvm2-udevrules") added a package dependency due to
lvm2-udevrules needs dmsetup, however dmsetup was moved to libdevmapper
in commit 269d009a81d4 ("lvm2: libdevicemapper package needs udev
rules and dmsetup"), so this dependency should be only for libdevmapper
instead of the full package.

With the current implementation, a package that has a dependency with
lvm2-udev rules will include also many unnecessary packages like lvm2,
lvm2-scripts, etc. and their dependencies.

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
index 7bd7b09d8..08287e358 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
@@ -48,11 +48,11 @@ FILES_${PN}-scripts = " \
     ${sbindir}/lvmdump \
 "
 # Specified explicitly for the udev rules, just in case that it does not get picked
 # up automatically:
 FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
-RDEPENDS_${PN}-udevrules = "${PN}"
+RDEPENDS_${PN}-udevrules = "libdevmapper"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
 RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
 RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
-- 
2.22.0


