Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id DFDEB7ECCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 17:17:47 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id j6so8902622ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qh0lhYpzo/W2BnrHUDidxyeLrXIXjDkgr+CjW1pU/ds=;
	b=aqMj1yeIl947lPcCJG6Nge4MSyFDihGkDg64xdL9bwb587ZSx7hPLyK4KTBljEG3M+
	/y2nanPTAYVfBOSQYWFTgzkwzOmbR6fOhA+c+kyPXBjW/deGgauCAO3RQq0e6Iyua/1D
	Qjl4Ref3zWebLBhbfz/suuEldB+OChNFPbk2WX0YAflznQ1hX1kGNw9XpkQlyxy+Oc0x
	I6FYOvVFTsFKob9J1IVXCupOMkCsaqqC2HuCXUZ7B9+XjfRuNf9AS2vbRPPDgPE2R87/
	gDEk2a9LMV/GhnRwkp6+ns/utjhLoMgFusWodXWlX15MGFfN0haoCz77EPAz8hZT9nRC
	SKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qh0lhYpzo/W2BnrHUDidxyeLrXIXjDkgr+CjW1pU/ds=;
	b=a56KGRx4fVbVMKDofAa/rMwd/EKrCs/lr9xRVmIeHzmGHzguN9EuCGIYRfTJTAFal4
	XYp282/EzG6P2UZxAacTXoq07mXMqMiFDKBBKt0zlA9eQAnfPdEtJmgS+dtpZ+WH4oEu
	+KnEW5AaOGQz6v8Bi5Xdkckm8YMXr2THfqnDyltN8jKMpx4wvltugYtDgQVf1hVmCBG4
	VH86SZFsyQtscIPKSxw8NeO4AuaARRt9Y6TBModRwxYeheVZ650dEoK9i748TqxrTy3h
	QrRfsLAOmglC1JQJlY2T4dMFDYR79o1Ur89nHM6kR8k8iZwi2Azo43+oT4KqUxCkOuSt
	dMJQ==
X-Gm-Message-State: APjAAAU1PdSUXynPGk3W+1OtdF5gYyJ7jE0eB3ZOkkDb9LA3KT/9mJ5F
	mHl1utTcxQvB2sLuyiOJSdutysDeQzeUo1f40K9ngg==
X-Google-Smtp-Source: APXvYqzymD+ycY1bBXzkXruzOFZezJTTSLo/oQWNf+Oj9aDxNtTOv0gt4cEcs/BgGfiY0fXENgOKizSwj51KSZwWyD4=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr9889640ioc.179.1563297468886; 
	Tue, 16 Jul 2019 10:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190716124650.22236-1-ross.burton@intel.com>
	<CAMKF1spFQESmXpBiHpPN8J2X7LzdszPjT8fiwWqnq_r0Ec7Lpw@mail.gmail.com>
In-Reply-To: <CAMKF1spFQESmXpBiHpPN8J2X7LzdszPjT8fiwWqnq_r0Ec7Lpw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jul 2019 18:17:35 +0100
Message-ID: <CAJTo0La-VJ+d-04_bFzLDJ4jsACU+XMTAEDsyXdU5yY+0d_90g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 16 Jul 2019 17:17:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I clearly meant to do that but forgot to check before posting.

Ross

