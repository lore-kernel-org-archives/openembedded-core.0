Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15087.1795515794197497008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Yl7OJyeR;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2195; q=dns/txt;
  s=iport01; t=1795515794; x=1796725394;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ef1qWbamnENwc9VbpJSKVGKRr0Jj5oeVyf0p/a4o98Q=;
  b=Yl7OJyeRydHWAiby1S1TxUwj7iOdvo1rriczom4yYyhE6Zv0IE0AyBcg
   EfekRCgrN0dvN9LvVnvI4/hU7RT9XQhHhkVWp7wQLkc6yALyf0MEw7DNh
   2HloSBpQgHooC27qWeUqTCmSP+LjMys/i9wJQgCVTa+g16FLWHRdGp1u7
   B56EvXbOR+HSE5lbcrQ1sTgSj+bW1PAcKUS1FJ+IRsUHpqcqkkDRKuAX4
   53jYLbM/zS+cdP0Ks8/vNvcTk0CseIQfZn0ECLjDv8fSHcKLgvpPDF7gL
   RXtY/ZkAL9bgxszFdEW+qrLjoJ4ClyxdZ2C5b+BTcVnWwZ/MnRuvi+kux
   w==;
X-CSE-ConnectionGUID: RNhDex0YRdqetB7j/kz7Wg==
X-CSE-MsgGUID: F7kMFu50TlyWBw9OQwdS9Q==
X-IPAS-Result: =?us-ascii?q?A0BCAgDAYwVr/8tK/pBaglmCV3VgQ0mTWgGhHIF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjiQCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBU2ARgBKAUwXESDAgGCdAO6X4IsgQGDKQGBVNszAQsUAYE4hUKIJ?=
 =?us-ascii?q?IVzJxsbgXKEf4QrZYV5BIINFYEMgXJtgheJdYFRiElIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyhdASGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJ?=
 =?us-ascii?q?C8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ+bgeUFIMaWTWCZwKjQ?=
 =?us-ascii?q?4IhoREKKIN5jCSVOhozhVulF5kIo3NohGqBaDyBWXAVgyIJShkPlU6DJsgLJ?=
 =?us-ascii?q?jICPQcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:tY659qzotgjab6snjJF6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVRz
 TZLDWyHaf/famqkeIt2Porgo0oFuMDXn4JmHAY5pFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHsQPaEV6r5GO21X+
 OAydzJKbQLcuO3jldpXSsE07igiBMDmJsYb/3pn1zycVaxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkybC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oa2bIeFJI3aLSlTtmjHp
 Ufo4jmhPhULC/aAmB287X6X19aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:eUDgJ6F8zlSPwkI3pLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:kuOB9myafm2KwZ9cekP0BgUuPMAJf22F/U3cOkKkIzlrD76HFmCfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AjpQRYA5S/sMbATfp/6anM1D5xoxGvKeLJl1Qyak?=
 =?us-ascii?q?CqvauKn1XAiiRt2WOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="63458698"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:23:12 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id B627B18000145;
	Tue, 24 Nov 2026 10:23:11 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 68665CC1611; Tue, 24 Nov 2026 02:23:10 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][PATCH] curl: build and install unit tests for ptest
Date: Tue, 24 Nov 2026 02:23:05 -0800
Message-Id: <20261124102305.1094501-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251002
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

curl disables unit tests when cross-compiling with shared libcurl, and
ptest does not install their runner. Configure a separate static build
for the private unit-test library and runner, and install the runner so
test1304 and the other library unit tests can execute. Keep production
libcurl's configuration unchanged.

Checked an isolated cross build and staged unit-test execution using an
existing OE toolchain/sysroot.

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-support/curl/curl_8.23.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.23.0.bb b/meta/recipes-support/curl/curl_8.23.0.bb
index ad0ad408a16..bb9044a8894 100644
--- a/meta/recipes-support/curl/curl_8.23.0.bb
+++ b/meta/recipes-support/curl/curl_8.23.0.bb
@@ -113,8 +113,23 @@ do_install:append:class-nativesdk() {
 	install -m 644 ${UNPACKDIR}/environment.d-curl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/curl.sh
 }
 
+PTEST_UNIT_BUILD = "${B}/ptest-unit"
+
+# Shared cross builds disable unit tests. Build their private static
+# library separately, keeping the production libcurl configuration.
+do_configure_ptest_base[prefuncs] += "autotools_sitefiles"
+do_configure_ptest_base[cleandirs] += "${PTEST_UNIT_BUILD}"
+
+do_configure_ptest() {
+	install -d ${PTEST_UNIT_BUILD}
+	cd ${PTEST_UNIT_BUILD}
+	oe_runconf --disable-shared --enable-static
+}
+
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
+	oe_runmake -C ${PTEST_UNIT_BUILD}/lib libcurlu.la
+	oe_runmake -C ${PTEST_UNIT_BUILD}/tests/unit units
 }
 
 do_install_ptest() {
@@ -127,6 +142,11 @@ do_install_ptest() {
 	done
 	rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la
 
+	install -d ${D}${PTEST_PATH}/tests/unit
+	${PTEST_UNIT_BUILD}/libtool --mode=install install -m 0755 \
+		${PTEST_UNIT_BUILD}/tests/unit/units \
+		${D}${PTEST_PATH}/tests/unit/
+
 	install -d ${D}${PTEST_PATH}/tests/server
 	for name in $(makefile-getvar ${B}/tests/server/Makefile noinst_PROGRAMS); do
 		${B}/libtool --mode=install install ${B}/tests/server/$name ${D}${PTEST_PATH}/tests/server
-- 
2.35.6
