Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3159.1792748016536575068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 02:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TAcKNfhZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=20855; q=dns/txt;
  s=iport01; t=1792748016; x=1793957616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gURhZ9MJ3Bhr2WVpxDenAIIIFDcbQR//pGKnqqVVuXY=;
  b=TAcKNfhZD2VK189h4ZXJnqsdsoeon2v+YvEBRF9jHCYhTWVUUTeiaf6n
   VCCImkjZkRMH1CoHC/yOjIyPUF0cq4VvCIxJBZsia7YD9qYKM6cB3DZcU
   rvvftKmtZ7OI3HfiM/rq7NSbetxOieZKjhzkEVYl8qkXqThX5n/fNy7hZ
   KL7vRgJi3PKF6FN9ruk3y6A7nUTH4HKyP3UvBJxvfqo0Y9oRZsEo6ZWeN
   NctNqwe6wr2B3HBqGZYg8YhSNHsZtnnfq4wDGoTvq4Er9upwFg4ft1tP7
   Y6C0JNjEUjY2oxsJ0JrWBlzJ1rlOXiTdjgGkqqhYo9NBzUqWxpVKjAZsE
   g==;
X-CSE-ConnectionGUID: jvl5zqR7RMaR3xPHmRzLBg==
X-CSE-MsgGUID: d3eZ298xQFyXWxZ9c8f4tQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgBIKNtq/4z/Ja1aglmCV3VgQ0kDlkgDnhwUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDMgEYAS0QHAMBAhYBAQEWKx0BBQgZgwIBgnQDEQa1c?=
 =?us-ascii?q?hs3giyBAYMpAT8CAkABUNsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYE7gi6BB?=
 =?us-ascii?q?YEyKgIBgRgOIAFXCQIGhXUEgg0VehKBWhgGZYYlhkoaAmqGCUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BFiMZNmuBCV2BKylgASGBC?=
 =?us-ascii?q?IF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExouC4EaODwJJkEVDGYLGgViC?=
 =?us-ascii?q?AINDH85EB8YDUgRLDcVGQQ+bgeRb4IaagcBWAgCKwEHIgEBBIEBfQY1CwEBB?=
 =?us-ascii?q?BiSdAcKkBaCIYE1n1oKKIN2jCKODYctGjOFW6UUmQiLN4JTlTQ0aIRpgWg8g?=
 =?us-ascii?q?VlwFTuCZwkWNBkPji4LC4F4gWiEB4I5yBonMgIEBTIBAQcCBw4DC4FokAACJ?=
 =?us-ascii?q?AKBVgEB?=
IronPort-Data: A9a23:0LJ54qn+uPkgxWU9h3FHma7o5gzvJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcCjrSPaqJYGL8KtBzbYWzphsB6pHSzIBrQAA9/CxgEVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsfnb9HuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY8G/rtlGFsRz
 9kREmsdVjCGvfCS6r3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIIY3WGZ0Fzh3wS
 mTu8z/0MEtLZMym5yu1zWKe1+Sfk3/nYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM/JBFOQ87keGzazb6gKxHW0FSjMHZsZOiSMtbSYh2
 lnMm5biAiZi9eXOD3mc7byT6zi1PED5MFM/WMPNdiNdi/GLnW35pkunogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:ecp0L6tF1aW3/ZRqmKmfFSVG7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:F/7ufGzj4rdoWPqmrSD3BgUWBMR4YGTnk031KnXjGV5JTYeHbXWfrfY=
X-Talos-MUID: 9a23:TWi7tAmxOvCYJ8jE6FTRdnpub8paufX+GHkjgKU5q/vVPnx+Zyuk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,174,1787011200"; 
   d="scan'208";a="539440883"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Oct 2026 09:33:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 00FD818000636;
	Fri, 23 Oct 2026 09:33:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 99CCACBF201; Fri, 23 Oct 2026 02:33:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 1/5] curl: fix CVE-2026-8926