On Tue, 16 Jul 2019 at 17:30, Khem Raj <raj.khem@gmail.com> wrote:
>
> May be add a line about why it is being removed
>
> On Tue, Jul 16, 2019 at 5:46 AM Ross Burton <ross.burton@intel.com> wrote=
:
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  .../cve-check-tool/cve-check-tool_5.6.4.bb    |  62 -----
>>  ...x-freeing-memory-allocated-by-sqlite.patch |  50 ----
>>  ...erriding-default-CA-certificate-file.patch | 215 ------------------
>>  ...s-in-percent-when-downloading-CVE-db.patch | 135 -----------
>>  ...omputed-vs-expected-sha256-digit-str.patch |  52 -----
>>  ...heck-for-malloc_trim-before-using-it.patch |  51 -----
>>  6 files changed, 565 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_=
5.6.4.bb
>>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-=
freeing-memory-allocated-by-sqlite.patch
>>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl=
-allow-overriding-default-CA-certificate-file.patch
>>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-prin=
t-progress-in-percent-when-downloading-CVE-db.patch
>>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-upda=
te-Compare-computed-vs-expected-sha256-digit-str.patch
>>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for=
-malloc_trim-before-using-it.patch
>>
>> diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.b=
b b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
>> deleted file mode 100644
>> index 1c84fb1cf2d..00000000000
>> --- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
>> +++ /dev/null
>> @@ -1,62 +0,0 @@
>> -SUMMARY =3D "cve-check-tool"
>> -DESCRIPTION =3D "cve-check-tool is a tool for checking known (public) C=
VEs.\
>> -The tool will identify potentially vunlnerable software packages within=
 Linux distributions through version matching."
