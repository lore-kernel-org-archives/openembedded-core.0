Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FB9C5519F
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.26803.1650875796095555961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 01:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23P8aZl1001753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 01:36:35 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Apr 2022 01:36:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 01:36:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Apr 2022 01:36:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] bind: Upgrade to 9.16.28
Date: Mon, 25 Apr 2022 16:36:32 +0800
Message-ID: <20220425083632.3473657-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164811

From: Mingli Yu <mingli.yu@windriver.com>

* The 9.16 branch will be limited to bug fixes [1] now and upgrade to the
  latest 9.16.x release to fix some security fixes.
 - CVE-2021-25219
 - CVE-2021-25220

* License-Update: copyright years

[1] https://bind9.readthedocs.io/en/v9_16/notes.html#notes-for-bind-9-16-28

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...d-V-and-start-log-hide-build-options.patch | 35 ---------
 .../bind/bind-9.16.16/CVE-2021-25219-1.patch  | 76 -------------------
 .../bind/bind-9.16.16/CVE-2021-25219-2.patch  | 65 ----------------
 ...1-avoid-start-failure-with-bind-user.patch |  0
 ...d-V-and-start-log-hide-build-options.patch | 40 ++++++++++
 ...ching-for-json-headers-searches-sysr.patch |  0
 .../bind/{bind-9.16.16 => bind-9.16.28}/bind9 |  0
 .../{bind-9.16.16 => bind-9.16.28}/conf.patch |  0
 .../generate-rndc-key.sh                      |  0
 ...t.d-add-support-for-read-only-rootfs.patch |  0
 .../make-etc-initd-bind-stop-work.patch       |  0
 .../named.service                             |  0
 .../bind/{bind_9.16.16.bb => bind_9.16.28.bb} |  8 +-
 13 files changed, 42 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/0001-avoid-start-failure-with-bind-user.patch (100%)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.28/0001-named-lwresd-V-and-start-log-hide-build-options.patch
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.28}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.16.bb => bind_9.16.28.bb} (93%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
deleted file mode 100644
index 5bcc16c9b2..0000000000
--- a/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 27 Aug 2018 21:24:20 +0800
-Subject: [PATCH] `named/lwresd -V' and start log hide build options
-
-The build options expose build path directories, so hide them.
-[snip]
-$ named -V
-|built by make with *** (options are hidden)
-[snip]
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Refreshed for 9.16.0
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- bin/named/include/named/globals.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: bind-9.16.0/bin/named/include/named/globals.h
-===================================================================
---- bind-9.16.0.orig/bin/named/include/named/globals.h
-+++ bind-9.16.0/bin/named/include/named/globals.h
-@@ -69,7 +69,7 @@ EXTERN const char *named_g_version     I
- EXTERN const char *named_g_product     INIT(PRODUCT);
- EXTERN const char *named_g_description INIT(DESCRIPTION);
- EXTERN const char *named_g_srcid       INIT(SRCID);
--EXTERN const char *named_g_configargs  INIT(CONFIGARGS);
-+EXTERN const char *named_g_configargs  INIT("*** (options are hidden)");
- EXTERN const char *named_g_builder     INIT(BUILDER);
- EXTERN in_port_t named_g_port	       INIT(0);
- EXTERN isc_dscp_t named_g_dscp	       INIT(-1);
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch b/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch
deleted file mode 100644
index f63c333264..0000000000
--- a/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 011e9418ce9bb25675de6ac8d47536efedeeb312 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@sury.org>
-Date: Fri, 24 Sep 2021 09:35:11 +0200
-Subject: [PATCH] Disable lame-ttl cache
-
-The lame-ttl cache is implemented in ADB as per-server locked
-linked-list "indexed" with <qname,qtype>.  This list has to be walked
-every time there's a new query or new record added into the lame cache.
-Determined attacker can use this to degrade performance of the resolver.
-
-Resolver testing has shown that disabling the lame cache has little
-impact on the resolver performance and it's a minimal viable defense
-against this kind of attack.
-
-CVE: CVE-2021-25219
-
-Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/8fe18c0566c41228a568157287f5a44f96d37662]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- bin/named/config.c    | 2 +-
- bin/named/server.c    | 7 +++++--
- doc/arm/reference.rst | 6 +++---
- 3 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/bin/named/config.c b/bin/named/config.c
-index fa8473db7c..b6453b814e 100644
---- a/bin/named/config.c
-+++ b/bin/named/config.c
-@@ -151,7 +151,7 @@ options {\n\
- 	fetches-per-server 0;\n\
- 	fetches-per-zone 0;\n\
- 	glue-cache yes;\n\
--	lame-ttl 600;\n"
-+	lame-ttl 0;\n"
- #ifdef HAVE_LMDB
- 			    "	lmdb-mapsize 32M;\n"
- #endif /* ifdef HAVE_LMDB */
-diff --git a/bin/named/server.c b/bin/named/server.c
-index 638703e8c2..35ad6a0b7f 100644
---- a/bin/named/server.c
-+++ b/bin/named/server.c
-@@ -4806,8 +4806,11 @@ configure_view(dns_view_t *view, dns_viewlist_t *viewlist, cfg_obj_t *config,
- 	result = named_config_get(maps, "lame-ttl", &obj);
- 	INSIST(result == ISC_R_SUCCESS);
- 	lame_ttl = cfg_obj_asduration(obj);
--	if (lame_ttl > 1800) {
--		lame_ttl = 1800;
-+	if (lame_ttl > 0) {
-+		cfg_obj_log(obj, named_g_lctx, ISC_LOG_WARNING,
-+			    "disabling lame cache despite lame-ttl > 0 as it "
-+			    "may cause performance issues");
-+		lame_ttl = 0;
- 	}
- 	dns_resolver_setlamettl(view->resolver, lame_ttl);
- 
-diff --git a/doc/arm/reference.rst b/doc/arm/reference.rst
-index 3bc4439745..fea854f3d1 100644
---- a/doc/arm/reference.rst
-+++ b/doc/arm/reference.rst
-@@ -3358,9 +3358,9 @@ Tuning
- ^^^^^^
- 
- ``lame-ttl``
--   This sets the number of seconds to cache a lame server indication. 0
--   disables caching. (This is **NOT** recommended.) The default is
--   ``600`` (10 minutes) and the maximum value is ``1800`` (30 minutes).
-+   This is always set to 0. More information is available in the
-+   `security advisory for CVE-2021-25219
-+   <https://kb.isc.org/docs/cve-2021-25219>`_.
- 
- ``servfail-ttl``
-    This sets the number of seconds to cache a SERVFAIL response due to DNSSEC
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch b/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch
deleted file mode 100644
index 1217f7f186..0000000000
--- a/meta/recipes-connectivity/bind/bind-9.16.16/CVE-2021-25219-2.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 117cf776a7add27ac6d236b4062258da0d068486 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@sury.org>
-Date: Mon, 15 Nov 2021 16:26:52 +0800
-Subject: [PATCH] Enable lame response detection even with disabled lame cache
-
-Previously, when lame cache would be disabled by setting lame-ttl to 0,
-it would also disable lame answer detection.  In this commit, we enable
-the lame response detection even when the lame cache is disabled.  This
-enables stopping answer processing early rather than going through the
-whole answer processing flow.
-
-CVE: CVE-2021-25219
-
-Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/e4931584a34bdd0a0d18e4d918fb853bf5296787]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- lib/dns/resolver.c | 23 ++++++++++++-----------
- 1 file changed, 12 insertions(+), 11 deletions(-)
-
-diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
-index 50fadc0..9291bd4 100644
---- a/lib/dns/resolver.c
-+++ b/lib/dns/resolver.c
-@@ -10217,25 +10217,26 @@ rctx_badserver(respctx_t *rctx, isc_result_t result) {
-  */
- static isc_result_t
- rctx_lameserver(respctx_t *rctx) {
--	isc_result_t result;
-+	isc_result_t result = ISC_R_SUCCESS;
- 	fetchctx_t *fctx = rctx->fctx;
- 	resquery_t *query = rctx->query;
- 
--	if (fctx->res->lame_ttl == 0 || ISFORWARDER(query->addrinfo) ||
--	    !is_lame(fctx, query->rmessage))
--	{
-+	if (ISFORWARDER(query->addrinfo) || !is_lame(fctx, query->rmessage)) {
- 		return (ISC_R_SUCCESS);
- 	}
- 
- 	inc_stats(fctx->res, dns_resstatscounter_lame);
- 	log_lame(fctx, query->addrinfo);
--	result = dns_adb_marklame(fctx->adb, query->addrinfo, &fctx->name,
--				  fctx->type, rctx->now + fctx->res->lame_ttl);
--	if (result != ISC_R_SUCCESS) {
--		isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
--			      DNS_LOGMODULE_RESOLVER, ISC_LOG_ERROR,
--			      "could not mark server as lame: %s",
--			      isc_result_totext(result));
-+	if (fctx->res->lame_ttl != 0) {
-+		result = dns_adb_marklame(fctx->adb, query->addrinfo,
-+					  &fctx->name, fctx->type,
-+					  rctx->now + fctx->res->lame_ttl);
-+		if (result != ISC_R_SUCCESS) {
-+			isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
-+				      DNS_LOGMODULE_RESOLVER, ISC_LOG_ERROR,
-+				      "could not mark server as lame: %s",
-+				      isc_result_totext(result));
-+		}
- 	}
- 	rctx->broken_server = DNS_R_LAME;
- 	rctx->next_server = true;
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.28/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.28/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.28/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.28/0001-named-lwresd-V-and-start-log-hide-build-options.patch
new file mode 100644
index 0000000000..c405617baa
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.28/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -0,0 +1,40 @@
+From ed30068de0349af0296f16523a623574ed3f803b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 Apr 2022 15:55:14 +0800
+Subject: [PATCH] `named/lwresd -V' and start log hide build options
+
+The build options expose build path directories, so hide them.
+[snip]
+$ named -V
+|built by make with *** (options are hidden)
+[snip]
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Refreshed for 9.16.0
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Rebased to 9.16.28
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ bin/named/include/named/globals.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/named/include/named/globals.h b/bin/named/include/named/globals.h
+index 82b632e..b33a27b 100644
+--- a/bin/named/include/named/globals.h
++++ b/bin/named/include/named/globals.h
+@@ -71,7 +71,7 @@ EXTERN const char *named_g_version	  INIT(VERSION);
+ EXTERN const char *named_g_product	  INIT(PRODUCT);
+ EXTERN const char *named_g_description	  INIT(DESCRIPTION);
+ EXTERN const char *named_g_srcid	  INIT(SRCID);
+-EXTERN const char *named_g_configargs	  INIT(CONFIGARGS);
++EXTERN const char *named_g_configargs	  INIT("*** (options are hidden)");
+ EXTERN const char *named_g_builder	  INIT(BUILDER);
+ EXTERN in_port_t named_g_port		  INIT(0);
+ EXTERN isc_dscp_t named_g_dscp		  INIT(-1);
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.28/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.28/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/bind9 b/meta/recipes-connectivity/bind/bind-9.16.28/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.28/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.28/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.28/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.28/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.28/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.28/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.28/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.28/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.28/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/named.service b/meta/recipes-connectivity/bind/bind-9.16.28/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.28/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.16.bb b/meta/recipes-connectivity/bind/bind_9.16.28.bb
similarity index 93%
rename from meta/recipes-connectivity/bind/bind_9.16.16.bb
rename to meta/recipes-connectivity/bind/bind_9.16.28.bb
index 4bfdeca9ce..2ebd9fdde5 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.16.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.28.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ef10b4de6371115dcecdc38ca2af4561"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e7b3c52170a348459a4ff3f5ce95e37"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -18,11 +18,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
-           file://CVE-2021-25219-1.patch \
-           file://CVE-2021-25219-2.patch \
            "
 
-SRC_URI[sha256sum] = "6c913902adf878e7dc5e229cea94faefc9d40f44775a30213edd08860f761d7b"
+SRC_URI[sha256sum] = "332e34dcbd723a2569efbaf4e79b62e6d56c9abd5bb8411df01533f984d1a370"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
@@ -64,8 +62,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
 
 do_install_append() {
 
-	rmdir "${D}${localstatedir}/run"
-	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 	install -d -o bind "${D}${localstatedir}/cache/bind"
 	install -d "${D}${sysconfdir}/bind"
 	install -d "${D}${sysconfdir}/init.d"
-- 
2.25.1


