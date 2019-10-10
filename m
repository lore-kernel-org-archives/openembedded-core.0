Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 508627F502
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:40 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 23so3949644pgk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uG4Wi47pQPXMZ7XqO6H/IoswxKTZz5VF+F7MPQov+/A=;
	b=PCNwjcg20qttRugAYNMXdKzy2TF3JLeKRX5sh0S8IYhQVLsT6B6NeCP1MlbCaetcCs
	LWZ/gttLmEF0KBGJVuf5P3ZI01V87e1NpzajX+sEosHDRq7N/l5D53jZDN/tbrHTYmYT
	7n3Fz50XC1r83aGenbA35QE1wmAEc097Y1RL2Zf1dVPXLyRM3bPTLtSGe2p9IIwl7vrJ
	QCJEwm6uNnSv5r2GMvwmU/mBBZO1SRhvTH9JvEe1VYR8yBPo7NB5w7FBUjqxBQaIpAvu
	wZAdYbmq1JLAqsyT4HAxtGAELwmFO2X4G100rgz4ZotLsmsjKBSl+8+6lv3tckoow3BU
	ioMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uG4Wi47pQPXMZ7XqO6H/IoswxKTZz5VF+F7MPQov+/A=;
	b=RdTmUuCb9KH1NKVxLsQ5Q4BfLPjVNhRcw5J7GQyTmqcC72eXVZtKXGdF0d49QkilpK
	0GSwpwGxj5KUkrnebJqEpB/mYf7fqWyCoxRQ9AXgB4if07zwdxDAAgYHdKbqIDm+aMCc
	uulyYBY0SEB5SAPa2JL+T4j4sSbDNJijudQLUQ3RITt/v2itY9Fvwb3NoyOWLTs5XDUE
	Hl3CFMx57ecvJP+hONQ99qLmBsRphRXFZosCeS2+mYwMKueM7WHTdu6YCk3luoqEmcf4
	WS+sKUEeyaq0a6fMLKHD07PeN1PWRauWJ95G5Z4ktuOPT28kYffVWXez4FTzz3zs+vBy
	A62g==
X-Gm-Message-State: APjAAAXLlqQMFIIACS7K9ad6bt5WYuitBN2s2LRVStLZTl1wkG07I9iW
	MIB3pIAzfi8blem7N81JY64t+6Tw
X-Google-Smtp-Source: APXvYqxwFHEvH7mhgfaJAmynQhQF2HtQW6a/fuCShPi8HCoYwVOtXLiWsoLjPQvCbD53MEjlJ9S4Hg==
X-Received: by 2002:a63:4383:: with SMTP id
	q125mr11705999pga.373.1570722581024; 
	Thu, 10 Oct 2019 08:49:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:20 -0700
Message-Id: <c901bc8cd9de5853185af2059c6f1efeb4ccdd60.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
Subject: [thud 08/12] wget: Security fixes CVE-2018-20483
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:40 -0000

From: Andrii Bordunov via Openembedded-core <openembedded-core@lists.openembedded.org>

Source: http://git.savannah.gnu.org/cgit/wget.git/
Type: Security Fix
Disposition: Backport from http://git.savannah.gnu.org/cgit/wget.git/
Description:

Fixes CVE-2018-20483

Signed-off-by: Aviraj CJ <acj@cisco.com>
[Affects Wget before 1.20.1]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wget/wget/CVE-2018-20483_p1.patch              |  73 ++++++++++++
 .../wget/wget/CVE-2018-20483_p2.patch              | 127 +++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.5.bb          |   2 +
 3 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2018-20483_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2018-20483_p2.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2018-20483_p1.patch b/meta/recipes-extended/wget/wget/CVE-2018-20483_p1.patch