Date: Fri, 23 Oct 2026 02:33:27 -0700
Message-Id: <20261023093331.1886272-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261023093331.1886272-1-dkelaiya@cisco.com>
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 09:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248496
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream fix [1] for [2] to curl 8.19.0.

Include entry-selection changes and extended test 685 from [4].
Keep password-only entries valid for a user supplied in the URL,
while rejecting passwords tied to a different login. Reset login
matching state when changing entries.

Include upstream follow-up [3] to cover URL users absent from the
netrc file, with regression test 1646.

Select the final login and password at the end of each machine entry.
Extend tests/data/test1304 and tests/unit/unit1304.c for both
credential orders, replaced logins, account values and macros.
Document the retained parser API and test harness separately from
upstream's lexer/scanner rewrite. Preserve generic password-only
entries and the old blank-password API.

[1] https://github.com/curl/curl/commit/4ae1d7cc2643e4773a136395f12bc02fc6867854
[2] https://curl.se/docs/CVE-2026-8926.html
[3] https://github.com/curl/curl/commit/7ca5f939c8403db7ede21e2ccb805a65d3329ef8
[4] https://github.com/curl/curl/commit/a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Select the final login/password at entry boundaries to handle both
  credential orderings and reject a mismatched final login.
- Extend tests/data/test1304 and tests/unit/unit1304.c for both orders,
  replaced logins, account values and macro bodies.
- Document the retained parser API, test harness, password-only
  entries and blank-password behavior.
---
 .../curl/curl/CVE-2026-8926-dependent.patch   | 140 ++++++++++
 .../curl/curl/CVE-2026-8926_p1.patch          | 258 ++++++++++++++++++
 .../curl/curl/CVE-2026-8926_p2.patch          |  84 ++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   3 +
 4 files changed, 485 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch b/meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