>> -HOMEPAGE =3D "https://github.com/ikeydoherty/cve-check-tool"
>> -SECTION =3D "Development/Tools"
>> -LICENSE =3D "GPL-2.0+"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De8c1458438ead3c34974bc0be3a0=
3ed6"
>> -
>> -SRC_URI =3D "https://github.com/ikeydoherty/${BPN}/releases/download/v$=
{PV}/${BP}.tar.xz \
>> -           file://check-for-malloc_trim-before-using-it.patch \
>> -           file://0001-print-progress-in-percent-when-downloading-CVE-d=
b.patch \
>> -           file://0001-curl-allow-overriding-default-CA-certificate-fil=
e.patch \
>> -           file://0001-update-Compare-computed-vs-expected-sha256-digit=
-str.patch \
>> -           file://0001-Fix-freeing-memory-allocated-by-sqlite.patch \
>> -          "
>> -
>> -SRC_URI[md5sum] =3D "c5f4247140fc9be3bf41491d31a34155"
>> -SRC_URI[sha256sum] =3D "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af3=
9168f8acf501e6a5b"
>> -
>> -UPSTREAM_CHECK_URI =3D "https://github.com/ikeydoherty/cve-check-tool/r=
eleases"
>> -
>> -DEPENDS =3D "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl c=
a-certificates"
>> -
>> -RDEPENDS_${PN} =3D "ca-certificates"
>> -
>> -inherit pkgconfig autotools
>> -
>> -EXTRA_OECONF =3D "--disable-coverage --enable-relative-plugins"
>> -CFLAGS_append =3D " -Wno-error=3Dpedantic"
>> -
>> -do_populate_cve_db() {
>> -    if [ "${BB_NO_NETWORK}" =3D "1" ] ; then
>> -        bbwarn "BB_NO_NETWORK is set; Can't update cve-check-tool datab=
ase, new CVEs won't be detected"
>> -        return
>> -    fi
>> -
>> -    # In case we don't inherit cve-check class, use default values defi=
ned in the class.
>> -    cve_dir=3D"${CVE_CHECK_DB_DIR}"
>> -    cve_file=3D"${CVE_CHECK_TMP_FILE}"
>> -
>> -    [ -z "${cve_dir}" ] && cve_dir=3D"${DL_DIR}/CVE_CHECK"
>> -    [ -z "${cve_file}" ] && cve_file=3D"${TMPDIR}/cve_check"
>> -
>> -    unused=3D"${@bb.utils.export_proxies(d)}"
>> -    bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
>> -    # --cacert works around curl-native not finding the CA bundle
>> -    if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificate=
s.crt -d "$cve_dir" ; then
>> -        printf "CVE database was updated on %s UTC\n\n" "$(LANG=3DC dat=
e --utc +'%F %T')" > "$cve_file"
>> -    else
>> -        bbwarn "Error in executing cve-check-update"
>> -        if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'=
}" -ne 0 ] ; then
>> -            bbwarn "Failed to update cve-check-tool database, CVEs won'=
t be checked"
>> -        fi
>> -    fi
>> -}
>> -
>> -addtask populate_cve_db after do_populate_sysroot
>> -do_populate_cve_db[depends] =3D "cve-check-tool-native:do_populate_sysr=
oot"
>> -do_populate_cve_db[nostamp] =3D "1"
>> -do_populate_cve_db[progress] =3D "percent"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing=
-memory-allocated-by-sqlite.patch b/meta/recipes-devtools/cve-check-tool/fi=
les/0001-Fix-freeing-memory-allocated-by-sqlite.patch
>> deleted file mode 100644
>> index 4a82cf2dded..00000000000
>> --- a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory=
-allocated-by-sqlite.patch
>> +++ /dev/null
>> @@ -1,50 +0,0 @@
>> -From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001
>> -From: Peter Marko <peter.marko@siemens.com>
>> -Date: Thu, 13 Apr 2017 23:09:52 +0200
>> -Subject: [PATCH] Fix freeing memory allocated by sqlite
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ----
>> - src/core.c | 8 ++++----
>> - 1 file changed, 4 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/src/core.c b/src/core.c
>> -index 6263031..6788f16 100644
>> ---- a/src/core.c
>> -+++ b/src/core.c
>> -@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)
>> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
>> -         if (rc !=3D SQLITE_OK) {
>> -                 fprintf(stderr, "ensure_table(): %s\n", err);
>> --                free(err);
>> -+                sqlite3_free(err);
>> -                 return false;
>> -         }
>> -
>> -@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)
>> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
>> -         if (rc !=3D SQLITE_OK) {
>> -                 fprintf(stderr, "ensure_table(): %s\n", err);
>> --                free(err);
>> -+                sqlite3_free(err);
>> -                 return false;
>> -         }
>> -
>> -@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)
>> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
>> -         if (rc !=3D SQLITE_OK) {
>> -                 fprintf(stderr, "ensure_table(): %s\n", err);
>> --                free(err);
>> -+                sqlite3_free(err);
>> -                 return false;
>> -         }
>> -         if (err) {
>> --                free(err);
>> -+                sqlite3_free(err);
>> -         }
>> -
>> -         return true;
>> ---
>> -2.1.4
>> -
>> diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-=
overriding-default-CA-certificate-file.patch b/meta/recipes-devtools/cve-ch=
eck-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
>> deleted file mode 100644
>> index 3d8ebd1bd26..00000000000
>> --- a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overrid=
ing-default-CA-certificate-file.patch
>> +++ /dev/null
>> @@ -1,215 +0,0 @@
>> -From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001
>> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> -Date: Thu, 9 Feb 2017 14:51:28 +0200
>> -Subject: [PATCH] curl: allow overriding default CA certificate file
>> -
>> -Similar to curl, --cacert can now be used in cve-check-tool and
>> -cve-check-update to override the default CA certificate file. Useful
>> -in cases where the system default is unsuitable (for example,
>> -out-dated) or broken (as in OE's current native libcurl, which embeds
>> -a path string from one build host and then uses it on another although
>> -the right path may have become something different).
>> -
>> -Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-to=
ol/pull/45]
>> -
>> -Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>> -
>> -
>> -Took Patrick Ohlys original patch from meta-security-isafw, rebased
>> -on top of other patches.
>> -
>> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ----
>> - src/library/cve-check-tool.h |  1 +
>> - src/library/fetch.c          | 10 +++++++++-
>> - src/library/fetch.h          |  3 ++-
>> - src/main.c                   |  5 ++++-
>> - src/update-main.c            |  4 +++-
>> - src/update.c                 | 12 +++++++-----
>> - src/update.h                 |  2 +-
>> - 7 files changed, 27 insertions(+), 10 deletions(-)
>> -
>> -diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.=
h
>> -index e4bb5b1..f89eade 100644
>> ---- a/src/library/cve-check-tool.h
>> -+++ b/src/library/cve-check-tool.h
>> -@@ -43,6 +43,7 @@ typedef struct CveCheckTool {
>> -     bool bugs;                          /**<Whether bug tracking is en=
abled */
>> -     GHashTable *mapping;                /**<CVE Mapping */
>> -     const char *output_file;            /**<Output file, if any */
>> -+    const char *cacert_file;            /**<Non-default SSL certificat=
e file, if any */
>> - } CveCheckTool;
>> -
>> - /**
>> -diff --git a/src/library/fetch.c b/src/library/fetch.c
>> -index 0fe6d76..8f998c3 100644
>> ---- a/src/library/fetch.c
>> -+++ b/src/library/fetch.c
>> -@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_=
t dltotal, curl_off_t dlnow
>> - }
>> -
>> - FetchStatus fetch_uri(const char *uri, const char *target, bool verbos=
e,
>> --                      unsigned int start_percent, unsigned int end_per=
cent)
>> -+                      unsigned int start_percent, unsigned int end_per=
cent,
>> -+                      const char *cacert_file)
>> - {
>> -         FetchStatus ret =3D FETCH_STATUS_FAIL;
>> -         CURLcode res;
>> -@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char *t=
arget, bool verbose,
>> -                 return ret;
>> -         }
>> -
>> -+        if (cacert_file) {
>> -+                res =3D curl_easy_setopt(curl, CURLOPT_CAINFO, cacert_=
file);
>> -+                if (res !=3D CURLE_OK) {
>> -+                        goto bail;
>> -+                }
>> -+        }
>> -+
>> -         if (stat(target, &st) =3D=3D 0) {
>> -                 res =3D curl_easy_setopt(curl, CURLOPT_TIMECONDITION, =
CURL_TIMECOND_IFMODSINCE);
>> -                 if (res !=3D CURLE_OK) {
>> -diff --git a/src/library/fetch.h b/src/library/fetch.h
>> -index 4cce5d1..836c7d7 100644
>> ---- a/src/library/fetch.h
>> -+++ b/src/library/fetch.h
>> -@@ -29,7 +29,8 @@ typedef enum {
>> -  * @return A FetchStatus, indicating the operation taken
>> -  */
>> - FetchStatus fetch_uri(const char *uri, const char *target, bool verbos=
e,
>> --                      unsigned int this_percent, unsigned int next_per=
cent);
>> -+                      unsigned int this_percent, unsigned int next_per=
cent,
>> -+                      const char *cacert_file);
>> -
>> - /**
>> -  * Attempt to extract the given gzipped file
>> -diff --git a/src/main.c b/src/main.c
>> -index 8e6f158..ae69d47 100644
>> ---- a/src/main.c
>> -+++ b/src/main.c
>> -@@ -280,6 +280,7 @@ static bool csv_mode =3D false;
>> - static char *modified_stamp =3D NULL;
>> - static gchar *mapping_file =3D NULL;
>> - static gchar *output_file =3D NULL;
>> -+static gchar *cacert_file =3D NULL;
>> -
>> - static GOptionEntry _entries[] =3D {
>> -         { "not-patched", 'n', 0, G_OPTION_ARG_NONE, &hide_patched, "Hi=
de patched/addressed CVEs", NULL },
>> -@@ -294,6 +295,7 @@ static GOptionEntry _entries[] =3D {
>> -         { "csv", 'c', 0, G_OPTION_ARG_NONE, &csv_mode, "Output CSV for=
matted data only", NULL },
>> -         { "mapping", 'M', 0, G_OPTION_ARG_STRING, &mapping_file, "Path=
 to a mapping file", NULL},
>> -         { "output-file", 'o', 0, G_OPTION_ARG_STRING, &output_file, "P=
ath to the output file (output plugin specific)", NULL},
>> -+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &cacert_file, "Path t=
o the combined SSL certificates file (system default is used if not set)", =
NULL},
>> -         { .short_name =3D 0 }
>> - };
>> -
>> -@@ -492,6 +494,7 @@ int main(int argc, char **argv)
>> -
>> -         quiet =3D csv_mode || !no_html;
>> -         self->output_file =3D output_file;
>> -+        self->cacert_file =3D cacert_file;
>> -
>> -         if (!csv_mode && self->output_file) {
>> -                 quiet =3D false;
>> -@@ -530,7 +533,7 @@ int main(int argc, char **argv)
>> -                 if (status) {
>> -                         fprintf(stderr, "Update of db forced\n");
>> -                         cve_db_unlock();
>> --                        if (!update_db(quiet, db_path->str)) {
>> -+                        if (!update_db(quiet, db_path->str, self->cace=
rt_file)) {
>> -                                 fprintf(stderr, "DB update failure\n")=
;
>> -                                 goto cleanup;
>> -                         }
>> -diff --git a/src/update-main.c b/src/update-main.c
>> -index 2379cfa..c52d9d0 100644
>> ---- a/src/update-main.c
>> -+++ b/src/update-main.c
>> -@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of t=
he License, or\n\
>> - static gchar *nvds =3D NULL;
>> - static bool _show_version =3D false;
>> - static bool _quiet =3D false;
>> -+static const char *_cacert_file =3D NULL;
>> -
>> - static GOptionEntry _entries[] =3D {
>> -         { "nvd-dir", 'd', 0, G_OPTION_ARG_STRING, &nvds, "NVD director=
y in filesystem", NULL },
>> -         { "version", 'v', 0, G_OPTION_ARG_NONE, &_show_version, "Show =
version", NULL },
>> -         { "quiet", 'q', 0, G_OPTION_ARG_NONE, &_quiet, "Run silently",=
 NULL },
>> -+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &_cacert_file, "Path =
to the combined SSL certificates file (system default is used if not set)",=
 NULL},
>> -         { .short_name =3D 0 }
>> - };
>> -
>> -@@ -88,7 +90,7 @@ int main(int argc, char **argv)
>> -                 goto end;
>> -         }
>> -
>> --        if (update_db(_quiet, db_path->str)) {
>> -+        if (update_db(_quiet, db_path->str, _cacert_file)) {
>> -                 ret =3D EXIT_SUCCESS;
>> -         } else {
>> -                 fprintf(stderr, "Failed to update database\n");
>> -diff --git a/src/update.c b/src/update.c
>> -index 070560a..8cb4a39 100644
>> ---- a/src/update.c
>> -+++ b/src/update.c
>> -@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char *u=
pdate_fname, bool ok)
>> -
>> - static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db=
,
>> -                            bool db_exist, bool verbose,
>> --                           unsigned int this_percent, unsigned int nex=
t_percent)
>> -+                           unsigned int this_percent, unsigned int nex=
t_percent,
>> -+                           const char *cacert_file)
>> - {
>> -         const char nvd_uri[] =3D URI_PREFIX;
>> -         autofree(cve_string) *uri_meta =3D NULL;
>> -@@ -331,14 +332,14 @@ refetch:
>> -         }
>> -
>> -         /* Fetch NVD META file */
>> --        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, thi=
s_percent, this_percent);
>> -+        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, thi=
s_percent, this_percent, cacert_file);
>> -         if (st =3D=3D FETCH_STATUS_FAIL) {
>> -                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str)=
;
>> -                 return -1;
>> -         }
>> -
>> -         /* Fetch NVD XML file */
>> --        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbos=
e, this_percent, next_percent);
>> -+        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbos=
e, this_percent, next_percent, cacert_file);
>> -         switch (st) {
>> -         case FETCH_STATUS_FAIL:
>> -                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->s=
tr);
>> -@@ -391,7 +392,7 @@ refetch:
>> -         return 0;
>> - }
>> -
>> --bool update_db(bool quiet, const char *db_file)
>> -+bool update_db(bool quiet, const char *db_file, const char *cacert_fil=
e)
>> - {
>> -         autofree(char) *db_dir =3D NULL;
>> -         autofree(CveDB) *cve_db =3D NULL;
>> -@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)
>> -                 if (!quiet)
>> -                         fprintf(stderr, "completed: %u%%\r", start_per=
cent);
>> -                 rc =3D do_fetch_update(y, db_dir, cve_db, db_exist, !q=
uiet,
>> --                                     start_percent, end_percent);
>> -+                                     start_percent, end_percent,
>> -+                                     cacert_file);
>> -                 switch (rc) {
>> -                 case 0:
>> -                         if (!quiet)
>> -diff --git a/src/update.h b/src/update.h
>> -index b8e9911..ceea0c3 100644
>> ---- a/src/update.h
>> -+++ b/src/update.h
>> -@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);
>> -
>> - int update_required(const char *db_file);
>> -
>> --bool update_db(bool quiet, const char *db_file);
>> -+bool update_db(bool quiet, const char *db_file, const char *cacert_fil=
e);
>> -
>> -
>> - /*
>> ---
>> -2.1.4
>> -
>> diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-print-progr=
ess-in-percent-when-downloading-CVE-db.patch b/meta/recipes-devtools/cve-ch=
eck-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
>> deleted file mode 100644
>> index 8ea6f686e3f..00000000000
>> --- a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-=
percent-when-downloading-CVE-db.patch
>> +++ /dev/null
>> @@ -1,135 +0,0 @@
>> -From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001
>> -From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
>> -Date: Mon, 26 Sep 2016 12:12:41 +0100
>> -Subject: [PATCH] print progress in percent when downloading CVE db
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>> ----
>> - src/library/fetch.c | 28 +++++++++++++++++++++++++++-
>> - src/library/fetch.h |  3 ++-
>> - src/update.c        | 16 ++++++++++++----
>> - 3 files changed, 41 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/src/library/fetch.c b/src/library/fetch.c
>> -index 06d4b30..0fe6d76 100644
>> ---- a/src/library/fetch.c
>> -+++ b/src/library/fetch.c
>> -@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size, si=
ze_t nmemb, struct fetch_t *f
>> -         return fwrite(ptr, size, nmemb, f->f);
>> - }
>> -
>> --FetchStatus fetch_uri(const char *uri, const char *target, bool verbos=
e)
>> -+struct percent_t {
>> -+        unsigned int start;
>> -+        unsigned int end;
>> -+};
>> -+
>> -+static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_o=
ff_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
>> -+{
>> -+        (void) ultotal;
>> -+        (void) ulnow;
>> -+
>> -+        struct percent_t *percent =3D (struct percent_t *) ptr;
>> -+
>> -+        if (dltotal && percent && percent->end >=3D percent->start) {
>> -+                unsigned int diff =3D percent->end - percent->start;
>> -+                if (diff) {
>> -+                        fprintf(stderr,"completed: %"CURL_FORMAT_CURL_=
OFF_T"%%\r", percent->start + (diff * dlnow / dltotal));
>> -+                }
>> -+        }
>> -+
>> -+        return 0;
>> -+}
>> -+
>> -+FetchStatus fetch_uri(const char *uri, const char *target, bool verbos=
e,
>> -+                      unsigned int start_percent, unsigned int end_per=
cent)
>> - {
>> -         FetchStatus ret =3D FETCH_STATUS_FAIL;
>> -         CURLcode res;
>> -         struct stat st;
>> -         CURL *curl =3D NULL;
>> -         struct fetch_t *f =3D NULL;
>> -+        struct percent_t percent =3D { .start =3D start_percent, .end =
=3D end_percent };
>> -
>> -         curl =3D curl_easy_init();
>> -         if (!curl) {
>> -@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char *ta=
rget, bool verbose)
>> -         }
>> -         if (verbose) {
>> -                 (void)curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
>> -+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFODATA, &pe=
rcent);
>> -+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION,=
 progress_callback_new);
>> -         }
>> -         res =3D curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, (curl_wr=
ite_callback)write_func);
>> -         if (res !=3D CURLE_OK) {
>> -diff --git a/src/library/fetch.h b/src/library/fetch.h
>> -index 70c3779..4cce5d1 100644
>> ---- a/src/library/fetch.h
>> -+++ b/src/library/fetch.h
>> -@@ -28,7 +28,8 @@ typedef enum {
>> -  * @param verbose Whether to be verbose
>> -  * @return A FetchStatus, indicating the operation taken
>> -  */
>> --FetchStatus fetch_uri(const char *uri, const char *target, bool verbos=
e);
>> -+FetchStatus fetch_uri(const char *uri, const char *target, bool verbos=
e,
>> -+                      unsigned int this_percent, unsigned int next_per=
cent);
>> -
>> - /**
>> -  * Attempt to extract the given gzipped file
>> -diff --git a/src/update.c b/src/update.c
>> -index 30fbe96..eaeeefd 100644
>> ---- a/src/update.c
>> -+++ b/src/update.c
>> -@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char *u=
pdate_fname, bool ok)
>> - }
>> -
>> - static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db=
,
>> --                           bool db_exist, bool verbose)
>> -+                           bool db_exist, bool verbose,
>> -+                           unsigned int this_percent, unsigned int nex=
t_percent)
>> - {
>> -         const char nvd_uri[] =3D URI_PREFIX;
>> -         autofree(cve_string) *uri_meta =3D NULL;
>> -@@ -330,14 +331,14 @@ refetch:
>> -         }
>> -
>> -         /* Fetch NVD META file */
>> --        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose);
>> -+        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose, thi=
s_percent, this_percent);
>> -         if (st =3D=3D FETCH_STATUS_FAIL) {
>> -                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str)=
;
>> -                 return -1;
>> -         }
>> -
>> -         /* Fetch NVD XML file */
>> --        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbos=
e);
>> -+        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbos=
e, this_percent, next_percent);
>> -         switch (st) {
>> -         case FETCH_STATUS_FAIL:
>> -                 fprintf(stderr, "Failed to fetch %s\n", uri_data_gz->s=
tr);
>> -@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)
>> -         for (int i =3D YEAR_START; i <=3D year+1; i++) {
>> -                 int y =3D i > year ? -1 : i;
>> -                 int rc;
>> -+                unsigned int start_percent =3D ((i+0 - YEAR_START) * 1=
00) / (year+2 - YEAR_START);
>> -+                unsigned int end_percent =3D ((i+1 - YEAR_START) * 100=
) / (year+2 - YEAR_START);
>> -
>> --                rc =3D do_fetch_update(y, db_dir, cve_db, db_exist, !q=
uiet);
>> -+                if (!quiet)
>> -+                        fprintf(stderr, "completed: %u%%\r", start_per=
cent);
>> -+                rc =3D do_fetch_update(y, db_dir, cve_db, db_exist, !q=
uiet,
>> -+                                     start_percent, end_percent);
>> -                 switch (rc) {
>> -                 case 0:
>> -+                        if (!quiet)
>> -+                                fprintf(stderr,"completed: %u%%\r", en=
d_percent);
>> -                         continue;
>> -                 case ENOMEM:
>> -                         goto oom;
>> ---
>> -2.9.3
>> -
>> diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-update-Comp=
are-computed-vs-expected-sha256-digit-str.patch b/meta/recipes-devtools/cve=
-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str=
.patch
>> deleted file mode 100644
>> index 458c0cc84e5..00000000000
>> --- a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-com=
puted-vs-expected-sha256-digit-str.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001
>> -From: Sergey Popovich <popovich_sergei@mail.ua>
>> -Date: Fri, 21 Apr 2017 07:32:23 -0700
>> -Subject: [PATCH] update: Compare computed vs expected sha256 digit stri=
ng
>> - ignoring case
>> -
>> -We produce sha256 digest string using %x snprintf()
>> -qualifier for each byte of digest which uses alphabetic
>> -characters from "a" to "f" in lower case to represent
>> -integer values from 10 to 15.
>> -
>> -Previously all of the NVD META files supply sha256
>> -digest string for corresponding XML file in lower case.
>> -
>> -However due to some reason this changed recently to
>> -provide digest digits in upper case causing fetched
>> -data consistency checks to fail. This prevents database
>> -from being updated periodically.
>> -
>> -While commit c4f6e94 (update: Do not treat sha256 failure
>> -as fatal if requested) adds useful option to skip
>> -digest validation at all and thus provides workaround for
>> -this situation, it might be unacceptable for some
>> -deployments where we need to ensure that downloaded
>> -data is consistent before start parsing it and update
>> -SQLite database.
>> -
>> -Use strcasecmp() to compare two digest strings case
>> -insensitively and addressing this case.
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Sergey Popovich <popovich_sergei@mail.ua>
>> ----
>> - src/update.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/src/update.c b/src/update.c
>> -index 8588f38..3cc6b67 100644
>> ---- a/src/update.c
>> -+++ b/src/update.c
>> -@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const =
char *data)
>> -                 snprintf(&csum_data[idx], len, "%02hhx", digest[i]);
>> -         }
>> -
>> --        ret =3D streq(csum_meta, csum_data);
>> -+        ret =3D !strcasecmp(csum_meta, csum_data);
>> -
>> - err_unmap:
>> -         munmap(buffer, length);
>> ---
>> -2.11.0
>> -
>> diff --git a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc=
_trim-before-using-it.patch b/meta/recipes-devtools/cve-check-tool/files/ch=
eck-for-malloc_trim-before-using-it.patch
>> deleted file mode 100644
>> index 0774ad946a4..00000000000
>> --- a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-b=
efore-using-it.patch
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 22 Aug 2016 22:54:24 -0700
>> -Subject: [PATCH] Check for malloc_trim before using it
>> -
>> -malloc_trim is gnu specific and not all libc
>> -implement it, threfore write a configure check
>> -to poke for it first and use the define to
>> -guard its use.
>> -
>> -Helps in compiling on musl based systems
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> -Upstream-Status: Submitted [https://github.com/ikeydoherty/cve-check-to=
ol/pull/48]
>> - configure.ac | 2 ++
>> - src/core.c   | 4 ++--
>> - 2 files changed, 4 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index d3b66ce..79c3542 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])
>> - m4_define([openssl_required_version],[1.0.0])
>> - # TODO: Set minimum sqlite
>> -
>> -+AC_CHECK_FUNCS_ONCE(malloc_trim)
>> -+
>> - PKG_CHECK_MODULES(CVE_CHECK_TOOL,
>> -                  [
>> -                   glib-2.0 >=3D glib_required_version,
>> -diff --git a/src/core.c b/src/core.c
>> -index 6263031..0d5df29 100644
>> ---- a/src/core.c
>> -+++ b/src/core.c
>> -@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)
>> -         }
>> -
>> -         b =3D true;
>> --
>> -+#ifdef HAVE_MALLOC_TRIM
>> -         malloc_trim(0);
>> --
>> -+#endif
>> -         xmlFreeTextReader(r);
>> -         if (fd) {
>> -                 close(fd);
>> ---
>> -2.9.3
>> -
>> --
>> 2.20.1
>>

