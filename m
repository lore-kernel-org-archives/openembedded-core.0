Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1249.1793949577074943083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dDBdVPDh;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23805; q=dns/txt;
  s=iport01; t=1793949577; x=1795159177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZHncDlpn5YDJVT1ACW0zcUxbiP7QF4wvUonVL3X0PMQ=;
  b=dDBdVPDh+LtiHSIqgEwRn4mOqhOFyDTq+SC/O3s8cqwbE/qlIfLoAMpk
   FQdEO3Es0ogsUGjOKxlJSFVa5UOVIXLzjJ+DqSx3UlS5EBs4kq+F9gXrw
   CE4dmbcgkKpQhj+ghs5R5CqeDUwhDm2AYtxTyNGeeGOHjc39NdMB/UKtp
   AVCxfV3WJhr5ZpxV+i/lG/BdLw/HoAu+Qsjs8QmtZcR0uZ0KrTEmqRNKJ
   W0B/T1DZtTqAYrWz2xt+rm+rs1AIFbM/k8/4VltR6Y9MQAmfIkzpBNN7+
   R4L2aaIiWc6L3uWFkZdJP1DbJHT2eX1XO4eBr7uFmiu6ADWQrSWFryyxX
   w==;
X-CSE-ConnectionGUID: xzVppjo2QGqNkO/uXQhg8w==
X-CSE-MsgGUID: eXKjMi2SRaOvpsVbsFALKQ==
X-IPAS-Result: =?us-ascii?q?A0DWAgDtfu1q/4r/Ja1aglmCV3VgQ0mWSwOBE5A5jFUUg?=
 =?us-ascii?q?WoPAQEBD0oHBAEBgXEBIIJzAo4dAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4YVBjQNkBIBAgEDGg0LARgBLRAcAwECFwEBFisjCBAJg?=
 =?us-ascii?q?wIBgnQDEQa7OBs3gXkzgQGDKQE/AgJAAVDbMwELFAGBOIVAiCNdGAGEfScbG?=
 =?us-ascii?q?4FygRWCc3aBBYFcAQEBAYEhBB8BAWACBoV2BIINFYEMgVoeZQmFNIY+GgKBU?=
 =?us-ascii?q?VqGH0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHX?=
 =?us-ascii?q?YErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmP?=
 =?us-ascii?q?xUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YDUgRLDcVGQQ+bgeSPYJeLQYBM?=
 =?us-ascii?q?ScIAQIHEQcCCgEHDBYBARcYXRQUGTAFAi0MCwEFEAgRjxmDUQGQH4Ihiy+VY?=
 =?us-ascii?q?goog3iKI4IBjg2HLRozhASBV5JCg1OPAQuYfYJZizGVNzIYAQEBFjeEaYFqA?=
 =?us-ascii?q?TmBWXAVO4JnCRY0GQ+MZ4FEAwsLgXiBaIZAxgUmMgIJMgEBBwIHDgMLgWiQA?=
 =?us-ascii?q?AIkAoFWAQE?=
IronPort-Data: A9a23:smq1dahQ6jKY9rdkpcokPokeX161MREKZh0ujC45NGQN5FlHY01je
 htvDWiHOP/ZZWHze912Oo++8ElXsMSDx4BiTwFkpC4yF3ljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUI6NhvGWNJr
 8U3MRYOSVeet9u2z+KkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4DXHZ8Ixx/Hz
 o7A12nJIRM/NYak8zOi7Gq3uOXUswrfe7tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:4pOeFq+dUOQ9+2VbDXFuk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Aifi75WketI+IzJwwMKXTMcUu2knXOW3P8m/IIUj?=
 =?us-ascii?q?iMElwbr6yDkKgwaNrw9U7zg=3D=3D?=
