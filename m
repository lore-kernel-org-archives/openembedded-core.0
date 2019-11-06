Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id B71097F877
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References
	:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hwU9gDYN/QmA0HlNORgdICYSfw78ZxVeivhF57OFWUw=;
	b=xgi3hyOP8gXTP/CeT8+k7lyskI
	rOwpJntbS856vZCz++T2DKKmdhBo2H7fcQ9wLo3MJpHB4dzkvRX+VoN4Qe8J7HgzHuzK2HJox6Wgo
	cyoGnb/41NnZUXyJ8k30ClVh36nBbEn4bgxwKWDnPKl1/xEcx7pNbums9xP5FKnlicZQsJgdKCEOR
	9aRhh0ijx8iG68fJgrYoteA5CxAPU5RQE5EfWkND9g89cL9A8IUUgYkdpKA6LQV+r/UKXpgruV9i2
	bO2v0pHN/fsxLSmJ3wSMB0FaUpaGxldzfA86pmKkyVBgylHqWzI9fw7Ed+6RFN+S95hWliK93hG6A
	goJTNyAg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOF-0000A9-76; Wed, 06 Nov 2019 17:38:39 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007VL-28; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:29 +0200
Message-Id: <a8c58695767f5bb046b961b0bf9e0e931f321d92.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
MIME-Version: 1.0
X-Rspam-Score: 6.0 (++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: NEURAL_HAM(-0.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	a8c58695767f5bb046b961b0bf9e0e931f321d92.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 14/47] cve-check-tool: remove
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 5388ed6d1378d647a65912dbd537f9ef3cb5760a)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  62 ------
 ...01-Fix-freeing-memory-allocated-by-sqlite.patch |  50 -----
 ...ow-overriding-default-CA-certificate-file.patch | 215 ---------------------
 ...ogress-in-percent-when-downloading-CVE-db.patch | 135 -------------
 ...are-computed-vs-expected-sha256-digit-str.patch |  52 -----
 .../check-for-malloc_trim-before-using-it.patch    |  51 -----
 6 files changed, 565 deletions(-)
 delete mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
