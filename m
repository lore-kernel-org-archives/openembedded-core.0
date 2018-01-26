Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id B8462784F1;
	Fri, 26 Jan 2018 21:11:15 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id s5so1647523wra.0;
	Fri, 26 Jan 2018 13:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=00p/bce09iFPy+2Z/PEMTb8rAOeDCu+t+jltQz1r6Pc=;
	b=B1HptYUhAYiLtB3izlSEcWaPWdwplyGIMIM1IIOjfMgAA6FDlk+0gy7pH5ai78t7B9
	PqQ+XQNnZgLZVPnKIRBg21dqLEWuOPYbj43nSaMpbF/jYpQOBOH+D623LVSBNCAfX8mZ
	Sv7v1lH0dLG2LjxhzJfMW62fhroQ57uTtESd0x7PQkXcTxTBNA7S3Hud2/1l7rehO3np
	r4NxS2upryVrh7EtOSARqrTD2xSPSeUVIqxbijMphXBsZhs0DKfJXXqRjDO4k/X+jAVY
	8qyK8zsfRKSFtSb6AxJqr++aIIgVZTtoIO8zpiPPY282pUKA3SoipEzlOZP6lkTN9ONI
	/Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=00p/bce09iFPy+2Z/PEMTb8rAOeDCu+t+jltQz1r6Pc=;
	b=Iys+Nxfr2ApjTbUbTTybFiEpyubfCBCAPYQGsjLqGFvTH2HzWXVLSDYitdvd7NuhVa
	DXFSK4dUV6UByfuDYK/FESxtSbxL4wRHcOR5A5Z/ZGisoFs3TqsxlsRPtw6TNHXQJmf7
	rYPaAZbADe/ovNwFAHbkfllV3sVX9CO6rnBWEoG7tgDrjkK9+MWNSiFes99ZZb4ZMoay
	nbrNn9SxllF2CgC610m4Ry/Nzn+NIq20NewJ3riti2vurNLX0ogUOcgBnetF6Ew5664Y
	IDuZp3SN6gIfKLeS1LNv18iQL7t71HMqJKOdmEFJNdPl5wkDNhkbk1vvVy1u947deK+P
	DieA==
X-Gm-Message-State: AKwxyteC/6cGDdlFK7Fd9k3X6HNQzErn566sETz9cc2CQ2rKO3gR/UNx
	B4QLLss093RQskuz5vvRZ+wfFTM0NO/ZBEWJJkmiKQ==
X-Google-Smtp-Source: AH8x227B3k+55Lc3hHdhB+Qv34yE/UbrzxakZxAKjeZqS+Ckdz7nbHpMZXsOsda2cOWrNqr+YmsId6ijTsM+xFDzgH0=
X-Received: by 10.223.195.78 with SMTP id e14mr12489664wrg.68.1517001076496;
	Fri, 26 Jan 2018 13:11:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 26 Jan 2018 13:11:15 -0800 (PST)
In-Reply-To: <20180126131030.94CC72362F5@git.openembedded.org>
References: <151697222948.10795.9635543486349716912@git.openembedded.org>
	<20180126131030.94CC72362F5@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 Jan 2018 22:11:15 +0100
Message-ID: <CA+chaQf7JNHD_7T4B=pO0hEL=MUx+gkiteTAtEZ3=-EpQoNiNQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 19/24: curl: 7.54.1 -> 7.57.0
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
X-List-Received-Date: Fri, 26 Jan 2018 21:11:17 -0000
Content-Type: multipart/alternative; boundary="f403045fa74649e0600563b4560e"

--f403045fa74649e0600563b4560e
Content-Type: text/plain; charset="UTF-8"

Be aware that this upgrade might change your libcurl5 to libcurl4

With Yocto 1.7 Dizzy we used to have libcurl5, because of
different SIZEOF_OFF_T value.

Then in Yocto 1.8 Fido SIZEOF_OFF_T was changed in oe-core and curl started
to use libcurl4 again automatically.

Back then I've added simple workaround in our bbappend to keep libcurl5
(until we can rebuild all prebuilt binaries from 3rd party vendors):

# Force to use libcurl5 instead of libcurl4 (like we had with Yocto 1.7
Dizzy)
# The SONAME isn't bumped automatically since oe-core commit
49c848018484827c433e1bcf9c63416640456f3e
# which changed SIZEOF_OFF_T to 8
EXTRA_OECONF += "--enable-soname-bump"

and it was working fine until this upgrade to 7.57.0. I haven't checked yet
why enable-soname-bump stopped working (it's still recognized by configure
script).