X-Talos-MUID: 9a23:eGHtLgkKKEdqFjH8Ml6SdnpvBORqxqX0M3oEtoseoPeOLgJZHxSk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545025117"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id A9E28180001CD;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 0A2E7CBEF8A; Thu,  5 Nov 2026 23:19:35 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 7/9] curl: fix CVE-2026-94266
Date: Thu,  5 Nov 2026 23:19:30 -0800
Message-Id: <20261106071932.490299-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249607
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix referenced in [4], using [1],
and includes the invalid-URL correction in [2].

Remove credentials from CURLINFO_EFFECTIVE_URL, including credentials
loaded from netrc. Own the sanitized result in the easy handle and
release it on transfer reset and cleanup. Return the actual URL error
and a NULL result if parsing fails, rather than exposing an unfiltered
URL or reporting every failure as out of memory.

Retain tests 1876 and 1990. Select lib1990 explicitly for the older
runner and register both tests in curl 8.19.0's grouped lists.

Also apply Git's compatibility change [3] to the Wrynose Git 2.53.0
recipe. Git otherwise interprets stripped credentials as a redirect
and can discard authentication state. Keep this companion change with
the curl API change so the known Git regression is not introduced.

[1] https://github.com/curl/curl/commit/7a6bd027d0de2b6857472d35da090ef60cc29f19
[2] https://github.com/curl/curl/commit/589c35f0cb47266394367659648bf3efc03e3790
[3] https://github.com/git/git/commit/76524c2604bceee48481909e7824494498c39a34
[4] https://curl.se/docs/CVE-2026-94266.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 ...l-stripping-creds-from-effective-url.patch | 140 +++++++++++
 meta/recipes-devtools/git/git_2.53.0.bb       |   1 +
 .../curl/curl/CVE-2026-94266_p1.patch         | 225 +++++++++++++++++
 .../curl/curl/CVE-2026-94266_p2.patch         | 235 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 5 files changed, 603 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/0001-http-handle-curl-stripping-creds-from-effective-url.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266_p2.patch