deleted file mode 100644
index 1c84fb1..0000000
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY = "cve-check-tool"
-DESCRIPTION = "cve-check-tool is a tool for checking known (public) CVEs.\
-The tool will identify potentially vunlnerable software packages within Linux distributions through version matching."
-HOMEPAGE = "https://github.com/ikeydoherty/cve-check-tool"
-SECTION = "Development/Tools"
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
-
-SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
-           file://check-for-malloc_trim-before-using-it.patch \
-           file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
-           file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
-           file://0001-update-Compare-computed-vs-expected-sha256-digit-str.patch \
-           file://0001-Fix-freeing-memory-allocated-by-sqlite.patch \
-          "
-
-SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
-SRC_URI[sha256sum] = "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b"
-
-UPSTREAM_CHECK_URI = "https://github.com/ikeydoherty/cve-check-tool/releases"
-
-DEPENDS = "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl ca-certificates"
-
-RDEPENDS_${PN} = "ca-certificates"
-
-inherit pkgconfig autotools
-
-EXTRA_OECONF = "--disable-coverage --enable-relative-plugins"
-CFLAGS_append = " -Wno-error=pedantic"
-
-do_populate_cve_db() {
-    if [ "${BB_NO_NETWORK}" = "1" ] ; then
-        bbwarn "BB_NO_NETWORK is set; Can't update cve-check-tool database, new CVEs won't be detected"
-        return
-    fi
-
-    # In case we don't inherit cve-check class, use default values defined in the class.
-    cve_dir="${CVE_CHECK_DB_DIR}"
-    cve_file="${CVE_CHECK_TMP_FILE}"
-
-    [ -z "${cve_dir}" ] && cve_dir="${DL_DIR}/CVE_CHECK"
-    [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
-
-    unused="${@bb.utils.export_proxies(d)}"
-    bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
-    # --cacert works around curl-native not finding the CA bundle
-    if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
-        printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date --utc +'%F %T')" > "$cve_file"
-    else
-        bbwarn "Error in executing cve-check-update"
-        if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'}" -ne 0 ] ; then
-            bbwarn "Failed to update cve-check-tool database, CVEs won't be checked"
-        fi
-    fi
-}
-
-addtask populate_cve_db after do_populate_sysroot
-do_populate_cve_db[depends] = "cve-check-tool-native:do_populate_sysroot"
-do_populate_cve_db[nostamp] = "1"
-do_populate_cve_db[progress] = "percent"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
deleted file mode 100644
index 4a82cf2..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Thu, 13 Apr 2017 23:09:52 +0200
-Subject: [PATCH] Fix freeing memory allocated by sqlite
-
-Upstream-Status: Backport
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/core.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/core.c b/src/core.c
-index 6263031..6788f16 100644
---- a/src/core.c
-+++ b/src/core.c
-@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)
-         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
-         if (rc != SQLITE_OK) {
-                 fprintf(stderr, "ensure_table(): %s\n", err);
--                free(err);
-+                sqlite3_free(err);
-                 return false;
-         }
-         
-@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)
-         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
-         if (rc != SQLITE_OK) {
-                 fprintf(stderr, "ensure_table(): %s\n", err);
--                free(err);
-+                sqlite3_free(err);
-                 return false;
-         }
- 
-@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)
-         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
-         if (rc != SQLITE_OK) {
-                 fprintf(stderr, "ensure_table(): %s\n", err);
--                free(err);
-+                sqlite3_free(err);
-                 return false;
-         }
-         if (err) {
--                free(err);
-+                sqlite3_free(err);
-         }
- 
-         return true;
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch b/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
deleted file mode 100644
index 3d8ebd1..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 9 Feb 2017 14:51:28 +0200
-Subject: [PATCH] curl: allow overriding default CA certificate file
-
-Similar to curl, --cacert can now be used in cve-check-tool and
-cve-check-update to override the default CA certificate file. Useful
-in cases where the system default is unsuitable (for example,
-out-dated) or broken (as in OE's current native libcurl, which embeds
-a path string from one build host and then uses it on another although
-the right path may have become something different).
-
-Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-tool/pull/45]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
-
-Took Patrick Ohlys original patch from meta-security-isafw, rebased
-on top of other patches.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- src/library/cve-check-tool.h |  1 +
- src/library/fetch.c          | 10 +++++++++-
- src/library/fetch.h          |  3 ++-
- src/main.c                   |  5 ++++-
- src/update-main.c            |  4 +++-
- src/update.c                 | 12 +++++++-----
- src/update.h                 |  2 +-
- 7 files changed, 27 insertions(+), 10 deletions(-)
-
-diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.h
-index e4bb5b1..f89eade 100644
---- a/src/library/cve-check-tool.h
-+++ b/src/library/cve-check-tool.h
-@@ -43,6 +43,7 @@ typedef struct CveCheckTool {
-     bool bugs;                          /**<Whether bug tracking is enabled */
-     GHashTable *mapping;                /**<CVE Mapping */
-     const char *output_file;            /**<Output file, if any */
-+    const char *cacert_file;            /**<Non-default SSL certificate file, if any */
- } CveCheckTool;
- 
- /**
-diff --git a/src/library/fetch.c b/src/library/fetch.c
-index 0fe6d76..8f998c3 100644
---- a/src/library/fetch.c
-+++ b/src/library/fetch.c
-@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_t dlnow
- }
- 
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
--                      unsigned int start_percent, unsigned int end_percent)
-+                      unsigned int start_percent, unsigned int end_percent,
-+                      const char *cacert_file)
- {
-         FetchStatus ret = FETCH_STATUS_FAIL;
-         CURLcode res;
-@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
-                 return ret;
-         }
- 
-+        if (cacert_file) {
-+                res = curl_easy_setopt(curl, CURLOPT_CAINFO, cacert_file);
-+                if (res != CURLE_OK) {
-+                        goto bail;
-+                }
-+        }
-+
-         if (stat(target, &st) == 0) {
-                 res = curl_easy_setopt(curl, CURLOPT_TIMECONDITION, CURL_TIMECOND_IFMODSINCE);
-                 if (res != CURLE_OK) {
-diff --git a/src/library/fetch.h b/src/library/fetch.h
-index 4cce5d1..836c7d7 100644
---- a/src/library/fetch.h
-+++ b/src/library/fetch.h
-@@ -29,7 +29,8 @@ typedef enum {
-  * @return A FetchStatus, indicating the operation taken
-  */
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
--                      unsigned int this_percent, unsigned int next_percent);
-+                      unsigned int this_percent, unsigned int next_percent,
-+                      const char *cacert_file);
- 
- /**
-  * Attempt to extract the given gzipped file
-diff --git a/src/main.c b/src/main.c
-index 8e6f158..ae69d47 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -280,6 +280,7 @@ static bool csv_mode = false;
- static char *modified_stamp = NULL;
- static gchar *mapping_file = NULL;
- static gchar *output_file = NULL;
-+static gchar *cacert_file = NULL;
- 
- static GOptionEntry _entries[] = {
-         { "not-patched", 'n', 0, G_OPTION_ARG_NONE, &hide_patched, "Hide patched/addressed CVEs", NULL },
-@@ -294,6 +295,7 @@ static GOptionEntry _entries[] = {
-         { "csv", 'c', 0, G_OPTION_ARG_NONE, &csv_mode, "Output CSV formatted data only", NULL },
-         { "mapping", 'M', 0, G_OPTION_ARG_STRING, &mapping_file, "Path to a mapping file", NULL},
-         { "output-file", 'o', 0, G_OPTION_ARG_STRING, &output_file, "Path to the output file (output plugin specific)", NULL},
-+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &cacert_file, "Path to the combined SSL certificates file (system default is used if not set)", NULL},
-         { .short_name = 0 }
- };
- 
-@@ -492,6 +494,7 @@ int main(int argc, char **argv)
- 
-         quiet = csv_mode || !no_html;
-         self->output_file = output_file;
-+        self->cacert_file = cacert_file;
- 
-         if (!csv_mode && self->output_file) {
-                 quiet = false;
-@@ -530,7 +533,7 @@ int main(int argc, char **argv)
-                 if (status) {
-                         fprintf(stderr, "Update of db forced\n");
-                         cve_db_unlock();
--                        if (!update_db(quiet, db_path->str)) {
-+                        if (!update_db(quiet, db_path->str, self->cacert_file)) {
-                                 fprintf(stderr, "DB update failure\n");
-                                 goto cleanup;
-                         }
-diff --git a/src/update-main.c b/src/update-main.c
-index 2379cfa..c52d9d0 100644
---- a/src/update-main.c
-+++ b/src/update-main.c
-@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of the License, or\n\
- static gchar *nvds = NULL;
- static bool _show_version = false;
- static bool _quiet = false;
-+static const char *_cacert_file = NULL;
- 
- static GOptionEntry _entries[] = {
-         { "nvd-dir", 'd', 0, G_OPTION_ARG_STRING, &nvds, "NVD directory in filesystem", NULL },
-         { "version", 'v', 0, G_OPTION_ARG_NONE, &_show_version, "Show version", NULL },
-         { "quiet", 'q', 0, G_OPTION_ARG_NONE, &_quiet, "Run silently", NULL },
-+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &_cacert_file, "Path to the combined SSL certificates file (system default is used if not set)", NULL},
-         { .short_name = 0 }
- };
- 
-@@ -88,7 +90,7 @@ int main(int argc, char **argv)
-                 goto end;
-         }
- 
--        if (update_db(_quiet, db_path->str)) {
-+        if (update_db(_quiet, db_path->str, _cacert_file)) {
-                 ret = EXIT_SUCCESS;
-         } else {
-                 fprintf(stderr, "Failed to update database\n");
-diff --git a/src/update.c b/src/update.c
-index 070560a..8cb4a39 100644
---- a/src/update.c
-+++ b/src/update.c
-@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char *update_fname, bool ok)
- 
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
-                            bool db_exist, bool verbose,
--                           unsigned int this_percent, unsigned int next_percent)
-+                           unsigned int this_percent, unsigned int next_percent,
-+                           const char *cacert_file)
- {
-         const char nvd_uri[] = URI_PREFIX;
-         autofree(cve_string) *uri_meta = NULL;
-@@ -331,14 +332,14 @@ refetch:
-         }
- 
-         /* Fetch NVD META file */
--        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent);
-+        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent, cacert_file);
-         if (st == FETCH_STATUS_FAIL) {
-                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
-                 return -1;
-         }
- 
-         /* Fetch NVD XML file */
--        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent);
-+        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent, cacert_file);
-         switch (st) {
-         case FETCH_STATUS_FAIL:
-                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->str);
-@@ -391,7 +392,7 @@ refetch:
-         return 0;
- }
- 
--bool update_db(bool quiet, const char *db_file)
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file)
- {
-         autofree(char) *db_dir = NULL;
-         autofree(CveDB) *cve_db = NULL;
-@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)
-                 if (!quiet)
-                         fprintf(stderr, "completed: %u%%\r", start_percent);
-                 rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet,
--                                     start_percent, end_percent);
-+                                     start_percent, end_percent,
-+                                     cacert_file);
-                 switch (rc) {
-                 case 0:
-                         if (!quiet)
-diff --git a/src/update.h b/src/update.h
-index b8e9911..ceea0c3 100644
---- a/src/update.h
-+++ b/src/update.h
-@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);
- 
- int update_required(const char *db_file);
- 
--bool update_db(bool quiet, const char *db_file);
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file);
- 
- 
- /*
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
deleted file mode 100644
index 8ea6f68..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
-Date: Mon, 26 Sep 2016 12:12:41 +0100
-Subject: [PATCH] print progress in percent when downloading CVE db
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-Signed-off-by: André Draszik <git@andred.net>
----
- src/library/fetch.c | 28 +++++++++++++++++++++++++++-
- src/library/fetch.h |  3 ++-
- src/update.c        | 16 ++++++++++++----
- 3 files changed, 41 insertions(+), 6 deletions(-)
-
-diff --git a/src/library/fetch.c b/src/library/fetch.c
-index 06d4b30..0fe6d76 100644
---- a/src/library/fetch.c
-+++ b/src/library/fetch.c
-@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size, size_t nmemb, struct fetch_t *f
-         return fwrite(ptr, size, nmemb, f->f);
- }
- 
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)
-+struct percent_t {
-+        unsigned int start;
-+        unsigned int end;
-+};
-+
-+static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
-+{
-+        (void) ultotal;
-+        (void) ulnow;
-+
-+        struct percent_t *percent = (struct percent_t *) ptr;
-+
-+        if (dltotal && percent && percent->end >= percent->start) {
-+                unsigned int diff = percent->end - percent->start;
-+                if (diff) {
-+                        fprintf(stderr,"completed: %"CURL_FORMAT_CURL_OFF_T"%%\r", percent->start + (diff * dlnow / dltotal));
-+                }
-+        }
-+
-+        return 0;
-+}
-+
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
-+                      unsigned int start_percent, unsigned int end_percent)
- {
-         FetchStatus ret = FETCH_STATUS_FAIL;
-         CURLcode res;
-         struct stat st;
-         CURL *curl = NULL;
-         struct fetch_t *f = NULL;
-+        struct percent_t percent = { .start = start_percent, .end = end_percent };
- 
-         curl = curl_easy_init();
-         if (!curl) {
-@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)
-         }
-         if (verbose) {
-                 (void)curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
-+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFODATA, &percent);
-+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION, progress_callback_new);
-         }
-         res = curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, (curl_write_callback)write_func);
-         if (res != CURLE_OK) {
-diff --git a/src/library/fetch.h b/src/library/fetch.h
-index 70c3779..4cce5d1 100644
---- a/src/library/fetch.h
-+++ b/src/library/fetch.h
-@@ -28,7 +28,8 @@ typedef enum {
-  * @param verbose Whether to be verbose
-  * @return A FetchStatus, indicating the operation taken
-  */
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose);
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,
-+                      unsigned int this_percent, unsigned int next_percent);
- 
- /**
-  * Attempt to extract the given gzipped file
-diff --git a/src/update.c b/src/update.c
-index 30fbe96..eaeeefd 100644
---- a/src/update.c
-+++ b/src/update.c
-@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char *update_fname, bool ok)
- }
- 
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
--                           bool db_exist, bool verbose)
-+                           bool db_exist, bool verbose,
-+                           unsigned int this_percent, unsigned int next_percent)
- {
-         const char nvd_uri[] = URI_PREFIX;
-         autofree(cve_string) *uri_meta = NULL;
-@@ -330,14 +331,14 @@ refetch:
-         }
- 
-         /* Fetch NVD META file */
--        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose);
-+        st = fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, this_percent, this_percent);
-         if (st == FETCH_STATUS_FAIL) {
-                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
-                 return -1;
-         }
- 
-         /* Fetch NVD XML file */
--        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose);
-+        st = fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose, this_percent, next_percent);
-         switch (st) {
-         case FETCH_STATUS_FAIL:
-                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->str);
-@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)
-         for (int i = YEAR_START; i <= year+1; i++) {
-                 int y = i > year ? -1 : i;
-                 int rc;
-+                unsigned int start_percent = ((i+0 - YEAR_START) * 100) / (year+2 - YEAR_START);
-+                unsigned int end_percent = ((i+1 - YEAR_START) * 100) / (year+2 - YEAR_START);
- 
--                rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet);
-+                if (!quiet)
-+                        fprintf(stderr, "completed: %u%%\r", start_percent);
-+                rc = do_fetch_update(y, db_dir, cve_db, db_exist, !quiet,
-+                                     start_percent, end_percent);
-                 switch (rc) {
-                 case 0:
-+                        if (!quiet)
-+                                fprintf(stderr,"completed: %u%%\r", end_percent);
-                         continue;
-                 case ENOMEM:
-                         goto oom;
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch b/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
deleted file mode 100644
index 458c0cc..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001
-From: Sergey Popovich <popovich_sergei@mail.ua>
-Date: Fri, 21 Apr 2017 07:32:23 -0700
-Subject: [PATCH] update: Compare computed vs expected sha256 digit string
- ignoring case
-
-We produce sha256 digest string using %x snprintf()
-qualifier for each byte of digest which uses alphabetic
-characters from "a" to "f" in lower case to represent
-integer values from 10 to 15.
-
-Previously all of the NVD META files supply sha256
-digest string for corresponding XML file in lower case.
-
-However due to some reason this changed recently to
-provide digest digits in upper case causing fetched
-data consistency checks to fail. This prevents database
-from being updated periodically.
-
-While commit c4f6e94 (update: Do not treat sha256 failure
-as fatal if requested) adds useful option to skip
-digest validation at all and thus provides workaround for
-this situation, it might be unacceptable for some
-deployments where we need to ensure that downloaded
-data is consistent before start parsing it and update
-SQLite database.
-
-Use strcasecmp() to compare two digest strings case
-insensitively and addressing this case.
-
-Upstream-Status: Backport
-Signed-off-by: Sergey Popovich <popovich_sergei@mail.ua>
----
- src/update.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/update.c b/src/update.c
-index 8588f38..3cc6b67 100644
---- a/src/update.c
-+++ b/src/update.c
-@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const char *data)
-                 snprintf(&csum_data[idx], len, "%02hhx", digest[i]);
-         }
- 
--        ret = streq(csum_meta, csum_data);
-+        ret = !strcasecmp(csum_meta, csum_data);
- 
- err_unmap:
-         munmap(buffer, length);
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch b/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
deleted file mode 100644
index 0774ad9..0000000
--- a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 Aug 2016 22:54:24 -0700
-Subject: [PATCH] Check for malloc_trim before using it
-
-malloc_trim is gnu specific and not all libc
-implement it, threfore write a configure check
-to poke for it first and use the define to
-guard its use.
-
-Helps in compiling on musl based systems
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-tool/pull/48]
- configure.ac | 2 ++
- src/core.c   | 4 ++--
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d3b66ce..79c3542 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])
- m4_define([openssl_required_version],[1.0.0])
- # TODO: Set minimum sqlite
- 
-+AC_CHECK_FUNCS_ONCE(malloc_trim)
-+
- PKG_CHECK_MODULES(CVE_CHECK_TOOL,
-                  [
-                   glib-2.0 >= glib_required_version,
-diff --git a/src/core.c b/src/core.c
-index 6263031..0d5df29 100644
---- a/src/core.c
-+++ b/src/core.c
-@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)
-         }
- 
-         b = true;
--
-+#ifdef HAVE_MALLOC_TRIM
-         malloc_trim(0);
--
-+#endif
-         xmlFreeTextReader(r);
-         if (fd) {
-                 close(fd);
--- 
-2.9.3
-
-- 
1.9.1


