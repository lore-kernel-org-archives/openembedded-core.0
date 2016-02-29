Return-Path: <christrobridge@hotmail.com>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Feb 2016 22:31:25 UTC
Received: from BLU004-OMC4S27.hotmail.com (blu004-omc4s27.hotmail.com
	[65.55.111.166])
	by mail.openembedded.org (Postfix) with ESMTP id C235E7423D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:31:25 +0000 (UTC)
Received: from BLU437-SMTP5 ([65.55.111.135]) by BLU004-OMC4S27.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Mon, 29 Feb 2016 14:26:23 -0800
X-TMN: [X8KKyHEYEPpXRPAGVjEacwH3CoqrrDiw]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <BLU437-SMTP500BA79639345A1468500DABA0@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 22:26:10 +0000
X-Mailer: git-send-email 2.4.3
X-OriginalArrivalTime: 29 Feb 2016 22:26:20.0106 (UTC)
	FILETIME=[36917AA0:01D17340]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] wireshark: 2.0.2 update including security
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
X-List-Received-Date: Mon, 29 Feb 2016 22:31:27 -0000
Content-Type: text/plain

From: Armin Kuster <akuster808@gmail.com>

The following vulnerabilities have been fixed:
* [1]wnpa-sec-2016-01
  DLL hijacking vulnerability. [2]CVE-2016-2521
* [3]wnpa-sec-2016-02
  ASN.1 BER dissector crash. ([4]Bug 11828) [5]CVE-2016-2522
* [6]wnpa-sec-2016-03
  DNP dissector infinite loop. ([7]Bug 11938) [8]CVE-2016-2523
* [9]wnpa-sec-2016-04
  X.509AF dissector crash. ([10]Bug 12002) [11]CVE-2016-2524
* [12]wnpa-sec-2016-05
  HTTP/2 dissector crash. ([13]Bug 12077) [14]CVE-2016-2525
* [15]wnpa-sec-2016-06
  HiQnet dissector crash. ([16]Bug 11983) [17]CVE-2016-2526
* [18]wnpa-sec-2016-07
  3GPP TS 32.423 Trace file parser crash. ([19]Bug 11982) [20]CVE-2016-2527
* [21]wnpa-sec-2016-08
  LBMC dissector crash. ([22]Bug 11984) [23]CVE-2016-2528
* [24]wnpa-sec-2016-09
  iSeries file parser crash. ([25]Bug 11985) [26]CVE-2016-2529
* [27]wnpa-sec-2016-10
  RSL dissector crash. ([28]Bug 11829) [29]CVE-2016-2530 [30]CVE-2016-2531
* [31]wnpa-sec-2016-11
  LLRP dissector crash. ([32]Bug 12048) [33]CVE-2016-2532
* [34]wnpa-sec-2016-12
  Ixia IxVeriWave file parser crash. ([35]Bug 11795)
* [36]wnpa-sec-2016-13
  IEEE 802.11 dissector crash. ([37]Bug 11818)
* [38]wnpa-sec-2016-14
  GSM A-bis OML dissector crash. ([39]Bug 11825)
* [40]wnpa-sec-2016-15
  ASN.1 BER dissector crash. ([41]Bug 12106)
* [42]wnpa-sec-2016-16
  SPICE dissector large loop. ([43]Bug 12151)
* [44]wnpa-sec-2016-17
  NFS dissector crash.
* [45]wnpa-sec-2016-18
  ASN.1 BER dissector crash. ([46]Bug 11822)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wireshark/{wireshark_2.0.1.bb => wireshark_2.0.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.1.bb => wireshark_2.0.2.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
index 49b5de6..b140099 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.2.bb
@@ -8,8 +8,8 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "c1610ab2238965363b811e5188750fb1"
-SRC_URI[sha256sum] = "c9bd07dd0d0045d6ca7537390a1afbcdf33716d193ea7d7084ae4f6c30b683ab"
+SRC_URI[md5sum] = "204d053e0796c7da09292e0b54bc8503"
+SRC_URI[sha256sum] = "e921fb072085a5654d899949bb561d0687f4819f7b63ba35777bb949a9b6b9c1"
 
 PE = "1"
 
-- 
2.4.3