diff --git a/meta/recipes-devtools/git/git/0001-http-handle-curl-stripping-creds-from-effective-url.patch b/meta/recipes-devtools/git/git/0001-http-handle-curl-stripping-creds-from-effective-url.patch
new file mode 100644
index 0000000000..597ef1c684
--- /dev/null
+++ b/meta/recipes-devtools/git/git/0001-http-handle-curl-stripping-creds-from-effective-url.patch
@@ -0,0 +1,140 @@
+From 76524c2604bceee48481909e7824494498c39a34 Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Mon, 28 Sep 2026 00:01:49 -0400
+Subject: [PATCH] http: handle curl stripping creds from effective url
+
+When we detect that curl performed a redirect of a URL we requested, we
+update our base URL to match the new location and flush the http_auth
+credentials. This goes back to c93c92f309 (http: update base URLs when
+we see redirects, 2013-09-28).
+
+We detect the redirect by comparing the requested URL to the response
+from CURLINFO_EFFECTIVE_URL, using a simple string comparison. This has
+worked fine for years, but a change in the upcoming curl 8.23.0 adds a
+complication. If our URL directly contains credentials (like
+"https://user:pass@example.com/foo.git"), then as of 7a6bd027d0
+(getinfo: make sure CURLINFO_EFFECTIVE_URL does not contain creds,
+2026-09-21), curl will strip the credentials from what it returns (so
+just "https://example.com/foo.git" in this case).
+
+This breaks our direct string comparison, and we believe that we've been
+redirected. We flush our http_auth credentials, and now subsequent
+requests will use the reduced URL, causing us to re-request credentials
+from the user. Notably this causes t5550.15 (among others) to complain;
+it tries a clone with credentials in the URL, and fails if the user is
+prompted at all.
+
+We can handle this new behavior by doing a more careful comparison: if
+the direct string comparison fails, we'll strip out the credentials
+ourselves and compare. This is a little extra work, but in practice it
+should only happen once per process.
+
+I've used curl's curl_url() interface to do the stripping here, mostly
+because its behavior should match the stripping it does internally. And
+also, though we have code to parse a URL, we don't have any to
+reconstruct it, making a single string comparison hard.
+
+One alternative would be to parse with url_parse() or similar, and
+compare the individual fields (skipping username/password). I think that
+would probably also work in practice, but it seemed to me that the
+simplest change would be sticking with string comparisons.
+
+The curl_url() interface appeared in 7.62.0. We document that 7.61.0 is
+still supported, so I've made it conditional here. Only new versions
+strip the result from CURLINFO_EFFECTIVE_URL, so it's OK for very old
+versions to skip the extra comparison. Likewise if we encounter any
+errors, we just quietly skip the comparison. That's fine if you don't
+have creds in your URLs, and if you do, you'll get end up in the
+existing error path (a redirect warning, and eventually an auth
+failure).
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/76524c2604bceee48481909e7824494498c39a34]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git-curl-compat.h |  7 +++++++
+ http.c            | 41 ++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 47 insertions(+), 1 deletion(-)
+
+diff --git a/git-curl-compat.h b/git-curl-compat.h
+index 659e5a3..e390e23 100644
+--- a/git-curl-compat.h
++++ b/git-curl-compat.h
+@@ -28,6 +28,13 @@
+  * introduced, oldest first, in the official version of cURL library.
+  */
+ 
++/**
++ * curl_url() interface added in 7.62.0 (October 2018)
++ */
++#if LIBCURL_VERSION_NUM >= 0x073e00
++#define GIT_CURL_HAVE_CURL_URL
++#endif
++
+ /**
+  * Versions before curl 7.66.0 (September 2019) required manually setting the
+  * transfer-encoding for a streaming POST; after that this is handled
+diff --git a/http.c b/http.c
+index 7815f14..6dd842a 100644
+--- a/http.c
++++ b/http.c
+@@ -2201,6 +2201,45 @@ static int http_request(const char *url,
+ 	return ret;
+ }
+ 
++#ifndef GIT_CURL_HAVE_CURL_URL
++#define strip_url_credential(in) NULL
++#else
++static char *strip_url_credential(const char *in)
++{
++	char *ret = NULL;
++	CURLU *url;
++
++	url = curl_url();
++	if (!url)
++		goto out;
++
++	if (curl_url_set(url, CURLUPART_URL, in, 0))
++		goto out;
++
++	curl_url_set(url, CURLUPART_USER, NULL, 0);
++	curl_url_set(url, CURLUPART_PASSWORD, NULL, 0);
++	curl_url_get(url, CURLUPART_URL, &ret, 0);
++
++out:
++	curl_url_cleanup(url);
++	return ret;
++}
++#endif
++
++static int match_effective_url(const char *asked, const char *got)
++{
++	char *stripped;
++	int ret;
++
++	if (!strcmp(asked, got))
++		return 1;
++
++	stripped = strip_url_credential(asked);
++	ret = stripped && !strcmp(stripped, got);
++	curl_free(stripped);
++	return ret;
++}
++
+ /*
+  * Update the "base" url to a more appropriate value, as deduced by
+  * redirects seen when requesting a URL starting with "url".
+@@ -2233,7 +2272,7 @@ static int update_url_from_redirect(struct strbuf *base,
+ 	const char *tail;
+ 	size_t new_len;
+ 
+-	if (!strcmp(asked, got->buf))
++	if (match_effective_url(asked, got->buf))
+ 		return 0;
+ 
+ 	if (!skip_prefix(asked, base->buf, &tail))
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index 5244891113..202799e05c 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -10,6 +10,7 @@ PROVIDES:append:class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
+           file://0001-http-handle-curl-stripping-creds-from-effective-url.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
diff --git a/meta/recipes-support/curl/curl/CVE-2026-94266_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-94266_p1.patch
new file mode 100644
index 0000000000..8b27e2859e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-94266_p1.patch
@@ -0,0 +1,225 @@
+From 7a6bd027d0de2b6857472d35da090ef60cc29f19 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 21 Sep 2026 11:13:13 +0200
+Subject: [PATCH] getinfo: make sure CURLINFO_EFFECTIVE_URL does not contain
+ creds
+
+Reported-by: Joshua Rogers
+
+Verified in test 1876
+
+Closes #23016
+
+CVE: CVE-2026-94266
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7a6bd027d0de2b6857472d35da090ef60cc29f19]
+
+Backport Changes:
+- Use Curl_safefree() in initialization, transfer reset and cleanup;
+  curl 8.19.0 does not have the newer curlx_safefree() helper.
+- Register test1876 in the older grouped TESTCASES list instead of
+  upstream's one-entry-per-line list.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/getinfo.c          | 47 +++++++++++++++++++++++++----
+ lib/transfer.c         |  1 +
+ lib/url.c              |  1 +
+ lib/urldata.h          |  1 +
+ tests/data/Makefile.am |  2 +-
+ tests/data/test1876    | 67 ++++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 113 insertions(+), 6 deletions(-)
+ create mode 100644 tests/data/test1876
+
+diff --git a/lib/getinfo.c b/lib/getinfo.c
+index dedafd382e..920f1f3a0c 100644
+--- a/lib/getinfo.c
++++ b/lib/getinfo.c
+@@ -72,6 +72,7 @@ void Curl_initinfo(struct Curl_easy *data)
+ 
+   curlx_free(info->wouldredirect);
+   info->wouldredirect = NULL;
++  Curl_safefree(info->effective_url);
+ 
+   memset(&info->primary, 0, sizeof(info->primary));
+   info->retry_after = 0;
+@@ -84,15 +85,51 @@ void Curl_initinfo(struct Curl_easy *data)
+ #endif
+ }
+ 
++static CURLcode effective_url(struct Curl_easy *data,
++                              const char **param_charp)
++{
++  const char *s = Curl_bufref_ptr(&data->state.url);
++  *param_charp = s ? s : "";
++  if(s) {
++    char *url = NULL;
++    /* Make a copy of the URL without credentials */
++    CURLU *u = curl_url();
++    CURLUcode uc;
++    if(!u)
++      return CURLE_OUT_OF_MEMORY;
++
++    uc = curl_url_set(u, CURLUPART_URL, s,
++                      CURLU_NON_SUPPORT_SCHEME |
++                      (data->set.path_as_is ? CURLU_PATH_AS_IS : 0));
++    if(!uc)
++      uc = curl_url_set(u, CURLUPART_USER, NULL, 0);
++    if(!uc)
++      uc = curl_url_set(u, CURLUPART_PASSWORD, NULL, 0);
++    if(!uc)
++      uc = curl_url_get(u, CURLUPART_URL, &url, CURLU_GET_EMPTY);
++
++    curl_url_cleanup(u);
++
++    if(uc || !url)
++      return CURLE_OUT_OF_MEMORY;
++    if(strcmp(url, s)) {
++      /* they are different */
++      curlx_free(data->info.effective_url);
++      data->info.effective_url = url;
++      *param_charp = url;
++    }
++    else
++      curl_free(url);
++  }
++  return CURLE_OK;
++}
++
+ static CURLcode getinfo_char(struct Curl_easy *data, CURLINFO info,
+                              const char **param_charp)
+ {
+   switch(info) {
+-  case CURLINFO_EFFECTIVE_URL: {
+-    const char *s = Curl_bufref_ptr(&data->state.url);
+-    *param_charp = s ? s : "";
+-  }
+-    break;
++  case CURLINFO_EFFECTIVE_URL:
++    return effective_url(data, param_charp);
+   case CURLINFO_EFFECTIVE_METHOD: {
+     const char *m = data->set.str[STRING_CUSTOMREQUEST];
+     if(!m) {
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 9b55913265..fc7a5177d1 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -534,6 +534,7 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+   data->state.authhost.want = data->set.httpauth;
+   data->state.authproxy.want = data->set.proxyauth;
+   Curl_safefree(data->info.wouldredirect);
++  Curl_safefree(data->info.effective_url);
+   Curl_data_priority_clear_state(data);
+   if(data->set.http_auto_referer)
+     Curl_bufref_free(&data->state.referer);
+diff --git a/lib/url.c b/lib/url.c
+index 4a01bafae1..ba3cb7f0b6 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -284,6 +284,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_safefree(data->state.most_recent_ftp_entrypath);
+   Curl_safefree(data->info.contenttype);
+   Curl_safefree(data->info.wouldredirect);
++  Curl_safefree(data->info.effective_url);
+ 
+   data_priority_cleanup(data);
+ 
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 0bc9ade696..8b18ce590a 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -756,6 +756,7 @@ struct PureInfo {
+   uint32_t httpauthpicked;  /* selected host auth type */
+   char *contenttype; /* the content type of the object */
+   char *wouldredirect; /* URL this would have been redirected to if asked to */
++  char *effective_url; /* when needed */
+   curl_off_t retry_after; /* info from Retry-After: header */
+   uint32_t header_size;  /* size of read header(s) in bytes */
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 08ece8bc1c..d6aaa71f5d 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -232,7 +232,7 @@ test1700 test1701 test1702 test1703 test1704 test1705 test1706 test1707 \
+ test1708 test1709 test1710 test1711 test1712 \
+ test1718 \
+ \
+-test1800 test1801 test1802 test1847 test1848 test1849 test1850 test1862 \
++test1800 test1801 test1802 test1847 test1848 test1849 test1850 test1862 test1876 \
+ \
+ test1900 test1901 test1902 test1903 test1904 test1905 test1906 test1907 \
+ test1908 test1909 test1910 test1911 test1912 test1913 test1914 test1915 \
+diff --git a/tests/data/test1876 b/tests/data/test1876
+new file mode 100644
+index 0000000000..4fc3b9fd02
+--- /dev/null
++++ b/tests/data/test1876
+@@ -0,0 +1,67 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++netrc
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redir
++Content-Length: 0
++Content-Type: text/html
++Location: %TESTNUMBER0002
++
++</data>
++
++<data2 crlf="headers">
++HTTP/1.1 200 OK
++Content-Length: 0
++Content-Type: text/html
++
++</data2>
++
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++verify no credentials present in effective URL after redirect
++</name>
++<file name="%LOGDIR/netrc">
++machine %HOSTIP
++login netrcuser
++password netrcSECRET123
++</file>
++
++<command option="no-include">
++http://%HOSTIP:%HTTPPORT/%TESTNUMBER --netrc-optional --netrc-file %LOGDIR/netrc -L -w 'EFFECTIVE_URL=%{url_effective}\n'
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic %b64[netrcuser:netrcSECRET123]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++GET /%TESTNUMBER0002 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic %b64[netrcuser:netrcSECRET123]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<stdout>
++EFFECTIVE_URL=http://%HOSTIP:%HTTPPORT/%TESTNUMBER0002
++</stdout>
++</verify>
++</testcase>
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-94266_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-94266_p2.patch
new file mode 100644
index 0000000000..54d10dbb0f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-94266_p2.patch
@@ -0,0 +1,235 @@
+From 589c35f0cb47266394367659648bf3efc03e3790 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?M=C3=A1t=C3=A9=20Szab=C3=B3?= <mszabo@slack-corp.com>
+Date: Fri, 16 Oct 2026 22:23:57 +0200
+Subject: [PATCH] getinfo: clarify invalid URL handling for
+ CURLINFO_EFFECTIVE_URL
+
+Since 7a6bd02 `CURLINFO_EFFECTIVE_URL` returns `CURLE_OUT_OF_MEMORY` if
+the effective URL couldn't be parsed, which surprised some code that
+expected it to be mostly always present in normal operation (we interact
+with `libcurl` over HHVM's wrapper, which, akin to PHP, wraps[1]
+easy_getinfo and returns a dict with optional entries, so it's been easy
+for things to assume that `url` would always be set).
+
+Clarify the new behaviour in docs and have `CURLINFO_EFFECTIVE_URL`
+return the relevant parsing error code rather than `CURLE_OUT_OF_MEMORY`
+for invalid URLs.
+
+[1] https://github.com/facebook/hhvm/blob/c83584cad90cc9327d0b75175135d46882d8dc1f/hphp/runtime/ext/curl/ext_curl.cpp#L208
+
+Closes #23444
+
+CVE: CVE-2026-94266
+Upstream-Status: Backport [https://github.com/curl/curl/commit/589c35f0cb47266394367659648bf3efc03e3790]
+
+Backport Changes:
+- Register test1990 without indentation in curl 8.19.0's grouped
+  TESTCASES list; upstream indents its entry by two spaces.
+- Add <tool>lib1990</tool> to test1990. The 8.19.0 runner does not
+  select a library tool from the libtest keyword, as upstream does.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ docs/libcurl/opts/CURLINFO_EFFECTIVE_URL.md |  8 +++
+ lib/getinfo.c                               | 10 +++-
+ tests/data/Makefile.am                      |  1 +
+ tests/data/test1990                         | 31 ++++++++++
+ tests/libtest/Makefile.inc                  |  1 +
+ tests/libtest/lib1990.c                     | 63 +++++++++++++++++++++
+ 6 files changed, 111 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1990
+ create mode 100644 tests/libtest/lib1990.c
+
+diff --git a/docs/libcurl/opts/CURLINFO_EFFECTIVE_URL.md b/docs/libcurl/opts/CURLINFO_EFFECTIVE_URL.md
+index f7adcd810b..12347bfd5f 100644
+--- a/docs/libcurl/opts/CURLINFO_EFFECTIVE_URL.md
++++ b/docs/libcurl/opts/CURLINFO_EFFECTIVE_URL.md
+@@ -32,6 +32,14 @@ Pass in a pointer to a char pointer and get the last used effective URL.
+ In cases when you have asked libcurl to follow redirects, it may not be the same
+ value you set with CURLOPT_URL(3).
+ 
++Any credentials (username and password) present in the URL are removed from
++the returned string.
++
++If no URL has been used yet, **urlp** points to an empty string.
++
++If the URL set with CURLOPT_URL(3) cannot be parsed as a valid URL, **urlp** is
++set to NULL and an error is returned, typically *CURLE_URL_MALFORMAT*.
++
+ The **urlp** pointer is NULL or points to private memory. You **must not**
+ free it. It memory gets freed automatically when you call curl_easy_cleanup(3)
+ on the corresponding curl handle.
+diff --git a/lib/getinfo.c b/lib/getinfo.c
+index 920f1f3a0c..ce4ac77f52 100644
+--- a/lib/getinfo.c
++++ b/lib/getinfo.c
+@@ -29,6 +29,7 @@
+ #include "vtls/vtls.h"
+ #include "connect.h" /* Curl_getconnectinfo() */
+ #include "bufref.h"
++#include "url.h" /* Curl_uc_to_curlcode() */
+ #include "curlx/strparse.h"
+ 
+ /*
+@@ -89,7 +90,8 @@ static CURLcode effective_url(struct Curl_easy *data,
+                               const char **param_charp)
+ {
+   const char *s = Curl_bufref_ptr(&data->state.url);
+-  *param_charp = s ? s : "";
++  /* never return the URL unfiltered */
++  *param_charp = s ? NULL : "";
+   if(s) {
+     char *url = NULL;
+     /* Make a copy of the URL without credentials */
+@@ -111,15 +113,17 @@ static CURLcode effective_url(struct Curl_easy *data,
+     curl_url_cleanup(u);
+ 
+     if(uc || !url)
+-      return CURLE_OUT_OF_MEMORY;
++      return uc ? Curl_uc_to_curlcode(uc) : CURLE_OUT_OF_MEMORY;
+     if(strcmp(url, s)) {
+       /* they are different */
+       curlx_free(data->info.effective_url);
+       data->info.effective_url = url;
+       *param_charp = url;
+     }
+-    else
++    else {
+       curl_free(url);
++      *param_charp = s;
++    }
+   }
+   return CURLE_OK;
+ }
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index d6aaa71f5d..b348f37bf8 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -243,6 +243,7 @@ test1941 test1942 test1943 test1944 test1945 test1946 test1947 test1948 \
+ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 test1976 test1977 \
+ test1978 test1979 test1980 test1981 \
++test1990 \
+ \
+ test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
+ test2009 test2010 test2011 \
+diff --git a/tests/data/test1990 b/tests/data/test1990
+new file mode 100644
+index 0000000000..61ef3ca95d
+--- /dev/null
++++ b/tests/data/test1990
+@@ -0,0 +1,31 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++CURLINFO_EFFECTIVE_URL
++libtest
++</keywords>
++</info>
++
++# Client-side
++<client>
++<tool>
++lib1990
++</tool>
++<name>
++CURLINFO_EFFECTIVE_URL with no URL and an invalid URL
++</name>
++<command>
++-
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<stdout>
++getinfo: 0, url: ''
++perform: 3
++getinfo: 3, url: (NULL)
++</stdout>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index e494189f69..fc8534234d 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -111,6 +111,7 @@ TESTS_C = \
+   lib1955.c lib1956.c lib1957.c lib1958.c lib1959.c lib1960.c \
+   lib1964.c                                                   lib1970.c \
+   lib1971.c lib1972.c lib1973.c lib1974.c lib1975.c lib1977.c lib1978.c \
++  lib1990.c \
+   lib2023.c lib2032.c lib2082.c \
+   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c \
+   lib2402.c           lib2404.c lib2405.c \
+diff --git a/tests/libtest/lib1990.c b/tests/libtest/lib1990.c
+new file mode 100644
+index 0000000000..96e18d4033
+--- /dev/null
++++ b/tests/libtest/lib1990.c
+@@ -0,0 +1,63 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ***************************************************************************/
++#include "first.h"
++
++static void show_effective_url(CURL *curl)
++{
++  char untouched[] = "untouched";
++  char *url = untouched;
++  CURLcode result = curl_easy_getinfo(curl, CURLINFO_EFFECTIVE_URL, &url);
++  if(url)
++    curl_mprintf("getinfo: %d, url: '%s'\n", (int)result, url);
++  else
++    curl_mprintf("getinfo: %d, url: (NULL)\n", (int)result);
++}
++
++static CURLcode test_lib1990(const char *URL)
++{
++  CURL *curl;
++  CURLcode result;
++
++  (void)URL;
++  curl_global_init(CURL_GLOBAL_ALL);
++  curl = curl_easy_init();
++  if(!curl) {
++    curl_global_cleanup();
++    return TEST_ERR_EASY_INIT;
++  }
++
++  /* no URL used yet */
++  show_effective_url(curl);
++
++  /* an invalid URL with credentials must not be returned */
++  curl_easy_setopt(curl, CURLOPT_URL, "http://user:secret@[invalid/");
++  result = curl_easy_perform(curl);
++  curl_mprintf("perform: %d\n", (int)result);
++  show_effective_url(curl);
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return CURLE_OK;
++}
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 71b7c06e71..a4f7b466c3 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -68,6 +68,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92388_p1.patch \
            file://CVE-2026-92388_p2.patch \
            file://CVE-2026-92392.patch \
+           file://CVE-2026-94266_p1.patch \
+           file://CVE-2026-94266_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
