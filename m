Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBBE7ECFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 16:30:42 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id w17so20198071qto.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 09:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ivROfx3N0kQzinvkGwJsmVVasDeBS1etF5eO6LFIgus=;
	b=BY79c5KtktoFfu66+wPUomtwCs8dm6Fwh1PMZNmoARXU+S91W2zOoeBESLCdIr1C4P
	QudkbXJbzcp/IoZGg7Igz/Ev8pnHG/qXARuaHT3ezUTlUjk8/JygEqCYtKL/pFkuTW4c
	NuPSUrCCTGWm1uLoRYuK+L5Ky5jtboscVuMtWojFi4ySXhFNyX9LQTa3TW2CMcRO6ACB
	vYnA+aY8cBiNiaqHp/t+1HlE7epUovAZUVlgolhdYONwxtYmiKRgvFmTl4zV6j2Y0gbt
	H8I6Q23ew4jj5sEBvMPCY1WfyzlfI6OoyzyD39i8sqYPHp/W/03LIOC2W4pwJGeEFEbA
	bDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ivROfx3N0kQzinvkGwJsmVVasDeBS1etF5eO6LFIgus=;
	b=WIOMFuGo9Vcuw+NihMhdZdIuHn66gasOeeOSdSxKgPM9WSUSHvwGVz5cdgFu2ySV6u
	1RTC3ChsRKvPvz5P0XWIU+A2w3/TcmOaMbnjGo+o4YMVQGGYp6MUuYEWuIeQWCN2DgxN
	b+/6HUSeOd4hqlEWkLz3Hd491UtFsBlNA/R0ZfQNW6K77KHC0z2QRFNyuB7S0+mpoomh
	5KqlBl1Jbt7VOC50/32naDOMPKDvqjDh8TFL9pGRnYapPU1hiVz6lKRVjGdgsEX0Z7nE
	hq0eX6ETFaf1wJkP+vpFdhLoPsogZk8lW5kcUbXGRUix3Rb7XhAHyGU9bdIqWa7WTty6
	/52Q==
X-Gm-Message-State: APjAAAUeu5cnSgShmr8Uinkn20L9GRFn5jC1xKrrR6dDxdFTocmEYf27
	dYprVzC8ptMB7/ktgvAP/oN9RAxklEPNZSGJtao=
X-Google-Smtp-Source: APXvYqxKiZXDsdY+pODg1d3iYNqaxQvHMC2Gbg5UWCdv2NmhWbyYGUUP26XdfiBeWeft2klIouzkYz9/wHy5E/Ry/S8=
X-Received: by 2002:aed:36e8:: with SMTP id f95mr23434647qtb.88.1563294643641; 
	Tue, 16 Jul 2019 09:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190716124650.22236-1-ross.burton@intel.com>
In-Reply-To: <20190716124650.22236-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 09:30:29 -0700
Message-ID: <CAMKF1spFQESmXpBiHpPN8J2X7LzdszPjT8fiwWqnq_r0Ec7Lpw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Sergey Popovich <popovich_sergei@mail.ua>,
	openembedded-core@lists.openembedded.org,
	Jussi Kukkonen <jussi.kukkonen@intel.com>
Subject: Re: [PATCH] cve-check-tool: remove
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
X-List-Received-Date: Tue, 16 Jul 2019 16:30:43 -0000
Content-Type: multipart/alternative; boundary="000000000000e9e1f6058dcee564"

--000000000000e9e1f6058dcee564
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

May be add a line about why it is being removed