new file mode 100644
index 0000000..cbc4a12
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2018-20483_p1.patch
@@ -0,0 +1,73 @@
+From 6c5471e4834aebd7359d88b760b087136473bac8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 26 Dec 2018 13:51:48 +0100
+Subject: [PATCH 1/2] Don't use extended attributes (--xattr) by default
+
+* src/init.c (defaults): Set enable_xattr to false by default
+* src/main.c (print_help): Reverse option logic of --xattr
+* doc/wget.texi: Add description for --xattr
+
+Users may not be aware that the origin URL and Referer are saved
+including credentials, and possibly access tokens within
+the urls.
+
+CVE: CVE-2018-20483 patch 1
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/wget.git/commit/?id=c125d24762962d91050d925fbbd9e6f30b2302f8]
+Signed-off-by: Aviraj CJ <acj@cisco.com>
+---
+ doc/wget.texi | 8 ++++++++
+ src/init.c    | 4 ----
+ src/main.c    | 2 +-
+ 3 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/doc/wget.texi b/doc/wget.texi
+index eaf6b380..3f9d7c1c 100644
+--- a/doc/wget.texi
++++ b/doc/wget.texi
+@@ -540,6 +540,14 @@ right NUMBER.
+ Set preferred location for Metalink resources. This has effect if multiple
+ resources with same priority are available.
+ 
++@cindex xattr
++@item --xattr
++Enable use of file system's extended attributes to save the
++original URL and the Referer HTTP header value if used.
++
++Be aware that the URL might contain private information like
++access tokens or credentials.
++
+ 
+ @cindex force html
+ @item -F
+diff --git a/src/init.c b/src/init.c
+index eb81ab47..800970c5 100644
+--- a/src/init.c
++++ b/src/init.c
+@@ -509,11 +509,7 @@ defaults (void)
+   opt.hsts = true;
+ #endif
+ 
+-#ifdef ENABLE_XATTR
+-  opt.enable_xattr = true;
+-#else
+   opt.enable_xattr = false;
+-#endif
+ }
+ 
+ /* Return the user's home directory (strdup-ed), or NULL if none is
+diff --git a/src/main.c b/src/main.c
+index 81db9319..6ac1621b 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -754,7 +754,7 @@ Download:\n"),
+ #endif
+ #ifdef ENABLE_XATTR
+     N_("\
+-       --no-xattr                  turn off storage of metadata in extended file attributes\n"),
++       --xattr                     turn on storage of metadata in extended file attributes\n"),
+ #endif
+     "\n",
+ 
+-- 
+2.19.1
+
diff --git a/meta/recipes-extended/wget/wget/CVE-2018-20483_p2.patch b/meta/recipes-extended/wget/wget/CVE-2018-20483_p2.patch
new file mode 100644
index 0000000..72ce8a0
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2018-20483_p2.patch
@@ -0,0 +1,127 @@
+From 5a4ee4f3c07cc5dc7ef5f7244fcf51fd2fa3bc67 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 26 Dec 2018 14:38:18 +0100
+Subject: [PATCH 2/2] Don't save user/pw with --xattr
+
+Also the Referer info is reduced to scheme+host+port.
+
+* src/ftp.c (getftp): Change params of set_file_metadata()
+* src/http.c (gethttp): Change params of set_file_metadata()
+* src/xattr.c (set_file_metadata): Remove user/password from origin URL,
+  reduce Referer value to scheme/host/port.
+* src/xattr.h: Change prototype of set_file_metadata()
+
+CVE: CVE-2018-20483 patch 2
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/wget.git/commit/?id=3cdfb594cf75f11cdbb9702ac5e856c332ccacfa]
+Signed-off-by: Aviraj CJ <acj@cisco.com>
+---
+ src/ftp.c   |  2 +-
+ src/http.c  |  4 ++--
+ src/xattr.c | 24 ++++++++++++++++++++----
+ src/xattr.h |  3 ++-
+ 4 files changed, 25 insertions(+), 8 deletions(-)
+
+diff --git a/src/ftp.c b/src/ftp.c
+index 69148936..db8a6267 100644
+--- a/src/ftp.c
++++ b/src/ftp.c
+@@ -1580,7 +1580,7 @@ Error in server response, closing control connection.\n"));
+ 
+ #ifdef ENABLE_XATTR
+   if (opt.enable_xattr)
+-    set_file_metadata (u->url, NULL, fp);
++    set_file_metadata (u, NULL, fp);
+ #endif
+ 
+   fd_close (local_sock);
+diff --git a/src/http.c b/src/http.c
+index 77bdbbed..472c328f 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -4120,9 +4120,9 @@ gethttp (const struct url *u, struct url *original_url, struct http_stat *hs,
+   if (opt.enable_xattr)
+     {
+       if (original_url != u)
+-        set_file_metadata (u->url, original_url->url, fp);
++        set_file_metadata (u, original_url, fp);
+       else
+-        set_file_metadata (u->url, NULL, fp);
++        set_file_metadata (u, NULL, fp);
+     }
+ #endif
+ 
+diff --git a/src/xattr.c b/src/xattr.c
+index 66524226..0f20fadf 100644
+--- a/src/xattr.c
++++ b/src/xattr.c
+@@ -21,6 +21,7 @@
+ #include <string.h>
+ 
+ #include "log.h"
++#include "utils.h"
+ #include "xattr.h"
+ 
+ #ifdef USE_XATTR
+@@ -57,7 +58,7 @@ write_xattr_metadata (const char *name, const char *value, FILE *fp)
+ #endif /* USE_XATTR */
+ 
+ int
+-set_file_metadata (const char *origin_url, const char *referrer_url, FILE *fp)
++set_file_metadata (const struct url *origin_url, const struct url *referrer_url, FILE *fp)
+ {
+   /* Save metadata about where the file came from (requested, final URLs) to
+    * user POSIX Extended Attributes of retrieved file.
+@@ -67,13 +68,28 @@ set_file_metadata (const char *origin_url, const char *referrer_url, FILE *fp)
+    * [http://0pointer.de/lennart/projects/mod_mime_xattr/].
+    */
+   int retval = -1;
++  char *value;
+ 
+   if (!origin_url || !fp)
+     return retval;
+ 
+-  retval = write_xattr_metadata ("user.xdg.origin.url", escnonprint_uri (origin_url), fp);
+-  if ((!retval) && referrer_url)
+-    retval = write_xattr_metadata ("user.xdg.referrer.url", escnonprint_uri (referrer_url), fp);
++  value = url_string (origin_url, URL_AUTH_HIDE);
++  retval = write_xattr_metadata ("user.xdg.origin.url", escnonprint_uri (value), fp);
++  xfree (value);
++
++  if (!retval && referrer_url)
++    {
++	  struct url u;
++
++	  memset(&u, 0, sizeof(u));
++      u.scheme = referrer_url->scheme;
++      u.host = referrer_url->host;
++      u.port = referrer_url->port;
++
++      value = url_string (&u, 0);
++      retval = write_xattr_metadata ("user.xdg.referrer.url", escnonprint_uri (value), fp);
++      xfree (value);
++    }
+ 
+   return retval;
+ }
+diff --git a/src/xattr.h b/src/xattr.h
+index 10f3ed11..40c7a8d3 100644
+--- a/src/xattr.h
++++ b/src/xattr.h
+@@ -16,12 +16,13 @@
+    along with this program; if not, see <http://www.gnu.org/licenses/>.  */
+ 
+ #include <stdio.h>
++#include <url.h>
+ 
+ #ifndef _XATTR_H
+ #define _XATTR_H
+ 
+ /* Store metadata name/value attributes against fp. */
+-int set_file_metadata (const char *origin_url, const char *referrer_url, FILE *fp);
++int set_file_metadata (const struct url *origin_url, const struct url *referrer_url, FILE *fp);
+ 
+ #if defined(__linux)
+ /* libc on Linux has fsetxattr (5 arguments). */
+-- 
+2.19.1
+
diff --git a/meta/recipes-extended/wget/wget_1.19.5.bb b/meta/recipes-extended/wget/wget_1.19.5.bb
index 920b74d..a53844b 100644
--- a/meta/recipes-extended/wget/wget_1.19.5.bb
+++ b/meta/recipes-extended/wget/wget_1.19.5.bb
@@ -2,6 +2,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-improve-reproducibility.patch \
            file://CVE-2019-5953.patch \
+           file://CVE-2018-20483_p1.patch \
+           file://CVE-2018-20483_p2.patch \
           "
 
 SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
-- 
2.7.4