On Fri, Jan 26, 2018 at 2:10 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 215d5677004537fc190b5381157ac8b94db6d7e8
> Author: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> AuthorDate: Wed Jan 24 11:01:36 2018 +0800
>
>     curl: 7.54.1 -> 7.57.0
>
>     1.Upgrade curl from 7.54.1 to 7.57.0.
>     2.Delete CVE-2017-1000099.patch, CVE-2017-1000100.patch,
> CVE-2017-1000101.patch, CVE-2017-1000254.patch, reproducible-mkhelp.patch,
> since it is integrated upstream.
>     3.Remove "do_install_append()" from curl_7.57.0.bb, since
> curl/curlbuild.h has been removed.
>
>     Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../curl/curl/CVE-2017-1000099.patch               |  41 ------
>  .../curl/curl/CVE-2017-1000100.patch               |  51 --------
>  .../curl/curl/CVE-2017-1000101.patch               |  99 ---------------
>  .../curl/curl/CVE-2017-1000254.patch               | 138
> ---------------------
>  .../curl/curl/reproducible-mkhelp.patch            |  32 -----
>  .../curl/{curl_7.54.1.bb => curl_7.57.0.bb}        |  14 +--
>  6 files changed, 2 insertions(+), 373 deletions(-)
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
> b/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
> deleted file mode 100644
> index 96ff1b0..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From c9332fa5e84f24da300b42b1a931ade929d3e27d Mon Sep 17 00:00:00 2001
> -From: Even Rouault <even.rouault@spatialys.com>
> -Date: Tue, 1 Aug 2017 17:17:06 +0200
> -Subject: [PATCH] file: output the correct buffer to the user
> -
> -Regression brought by 7c312f84ea930d8 (April 2017)
> -
> -CVE: CVE-2017-1000099
> -
> -Bug: https://curl.haxx.se/docs/adv_20170809C.html
> -
> -Credit to OSS-Fuzz for the discovery
> -
> -Upstream-Status: Backport
> -https://github.com/curl/curl/commit/c9332fa5e84f24da300b42b1a931ad
> e929d3e27d
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ----
> - lib/file.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/file.c b/lib/file.c
> -index bd426eac2..666cbe75b 100644
> ---- a/lib/file.c
> -+++ b/lib/file.c
> -@@ -499,11 +499,11 @@ static CURLcode file_do(struct connectdata *conn,
> bool *done)
> -              Curl_month[tm->tm_mon],
> -              tm->tm_year + 1900,
> -              tm->tm_hour,
> -              tm->tm_min,
> -              tm->tm_sec);
> --    result = Curl_client_write(conn, CLIENTWRITE_BOTH, buf, 0);
> -+    result = Curl_client_write(conn, CLIENTWRITE_BOTH, header, 0);
> -     if(!result)
> -       /* set the file size to make it available post transfer */
> -       Curl_pgrsSetDownloadSize(data, expected_size);
> -     return result;
> -   }
> ---
> -2.13.3
> -
> diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
> b/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
> deleted file mode 100644
> index f74f1dd..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 358b2b131ad6c095696f20dcfa62b8305263f898 Mon Sep 17 00:00:00 2001
> -From: Daniel Stenberg <daniel@haxx.se>
> -Date: Tue, 1 Aug 2017 17:16:46 +0200
> -Subject: [PATCH] tftp: reject file name lengths that don't fit
> -
> -... and thereby avoid telling send() to send off more bytes than the
> -size of the buffer!
> -
> -CVE: CVE-2017-1000100
> -
> -Bug: https://curl.haxx.se/docs/adv_20170809B.html
> -Reported-by: Even Rouault
> -
> -Credit to OSS-Fuzz for the discovery
> -
> -Upstream-Status: Backport
> -https://github.com/curl/curl/commit/358b2b131ad6c095696f20dcfa62b8
> 305263f898
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ----
> - lib/tftp.c |    7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/lib/tftp.c b/lib/tftp.c
> -index 02bd842..f6f4bce 100644
> ---- a/lib/tftp.c
> -+++ b/lib/tftp.c
> -@@ -5,7 +5,7 @@
> -  *                            | (__| |_| |  _ <| |___
> -  *                             \___|\___/|_| \_\_____|
> -  *
> -- * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
> -+ * Copyright (C) 1998 - 2017, Daniel Stenberg, <daniel@haxx.se>, et al.
> -  *
> -  * This software is licensed as described in the file COPYING, which
> -  * you should have received as part of this distribution. The terms
> -@@ -491,6 +491,11 @@ static CURLcode tftp_send_first(tftp_state_data_t
> *state, tftp_event_t event)
> -     if(result)
> -       return result;
> -
> -+    if(strlen(filename) > (state->blksize - strlen(mode) - 4)) {
> -+      failf(data, "TFTP file name too long\n");
> -+      return CURLE_TFTP_ILLEGAL; /* too long file name field */
> -+    }
> -+
> -     snprintf((char *)state->spacket.data+2,
> -              state->blksize,
> -              "%s%c%s%c", filename, '\0',  mode, '\0');
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
> b/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
> deleted file mode 100644
> index c300fff..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From 453e7a7a03a2cec749abd3878a48e728c515cca7 Mon Sep 17 00:00:00 2001
> -From: Daniel Stenberg <daniel@haxx.se>
> -Date: Tue, 1 Aug 2017 17:16:07 +0200
> -Subject: [PATCH] glob: do not continue parsing after a strtoul() overflow
> - range
> -
> -Added test 1289 to verify.
> -
> -CVE: CVE-2017-1000101
> -
> -Bug: https://curl.haxx.se/docs/adv_20170809A.html
> -Reported-by: Brian Carpenter
> -
> -Upstream-Status: Backport
> -https://github.com/curl/curl/commit/453e7a7a03a2cec749abd3878a48e7
> 28c515cca7
> -
> -Rebase the tests/data/Makefile.inc changes for curl 7.54.1.
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ----
> - src/tool_urlglob.c      |  5 ++++-
> - tests/data/Makefile.inc |  2 +-
> - tests/data/test1289     | 35 +++++++++++++++++++++++++++++++++++
> - 3 files changed, 40 insertions(+), 2 deletions(-)
> - create mode 100644 tests/data/test1289
> -
> -diff --git a/src/tool_urlglob.c b/src/tool_urlglob.c
> -index 6b1ece0..d56dcd9 100644
> ---- a/src/tool_urlglob.c
> -+++ b/src/tool_urlglob.c
> -@@ -273,7 +273,10 @@ static CURLcode glob_range(URLGlob *glob, char
> **patternp,
> -         }
> -         errno = 0;
> -         max_n = strtoul(pattern, &endp, 10);
> --        if(errno || (*endp == ':')) {
> -+        if(errno)
> -+          /* overflow */
> -+          endp = NULL;
> -+        else if(*endp == ':') {
> -           pattern = endp+1;
> -           errno = 0;
> -           step_n = strtoul(pattern, &endp, 10);
> -diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> -index 155320a..7adbee6 100644
> ---- a/tests/data/Makefile.inc
> -+++ b/tests/data/Makefile.inc
> -@@ -132,7 +132,7 @@ test1252 test1253 test1254 test1255 test1256 test1257
> test1258 test1259 \
> - test1260 test1261 test1262 \
> - \
> - test1280 test1281 test1282 test1283 test1284 test1285 test1286 test1287 \
> --test1288 \
> -+test1288 test1289 \
> - \
> - test1300 test1301 test1302 test1303 test1304 test1305 test1306 test1307 \
> - test1308 test1309 test1310 test1311 test1312 test1313 test1314 test1315 \
> -diff --git a/tests/data/test1289 b/tests/data/test1289
> -new file mode 100644
> -index 0000000..d679cc0
> ---- /dev/null
> -+++ b/tests/data/test1289
> -@@ -0,0 +1,35 @@
> -+<testcase>
> -+<info>
> -+<keywords>
> -+HTTP
> -+HTTP GET
> -+globbing
> -+</keywords>
> -+</info>
> -+
> -+#
> -+# Server-side
> -+<reply>
> -+</reply>
> -+
> -+# Client-side
> -+<client>
> -+<server>
> -+http
> -+</server>
> -+<name>
> -+globbing with overflow and bad syntxx
> -+</name>
> -+<command>
> -+http://ur%20[0-60000000000000000000
> -+</command>
> -+</client>
> -+
> -+# Verify data after the test has been "shot"
> -+<verify>
> -+# curl: (3) [globbing] bad range in column
> -+<errorcode>
> -+3
> -+</errorcode>
> -+</verify>
> -+</testcase>
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000254.patch
> b/meta/recipes-support/curl/curl/CVE-2017-1000254.patch
> deleted file mode 100644
> index 2b0798b..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2017-1000254.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -From 1b2eba6f9745c064f7283e0ada8f46df9d9d6e42 Mon Sep 17 00:00:00 2001
> -From: Li Zhou <li.zhou@windriver.com>
> -Date: Mon, 23 Oct 2017 00:26:50 -0700
> -Subject: [PATCH] FTP: zero terminate the entry path even on bad input
> -
> -... a single double quote could leave the entry path buffer without a zero
> -terminating byte. CVE-2017-1000254
> -
> -Test 1152 added to verify.
> -
> -Reported-by: Max Dymond
> -Bug: https://curl.haxx.se/docs/adv_20171004.html
> -
> -Upstream-Status: Backport
> -CVE: CVE-2017-1000254
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - lib/ftp.c               |  7 ++++--
> - tests/data/Makefile.inc |  2 ++
> - tests/data/test1152     | 61 ++++++++++++++++++++++++++++++
> +++++++++++++++++++
> - 3 files changed, 68 insertions(+), 2 deletions(-)
> - create mode 100644 tests/data/test1152
> -
> -diff --git a/lib/ftp.c b/lib/ftp.c
> -index 5edec37..493dbf9 100644
> ---- a/lib/ftp.c
> -+++ b/lib/ftp.c
> -@@ -2826,6 +2826,7 @@ static CURLcode ftp_statemach_act(struct
> connectdata *conn)
> -         const size_t buf_size = data->set.buffer_size;
> -         char *dir;
> -         char *store;
> -+        bool entry_extracted = FALSE;
> -
> -         dir = malloc(nread + 1);
> -         if(!dir)
> -@@ -2857,7 +2858,7 @@ static CURLcode ftp_statemach_act(struct
> connectdata *conn)
> -               }
> -               else {
> -                 /* end of path */
> --                *store = '\0'; /* zero terminate */
> -+                entry_extracted = TRUE;
> -                 break; /* get out of this loop */
> -               }
> -             }
> -@@ -2866,7 +2867,9 @@ static CURLcode ftp_statemach_act(struct
> connectdata *conn)
> -             store++;
> -             ptr++;
> -           }
> --
> -+          *store = '\0'; /* zero terminate */
> -+        }
> -+        if(entry_extracted) {
> -           /* If the path name does not look like an absolute path (i.e.:
> it
> -              does not start with a '/'), we probably need some
> server-dependent
> -              adjustments. For example, this is the case when connecting
> to
> -diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> -index 7adbee6..5284654 100644
> ---- a/tests/data/Makefile.inc
> -+++ b/tests/data/Makefile.inc
> -@@ -121,6 +121,8 @@ test1120 test1121 test1122 test1123 test1124 test1125
> test1126 test1127 \
> - test1128 test1129 test1130 test1131 test1132 test1133 test1134 test1135 \
> - test1136 test1137 test1138 test1139 test1140 test1141 test1142 test1143 \
> - test1144 test1145 test1146 \
> -+test1152 \
> -+\
> - test1200 test1201 test1202 test1203 test1204 test1205 test1206 test1207 \
> - test1208 test1209 test1210 test1211 test1212 test1213 test1214 test1215 \
> - test1216 test1217 test1218 test1219 \
> -diff --git a/tests/data/test1152 b/tests/data/test1152
> -new file mode 100644
> -index 0000000..aa8c0a7
> ---- /dev/null
> -+++ b/tests/data/test1152
> -@@ -0,0 +1,61 @@
> -+<testcase>
> -+<info>
> -+<keywords>
> -+FTP
> -+PASV
> -+LIST
> -+</keywords>
> -+</info>
> -+#
> -+# Server-side
> -+<reply>
> -+<servercmd>
> -+REPLY PWD 257 "just one
> -+</servercmd>
> -+
> -+# When doing LIST, we get the default list output hard-coded in the test
> -+# FTP server
> -+<data mode="text">
> -+total 20
> -+drwxr-xr-x   8 98       98           512 Oct 22 13:06 .
> -+drwxr-xr-x   8 98       98           512 Oct 22 13:06 ..
> -+drwxr-xr-x   2 98       98           512 May  2  1996 curl-releases
> -+-r--r--r--   1 0        1             35 Jul 16  1996 README
> -+lrwxrwxrwx   1 0        1              7 Dec  9  1999 bin -> usr/bin
> -+dr-xr-xr-x   2 0        1            512 Oct  1  1997 dev
> -+drwxrwxrwx   2 98       98           512 May 29 16:04 download.html
> -+dr-xr-xr-x   2 0        1            512 Nov 30  1995 etc
> -+drwxrwxrwx   2 98       1            512 Oct 30 14:33 pub
> -+dr-xr-xr-x   5 0        1            512 Oct  1  1997 usr
> -+</data>
> -+</reply>
> -+
> -+#
> -+# Client-side
> -+<client>
> -+<server>
> -+ftp
> -+</server>
> -+ <name>
> -+FTP with uneven quote in PWD response
> -+ </name>
> -+ <command>
> -+ftp://%HOSTIP:%FTPPORT/test-1152/
> -+</command>
> -+</client>
> -+
> -+#
> -+# Verify data after the test has been "shot"
> -+<verify>
> -+<protocol>
> -+USER anonymous
> -+PASS ftp@example.com
> -+PWD
> -+CWD test-1152
> -+EPSV
> -+TYPE A
> -+LIST
> -+QUIT
> -+</protocol>
> -+</verify>
> -+</testcase>
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-support/curl/curl/reproducible-mkhelp.patch
> b/meta/recipes-support/curl/curl/reproducible-mkhelp.patch
> deleted file mode 100644
> index 268bbeb..0000000
> --- a/meta/recipes-support/curl/curl/reproducible-mkhelp.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 1fe92fd3dd64c7228f6ff41e3fc16c4f2392471a Mon Sep 17 00:00:00 2001
> -From: Juro Bystricky <juro.bystricky@intel.com>
> -Date: Fri, 27 Oct 2017 08:28:25 -0700
> -Subject: mkhelp.pl: support reproducible build
> -
> -Do not generate line with the current date, such as:
> -
> -* Generation time: Tue Oct-24 18:01:41 2017
> -
> -This will improve reproducibility. The generated string is only
> -part of a comment, so there should be no adverse consequences.
> -
> -Upstream-Status: Submitted [ https://github.com/curl/curl/pull/2026 ]
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -
> -diff --git a/src/mkhelp.pl b/src/mkhelp.pl
> -index 270daa2..757f024 100755
> ---- a/src/mkhelp.pl
> -+++ b/src/mkhelp.pl
> -@@ -102,11 +102,9 @@ while(<READ>) {
> - }
> - close(READ);
> -
> --$now = localtime;
> - print <<HEAD
> - /*
> -  * NEVER EVER edit this manually, fix the mkhelp.pl script instead!
> -- * Generation time: $now
> -  */
> - #ifdef USE_MANUAL
> - #include "tool_hugehelp.h"
> diff --git a/meta/recipes-support/curl/curl_7.54.1.bb
> b/meta/recipes-support/curl/curl_7.57.0.bb
> similarity index 86%
> rename from meta/recipes-support/curl/curl_7.54.1.bb
> rename to meta/recipes-support/curl/curl_7.57.0.bb
> index 58f0531..47e3d45 100644
> --- a/meta/recipes-support/curl/curl_7.54.1.bb
> +++ b/meta/recipes-support/curl/curl_7.57.0.bb
> @@ -7,23 +7,16 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=
> 3a34942f4ae3fbf1a303160714e66
>
>  SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://0001-replace-krb5-config-with-pkg-config.patch \
> -           file://CVE-2017-1000099.patch \
> -           file://CVE-2017-1000100.patch \
> -           file://CVE-2017-1000101.patch \
> -           file://CVE-2017-1000254.patch \
>  "
>
> -SRC_URI_append_class-target = " \
> -           file://reproducible-mkhelp.patch \
> -"
>
>  # curl likes to set -g0 in CFLAGS, so we stop it
>  # from mucking around with debug options
>  #
>  SRC_URI += " file://configure_ac.patch"
>
> -SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
> -SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770
> 046249263c491fcae48df0e1a3ca8f25a0"
> +SRC_URI[md5sum] = "dd3e22e923be17663e67f721c2aec054"
> +SRC_URI[sha256sum] = "c92fe31a348eae079121b73884065e
> 600c533493eb50f1f6cee9c48a3f454826"
>
>  CVE_PRODUCT = "libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
> @@ -64,9 +57,6 @@ EXTRA_OECONF = " \
>      --without-libpsl \
>  "
>
> -do_install_append() {
> -       oe_multilib_header curl/curlbuild.h
> -}
>
>  do_install_append_class-target() {
>         # cleanup buildpaths from curl-config
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--f403045fa74649e0600563b4560e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Be aware that this upgrade might change your libcurl5 to l=
ibcurl4<div><br></div><div>With Yocto 1.7 Dizzy we used to have libcurl5, b=
ecause of different=C2=A0SIZEOF_OFF_T value.</div><div><br></div><div>Then =
in Yocto 1.8 Fido SIZEOF_OFF_T was changed in oe-core and curl started to u=
se libcurl4 again automatically.<br><div><br></div><div>Back then I&#39;ve =
added simple workaround in our bbappend to keep libcurl5 (until we can rebu=
ild all prebuilt binaries from 3rd party vendors):</div><div><br></div><div=
><div># Force to use libcurl5 instead of libcurl4 (like we had with Yocto 1=
.7 Dizzy)</div><div># The SONAME isn&#39;t bumped automatically since oe-co=
re commit 49c848018484827c433e1bcf9c63416640456f3e</div><div># which change=
d SIZEOF_OFF_T to 8</div><div>EXTRA_OECONF +=3D &quot;--enable-soname-bump&=
quot;</div></div><div><br></div><div>and it was working fine until this upg=
rade to=C2=A07.57.0. I haven&#39;t checked yet why enable-soname-bump stopp=
ed working (it&#39;s still recognized by configure script).</div><div><br><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri=
, Jan 26, 2018 at 2:10 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@git=
.openembedded.org" target=3D"_blank">git@git.openembedded.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This is an automated email from =
the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 215d5677004537fc190b5381157ac8<wbr>b94db6d7e8<br>
Author: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com">huang=
qy.fnst@cn.fujitsu.com</a>&gt;<br>
AuthorDate: Wed Jan 24 11:01:36 2018 +0800<br>
<br>
=C2=A0 =C2=A0 curl: 7.54.1 -&gt; 7.57.0<br>
<br>
=C2=A0 =C2=A0 1.Upgrade curl from 7.54.1 to 7.57.0.<br>
=C2=A0 =C2=A0 2.Delete CVE-2017-1000099.patch, CVE-2017-1000100.patch, CVE-=
2017-1000101.patch, CVE-2017-1000254.patch, reproducible-mkhelp.patch, sinc=
e it is integrated upstream.<br>
=C2=A0 =C2=A0 3.Remove &quot;do_install_append()&quot; from <a href=3D"http=
://curl_7.57.0.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.57.0.bb</a>,=
 since curl/curlbuild.h has been removed.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@=
cn.fujitsu.com">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0.../curl/curl/CVE-2017-<wbr>1000099.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 ------<br>
=C2=A0.../curl/curl/CVE-2017-<wbr>1000100.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 51 --------<br>
=C2=A0.../curl/curl/CVE-2017-<wbr>1000101.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 99 ---------------<br>
=C2=A0.../curl/curl/CVE-2017-<wbr>1000254.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 138 ---------------------<br>
=C2=A0.../curl/curl/reproducible-<wbr>mkhelp.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 32 -----<br>
=C2=A0.../curl/{<a href=3D"http://curl_7.54.1.bb" rel=3D"noreferrer" target=
=3D"_blank">curl_7.54.1.bb</a> =3D&gt; <a href=3D"http://curl_7.57.0.bb" re=
l=3D"noreferrer" target=3D"_blank">curl_7.57.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 14 +--<br>
=C2=A06 files changed, 2 insertions(+), 373 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000099.patch b/m=
eta/recipes-support/curl/<wbr>curl/CVE-2017-1000099.patch<br>
deleted file mode 100644<br>
index 96ff1b0..0000000<br>
--- a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000099.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From c9332fa5e84f24da300b42b1a931ad<wbr>e929d3e27d Mon Sep 17 00:00:00 200=
1<br>
-From: Even Rouault &lt;<a href=3D"mailto:even.rouault@spatialys.com">even.=
rouault@spatialys.com</a>&gt;<br>
-Date: Tue, 1 Aug 2017 17:17:06 +0200<br>
-Subject: [PATCH] file: output the correct buffer to the user<br>
-<br>
-Regression brought by 7c312f84ea930d8 (April 2017)<br>
-<br>
-CVE: CVE-2017-1000099<br>
-<br>
-Bug: <a href=3D"https://curl.haxx.se/docs/adv_20170809C.html" rel=3D"noref=
errer" target=3D"_blank">https://curl.haxx.se/docs/adv_<wbr>20170809C.html<=
/a><br>
-<br>
-Credit to OSS-Fuzz for the discovery<br>
-<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/curl/curl/commit/c9332fa5e84f24da300b42b1a93=
1ade929d3e27d" rel=3D"noreferrer" target=3D"_blank">https://github.com/curl=
/curl/<wbr>commit/<wbr>c9332fa5e84f24da300b42b1a931ad<wbr>e929d3e27d</a><br=
>
-<br>
-Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com=
">wenzong.fan@windriver.com</a>&gt;<br>
----<br>
- lib/file.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/lib/file.c b/lib/file.c<br>
-index bd426eac2..666cbe75b 100644<br>
---- a/lib/file.c<br>
-+++ b/lib/file.c<br>
-@@ -499,11 +499,11 @@ static CURLcode file_do(struct connectdata *conn, bo=
ol *done)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Curl_month[tm-&gt;tm_mon]=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm-&gt;tm_year + 1900,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm-&gt;tm_hour,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm-&gt;tm_min,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm-&gt;tm_sec);<br>
--=C2=A0 =C2=A0 result =3D Curl_client_write(conn, CLIENTWRITE_BOTH, buf, 0=
);<br>
-+=C2=A0 =C2=A0 result =3D Curl_client_write(conn, CLIENTWRITE_BOTH, header=
, 0);<br>
-=C2=A0 =C2=A0 =C2=A0if(!result)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* set the file size to make it available post =
transfer */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_pgrsSetDownloadSize(data, expected_size);<=
br>
-=C2=A0 =C2=A0 =C2=A0return result;<br>
-=C2=A0 =C2=A0}<br>
---<br>
-2.13.3<br>
-<br>
diff --git a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000100.patch b/m=
eta/recipes-support/curl/<wbr>curl/CVE-2017-1000100.patch<br>
deleted file mode 100644<br>
index f74f1dd..0000000<br>
--- a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000100.patch<br>
+++ /dev/null<br>
@@ -1,51 +0,0 @@<br>
-From 358b2b131ad6c095696f20dcfa62b8<wbr>305263f898 Mon Sep 17 00:00:00 200=
1<br>
-From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se">daniel@haxx.se=
</a>&gt;<br>
-Date: Tue, 1 Aug 2017 17:16:46 +0200<br>
-Subject: [PATCH] tftp: reject file name lengths that don&#39;t fit<br>
-<br>
-... and thereby avoid telling send() to send off more bytes than the<br>
-size of the buffer!<br>
-<br>
-CVE: CVE-2017-1000100<br>
-<br>
-Bug: <a href=3D"https://curl.haxx.se/docs/adv_20170809B.html" rel=3D"noref=
errer" target=3D"_blank">https://curl.haxx.se/docs/adv_<wbr>20170809B.html<=
/a><br>
-Reported-by: Even Rouault<br>
-<br>
-Credit to OSS-Fuzz for the discovery<br>
-<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/curl/curl/commit/358b2b131ad6c095696f20dcfa6=
2b8305263f898" rel=3D"noreferrer" target=3D"_blank">https://github.com/curl=
/curl/<wbr>commit/<wbr>358b2b131ad6c095696f20dcfa62b8<wbr>305263f898</a><br=
>
-<br>
-Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com=
">wenzong.fan@windriver.com</a>&gt;<br>
----<br>
- lib/tftp.c |=C2=A0 =C2=A0 7 ++++++-<br>
- 1 file changed, 6 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/lib/tftp.c b/lib/tftp.c<br>
-index 02bd842..f6f4bce 100644<br>
---- a/lib/tftp.c<br>
-+++ b/lib/tftp.c<br>
-@@ -5,7 +5,7 @@<br>
-=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (__| |_| |=C2=A0 _ &lt;| |___<br>
-=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\___|\___/|_| \_\_____|<br>
-=C2=A0 *<br>
-- * Copyright (C) 1998 - 2016, Daniel Stenberg, &lt;<a href=3D"mailto:dani=
el@haxx.se">daniel@haxx.se</a>&gt;, et al.<br>
-+ * Copyright (C) 1998 - 2017, Daniel Stenberg, &lt;<a href=3D"mailto:dani=
el@haxx.se">daniel@haxx.se</a>&gt;, et al.<br>
-=C2=A0 *<br>
-=C2=A0 * This software is licensed as described in the file COPYING, which=
<br>
-=C2=A0 * you should have received as part of this distribution. The terms<=
br>
-@@ -491,6 +491,11 @@ static CURLcode tftp_send_first(tftp_state_<wbr>data_=
t *state, tftp_event_t event)<br>
-=C2=A0 =C2=A0 =C2=A0if(result)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
-<br>
-+=C2=A0 =C2=A0 if(strlen(filename) &gt; (state-&gt;blksize - strlen(mode) =
- 4)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 failf(data, &quot;TFTP file name too long\n&quot;);<=
br>
-+=C2=A0 =C2=A0 =C2=A0 return CURLE_TFTP_ILLEGAL; /* too long file name fie=
ld */<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0snprintf((char *)state-&gt;spacket.data+2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;blksize,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s%c%s%c&quot;, fil=
ename, &#39;\0&#39;,=C2=A0 mode, &#39;\0&#39;);<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000101.patch b/m=
eta/recipes-support/curl/<wbr>curl/CVE-2017-1000101.patch<br>
deleted file mode 100644<br>
index c300fff..0000000<br>
--- a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000101.patch<br>
+++ /dev/null<br>
@@ -1,99 +0,0 @@<br>
-From 453e7a7a03a2cec749abd3878a48e7<wbr>28c515cca7 Mon Sep 17 00:00:00 200=
1<br>
-From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se">daniel@haxx.se=
</a>&gt;<br>
-Date: Tue, 1 Aug 2017 17:16:07 +0200<br>
-Subject: [PATCH] glob: do not continue parsing after a strtoul() overflow<=
br>
- range<br>
-<br>
-Added test 1289 to verify.<br>
-<br>
-CVE: CVE-2017-1000101<br>
-<br>
-Bug: <a href=3D"https://curl.haxx.se/docs/adv_20170809A.html" rel=3D"noref=
errer" target=3D"_blank">https://curl.haxx.se/docs/adv_<wbr>20170809A.html<=
/a><br>
-Reported-by: Brian Carpenter<br>
-<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://github.com/curl/curl/commit/453e7a7a03a2cec749abd3878a4=
8e728c515cca7" rel=3D"noreferrer" target=3D"_blank">https://github.com/curl=
/curl/<wbr>commit/<wbr>453e7a7a03a2cec749abd3878a48e7<wbr>28c515cca7</a><br=
>
-<br>
-Rebase the tests/data/Makefile.inc changes for curl 7.54.1.<br>
-<br>
-Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com=
">wenzong.fan@windriver.com</a>&gt;<br>
----<br>
- src/tool_urlglob.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
- tests/data/Makefile.inc |=C2=A0 2 +-<br>
- tests/data/test1289=C2=A0 =C2=A0 =C2=A0| 35 +++++++++++++++++++++++++++++=
+<wbr>+++++<br>
- 3 files changed, 40 insertions(+), 2 deletions(-)<br>
- create mode 100644 tests/data/test1289<br>
-<br>
-diff --git a/src/tool_urlglob.c b/src/tool_urlglob.c<br>
-index 6b1ece0..d56dcd9 100644<br>
---- a/src/tool_urlglob.c<br>
-+++ b/src/tool_urlglob.c<br>
-@@ -273,7 +273,10 @@ static CURLcode glob_range(URLGlob *glob, char **patt=
ernp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_n =3D strtoul(pattern, &amp;endp, 10=
);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(errno || (*endp =3D=3D &#39;:&#39;)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(errno)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* overflow */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endp =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if(*endp =3D=3D &#39;:&#39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattern =3D endp+1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0step_n =3D strtoul(pattern, &amp;=
endp, 10);<br>
-diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc<br>
-index 155320a..7adbee6 100644<br>
---- a/tests/data/Makefile.inc<br>
-+++ b/tests/data/Makefile.inc<br>
-@@ -132,7 +132,7 @@ test1252 test1253 test1254 test1255 test1256 test1257 =
test1258 test1259 \<br>
- test1260 test1261 test1262 \<br>
- \<br>
- test1280 test1281 test1282 test1283 test1284 test1285 test1286 test1287 \=
<br>
--test1288 \<br>
-+test1288 test1289 \<br>
- \<br>
- test1300 test1301 test1302 test1303 test1304 test1305 test1306 test1307 \=
<br>
- test1308 test1309 test1310 test1311 test1312 test1313 test1314 test1315 \=
<br>
-diff --git a/tests/data/test1289 b/tests/data/test1289<br>
-new file mode 100644<br>
-index 0000000..d679cc0<br>
---- /dev/null<br>
-+++ b/tests/data/test1289<br>
-@@ -0,0 +1,35 @@<br>
-+&lt;testcase&gt;<br>
-+&lt;info&gt;<br>
-+&lt;keywords&gt;<br>
-+HTTP<br>
-+HTTP GET<br>
-+globbing<br>
-+&lt;/keywords&gt;<br>
-+&lt;/info&gt;<br>
-+<br>
-+#<br>
-+# Server-side<br>
-+&lt;reply&gt;<br>
-+&lt;/reply&gt;<br>
-+<br>
-+# Client-side<br>
-+&lt;client&gt;<br>
-+&lt;server&gt;<br>
-+http<br>
-+&lt;/server&gt;<br>
-+&lt;name&gt;<br>
-+globbing with overflow and bad syntxx<br>
-+&lt;/name&gt;<br>
-+&lt;command&gt;<br>
-+<a href=3D"http://ur" rel=3D"noreferrer" target=3D"_blank">http://ur</a>%=
20[0-<wbr>60000000000000000000<br>
-+&lt;/command&gt;<br>
-+&lt;/client&gt;<br>
-+<br>
-+# Verify data after the test has been &quot;shot&quot;<br>
-+&lt;verify&gt;<br>
-+# curl: (3) [globbing] bad range in column<br>
-+&lt;errorcode&gt;<br>
-+3<br>
-+&lt;/errorcode&gt;<br>
-+&lt;/verify&gt;<br>
-+&lt;/testcase&gt;<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000254.patch b/m=
eta/recipes-support/curl/<wbr>curl/CVE-2017-1000254.patch<br>
deleted file mode 100644<br>
index 2b0798b..0000000<br>
--- a/meta/recipes-support/curl/<wbr>curl/CVE-2017-1000254.patch<br>
+++ /dev/null<br>
@@ -1,138 +0,0 @@<br>
-From 1b2eba6f9745c064f7283e0ada8f46<wbr>df9d9d6e42 Mon Sep 17 00:00:00 200=
1<br>
-From: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zhou@windriv=
er.com</a>&gt;<br>
-Date: Mon, 23 Oct 2017 00:26:50 -0700<br>
-Subject: [PATCH] FTP: zero terminate the entry path even on bad input<br>
-<br>
-... a single double quote could leave the entry path buffer without a zero=
<br>
-terminating byte. CVE-2017-1000254<br>
-<br>
-Test 1152 added to verify.<br>
-<br>
-Reported-by: Max Dymond<br>
-Bug: <a href=3D"https://curl.haxx.se/docs/adv_20171004.html" rel=3D"norefe=
rrer" target=3D"_blank">https://curl.haxx.se/docs/adv_<wbr>20171004.html</a=
><br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2017-1000254<br>
-Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zho=
u@windriver.com</a>&gt;<br>
----<br>
- lib/ftp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7=
 ++++--<br>
- tests/data/Makefile.inc |=C2=A0 2 ++<br>
- tests/data/test1152=C2=A0 =C2=A0 =C2=A0| 61 +++++++++++++++++++++++++++++=
+<wbr>+++++++++++++++++++<br>
- 3 files changed, 68 insertions(+), 2 deletions(-)<br>
- create mode 100644 tests/data/test1152<br>
-<br>
-diff --git a/lib/ftp.c b/lib/ftp.c<br>
-index 5edec37..493dbf9 100644<br>
---- a/lib/ftp.c<br>
-+++ b/lib/ftp.c<br>
-@@ -2826,6 +2826,7 @@ static CURLcode ftp_statemach_act(struct connectdata=
 *conn)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const size_t buf_size =3D data-&gt;set.b=
uffer_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *dir;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *store;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool entry_extracted =3D FALSE;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dir =3D malloc(nread + 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!dir)<br>
-@@ -2857,7 +2858,7 @@ static CURLcode ftp_statemach_act(struct connectdata=
 *conn)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* end of pa=
th */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *store =3D &#39;\=
0&#39;; /* zero terminate */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry_extracted =
=3D TRUE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break; /* ge=
t out of this loop */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2866,7 +2867,9 @@ static CURLcode ftp_statemach_act(struct connectdata=
 *conn)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0store++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *store =3D &#39;\0&#39;; /* zero termi=
nate */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(entry_extracted) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the path name does not look=
 like an absolute path (i.e.: it<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 does not start with a &#3=
9;/&#39;), we probably need some server-dependent<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjustments. For example,=
 this is the case when connecting to<br>
-diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc<br>
-index 7adbee6..5284654 100644<br>
---- a/tests/data/Makefile.inc<br>
-+++ b/tests/data/Makefile.inc<br>
-@@ -121,6 +121,8 @@ test1120 test1121 test1122 test1123 test1124 test1125 =
test1126 test1127 \<br>
- test1128 test1129 test1130 test1131 test1132 test1133 test1134 test1135 \=
<br>
- test1136 test1137 test1138 test1139 test1140 test1141 test1142 test1143 \=
<br>
- test1144 test1145 test1146 \<br>
-+test1152 \<br>
-+\<br>
- test1200 test1201 test1202 test1203 test1204 test1205 test1206 test1207 \=
<br>
- test1208 test1209 test1210 test1211 test1212 test1213 test1214 test1215 \=
<br>
- test1216 test1217 test1218 test1219 \<br>
-diff --git a/tests/data/test1152 b/tests/data/test1152<br>
-new file mode 100644<br>
-index 0000000..aa8c0a7<br>
---- /dev/null<br>
-+++ b/tests/data/test1152<br>
-@@ -0,0 +1,61 @@<br>
-+&lt;testcase&gt;<br>
-+&lt;info&gt;<br>
-+&lt;keywords&gt;<br>
-+FTP<br>
-+PASV<br>
-+LIST<br>
-+&lt;/keywords&gt;<br>
-+&lt;/info&gt;<br>
-+#<br>
-+# Server-side<br>
-+&lt;reply&gt;<br>
-+&lt;servercmd&gt;<br>
-+REPLY PWD 257 &quot;just one<br>
-+&lt;/servercmd&gt;<br>
-+<br>
-+# When doing LIST, we get the default list output hard-coded in the test<=
br>
-+# FTP server<br>
-+&lt;data mode=3D&quot;text&quot;&gt;<br>
-+total 20<br>
-+drwxr-xr-x=C2=A0 =C2=A08 98=C2=A0 =C2=A0 =C2=A0 =C2=A098=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0512 Oct 22 13:06 .<br>
-+drwxr-xr-x=C2=A0 =C2=A08 98=C2=A0 =C2=A0 =C2=A0 =C2=A098=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0512 Oct 22 13:06 ..<br>
-+drwxr-xr-x=C2=A0 =C2=A02 98=C2=A0 =C2=A0 =C2=A0 =C2=A098=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0512 May=C2=A0 2=C2=A0 1996 curl-releases<br>
-+-r--r--r--=C2=A0 =C2=A01 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A035 Jul 16=C2=A0 1996 README<br>
-+lrwxrwxrwx=C2=A0 =C2=A01 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 Dec=C2=A0 9=C2=A0 1999 bin -&gt; usr/bin<=
br>
-+dr-xr-xr-x=C2=A0 =C2=A02 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 512 Oct=C2=A0 1=C2=A0 1997 dev<br>
-+drwxrwxrwx=C2=A0 =C2=A02 98=C2=A0 =C2=A0 =C2=A0 =C2=A098=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0512 May 29 16:04 download.html<br>
-+dr-xr-xr-x=C2=A0 =C2=A02 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 512 Nov 30=C2=A0 1995 etc<br>
-+drwxrwxrwx=C2=A0 =C2=A02 98=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 512 Oct 30 14:33 pub<br>
-+dr-xr-xr-x=C2=A0 =C2=A05 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 512 Oct=C2=A0 1=C2=A0 1997 usr<br>
-+&lt;/data&gt;<br>
-+&lt;/reply&gt;<br>
-+<br>
-+#<br>
-+# Client-side<br>
-+&lt;client&gt;<br>
-+&lt;server&gt;<br>
-+ftp<br>
-+&lt;/server&gt;<br>
-+ &lt;name&gt;<br>
-+FTP with uneven quote in PWD response<br>
-+ &lt;/name&gt;<br>
-+ &lt;command&gt;<br>
-+ftp://%HOSTIP:%FTPPORT/test-<wbr>1152/<br>
-+&lt;/command&gt;<br>
-+&lt;/client&gt;<br>
-+<br>
-+#<br>
-+# Verify data after the test has been &quot;shot&quot;<br>
-+&lt;verify&gt;<br>
-+&lt;protocol&gt;<br>
-+USER anonymous<br>
-+PASS <a href=3D"mailto:ftp@example.com">ftp@example.com</a><br>
-+PWD<br>
-+CWD test-1152<br>
-+EPSV<br>
-+TYPE A<br>
-+LIST<br>
-+QUIT<br>
-+&lt;/protocol&gt;<br>
-+&lt;/verify&gt;<br>
-+&lt;/testcase&gt;<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-support/curl/<wbr>curl/reproducible-mkhelp.patch =
b/meta/recipes-support/curl/<wbr>curl/reproducible-mkhelp.patch<br>
deleted file mode 100644<br>
index 268bbeb..0000000<br>
--- a/meta/recipes-support/curl/<wbr>curl/reproducible-mkhelp.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 1fe92fd3dd64c7228f6ff41e3fc16c<wbr>4f2392471a Mon Sep 17 00:00:00 200=
1<br>
-From: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro.=
bystricky@intel.com</a>&gt;<br>
-Date: Fri, 27 Oct 2017 08:28:25 -0700<br>
-Subject: <a href=3D"http://mkhelp.pl" rel=3D"noreferrer" target=3D"_blank"=
>mkhelp.pl</a>: support reproducible build<br>
-<br>
-Do not generate line with the current date, such as:<br>
-<br>
-* Generation time: Tue Oct-24 18:01:41 2017<br>
-<br>
-This will improve reproducibility. The generated string is only<br>
-part of a comment, so there should be no adverse consequences.<br>
-<br>
-Upstream-Status: Submitted [ <a href=3D"https://github.com/curl/curl/pull/=
2026" rel=3D"noreferrer" target=3D"_blank">https://github.com/curl/curl/<wb=
r>pull/2026</a> ]<br>
-<br>
-Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om">juro.bystricky@intel.com</a>&gt;<br>
-<br>
-diff --git a/src/<a href=3D"http://mkhelp.pl" rel=3D"noreferrer" target=3D=
"_blank">mkhelp.pl</a> b/src/<a href=3D"http://mkhelp.pl" rel=3D"noreferrer=
" target=3D"_blank">mkhelp.pl</a><br>
-index 270daa2..757f024 100755<br>
---- a/src/<a href=3D"http://mkhelp.pl" rel=3D"noreferrer" target=3D"_blank=
">mkhelp.pl</a><br>
-+++ b/src/<a href=3D"http://mkhelp.pl" rel=3D"noreferrer" target=3D"_blank=
">mkhelp.pl</a><br>
-@@ -102,11 +102,9 @@ while(&lt;READ&gt;) {<br>
- }<br>
- close(READ);<br>
-<br>
--$now =3D localtime;<br>
- print &lt;&lt;HEAD<br>
- /*<br>
-=C2=A0 * NEVER EVER edit this manually, fix the <a href=3D"http://mkhelp.p=
l" rel=3D"noreferrer" target=3D"_blank">mkhelp.pl</a> script instead!<br>
-- * Generation time: $now<br>
-=C2=A0 */<br>
- #ifdef USE_MANUAL<br>
- #include &quot;tool_hugehelp.h&quot;<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" re=
l=3D"noreferrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.57.0.bb" rel=3D"noreferrer" target=3D"=
_blank">cu<wbr>rl_7.57.0.bb</a><br>
similarity index 86%<br>
rename from meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.54.1.bb</a><br>
rename to meta/recipes-support/curl/<a href=3D"http://curl_7.57.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl<wbr>_7.57.0.bb</a><br>
index 58f0531..47e3d45 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_7.54.1.bb" rel=3D"no=
referrer" target=3D"_blank">cu<wbr>rl_7.54.1.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.57.0.bb" rel=3D"no=
referrer" target=3D"_blank">cu<wbr>rl_7.57.0.bb</a><br>
@@ -7,23 +7,16 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;beginline=3D8;<=
wbr>md5=3D<wbr>3a34942f4ae3fbf1a303160714e66<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://curl.haxx.se/download/curl-${PV}.=
tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://curl.haxx.se/download/=
<wbr>curl-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-replace-krb5-<wbr>con=
fig-with-pkg-config.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000099.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000100.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000101.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2017-1000254.patch \<b=
r>
=C2=A0&quot;<br>
<br>
-SRC_URI_append_class-target =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reproducible-mkhelp.<wbr>p=
atch \<br>
-&quot;<br>
<br>
=C2=A0# curl likes to set -g0 in CFLAGS, so we stop it<br>
=C2=A0# from mucking around with debug options<br>
=C2=A0#<br>
=C2=A0SRC_URI +=3D &quot; file://configure_ac.patch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>6b6eb722f512e7a24855ff084f54fe<wbr>55&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>fdfc4df2d001ee0c44ec071186e770<wbr>04624=
9263c491fcae48df0e1a3ca8f<wbr>25a0&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>dd3e22e923be17663e67f721c2aec0<wbr>54&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c92fe31a348eae079121b73884065e<wbr>600c5=
33493eb50f1f6cee9c48a3f45<wbr>4826&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;libcurl&quot;<br>
=C2=A0inherit autotools pkgconfig binconfig multilib_header<br>
@@ -64,9 +57,6 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--without-libpsl \<br>
=C2=A0&quot;<br>
<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header curl/curlbuild.h<br>
-}<br>
<br>
=C2=A0do_install_append_class-<wbr>target() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cleanup buildpaths from curl-config<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div></div>

--f403045fa74649e0600563b4560e--