new file mode 100644
index 0000000000..1c46d08e27
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
@@ -0,0 +1,140 @@
+From a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 9 Mar 2026 08:38:14 +0100
+Subject: [PATCH] netrc: refactor into smaller sub functions
+
+Fixes #20950 - test 685 is extended for this
+Closes #20932
+
+CVE: CVE-2026-8926
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca]
+
+Backport Changes:
+- Kept the curl 8.19.0 parser and login/password API instead of
+  extracting netrc_state, token, state, and finalization helpers.
+- Applied the password-presence check, generic-entry selection and
+  entry-state resets in the existing parser, without the helper moves.
+- Omitted netrc_finalize's password-return comment because the CVE
+  fix must reject entries with an explicitly mismatched login.
+
+(cherry picked from commit a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ docs/cmdline-opts/netrc.md         | 12 ++++++++++--
+ docs/libcurl/opts/CURLOPT_NETRC.md |  5 +++++
+ lib/netrc.c                        | 17 ++++++++++++++---
+ tests/data/test685                 |  4 +++-
+ 4 files changed, 32 insertions(+), 6 deletions(-)
+
+diff --git a/docs/cmdline-opts/netrc.md b/docs/cmdline-opts/netrc.md
+index 72b5ff9..03a7ed6 100644
+--- a/docs/cmdline-opts/netrc.md
++++ b/docs/cmdline-opts/netrc.md
+@@ -35,10 +35,18 @@ On Windows two filenames in the home directory are checked: *.netrc* and
+ *_netrc*, preferring the former. Older versions on Windows checked for
+ *_netrc* only.
+ 
+-A quick and simple example of how to setup a *.netrc* to allow curl to FTP to
+-the machine host.example.com with username 'myself' and password 'secret'
++A quick and simple example of how to setup a *.netrc* to allow curl to access
++the machine host.example.com with username `myself` and password `secret`
+ could look similar to:
+ 
+     machine host.example.com
+     login myself
+     password secret
++
++curl also supports the `default` keyword. This is the same as machine name
++except that default matches any name. There can be only one `default` token,
++and it must be after all machine tokens.
++
++When providing a username in the URL and a *.netrc* file, curl looks for the
++password for that specific user for the given host if such an entry appears in
++the file before a "generic" `machine` entry without `login` specified.
+diff --git a/docs/libcurl/opts/CURLOPT_NETRC.md b/docs/libcurl/opts/CURLOPT_NETRC.md
+index 65d87cf..1e3dbb1 100644
+--- a/docs/libcurl/opts/CURLOPT_NETRC.md
++++ b/docs/libcurl/opts/CURLOPT_NETRC.md
+@@ -50,6 +50,11 @@ and similar things are not supported).
+ The netrc file provides credentials for a hostname independent of which
+ protocol and port number that are used.
+ 
++When providing a username in the URL and a *.netrc* file, libcurl looks for
++and uses the password for that specific user for the given host if such an
++entry appears in the file before a "generic" `machine` entry without `login`
++specified.
++
+ libcurl does not verify that the file has the correct properties set (as the
+ standard Unix ftp client does). It should only be readable by user.
+ 
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 1073cc5..5eb0c84 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -289,8 +289,7 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+             retcode = NETRC_OUT_OF_MEMORY; /* allocation failed */
+             goto out;
+           }
+-          if(!specific_login || our_login)
+-            found |= FOUND_PASSWORD;
++          found |= FOUND_PASSWORD;
+           keyword = NONE;
+         }
+         else if(curl_strequal("login", tok))
+@@ -299,13 +298,22 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+           keyword = PASSWORD;
+         else if(curl_strequal("machine", tok)) {
+           /* a new machine here */
+-          if(found & FOUND_PASSWORD) {
++          if(found & FOUND_PASSWORD &&
++             /* a password was provided for this host */
++
++             ((!specific_login || our_login) ||
++              /* either there was no specific login to search for, or this
++                 is the specific one we wanted */
++              (specific_login && !(found & FOUND_LOGIN)))) {
++            /* or we look for a specific login, but that was not specified */
++
+             done = TRUE;
+             break;
+           }
+           state = HOSTFOUND;
+           keyword = NONE;
+           found = 0;
++          our_login = FALSE;
+           Curl_safefree(password);
+           if(!specific_login)
+             Curl_safefree(login);
+@@ -313,6 +321,9 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+         else if(curl_strequal("default", tok)) {
+           state = HOSTVALID;
+           retcode = NETRC_OK; /* we did find our host */
++          keyword = NONE;
++          found = 0;
++          our_login = FALSE;
+           Curl_safefree(password);
+           if(!specific_login)
+             Curl_safefree(login);
+diff --git a/tests/data/test685 b/tests/data/test685
+index a069ff8..5346cd1 100644
+--- a/tests/data/test685
++++ b/tests/data/test685
+@@ -26,13 +26,15 @@ Connection: close
+ http
+ </server>
+ <name>
+-netrc with no login - provided user
++netrc with no login - but provided user in URL
+ </name>
+ <command>
+ --netrc-optional --netrc-file %LOGDIR/netrc%TESTNUMBER http://user@%HOSTIP:%HTTPPORT/
+ </command>
+ <file name="%LOGDIR/netrc%TESTNUMBER" >
++machine %HOSTIP password firstthis login unknown
+ machine %HOSTIP password 5up3r53cr37
++machine %HOSTIP password d1ff3r3nt login anotherone
+ </file>
+ </client>
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
new file mode 100644
index 0000000000..71d44a2bd5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
@@ -0,0 +1,258 @@
+From 4ae1d7cc2643e4773a136395f12bc02fc6867854 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 15 May 2026 11:45:49 +0200
+Subject: [PATCH] netrc: scanner refactor
+
+Refactor the netrc scanner. Add test case for checking that the last
+matched machine with unmatched login does not return the password as
+success (unit1304).
+
+Closes #21624
+
+CVE: CVE-2026-8926
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4ae1d7cc2643e4773a136395f12bc02fc6867854]
+
+Backport Changes:
+- Kept curl 8.19.0's parsenetrc() state machine and tokenizer;
+  applied the selection rules from upstream netrc_scan_end_entry()
+  without importing the lexer/scanner replacement.
+- Kept Curl_parsenetrc() and its char **loginp / char **passwordp
+  interface. Omitted the netrc.h and url.c API/credential plumbing
+  changes for Curl_netrc_scan() and Curl_creds.
+- Kept the existing file-loading helpers; omitted upstream's grammar
+  documentation, debug tracing and helper reordering.
+- In the old parser, replaced the early login/password return with
+  selection at machine, default, macdef and EOF boundaries. Reject
+  an explicitly mismatched final login; keep password-only entries.
+- Retained the old API's blank-password result for a matching login
+  without a password, rather than importing Curl_creds handling.
+- Consume account values and skip macro-body lines in the retained
+  tokenizer instead of using upstream's literal-token/macro helpers.
+- Adapted tests/unit/unit1304.c to the old API. Kept
+  UNITTEST_BEGIN_SIMPLE and string cleanup instead of upstream's
+  easy-handle setup. Retained the old assertion style and substring/
+  superstring inputs. Updated the three unmatched-login results and
+  ported the final host/unmatched-login regression.
+- Extended the existing tests/data/test1304 fixture, which upstream
+  does not modify, and added unit1304 assertions for both credential
+  orders, replaced logins, account values and macro bodies.
+
+(cherry picked from commit 4ae1d7cc2643e4773a136395f12bc02fc6867854)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/netrc.c           | 53 +++++++++++++++++++++++++--------------------------
+ tests/data/test1304   |  8 ++++++++
+ tests/unit/unit1304.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++---
+ 3 files changed, 83 insertions(+), 30 deletions(-)
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 5eb0c84..9f97781 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -53,7 +53,8 @@ enum host_lookup_state {
+ enum found_state {
+   NONE,
+   LOGIN,
+-  PASSWORD
++  PASSWORD,
++  ACCOUNT
+ };
+ 
+ #define FOUND_LOGIN    1
+@@ -148,6 +149,8 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+       if(state == MACDEF) {
+         if((*tok == '\n') || (*tok == '\r'))
+           state = NOTHING; /* end of macro definition */
++        /* Macro contents are not netrc tokens. */
++        break;
+       }
+ 
+       if(!*tok || (*tok == '\n'))
+@@ -292,35 +295,32 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+           found |= FOUND_PASSWORD;
+           keyword = NONE;
+         }
++        else if(keyword == ACCOUNT)
++          keyword = NONE; /* Ignore the account value. */
++        else if(curl_strequal("account", tok))
++          keyword = ACCOUNT;
+         else if(curl_strequal("login", tok))
+           keyword = LOGIN;
+         else if(curl_strequal("password", tok))
+           keyword = PASSWORD;
+-        else if(curl_strequal("machine", tok)) {
+-          /* a new machine here */
+-          if(found & FOUND_PASSWORD &&
+-             /* a password was provided for this host */
+-
+-             ((!specific_login || our_login) ||
+-              /* either there was no specific login to search for, or this
+-                 is the specific one we wanted */
+-              (specific_login && !(found & FOUND_LOGIN)))) {
+-            /* or we look for a specific login, but that was not specified */
+-
++        else if(curl_strequal("machine", tok) ||
++                curl_strequal("default", tok) ||
++                curl_strequal("macdef", tok)) {
++          /* Select credentials only after reading the whole entry. */
++          if((found & FOUND_PASSWORD) &&
++             (!specific_login || our_login ||
++              !(found & FOUND_LOGIN))) {
+             done = TRUE;
+             break;
+           }
+-          state = HOSTFOUND;
+-          keyword = NONE;
+-          found = 0;
+-          our_login = FALSE;
+-          Curl_safefree(password);
+-          if(!specific_login)
+-            Curl_safefree(login);
+-        }
+-        else if(curl_strequal("default", tok)) {
+-          state = HOSTVALID;
+-          retcode = NETRC_OK; /* we did find our host */
++          if(curl_strequal("machine", tok))
++            state = HOSTFOUND;
++          else if(curl_strequal("default", tok)) {
++            state = HOSTVALID;
++            retcode = NETRC_OK;
++          }
++          else
++            state = MACDEF;
+           keyword = NONE;
+           found = 0;
+           our_login = FALSE;
+@@ -328,10 +328,6 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+           if(!specific_login)
+             Curl_safefree(login);
+         }
+-        if((found == (FOUND_PASSWORD | FOUND_LOGIN)) && our_login) {
+-          done = TRUE;
+-          break;
+-        }
+         break;
+       } /* switch (state) */
+       tok = ++tok_end;
+@@ -349,6 +345,9 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+ 
+ out:
+   curlx_dyn_free(&token);
++  if(!retcode && specific_login && !our_login &&
++     ((found & FOUND_LOGIN) || !password))
++    retcode = NETRC_NO_MATCH;
+   if(!retcode) {
+     if(!password && our_login) {
+       /* success without a password, set a blank one */
+diff --git a/tests/data/test1304 b/tests/data/test1304
+index 35f2a54..638a7d8 100644
+--- a/tests/data/test1304
++++ b/tests/data/test1304
+@@ -21,6 +21,14 @@ netrc parsing unit tests
+ </command>
+ <file name="%LOGDIR/netrc%TESTNUMBER">
+ machine example.com login admin password passwd
++machine multi.example.com login alice password p1 login bob password p2
++machine order.example.com login alice password p1 password p2 login bob
++machine account.example.com login bob password p2 account login
++machine macro.example.com login alice password p1
++macdef boot
++login bob password wrong
++
++machine macro.example.com login bob password p2
+ machine curl.example.com login none password none
+ </file>
+ </client>
+diff --git a/tests/unit/unit1304.c b/tests/unit/unit1304.c
+index 231ddd4..5287061 100644
+--- a/tests/unit/unit1304.c
++++ b/tests/unit/unit1304.c
+@@ -37,6 +37,11 @@ static CURLcode test_unit1304(const char *arg)
+ {
+   char *login = NULL;
+   char *password = NULL;
++  size_t i;
++  static const char * const hosts[] = {
++    "multi.example.com", "order.example.com",
++    "account.example.com", "macro.example.com"
++  };
+ 
+   UNITTEST_BEGIN_SIMPLE
+ 
+@@ -59,7 +64,7 @@ static CURLcode test_unit1304(const char *arg)
+   login = curlx_strdup("me");
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store, "example.com", &login, &password, arg);
+-  fail_unless(result == 0, "Host should have been found");
++  fail_unless(result == 1, "Login should not have been found");
+   abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+   curlx_free(login);
+@@ -82,7 +87,7 @@ static CURLcode test_unit1304(const char *arg)
+   login = curlx_strdup("admi"); /* spellchecker:disable-line */
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store, "example.com", &login, &password, arg);
+-  fail_unless(result == 0, "Host should have been found");
++  fail_unless(result == 1, "Login should not have been found");
+   abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+   curlx_free(login);
+@@ -94,7 +99,7 @@ static CURLcode test_unit1304(const char *arg)
+   login = curlx_strdup("adminn");
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store, "example.com", &login, &password, arg);
+-  fail_unless(result == 0, "Host should have been found");
++  fail_unless(result == 1, "Login should not have been found");
+   abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+   curlx_free(login);
+@@ -166,6 +171,47 @@ static CURLcode test_unit1304(const char *arg)
+   fail_unless(strncmp(login, "none", 4) == 0, "login should be 'none'");
+   Curl_netrc_cleanup(&store);
+ 
++  /*
++   * Test for the last host where we do not want to see the password
++   * if the login does not match.
++   */
++  curlx_free(password);
++  password = NULL;
++  curlx_free(login);
++  login = curlx_strdup("hilarious");
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store, "curl.example.com", &login, &password, arg);
++  fail_unless(result == 1, "Login should not have been found");
++  abort_unless(password == NULL, "password is not NULL!");
++  Curl_netrc_cleanup(&store);
++
++  /* Select final credentials in either order, skipping account values
++     and macro bodies. */
++  for(i = 0; i < CURL_ARRAYSIZE(hosts); i++) {
++    curlx_free(password);
++    password = NULL;
++    curlx_free(login);
++    login = curlx_strdup("bob");
++    Curl_netrc_init(&store);
++    result = Curl_parsenetrc(&store, hosts[i], &login, &password, arg);
++    fail_unless(result == 0, "Login should have been found");
++    abort_unless(password != NULL, "password is NULL!");
++    fail_unless(!strcmp(password, "p2"), "password should be p2");
++    Curl_netrc_cleanup(&store);
++  }
++
++  /* An earlier login must not match after a later one replaces it. */
++  curlx_free(password);
++  password = NULL;
++  curlx_free(login);
++  login = curlx_strdup("alice");
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store, "multi.example.com",
++                          &login, &password, arg);
++  fail_unless(result == 1, "Login should not have been found");
++  abort_unless(password == NULL, "password is not NULL!");
++  Curl_netrc_cleanup(&store);
++
+   UNITTEST_END(t1304_stop(&password, &login))
+ }
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch
new file mode 100644
index 0000000000..b511e03fc4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch
@@ -0,0 +1,84 @@
+From 7ca5f939c8403db7ede21e2ccb805a65d3329ef8 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 16 May 2026 00:54:13 +0200
+Subject: [PATCH] test1646: netrc parsing without user match but user in URL
+
+Follow-up to 4ae1d7cc2643e
+
+CVE: CVE-2026-8926
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7ca5f939c8403db7ede21e2ccb805a65d3329ef8]
+
+Backport Changes:
+- Registered test 1646 in the older curl 8.19.0 test-list row.
+
+(cherry picked from commit 7ca5f939c8403db7ede21e2ccb805a65d3329ef8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/data/Makefile.am |  2 +-
+ tests/data/test1646    | 45 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 13e47a3..ea700cd 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -218,7 +218,7 @@ test1620 test1621 test1622 test1623 test1624 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 test1636 test1637 \
+ \
+-test1640 test1641 test1642 test1643 test1647 test1648 test1649 \
++test1640 test1641 test1642 test1643 test1646 test1647 test1648 test1649 \
+ \
+ test1650 test1651 test1652 test1653 test1654 test1655 test1656 test1657 \
+ test1658 \
+diff --git a/tests/data/test1646 b/tests/data/test1646
+new file mode 100644
+index 0000000..3df03be
+--- /dev/null
++++ b/tests/data/test1646
+@@ -0,0 +1,45 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++netrc
++</keywords>
++</info>
++
++<reply>
++<data>
++HTTP/1.1 200 OK
++Content-Length: 6
++
++12345
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++netrc parsing without user match but user in URL
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER http://alice@example.com:%HTTPPORT/%TESTNUMBER --resolve example.com:%HTTPPORT:%HOSTIP
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++machine example.com login bob password sekret
++</file>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: example.com:%HTTPPORT
++Authorization: Basic %b64[alice:]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index c2697d6dd8..af76f5d53b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -38,6 +38,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80229.patch \
            file://CVE-2026-9546-01.patch \
            file://CVE-2026-9546-02.patch \
+           file://CVE-2026-8926-dependent.patch \
+           file://CVE-2026-8926_p1.patch \
+           file://CVE-2026-8926_p2.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6

