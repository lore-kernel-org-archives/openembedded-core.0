Return-Path: <Arturo.Buzarra@digi.com>
X-Greylist: delayed 383 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Mar 2019 11:13:58 UTC
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.210])
	by mail.openembedded.org (Postfix) with ESMTP id 06A987D080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 11:13:58 +0000 (UTC)
Received: from [67.219.247.53] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-d.us-east-1.aws.symcld.net id E8/E3-23688-8FAAC9C5;
	Thu, 28 Mar 2019 11:07:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsXi5LtOQPf7qjk
	xBu9Wm1nc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnXfl9hKrihXfH16jvmBsZO9S5GTg4hgVWM
	ElsP6XUxcgHZGxklpm5/wQSSYBPQk/j2ZRZzFyMHhwiQffWfKEhYWMBS4v/k7awgNouAqsTdS
	2uZQWxeARuJKQvugcUlBOQlfq7YxA4RF5Q4OfMJC4jNLKAp0br9NzuELS/RvHU22HghARWJ50
	9sIVoVJK69X8w+gZF3FpLuWUi6ZyHpXsDIvIrRNKkoMz2jJDcxM0fX0MBA19DQSNdS19RQL7F
	KN0WvtFg3NbG4RBfILS/WK67MTc5J0ctLLdnECAy2lAJO4x2MvR3phxglOZiURHljWufECPEl
	5adUZiQWZ8QXleakFh9ilOHgUJLgrV8JlBMsSk1PrUjLzAGGPUxagoNHSYQ3AyTNW1yQmFucm
	Q6ROsVoz/Gl/dFcZo5lh54DyYetn4Hkgt1/5jILseTl56VKifMuBWkTAGnLKM2DGwqL00uMsl
	LCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkrQKbwZOaVwO1+BXQWE9BZr+png5xVkoiQkmpgjIh
	0ucA5k19QsLn97c9DvQo6YZzKqmEdqUei7p128nnDKfd/xtGGlGN7N6d/FZKLEPkRMS+SU9H/
	5uMI4zuvg2xWOnEfnMLVFDlz+v01ZeXXD3X1P3y9NPzIaeuDMvrpSlzCDwVdpy8/e/qm3uF2g
	TeqhTtETi5xUgnnP3jm0RSX7rNxs5/ZKLEUZyQaajEXFScCAKT1A+HOAgAA
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-7.tower-425.messagelabs.com!1553771255!6583835!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28211 invoked from network); 28 Mar 2019 11:07:35 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-7.tower-425.messagelabs.com with SMTP;
	28 Mar 2019 11:07:35 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 28 Mar 2019 06:07:35 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.439.0; Thu, 28 Mar 2019 12:07:33 +0100
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 12:07:19 +0100
Message-ID: <20190328110719.30513-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [PATCH] networkmanager: upgrade 1.14.4 -> 1.14.6
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
X-List-Received-Date: Thu, 28 Mar 2019 11:13:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

    * License checksum changed
    * Patch was aligned but have no resources to test them

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
---
 ...ttings-settings-property-documentati.patch | 33 +++++++------------
 ...ger_1.14.4.bb => networkmanager_1.14.6.bb} |  6 ++--
 2 files changed, 15 insertions(+), 24 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.14.4.bb => networkmanager_1.14.6.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
index c50293c09..7d9bc32ad 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
@@ -13,43 +13,34 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- Makefile.am  | 20 --------------------
+ Makefile.am  | 11 -----------
  configure.ac |  5 -----
- 2 files changed, 25 deletions(-)
+ 2 files changed, 16 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 1e100f6..d31e3c1 100644
+index e1b442e99..d977e9457 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1115,9 +1115,7 @@ EXTRA_DIST += \
+@@ -1117,9 +1117,7 @@ EXTRA_DIST += \
  if HAVE_INTROSPECTION
- 
+
  libnm_noinst_data = \
 -	libnm/nm-property-docs.xml \
  	libnm/nm-settings-docs-overrides.xml \
 -	libnm/nm-settings-docs.xml \
  	libnm/nm-settings-keyfile-docs.xml \
  	libnm/nm-settings-ifcfg-rh-docs.xml
- 
-@@ -3692,27 +3690,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
+
+@@ -3696,18 +3694,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
  $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
- 
+
  clients_common_settings_doc_h = clients/common/settings-docs.h
 -if HAVE_INTROSPECTION
 -$(clients_common_settings_doc_h): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
 -	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
 -DISTCLEANFILES += $(clients_common_settings_doc_h)
 -check-local-settings-docs: $(clients_common_settings_doc_h)
--	@if test -z "$$NMTST_NO_CHECK_SETTINGS_DOCS" ; then \
--		if ! cmp -s "$(srcdir)/$(clients_common_settings_doc_h).in" "$(builddir)/$(clients_common_settings_doc_h)" ; then \
--			if test "$$NM_TEST_REGENERATE" == 1 ; then \
--				cp -f "$(builddir)/$(clients_common_settings_doc_h)" "$(srcdir)/$(clients_common_settings_doc_h).in"; \
--			else \
--				echo "The generated file \"$(builddir)/$(clients_common_settings_doc_h)\" differs from the source file \"$(srcdir)/$(clients_common_settings_doc_h).in\". You probably should copy the generated file over to the source file. You can skip this test by setting \$$NMTST_NO_CHECK_SETTINGS_DOCS=yes". You can also automatically copy the file by rerunning the test with \$$NM_TEST_REGENERATE=1 ; \
--				false; \
--			fi; \
--		fi;\
--	fi
+-	$(srcdir)/tools/check-settings-docs.sh "$(srcdir)" "$(builddir)" "$(clients_common_settings_doc_h)"
 -check_local += check-local-settings-docs
 -else
  $(clients_common_settings_doc_h): $(clients_common_settings_doc_h).in clients/common/.dirstamp
@@ -60,7 +51,7 @@ index 1e100f6..d31e3c1 100644
  	$(clients_common_settings_doc_h) \
  	$(clients_common_settings_doc_h).in
 diff --git a/configure.ac b/configure.ac
-index 79dc3b9..23d14a6 100644
+index 1f9dcb3c7..ca8db970a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1195,11 +1195,6 @@ GTK_DOC_CHECK(1.0)
@@ -75,6 +66,6 @@ index 79dc3b9..23d14a6 100644
  	AC_PATH_PROG(PERL, perl)
  	if test -z "$PERL"; then
  		AC_MSG_ERROR([--enable-introspection requires perl])
--- 
-2.14.5
+--
+2.21.0
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.6.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.6.bb
index f21600eda..c10403ba1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.6.bb
@@ -5,7 +5,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=2d56a1b0c42e388aa86aef59b154e8c3 \
+                    file://docs/api/html/license.html;md5=233931303ef80eded167add1f60a50c1 \
 "
 
 DEPENDS = " \
@@ -36,8 +36,8 @@ SRC_URI = " \
     file://musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch \
     file://musl/0006-Add-a-strndupa-replacement-for-musl.patch \
 "
-SRC_URI[md5sum] = "54ce62f0aa18ef6c5e754eaac47494ac"
-SRC_URI[sha256sum] = "35a3ede4c7d12d6212033c9e44cb82b7692f38063b53a067567f02f5937c8c18"
+SRC_URI[md5sum] = "6881d04fe72e09a98bd9bfb26813544b"
+SRC_URI[sha256sum] = "693bcdad15eec7f07a06cbc6e43ddb3b1c13b2d2d23ec165fbb5adf4c3323a5d"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.10/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
-- 
2.21.0