On Tue, Jul 16, 2019 at 5:46 AM Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../cve-check-tool/cve-check-tool_5.6.4.bb    |  62 -----
>  ...x-freeing-memory-allocated-by-sqlite.patch |  50 ----
>  ...erriding-default-CA-certificate-file.patch | 215 ------------------
>  ...s-in-percent-when-downloading-CVE-db.patch | 135 -----------
>  ...omputed-vs-expected-sha256-digit-str.patch |  52 -----
>  ...heck-for-malloc_trim-before-using-it.patch |  51 -----
>  6 files changed, 565 deletions(-)
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/
> cve-check-tool_5.6.4.bb
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-alloca=
ted-by-sqlite.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-def=
ault-CA-certificate-file.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent=
-when-downloading-CVE-db.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-v=
s-expected-sha256-digit-str.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-u=
sing-it.patch
>
> diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> deleted file mode 100644
> index 1c84fb1cf2d..00000000000
> --- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -SUMMARY =3D "cve-check-tool"
> -DESCRIPTION =3D "cve-check-tool is a tool for checking known (public) CV=
Es.\
> -The tool will identify potentially vunlnerable software packages within
> Linux distributions through version matching."
> -HOMEPAGE =3D "https://github.com/ikeydoherty/cve-check-tool"
> -SECTION =3D "Development/Tools"
> -LICENSE =3D "GPL-2.0+"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De8c1458438ead3c34974bc0be3a03=
ed6"
> -
> -SRC_URI =3D "
> https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.=
xz
> \
> -           file://check-for-malloc_trim-before-using-it.patch \
> -
>  file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
> -
>  file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
> -
>  file://0001-update-Compare-computed-vs-expected-sha256-digit-str.patch \
> -           file://0001-Fix-freeing-memory-allocated-by-sqlite.patch \
> -          "
> -
> -SRC_URI[md5sum] =3D "c5f4247140fc9be3bf41491d31a34155"
> -SRC_URI[sha256sum] =3D
> "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b"
> -
> -UPSTREAM_CHECK_URI =3D "
> https://github.com/ikeydoherty/cve-check-tool/releases"
> -
> -DEPENDS =3D "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl
> ca-certificates"
> -
> -RDEPENDS_${PN} =3D "ca-certificates"
> -
> -inherit pkgconfig autotools
> -
> -EXTRA_OECONF =3D "--disable-coverage --enable-relative-plugins"
> -CFLAGS_append =3D " -Wno-error=3Dpedantic"
> -
> -do_populate_cve_db() {
> -    if [ "${BB_NO_NETWORK}" =3D "1" ] ; then
> -        bbwarn "BB_NO_NETWORK is set; Can't update cve-check-tool
> database, new CVEs won't be detected"
> -        return
> -    fi
> -
> -    # In case we don't inherit cve-check class, use default values
> defined in the class.
> -    cve_dir=3D"${CVE_CHECK_DB_DIR}"
> -    cve_file=3D"${CVE_CHECK_TMP_FILE}"
> -
> -    [ -z "${cve_dir}" ] && cve_dir=3D"${DL_DIR}/CVE_CHECK"
> -    [ -z "${cve_file}" ] && cve_file=3D"${TMPDIR}/cve_check"
> -
> -    unused=3D"${@bb.utils.export_proxies(d)}"
> -    bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
> -    # --cacert works around curl-native not finding the CA bundle
> -    if cve-check-update --cacert
> ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
> -        printf "CVE database was updated on %s UTC\n\n" "$(LANG=3DC date
> --utc +'%F %T')" > "$cve_file"
> -    else
> -        bbwarn "Error in executing cve-check-update"
> -        if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'}=
"
> -ne 0 ] ; then
> -            bbwarn "Failed to update cve-check-tool database, CVEs won't
> be checked"
> -        fi
> -    fi
> -}
> -
> -addtask populate_cve_db after do_populate_sysroot
> -do_populate_cve_db[depends] =3D "cve-check-tool-native:do_populate_sysro=
ot"
> -do_populate_cve_db[nostamp] =3D "1"
> -do_populate_cve_db[progress] =3D "percent"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allo=
cated-by-sqlite.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allo=
cated-by-sqlite.patch
> deleted file mode 100644
> index 4a82cf2dded..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allo=
cated-by-sqlite.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001
> -From: Peter Marko <peter.marko@siemens.com>
> -Date: Thu, 13 Apr 2017 23:09:52 +0200
> -Subject: [PATCH] Fix freeing memory allocated by sqlite
> -
> -Upstream-Status: Backport
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - src/core.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/core.c b/src/core.c
> -index 6263031..6788f16 100644
> ---- a/src/core.c
> -+++ b/src/core.c
> -@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)
> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
> -         if (rc !=3D SQLITE_OK) {
> -                 fprintf(stderr, "ensure_table(): %s\n", err);
> --                free(err);
> -+                sqlite3_free(err);
> -                 return false;
> -         }
> -
> -@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)
> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
> -         if (rc !=3D SQLITE_OK) {
> -                 fprintf(stderr, "ensure_table(): %s\n", err);
> --                free(err);
> -+                sqlite3_free(err);
> -                 return false;
> -         }
> -
> -@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)
> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
> -         if (rc !=3D SQLITE_OK) {
> -                 fprintf(stderr, "ensure_table(): %s\n", err);
> --                free(err);
> -+                sqlite3_free(err);
> -                 return false;
> -         }
> -         if (err) {
> --                free(err);
> -+                sqlite3_free(err);
> -         }
> -
> -         return true;
> ---
> -2.1.4
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-d=
efault-CA-certificate-file.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-d=
efault-CA-certificate-file.patch
> deleted file mode 100644
> index 3d8ebd1bd26..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-d=
efault-CA-certificate-file.patch
> +++ /dev/null
> @@ -1,215 +0,0 @@
> -From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Thu, 9 Feb 2017 14:51:28 +0200
> -Subject: [PATCH] curl: allow overriding default CA certificate file
> -
> -Similar to curl, --cacert can now be used in cve-check-tool and
> -cve-check-update to override the default CA certificate file. Useful
> -in cases where the system default is unsuitable (for example,
> -out-dated) or broken (as in OE's current native libcurl, which embeds
> -a path string from one build host and then uses it on another although
> -the right path may have become something different).
> -
> -Upstream-Status: Submitted [
> https://github.com/ikeydoherty/cve-check-tool/pull/45]
> -
> -Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> -
> -
> -Took Patrick Ohlys original patch from meta-security-isafw, rebased
> -on top of other patches.
> -
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - src/library/cve-check-tool.h |  1 +
> - src/library/fetch.c          | 10 +++++++++-
> - src/library/fetch.h          |  3 ++-
> - src/main.c                   |  5 ++++-
> - src/update-main.c            |  4 +++-
> - src/update.c                 | 12 +++++++-----
> - src/update.h                 |  2 +-
> - 7 files changed, 27 insertions(+), 10 deletions(-)
> -
> -diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.h
> -index e4bb5b1..f89eade 100644
> ---- a/src/library/cve-check-tool.h
> -+++ b/src/library/cve-check-tool.h
> -@@ -43,6 +43,7 @@ typedef struct CveCheckTool {
> -     bool bugs;                          /**<Whether bug tracking is
> enabled */
> -     GHashTable *mapping;                /**<CVE Mapping */
> -     const char *output_file;            /**<Output file, if any */
> -+    const char *cacert_file;            /**<Non-default SSL certificate
> file, if any */
> - } CveCheckTool;
> -
> - /**
> -diff --git a/src/library/fetch.c b/src/library/fetch.c
> -index 0fe6d76..8f998c3 100644
> ---- a/src/library/fetch.c
> -+++ b/src/library/fetch.c
> -@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_t
> dltotal, curl_off_t dlnow
> - }
> -
> - FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> --                      unsigned int start_percent, unsigned int
> end_percent)
> -+                      unsigned int start_percent, unsigned int
> end_percent,
> -+                      const char *cacert_file)
> - {
> -         FetchStatus ret =3D FETCH_STATUS_FAIL;
> -         CURLcode res;
> -@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char
> *target, bool verbose,
> -                 return ret;
> -         }
> -
> -+        if (cacert_file) {
> -+                res =3D curl_easy_setopt(curl, CURLOPT_CAINFO,
> cacert_file);
> -+                if (res !=3D CURLE_OK) {
> -+                        goto bail;
> -+                }
> -+        }
> -+
> -         if (stat(target, &st) =3D=3D 0) {
> -                 res =3D curl_easy_setopt(curl, CURLOPT_TIMECONDITION,
> CURL_TIMECOND_IFMODSINCE);
> -                 if (res !=3D CURLE_OK) {
> -diff --git a/src/library/fetch.h b/src/library/fetch.h
> -index 4cce5d1..836c7d7 100644
> ---- a/src/library/fetch.h
> -+++ b/src/library/fetch.h
> -@@ -29,7 +29,8 @@ typedef enum {
> -  * @return A FetchStatus, indicating the operation taken
> -  */
> - FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> --                      unsigned int this_percent, unsigned int
> next_percent);
> -+                      unsigned int this_percent, unsigned int
> next_percent,
> -+                      const char *cacert_file);
> -
> - /**
> -  * Attempt to extract the given gzipped file
> -diff --git a/src/main.c b/src/main.c
> -index 8e6f158..ae69d47 100644
> ---- a/src/main.c
> -+++ b/src/main.c
> -@@ -280,6 +280,7 @@ static bool csv_mode =3D false;
> - static char *modified_stamp =3D NULL;
> - static gchar *mapping_file =3D NULL;
> - static gchar *output_file =3D NULL;
> -+static gchar *cacert_file =3D NULL;
> -
> - static GOptionEntry _entries[] =3D {
> -         { "not-patched", 'n', 0, G_OPTION_ARG_NONE, &hide_patched, "Hid=
e
> patched/addressed CVEs", NULL },
> -@@ -294,6 +295,7 @@ static GOptionEntry _entries[] =3D {
> -         { "csv", 'c', 0, G_OPTION_ARG_NONE, &csv_mode, "Output CSV
> formatted data only", NULL },
> -         { "mapping", 'M', 0, G_OPTION_ARG_STRING, &mapping_file, "Path
> to a mapping file", NULL},
> -         { "output-file", 'o', 0, G_OPTION_ARG_STRING, &output_file,
> "Path to the output file (output plugin specific)", NULL},
> -+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &cacert_file, "Path to
> the combined SSL certificates file (system default is used if not set)",
> NULL},
> -         { .short_name =3D 0 }
> - };
> -
> -@@ -492,6 +494,7 @@ int main(int argc, char **argv)
> -
> -         quiet =3D csv_mode || !no_html;
> -         self->output_file =3D output_file;
> -+        self->cacert_file =3D cacert_file;
> -
> -         if (!csv_mode && self->output_file) {
> -                 quiet =3D false;
> -@@ -530,7 +533,7 @@ int main(int argc, char **argv)
> -                 if (status) {
> -                         fprintf(stderr, "Update of db forced\n");
> -                         cve_db_unlock();
> --                        if (!update_db(quiet, db_path->str)) {
> -+                        if (!update_db(quiet, db_path->str,
> self->cacert_file)) {
> -                                 fprintf(stderr, "DB update failure\n");
> -                                 goto cleanup;
> -                         }
> -diff --git a/src/update-main.c b/src/update-main.c
> -index 2379cfa..c52d9d0 100644
> ---- a/src/update-main.c
> -+++ b/src/update-main.c
> -@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of th=
e
> License, or\n\
> - static gchar *nvds =3D NULL;
> - static bool _show_version =3D false;
> - static bool _quiet =3D false;
> -+static const char *_cacert_file =3D NULL;
> -
> - static GOptionEntry _entries[] =3D {
> -         { "nvd-dir", 'd', 0, G_OPTION_ARG_STRING, &nvds, "NVD directory
> in filesystem", NULL },
> -         { "version", 'v', 0, G_OPTION_ARG_NONE, &_show_version, "Show
> version", NULL },
> -         { "quiet", 'q', 0, G_OPTION_ARG_NONE, &_quiet, "Run silently",
> NULL },
> -+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &_cacert_file, "Path t=
o
> the combined SSL certificates file (system default is used if not set)",
> NULL},
> -         { .short_name =3D 0 }
> - };
> -
> -@@ -88,7 +90,7 @@ int main(int argc, char **argv)
> -                 goto end;
> -         }
> -
> --        if (update_db(_quiet, db_path->str)) {
> -+        if (update_db(_quiet, db_path->str, _cacert_file)) {
> -                 ret =3D EXIT_SUCCESS;
> -         } else {
> -                 fprintf(stderr, "Failed to update database\n");
> -diff --git a/src/update.c b/src/update.c
> -index 070560a..8cb4a39 100644
> ---- a/src/update.c
> -+++ b/src/update.c
> -@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char
> *update_fname, bool ok)
> -
> - static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
> -                            bool db_exist, bool verbose,
> --                           unsigned int this_percent, unsigned int
> next_percent)
> -+                           unsigned int this_percent, unsigned int
> next_percent,
> -+                           const char *cacert_file)
> - {
> -         const char nvd_uri[] =3D URI_PREFIX;
> -         autofree(cve_string) *uri_meta =3D NULL;
> -@@ -331,14 +332,14 @@ refetch:
> -         }
> -
> -         /* Fetch NVD META file */
> --        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose,
> this_percent, this_percent);
> -+        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose,
> this_percent, this_percent, cacert_file);
> -         if (st =3D=3D FETCH_STATUS_FAIL) {
> -                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
> -                 return -1;
> -         }
> -
> -         /* Fetch NVD XML file */
> --        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
,
> this_percent, next_percent);
> -+        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
,
> this_percent, next_percent, cacert_file);
> -         switch (st) {
> -         case FETCH_STATUS_FAIL:
> -                 fprintf(stderr, "Failed to fetch %s\n",
> uri_data_gz->str);
> -@@ -391,7 +392,7 @@ refetch:
> -         return 0;
> - }
> -
> --bool update_db(bool quiet, const char *db_file)
> -+bool update_db(bool quiet, const char *db_file, const char *cacert_file=
)
> - {
> -         autofree(char) *db_dir =3D NULL;
> -         autofree(CveDB) *cve_db =3D NULL;
> -@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)
> -                 if (!quiet)
> -                         fprintf(stderr, "completed: %u%%\r",
> start_percent);
> -                 rc =3D do_fetch_update(y, db_dir, cve_db, db_exist, !qu=
iet,
> --                                     start_percent, end_percent);
> -+                                     start_percent, end_percent,
> -+                                     cacert_file);
> -                 switch (rc) {
> -                 case 0:
> -                         if (!quiet)
> -diff --git a/src/update.h b/src/update.h
> -index b8e9911..ceea0c3 100644
> ---- a/src/update.h
> -+++ b/src/update.h
> -@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);
> -
> - int update_required(const char *db_file);
> -
> --bool update_db(bool quiet, const char *db_file);
> -+bool update_db(bool quiet, const char *db_file, const char *cacert_file=
);
> -
> -
> - /*
> ---
> -2.1.4
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-perce=
nt-when-downloading-CVE-db.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-perce=
nt-when-downloading-CVE-db.patch
> deleted file mode 100644
> index 8ea6f686e3f..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-perce=
nt-when-downloading-CVE-db.patch
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
> -Date: Mon, 26 Sep 2016 12:12:41 +0100
> -Subject: [PATCH] print progress in percent when downloading CVE db
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Pending
> -Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ----
> - src/library/fetch.c | 28 +++++++++++++++++++++++++++-
> - src/library/fetch.h |  3 ++-
> - src/update.c        | 16 ++++++++++++----
> - 3 files changed, 41 insertions(+), 6 deletions(-)
> -
> -diff --git a/src/library/fetch.c b/src/library/fetch.c
> -index 06d4b30..0fe6d76 100644
> ---- a/src/library/fetch.c
> -+++ b/src/library/fetch.c
> -@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size,
> size_t nmemb, struct fetch_t *f
> -         return fwrite(ptr, size, nmemb, f->f);
> - }
> -
> --FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
)
> -+struct percent_t {
> -+        unsigned int start;
> -+        unsigned int end;
> -+};
> -+
> -+static int progress_callback_new(void *ptr, curl_off_t dltotal,
> curl_off_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
> -+{
> -+        (void) ultotal;
> -+        (void) ulnow;
> -+
> -+        struct percent_t *percent =3D (struct percent_t *) ptr;
> -+
> -+        if (dltotal && percent && percent->end >=3D percent->start) {
> -+                unsigned int diff =3D percent->end - percent->start;
> -+                if (diff) {
> -+                        fprintf(stderr,"completed:
> %"CURL_FORMAT_CURL_OFF_T"%%\r", percent->start + (diff * dlnow / dltotal)=
);
> -+                }
> -+        }
> -+
> -+        return 0;
> -+}
> -+
> -+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> -+                      unsigned int start_percent, unsigned int
> end_percent)
> - {
> -         FetchStatus ret =3D FETCH_STATUS_FAIL;
> -         CURLcode res;
> -         struct stat st;
> -         CURL *curl =3D NULL;
> -         struct fetch_t *f =3D NULL;
> -+        struct percent_t percent =3D { .start =3D start_percent, .end =
=3D
> end_percent };
> -
> -         curl =3D curl_easy_init();
> -         if (!curl) {
> -@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char
> *target, bool verbose)
> -         }
> -         if (verbose) {
> -                 (void)curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
> -+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFODATA,
> &percent);
> -+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION,
> progress_callback_new);
> -         }
> -         res =3D curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,
> (curl_write_callback)write_func);
> -         if (res !=3D CURLE_OK) {
> -diff --git a/src/library/fetch.h b/src/library/fetch.h
> -index 70c3779..4cce5d1 100644
> ---- a/src/library/fetch.h
> -+++ b/src/library/fetch.h
> -@@ -28,7 +28,8 @@ typedef enum {
> -  * @param verbose Whether to be verbose
> -  * @return A FetchStatus, indicating the operation taken
> -  */
> --FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
);
> -+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> -+                      unsigned int this_percent, unsigned int
> next_percent);
> -
> - /**
> -  * Attempt to extract the given gzipped file
> -diff --git a/src/update.c b/src/update.c
> -index 30fbe96..eaeeefd 100644
> ---- a/src/update.c
> -+++ b/src/update.c
> -@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char
> *update_fname, bool ok)
> - }
> -
> - static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
> --                           bool db_exist, bool verbose)
> -+                           bool db_exist, bool verbose,
> -+                           unsigned int this_percent, unsigned int
> next_percent)
> - {
> -         const char nvd_uri[] =3D URI_PREFIX;
> -         autofree(cve_string) *uri_meta =3D NULL;
> -@@ -330,14 +331,14 @@ refetch:
> -         }
> -
> -         /* Fetch NVD META file */
> --        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose);
> -+        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose,
> this_percent, this_percent);
> -         if (st =3D=3D FETCH_STATUS_FAIL) {
> -                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
> -                 return -1;
> -         }
> -
> -         /* Fetch NVD XML file */
> --        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
);
> -+        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
,
> this_percent, next_percent);
> -         switch (st) {
> -         case FETCH_STATUS_FAIL:
> -                 fprintf(stderr, "Failed to fetch %s\n",
> uri_data_gz->str);
> -@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)
> -         for (int i =3D YEAR_START; i <=3D year+1; i++) {
> -                 int y =3D i > year ? -1 : i;
> -                 int rc;
> -+                unsigned int start_percent =3D ((i+0 - YEAR_START) * 10=
0)
> / (year+2 - YEAR_START);
> -+                unsigned int end_percent =3D ((i+1 - YEAR_START) * 100)=
 /
> (year+2 - YEAR_START);
> -
> --                rc =3D do_fetch_update(y, db_dir, cve_db, db_exist,
> !quiet);
> -+                if (!quiet)
> -+                        fprintf(stderr, "completed: %u%%\r",
> start_percent);
> -+                rc =3D do_fetch_update(y, db_dir, cve_db, db_exist, !qu=
iet,
> -+                                     start_percent, end_percent);
> -                 switch (rc) {
> -                 case 0:
> -+                        if (!quiet)
> -+                                fprintf(stderr,"completed: %u%%\r",
> end_percent);
> -                         continue;
> -                 case ENOMEM:
> -                         goto oom;
> ---
> -2.9.3
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed=
-vs-expected-sha256-digit-str.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed=
-vs-expected-sha256-digit-str.patch
> deleted file mode 100644
> index 458c0cc84e5..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed=
-vs-expected-sha256-digit-str.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001
> -From: Sergey Popovich <popovich_sergei@mail.ua>
> -Date: Fri, 21 Apr 2017 07:32:23 -0700
> -Subject: [PATCH] update: Compare computed vs expected sha256 digit strin=
g
> - ignoring case
> -
> -We produce sha256 digest string using %x snprintf()
> -qualifier for each byte of digest which uses alphabetic
> -characters from "a" to "f" in lower case to represent
> -integer values from 10 to 15.
> -
> -Previously all of the NVD META files supply sha256
> -digest string for corresponding XML file in lower case.
> -
> -However due to some reason this changed recently to
> -provide digest digits in upper case causing fetched
> -data consistency checks to fail. This prevents database
> -from being updated periodically.
> -
> -While commit c4f6e94 (update: Do not treat sha256 failure
> -as fatal if requested) adds useful option to skip
> -digest validation at all and thus provides workaround for
> -this situation, it might be unacceptable for some
> -deployments where we need to ensure that downloaded
> -data is consistent before start parsing it and update
> -SQLite database.
> -
> -Use strcasecmp() to compare two digest strings case
> -insensitively and addressing this case.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Sergey Popovich <popovich_sergei@mail.ua>
> ----
> - src/update.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/update.c b/src/update.c
> -index 8588f38..3cc6b67 100644
> ---- a/src/update.c
> -+++ b/src/update.c
> -@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const
> char *data)
> -                 snprintf(&csum_data[idx], len, "%02hhx", digest[i]);
> -         }
> -
> --        ret =3D streq(csum_meta, csum_data);
> -+        ret =3D !strcasecmp(csum_meta, csum_data);
> -
> - err_unmap:
> -         munmap(buffer, length);
> ---
> -2.11.0
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before=
-using-it.patch
> b/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before=
-using-it.patch
> deleted file mode 100644
> index 0774ad946a4..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before=
-using-it.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 22 Aug 2016 22:54:24 -0700
> -Subject: [PATCH] Check for malloc_trim before using it
> -
> -malloc_trim is gnu specific and not all libc
> -implement it, threfore write a configure check
> -to poke for it first and use the define to
> -guard its use.
> -
> -Helps in compiling on musl based systems
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted [
> https://github.com/ikeydoherty/cve-check-tool/pull/48]
> - configure.ac | 2 ++
> - src/core.c   | 4 ++--
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index d3b66ce..79c3542 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])
> - m4_define([openssl_required_version],[1.0.0])
> - # TODO: Set minimum sqlite
> -
> -+AC_CHECK_FUNCS_ONCE(malloc_trim)
> -+
> - PKG_CHECK_MODULES(CVE_CHECK_TOOL,
> -                  [
> -                   glib-2.0 >=3D glib_required_version,
> -diff --git a/src/core.c b/src/core.c
> -index 6263031..0d5df29 100644
> ---- a/src/core.c
> -+++ b/src/core.c
> -@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)
> -         }
> -
> -         b =3D true;
> --
> -+#ifdef HAVE_MALLOC_TRIM
> -         malloc_trim(0);
> --
> -+#endif
> -         xmlFreeTextReader(r);
> -         if (fd) {
> -                 close(fd);
> ---
> -2.9.3
> -
> --
> 2.20.1
>
>

--000000000000e9e1f6058dcee564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">May be add a line about why it is being removed=C2=
=A0</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 16, 2019 at 5:46 AM Ross Burton &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Signed-off-by: Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;<br>
---<br>
=C2=A0.../cve-check-tool/<a href=3D"http://cve-check-tool_5.6.4.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-check-tool_5.6.4.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 62 -----<br>
=C2=A0...x-freeing-memory-allocated-by-sqlite.patch |=C2=A0 50 ----<br>
=C2=A0...erriding-default-CA-certificate-file.patch | 215 -----------------=
-<br>
=C2=A0...s-in-percent-when-downloading-CVE-db.patch | 135 -----------<br>
=C2=A0...omputed-vs-expected-sha256-digit-str.patch |=C2=A0 52 -----<br>
=C2=A0...heck-for-malloc_trim-before-using-it.patch |=C2=A0 51 -----<br>
=C2=A06 files changed, 565 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/<a href=3D"ht=
tp://cve-check-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-chec=
k-tool_5.6.4.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fi=
x-freeing-memory-allocated-by-sqlite.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-cu=
rl-allow-overriding-default-CA-certificate-file.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-pr=
int-progress-in-percent-when-downloading-CVE-db.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-up=
date-Compare-computed-vs-expected-sha256-digit-str.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-f=
or-malloc_trim-before-using-it.patch<br>
<br>
diff --git a/meta/recipes-devtools/cve-check-tool/<a href=3D"http://cve-che=
ck-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.4=
.bb</a> b/meta/recipes-devtools/cve-check-tool/<a href=3D"http://cve-check-=
tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.4.bb=
</a><br>
deleted file mode 100644<br>
index 1c84fb1cf2d..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/<a href=3D"http://cve-check-tool=
_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.4.bb</a>=
<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-SUMMARY =3D &quot;cve-check-tool&quot;<br>
-DESCRIPTION =3D &quot;cve-check-tool is a tool for checking known (public)=
 CVEs.\<br>
-The tool will identify potentially vunlnerable software packages within Li=
nux distributions through version matching.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/ikeydoherty/cve-check-too=
l" rel=3D"noreferrer" target=3D"_blank">https://github.com/ikeydoherty/cve-=
check-tool</a>&quot;<br>
-SECTION =3D &quot;Development/Tools&quot;<br>
-LICENSE =3D &quot;GPL-2.0+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De8c1458438ead3c34974bc0be3=
a03ed6&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/ikeydoherty/$%7BBPN%7D/rel=
eases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.=
tar.xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-for-malloc_trim-befo=
re-using-it.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-print-progress-in-per=
cent-when-downloading-CVE-db.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-curl-allow-overriding=
-default-CA-certificate-file.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-update-Compare-comput=
ed-vs-expected-sha256-digit-str.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-freeing-memory-al=
located-by-sqlite.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;c5f4247140fc9be3bf41491d31a34155&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b8f283be718af8d31232ac1bfc10a0378fb958aaaa49a=
f39168f8acf501e6a5b&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/ikeydoherty/cve=
-check-tool/releases" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/ikeydoherty/cve-check-tool/releases</a>&quot;<br>
-<br>
-DEPENDS =3D &quot;libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl=
 ca-certificates&quot;<br>
-<br>
-RDEPENDS_${PN} =3D &quot;ca-certificates&quot;<br>
-<br>
-inherit pkgconfig autotools<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-coverage --enable-relative-plugins&quot;<=
br>
-CFLAGS_append =3D &quot; -Wno-error=3Dpedantic&quot;<br>
-<br>
-do_populate_cve_db() {<br>
-=C2=A0 =C2=A0 if [ &quot;${BB_NO_NETWORK}&quot; =3D &quot;1&quot; ] ; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;BB_NO_NETWORK is set; Can&#39;t u=
pdate cve-check-tool database, new CVEs won&#39;t be detected&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-=C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 # In case we don&#39;t inherit cve-check class, use default =
values defined in the class.<br>
-=C2=A0 =C2=A0 cve_dir=3D&quot;${CVE_CHECK_DB_DIR}&quot;<br>
-=C2=A0 =C2=A0 cve_file=3D&quot;${CVE_CHECK_TMP_FILE}&quot;<br>
-<br>
-=C2=A0 =C2=A0 [ -z &quot;${cve_dir}&quot; ] &amp;&amp; cve_dir=3D&quot;${D=
L_DIR}/CVE_CHECK&quot;<br>
-=C2=A0 =C2=A0 [ -z &quot;${cve_file}&quot; ] &amp;&amp; cve_file=3D&quot;$=
{TMPDIR}/cve_check&quot;<br>
-<br>
-=C2=A0 =C2=A0 unused=3D&quot;${@bb.utils.export_proxies(d)}&quot;<br>
-=C2=A0 =C2=A0 bbdebug 2 &quot;Updating cve-check-tool database located in =
$cve_dir&quot;<br>
-=C2=A0 =C2=A0 # --cacert works around curl-native not finding the CA bundl=
e<br>
-=C2=A0 =C2=A0 if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-cert=
ificates.crt -d &quot;$cve_dir&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;CVE database was updated on %s UT=
C\n\n&quot; &quot;$(LANG=3DC date --utc +&#39;%F %T&#39;)&quot; &gt; &quot;=
$cve_file&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Error in executing cve-check-upda=
te&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${@&#39;1&#39; if bb.data.inherits_=
class(&#39;cve-check&#39;, d) else &#39;0&#39;}&quot; -ne 0 ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Failed to update cv=
e-check-tool database, CVEs won&#39;t be checked&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 fi<br>
-}<br>
-<br>
-addtask populate_cve_db after do_populate_sysroot<br>
-do_populate_cve_db[depends] =3D &quot;cve-check-tool-native:do_populate_sy=
sroot&quot;<br>
-do_populate_cve_db[nostamp] =3D &quot;1&quot;<br>
-do_populate_cve_db[progress] =3D &quot;percent&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-me=
mory-allocated-by-sqlite.patch b/meta/recipes-devtools/cve-check-tool/files=
/0001-Fix-freeing-memory-allocated-by-sqlite.patch<br>
deleted file mode 100644<br>
index 4a82cf2dded..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-al=
located-by-sqlite.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001<br>
-From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D=
"_blank">peter.marko@siemens.com</a>&gt;<br>
-Date: Thu, 13 Apr 2017 23:09:52 +0200<br>
-Subject: [PATCH] Fix freeing memory allocated by sqlite<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
----<br>
- src/core.c | 8 ++++----<br>
- 1 file changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/core.c b/src/core.c<br>
-index 6263031..6788f16 100644<br>
---- a/src/core.c<br>
-+++ b/src/core.c<br>
-@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sqlite3_exec(self-&gt;db, query, =
NULL, NULL, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D SQLITE_OK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;ensure_table(): %s\n&quot;, err);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
-@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sqlite3_exec(self-&gt;db, query, =
NULL, NULL, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D SQLITE_OK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;ensure_table(): %s\n&quot;, err);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sqlite3_exec(self-&gt;db, query, =
NULL, NULL, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D SQLITE_OK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;ensure_table(): %s\n&quot;, err);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
--- <br>
-2.1.4<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-ove=
rriding-default-CA-certificate-file.patch b/meta/recipes-devtools/cve-check=
-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch<br=
>
deleted file mode 100644<br>
index 3d8ebd1bd26..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding=
-default-CA-certificate-file.patch<br>
+++ /dev/null<br>
@@ -1,215 +0,0 @@<br>
-From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" targe=
t=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
-Date: Thu, 9 Feb 2017 14:51:28 +0200<br>
-Subject: [PATCH] curl: allow overriding default CA certificate file<br>
-<br>
-Similar to curl, --cacert can now be used in cve-check-tool and<br>
-cve-check-update to override the default CA certificate file. Useful<br>
-in cases where the system default is unsuitable (for example,<br>
-out-dated) or broken (as in OE&#39;s current native libcurl, which embeds<=
br>
-a path string from one build host and then uses it on another although<br>
-the right path may have become something different).<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/ikeydoherty/cve-=
check-tool/pull/45" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/ikeydoherty/cve-check-tool/pull/45</a>]<br>
-<br>
-Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com" =
target=3D"_blank">patrick.ohly@intel.com</a>&gt;<br>
-<br>
-<br>
-Took Patrick Ohlys original patch from meta-security-isafw, rebased<br>
-on top of other patches.<br>
-<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
----<br>
- src/library/cve-check-tool.h |=C2=A0 1 +<br>
- src/library/fetch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++++++-<br>
- src/library/fetch.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
- src/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 5 ++++-<br>
- src/update-main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-=
<br>
- src/update.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 12 +++++++-----<br>
- src/update.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
- 7 files changed, 27 insertions(+), 10 deletions(-)<br>
-<br>
-diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.h<b=
r>
-index e4bb5b1..f89eade 100644<br>
---- a/src/library/cve-check-tool.h<br>
-+++ b/src/library/cve-check-tool.h<br>
-@@ -43,6 +43,7 @@ typedef struct CveCheckTool {<br>
-=C2=A0 =C2=A0 =C2=A0bool bugs;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /**&lt;Whether bug trackin=
g is enabled */<br>
-=C2=A0 =C2=A0 =C2=A0GHashTable *mapping;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /**&lt;CVE Mapping */<br>
-=C2=A0 =C2=A0 =C2=A0const char *output_file;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /**&lt;Output file, if any */<br>
-+=C2=A0 =C2=A0 const char *cacert_file;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /**&lt;Non-default SSL certificate file, if any */<br>
- } CveCheckTool;<br>
- <br>
- /**<br>
-diff --git a/src/library/fetch.c b/src/library/fetch.c<br>
-index 0fe6d76..8f998c3 100644<br>
---- a/src/library/fetch.c<br>
-+++ b/src/library/fetch.c<br>
-@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_t d=
ltotal, curl_off_t dlnow<br>
- }<br>
- <br>
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int start_percent, unsigned int end_percent)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int start_percent, unsigned int end_percent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *cacert_file)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FetchStatus ret =3D FETCH_STATUS_FAIL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CURLcode res;<br>
-@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char *targ=
et, bool verbose,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cacert_file) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D curl_easy=
_setopt(curl, CURLOPT_CAINFO, cacert_file);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res !=3D CURL=
E_OK) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto bail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (stat(target, &amp;st) =3D=3D 0) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D curl=
_easy_setopt(curl, CURLOPT_TIMECONDITION, CURL_TIMECOND_IFMODSINCE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res !=3D=
 CURLE_OK) {<br>
-diff --git a/src/library/fetch.h b/src/library/fetch.h<br>
-index 4cce5d1..836c7d7 100644<br>
---- a/src/library/fetch.h<br>
-+++ b/src/library/fetch.h<br>
-@@ -29,7 +29,8 @@ typedef enum {<br>
-=C2=A0 * @return A FetchStatus, indicating the operation taken<br>
-=C2=A0 */<br>
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int this_percent, unsigned int next_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int this_percent, unsigned int next_percent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *cacert_file);<br>
- <br>
- /**<br>
-=C2=A0 * Attempt to extract the given gzipped file<br>
-diff --git a/src/main.c b/src/main.c<br>
-index 8e6f158..ae69d47 100644<br>
---- a/src/main.c<br>
-+++ b/src/main.c<br>
-@@ -280,6 +280,7 @@ static bool csv_mode =3D false;<br>
- static char *modified_stamp =3D NULL;<br>
- static gchar *mapping_file =3D NULL;<br>
- static gchar *output_file =3D NULL;<br>
-+static gchar *cacert_file =3D NULL;<br>
- <br>
- static GOptionEntry _entries[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;not-patched&quot;, &#39;n&#39;, =
0, G_OPTION_ARG_NONE, &amp;hide_patched, &quot;Hide patched/addressed CVEs&=
quot;, NULL },<br>
-@@ -294,6 +295,7 @@ static GOptionEntry _entries[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;csv&quot;, &#39;c&#39;, 0, G_OPT=
ION_ARG_NONE, &amp;csv_mode, &quot;Output CSV formatted data only&quot;, NU=
LL },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;mapping&quot;, &#39;M&#39;, 0, G=
_OPTION_ARG_STRING, &amp;mapping_file, &quot;Path to a mapping file&quot;, =
NULL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;output-file&quot;, &#39;o&#39;, =
0, G_OPTION_ARG_STRING, &amp;output_file, &quot;Path to the output file (ou=
tput plugin specific)&quot;, NULL},<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;cacert&quot;, &#39;C&#39;, 0, G_OPTIO=
N_ARG_STRING, &amp;cacert_file, &quot;Path to the combined SSL certificates=
 file (system default is used if not set)&quot;, NULL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .short_name =3D 0 }<br>
- };<br>
- <br>
-@@ -492,6 +494,7 @@ int main(int argc, char **argv)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quiet =3D csv_mode || !no_html;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;output_file =3D output_file;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;cacert_file =3D cacert_file;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!csv_mode &amp;&amp; self-&gt;output=
_file) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quiet =3D fa=
lse;<br>
-@@ -530,7 +533,7 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Update of db forced\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cve_db_unlock();<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!update_db(quiet, db_path-&gt;str)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!update_db(quiet, db_path-&gt;str, self-&gt;cacert_file)) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;DB updat=
e failure\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
-diff --git a/src/update-main.c b/src/update-main.c<br>
-index 2379cfa..c52d9d0 100644<br>
---- a/src/update-main.c<br>
-+++ b/src/update-main.c<br>
-@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of the =
License, or\n\<br>
- static gchar *nvds =3D NULL;<br>
- static bool _show_version =3D false;<br>
- static bool _quiet =3D false;<br>
-+static const char *_cacert_file =3D NULL;<br>
- <br>
- static GOptionEntry _entries[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;nvd-dir&quot;, &#39;d&#39;, 0, G=
_OPTION_ARG_STRING, &amp;nvds, &quot;NVD directory in filesystem&quot;, NUL=
L },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;version&quot;, &#39;v&#39;, 0, G=
_OPTION_ARG_NONE, &amp;_show_version, &quot;Show version&quot;, NULL },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;quiet&quot;, &#39;q&#39;, 0, G_O=
PTION_ARG_NONE, &amp;_quiet, &quot;Run silently&quot;, NULL },<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;cacert&quot;, &#39;C&#39;, 0, G_OPTIO=
N_ARG_STRING, &amp;_cacert_file, &quot;Path to the combined SSL certificate=
s file (system default is used if not set)&quot;, NULL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .short_name =3D 0 }<br>
- };<br>
- <br>
-@@ -88,7 +90,7 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto end;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (update_db(_quiet, db_path-&gt;str)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (update_db(_quiet, db_path-&gt;str, _cacer=
t_file)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D EXIT=
_SUCCESS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to update database\n&quot;);<br>
-diff --git a/src/update.c b/src/update.c<br>
-index 070560a..8cb4a39 100644<br>
---- a/src/update.c<br>
-+++ b/src/update.c<br>
-@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char *upda=
te_fname, bool ok)<br>
- <br>
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool db_exist, bool verbose,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int this_percent, unsigned int next_percen=
t)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int this_percent, unsigned int next_percen=
t,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *cacert_file)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char nvd_uri[] =3D URI_PREFIX;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(cve_string) *uri_meta =3D NULL;=
<br>
-@@ -331,14 +332,14 @@ refetch:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD META file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose, this_percent, this_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose, this_percent, this_percent, cacert_file);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st =3D=3D FETCH_STATUS_FAIL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_meta-&gt;str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD XML file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose, this_percent, next_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose, this_percent, next_percent, cacert_file);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (st) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FETCH_STATUS_FAIL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_data_gz-&gt;str);<br>
-@@ -391,7 +392,7 @@ refetch:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
- <br>
--bool update_db(bool quiet, const char *db_file)<br>
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file)<=
br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(char) *db_dir =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(CveDB) *cve_db =3D NULL;<br>
-@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!quiet)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;completed: %u%%\r&quot;, start_perce=
nt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D do_fe=
tch_update(y, db_dir, cve_db, db_exist, !quiet,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_percent, e=
nd_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_percent, e=
nd_percent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cacert_file);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (rc) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (!quiet)<br>
-diff --git a/src/update.h b/src/update.h<br>
-index b8e9911..ceea0c3 100644<br>
---- a/src/update.h<br>
-+++ b/src/update.h<br>
-@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);<br>
- <br>
- int update_required(const char *db_file);<br>
- <br>
--bool update_db(bool quiet, const char *db_file);<br>
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file);=
<br>
- <br>
- <br>
- /*<br>
--- <br>
-2.1.4<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress=
-in-percent-when-downloading-CVE-db.patch b/meta/recipes-devtools/cve-check=
-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch<br=
>
deleted file mode 100644<br>
index 8ea6f686e3f..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-per=
cent-when-downloading-CVE-db.patch<br>
+++ /dev/null<br>
@@ -1,135 +0,0 @@<br>
-From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D &lt;<a href=3D"mailto:git=
@andred.net" target=3D"_blank">git@andred.net</a>&gt;<br>
-Date: Mon, 26 Sep 2016 12:12:41 +0100<br>
-Subject: [PATCH] print progress in percent when downloading CVE db<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net" ta=
rget=3D"_blank">git@andred.net</a>&gt;<br>
----<br>
- src/library/fetch.c | 28 +++++++++++++++++++++++++++-<br>
- src/library/fetch.h |=C2=A0 3 ++-<br>
- src/update.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++++++++----<br>
- 3 files changed, 41 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/src/library/fetch.c b/src/library/fetch.c<br>
-index 06d4b30..0fe6d76 100644<br>
---- a/src/library/fetch.c<br>
-+++ b/src/library/fetch.c<br>
-@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size, size_=
t nmemb, struct fetch_t *f<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fwrite(ptr, size, nmemb, f-&gt;f)=
;<br>
- }<br>
- <br>
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)<=
br>
-+struct percent_t {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int start;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int end;<br>
-+};<br>
-+<br>
-+static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_=
t dlnow, curl_off_t ultotal, curl_off_t ulnow)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ultotal;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ulnow;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct percent_t *percent =3D (struct percent=
_t *) ptr;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dltotal &amp;&amp; percent &amp;&amp; per=
cent-&gt;end &gt;=3D percent-&gt;start) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int diff=
 =3D percent-&gt;end - percent-&gt;start;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (diff) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr,&quot;completed: %&quot;CURL_FORMAT_CURL_OFF_T&qu=
ot;%%\r&quot;, percent-&gt;start + (diff * dlnow / dltotal));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int start_percent, unsigned int end_percent)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FetchStatus ret =3D FETCH_STATUS_FAIL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CURLcode res;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat st;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CURL *curl =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct fetch_t *f =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct percent_t percent =3D { .start =3D sta=
rt_percent, .end =3D end_percent };<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curl =3D curl_easy_init();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!curl) {<br>
-@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char *targe=
t, bool verbose)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (verbose) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)curl_e=
asy_setopt(curl, CURLOPT_NOPROGRESS, 0L);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)curl_easy_s=
etopt(curl, CURLOPT_XFERINFODATA, &amp;percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)curl_easy_s=
etopt(curl, CURLOPT_XFERINFOFUNCTION, progress_callback_new);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D curl_easy_setopt(curl, CURLOPT_W=
RITEFUNCTION, (curl_write_callback)write_func);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res !=3D CURLE_OK) {<br>
-diff --git a/src/library/fetch.h b/src/library/fetch.h<br>
-index 70c3779..4cce5d1 100644<br>
---- a/src/library/fetch.h<br>
-+++ b/src/library/fetch.h<br>
-@@ -28,7 +28,8 @@ typedef enum {<br>
-=C2=A0 * @param verbose Whether to be verbose<br>
-=C2=A0 * @return A FetchStatus, indicating the operation taken<br>
-=C2=A0 */<br>
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose);=
<br>
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int this_percent, unsigned int next_percent);<br>
- <br>
- /**<br>
-=C2=A0 * Attempt to extract the given gzipped file<br>
-diff --git a/src/update.c b/src/update.c<br>
-index 30fbe96..eaeeefd 100644<br>
---- a/src/update.c<br>
-+++ b/src/update.c<br>
-@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char *upda=
te_fname, bool ok)<br>
- }<br>
- <br>
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool db_exist, bool verbose)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool db_exist, bool verbose,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int this_percent, unsigned int next_percen=
t)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char nvd_uri[] =3D URI_PREFIX;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(cve_string) *uri_meta =3D NULL;=
<br>
-@@ -330,14 +331,14 @@ refetch:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD META file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose, this_percent, this_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st =3D=3D FETCH_STATUS_FAIL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_meta-&gt;str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD XML file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose, this_percent, next_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (st) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FETCH_STATUS_FAIL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_data_gz-&gt;str);<br>
-@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D YEAR_START; i &lt;=3D yea=
r+1; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int y =3D i =
&gt; year ? -1 : i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int star=
t_percent =3D ((i+0 - YEAR_START) * 100) / (year+2 - YEAR_START);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int end_=
percent =3D ((i+1 - YEAR_START) * 100) / (year+2 - YEAR_START);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D do_fetch_u=
pdate(y, db_dir, cve_db, db_exist, !quiet);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!quiet)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;completed: %u%%\r&quot;, start_percent);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D do_fetch_u=
pdate(y, db_dir, cve_db, db_exist, !quiet,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_percent, e=
nd_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (rc) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!quiet)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,&quot;completed: %u%%=
\r&quot;, end_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case ENOMEM:=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto oom;<br>
--- <br>
-2.9.3<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare=
-computed-vs-expected-sha256-digit-str.patch b/meta/recipes-devtools/cve-ch=
eck-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.pa=
tch<br>
deleted file mode 100644<br>
index 458c0cc84e5..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-comput=
ed-vs-expected-sha256-digit-str.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001<br>
-From: Sergey Popovich &lt;<a href=3D"mailto:popovich_sergei@mail.ua" targe=
t=3D"_blank">popovich_sergei@mail.ua</a>&gt;<br>
-Date: Fri, 21 Apr 2017 07:32:23 -0700<br>
-Subject: [PATCH] update: Compare computed vs expected sha256 digit string<=
br>
- ignoring case<br>
-<br>
-We produce sha256 digest string using %x snprintf()<br>
-qualifier for each byte of digest which uses alphabetic<br>
-characters from &quot;a&quot; to &quot;f&quot; in lower case to represent<=
br>
-integer values from 10 to 15.<br>
-<br>
-Previously all of the NVD META files supply sha256<br>
-digest string for corresponding XML file in lower case.<br>
-<br>
-However due to some reason this changed recently to<br>
-provide digest digits in upper case causing fetched<br>
-data consistency checks to fail. This prevents database<br>
-from being updated periodically.<br>
-<br>
-While commit c4f6e94 (update: Do not treat sha256 failure<br>
-as fatal if requested) adds useful option to skip<br>
-digest validation at all and thus provides workaround for<br>
-this situation, it might be unacceptable for some<br>
-deployments where we need to ensure that downloaded<br>
-data is consistent before start parsing it and update<br>
-SQLite database.<br>
-<br>
-Use strcasecmp() to compare two digest strings case<br>
-insensitively and addressing this case.<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Sergey Popovich &lt;<a href=3D"mailto:popovich_sergei@mail.=
ua" target=3D"_blank">popovich_sergei@mail.ua</a>&gt;<br>
----<br>
- src/update.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/update.c b/src/update.c<br>
-index 8588f38..3cc6b67 100644<br>
---- a/src/update.c<br>
-+++ b/src/update.c<br>
-@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const cha=
r *data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(&am=
p;csum_data[idx], len, &quot;%02hhx&quot;, digest[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D streq(csum_meta, csum_data);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D !strcasecmp(csum_meta, csum_data);<br=
>
- <br>
- err_unmap:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(buffer, length);<br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_tr=
im-before-using-it.patch b/meta/recipes-devtools/cve-check-tool/files/check=
-for-malloc_trim-before-using-it.patch<br>
deleted file mode 100644<br>
index 0774ad946a4..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-befo=
re-using-it.patch<br>
+++ /dev/null<br>
@@ -1,51 +0,0 @@<br>
-From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Mon, 22 Aug 2016 22:54:24 -0700<br>
-Subject: [PATCH] Check for malloc_trim before using it<br>
-<br>
-malloc_trim is gnu specific and not all libc<br>
-implement it, threfore write a configure check<br>
-to poke for it first and use the define to<br>
-guard its use.<br>
-<br>
-Helps in compiling on musl based systems<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/ikeydoherty/cve-=
check-tool/pull/48" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/ikeydoherty/cve-check-tool/pull/48</a>]<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 ++<br>
- src/core.c=C2=A0 =C2=A0| 4 ++--<br>
- 2 files changed, 4 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index d3b66ce..79c3542 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])<br>
- m4_define([openssl_required_version],[1.0.0])<br>
- # TODO: Set minimum sqlite<br>
- <br>
-+AC_CHECK_FUNCS_ONCE(malloc_trim)<br>
-+<br>
- PKG_CHECK_MODULES(CVE_CHECK_TOOL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glib-=
2.0 &gt;=3D glib_required_version,<br>
-diff --git a/src/core.c b/src/core.c<br>
-index 6263031..0d5df29 100644<br>
---- a/src/core.c<br>
-+++ b/src/core.c<br>
-@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D true;<br>
--<br>
-+#ifdef HAVE_MALLOC_TRIM<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0malloc_trim(0);<br>
--<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFreeTextReader(r);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<b=
r>
--- <br>
-2.9.3<br>
-<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>

--000000000000e9e1f6058dcee564--
