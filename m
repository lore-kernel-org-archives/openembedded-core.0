Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15002.1795515244754068773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d381nTYG;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9543; q=dns/txt;
  s=iport01; t=1795515244; x=1796724844;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mN0Dj1sA4QLJWittqCf/XEUXFyYDz0YmZ1A7YnznCU4=;
  b=d381nTYGFzrdKI4BCnuYeT49zTSURk+ABuwBO5P/FVpIhEWhxDtMB1T9
   ihCrzjDLkkFKuheoPxYrZdlDyKW8MmydyR6JgnxoWgBn2edY78Q8q65/P
   CYOO21A+kculY13RQYqXRz5cb5ax/Mzg5jQwm4WZTU7sX/y+9VTrrCU0q
   pRx3wumchwbkUSpYPltb1FWOfRpXVX5/LLBSFYwI+ZRFThcY+IOFvtN/z
   rXguxxIKfp9lfR5Vtd5TvoCsqabenkPWyp1gC9Czg6abI6LhbMu0QOTsV
   0UwP2D6uw9lZFQUU0Rl4tHehRjuNIDY06wjQH2obsXNoMW0w7mILdhOGy
   Q==;
X-CSE-ConnectionGUID: qhBRN2mcTsq3A2Kx0ZpUcg==
X-CSE-MsgGUID: GIJ6YP+CTNega1on+uUNzQ==
X-IPAS-Result: =?us-ascii?q?A0ACAACgYgVr/8pK/pBaGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfAQBAQEBAQsBglZ1YENJjHKJWYEWnRYUgWoPAQEBD?=
 =?us-ascii?q?0QNBAEBgXEBIIJzjiQCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nd4ZjiDgBAgEqCwEYAS0sAwECWiMhgwIBgnQDEQa6BRs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMwELFAGBOAGFQYgkXRgBhH0nGxuBcoEVgnR2gQWBMioCA?=
 =?us-ascii?q?YEiJYZeBIIigQyBVB4xMwmMDAKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKg?=
 =?us-ascii?q?QwnHx4bDgIfEAYWIQsbGA1IESw3FRkEPm4HlBSCbS0BMCkGASEMAQciAhcYY?=
 =?us-ascii?q?gpiBTsLHooriEmQJoIhgTWfXAoog3mMJJU6GjOFW6UXC5h9jgqWAgJNhGqBa?=
 =?us-ascii?q?DyBWXAVgyIJFjQZD445ggOBaIRQcX/IGyYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:W6vZ+qCw/7wKKhVW/33iw5YqxClBgxIJ4kV8jS/XYbTApGh3hjIFy
 2JJWT3UOveLNjSnLYtwbIqw9h9TvJWDm9IyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/h2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2vVENmdsOIYk4f8sKDtt5
 aQqMA0GYUXW7w626OrTpuhEj8k5ac2uN4QFtzQ4lHfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWAHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237klYui+e0aIC9ltqiauR3wHeg5
 Un62Wn2C0gdMp+C9ByXyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnUjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:4omaba26DWQ4dpKwMduG9AqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: 9a23:d/cBcm/s9t506nnMlhCVv1cUMPoDKHjW8GzJeGbiKnYxeqWoQlDFrQ==
X-Talos-MUID: 9a23:J4K6iAVdybP5GJXq/BDNpm9TDIRD34KjB0lUlpNFpvSiJxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62737102"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:14:00 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id 1DCF934433;
	Tue, 24 Nov 2026 10:14:00 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B7055CC1611; Tue, 24 Nov 2026 02:13:58 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 10/12] curl: fix CVE-2026-87865
Date: Tue, 24 Nov 2026 02:13:55 -0800
Message-Id: <20261124101355.419134-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250999
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Match hashed known_hosts entries against the requested host before
selecting the host-key algorithm. Adapt the connection fields and
SSH test fixture to curl 8.19.0.

Retain test3500 and install test3500.pl into ptest so the hashed-host
regression can run from the target package.

[1] https://github.com/curl/curl/commit/323c184b6bdf5b1988a10c0a61560666e1588149
[2] https://curl.se/docs/CVE-2026-87865.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Drop the performance-only follow-up (_p2), as requested.
- Remove the optional local cherry-pick footer and extra final blank.
---
 .../curl/curl/CVE-2026-87865.patch            | 224 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   3 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865.patch b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
new file mode 100644
index 0000000000..c0135c8a31
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
@@ -0,0 +1,224 @@
+From 323c184b6bdf5b1988a10c0a61560666e1588149 Mon Sep 17 00:00:00 2001
+From: Bobbeh Rhino <bobbeh@rhino.Rhino>
+Date: Tue, 8 Sep 2026 06:33:27 -0400
+Subject: [PATCH] libssh2: match hashed known_hosts entries by host
+
+libssh2 does not expose the plaintext name for hashed entries. Check
+each entry key against the requested hostname before using its key type.
+Otherwise an unrelated hashed entry can select the wrong algorithm.
+
+Add an SFTP regression test 3500 with an unrelated hashed entry before
+the requested host.
+
+Closes #22874
+
+CVE: CVE-2026-87865
+Upstream-Status: Backport [https://github.com/curl/curl/commit/323c184b6bdf5b1988a10c0a61560666e1588149]
+
+Backport Changes:
+- Use curl 8.19.0's conn->host.name and conn->remote_port instead of
+  conn->origin->hostname and conn->origin->port. The older connection
+  has no origin pointer; preserve the -1 lookup port for port 22.
+- Register test3500 and test3500.pl in the older grouped TESTCASES
+  and EXTRA_DIST lists.
+- Use curl_host_rsa_key.pub in test3500's precheck; curl 8.19.0
+  generates that filename rather than the newer curl_host_key.pub.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/vssh/libssh2.c        | 16 +++++++--
+ tests/data/Makefile.am    |  2 ++
+ tests/data/test3500       | 47 +++++++++++++++++++++++++
+ tests/libtest/Makefile.am |  3 +-
+ tests/libtest/test3500.pl | 72 +++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 136 insertions(+), 4 deletions(-)
+ create mode 100644 tests/data/test3500
+ create mode 100755 tests/libtest/test3500.pl
+
+diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
+index 3c25fe7..7c18ff4 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -654,9 +654,19 @@ static CURLcode ssh_force_knownhost_key_type(struct Curl_easy *data,
+             break;
+           }
+         }
+-        else {
+-          found = TRUE;
+-          break;
++        else if(store->key) {
++          int keycheck = libssh2_knownhost_checkp(
++            sshc->kh, conn->host.name,
++            (conn->remote_port != PORT_SSH) ? conn->remote_port : -1,
++            store->key, strlen(store->key),
++            LIBSSH2_KNOWNHOST_TYPE_PLAIN |
++              LIBSSH2_KNOWNHOST_KEYENC_BASE64 |
++              (store->typemask & LIBSSH2_KNOWNHOST_KEY_MASK),
++            NULL);
++          if(keycheck == LIBSSH2_KNOWNHOST_CHECK_MATCH) {
++            found = TRUE;
++            break;
++          }
+         }
+       }
+     }
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 9fd7ee7..7a9b8d0 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -287,6 +287,8 @@ test3209 test3210 test3211 test3212 test3213 test3214 test3215 test3216 \
+ \
+ test3303 test3304 \
+ \
++test3500 \
++\
+ test4000 test4001
+ 
+ EXTRA_DIST = $(TESTCASES) DISABLED data-xml1 data320.html \
+diff --git a/tests/data/test3500 b/tests/data/test3500
+new file mode 100644
+index 0000000..86f0c43
+--- /dev/null
++++ b/tests/data/test3500
+@@ -0,0 +1,47 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++SFTP
++known_hosts
++libssh2
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data>
++Test data
++for hashed known hosts
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++sftp
++</server>
++<features>
++sftp
++libssh2
++!badlibssh
++</features>
++<precheck>
++%PERL %SRCDIR/libtest/test3500.pl %LOGDIR/server/curl_host_rsa_key.pub %LOGDIR/known%TESTNUMBER "[%HOSTIP]:%SSHPORT"
++</precheck>
++<name>
++SFTP matches requested hashed known_hosts entry
++</name>
++<command>
++--knownhosts %LOGDIR/known%TESTNUMBER --key %LOGDIR/server/curl_client_key --pubkey %LOGDIR/server/curl_client_key.pub -u %USER: sftp://%HOSTIP:%SSHPORT%SFTP_PWD/%LOGDIR/file%TESTNUMBER.txt
++</command>
++<file name="%LOGDIR/file%TESTNUMBER.txt">
++Test data
++for hashed known hosts
++</file>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.am b/tests/libtest/Makefile.am
+index e174698..82dbc62 100644
+--- a/tests/libtest/Makefile.am
++++ b/tests/libtest/Makefile.am
+@@ -44,7 +44,8 @@ AM_CPPFLAGS = -I$(top_srcdir)/include        \
+ include Makefile.inc
+ 
+ EXTRA_DIST = CMakeLists.txt $(FIRST_C) $(FIRST_H) $(UTILS_C) $(UTILS_H) $(TESTS_C) \
+-  test307.pl test610.pl test613.pl test1013.pl test1022.pl mk-lib1521.pl
++  test307.pl test610.pl test613.pl test1013.pl test1022.pl mk-lib1521.pl \
++  test3500.pl
+ 
+ CFLAGS += @CURL_CFLAG_EXTRAS@
+ 
+diff --git a/tests/libtest/test3500.pl b/tests/libtest/test3500.pl
+new file mode 100755
+index 0000000..d95f54c
+--- /dev/null
++++ b/tests/libtest/test3500.pl
+@@ -0,0 +1,72 @@
++#!/usr/bin/env perl
++#***************************************************************************
++#                                  _   _ ____  _
++#  Project                     ___| | | |  _ \| |
++#                             / __| | | | |_) | |
++#                            | (__| |_| |  _ <| |___
++#                             \___|\___/|_| \_\_____|
++#
++# Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
++#
++# This software is licensed as described in the file COPYING, which
++# you should have received as part of this distribution. The terms
++# are also available at https://curl.se/docs/copyright.html.
++#
++# You may opt to use, copy, modify, merge, publish, distribute and/or sell
++# copies of the Software, and permit persons to whom the Software is
++# furnished to do so, under the terms of the COPYING file.
++#
++# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++# KIND, either express or implied.
++#
++# SPDX-License-Identifier: curl
++#
++###########################################################################
++use strict;
++use warnings;
++
++use Digest::SHA qw(hmac_sha1);
++use MIME::Base64 qw(encode_base64);
++
++sub errout {
++    print $_[0] . "\n";
++    exit 1;
++}
++
++if(@ARGV != 3) {
++    errout "Usage: $0 host-public-key known-hosts-file target";
++}
++
++my ($hostkey_file, $knownhosts_file, $target) = @ARGV;
++open(my $hostkey, "<", $hostkey_file) or errout "$!";
++my $hostkey_line = <$hostkey>;
++close($hostkey) or errout "$!";
++
++my ($hostkey_algo, $hostkey_data) = split(/\s+/, $hostkey_line);
++if(!$hostkey_algo || !$hostkey_data) {
++    errout "Failed parsing SSH host public key";
++}
++
++my $rsa_key =
++    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgSyqrUP2xhqLqkyopVapoKeucYIp" .
++    "ZXeUqj+Q9WLWyXka5re62Y3R/lxZUXtkJjlpdD2LNMFenNlDQvPaXH5Utllt+c3z" .
++    "wOkOLy7RXX5S37SfQFm/0fPkZqoZfMDB6XDcwA4cakjCRn4oZyKs8dWAxoNaTtYc" .
++    "nKKMJ6rmc8PttykJw9fwiKAjPyYf21/BMvWIzu9req+TrDA/Jcd2UAug94CikJIX" .
++    "uwKmSYleAOo4eJWx8GyujgEgZn05eq+K1LSg9RqRVIxOdqjoE5K3abBfs0rmUuLd" .
++    "MFh7nHseTFXYbKzpz46V7iZMfFuoyURrzVsqGUm+/m7dxBM98In12kOm3";
++my $ed25519_key =
++    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqmXRY8k+W9GtpWxYru6ELAXYHdXq" .
++    "jf33ziITGTiJUN";
++my $other_key = $hostkey_algo eq "ssh-ed25519" ? $rsa_key : $ed25519_key;
++
++my $salt = "curl-knownhosts-test";
++my $salt64 = encode_base64($salt, "");
++my $hash64 = encode_base64(hmac_sha1("unrelated.invalid", $salt), "");
++my $target_hash64 = encode_base64(hmac_sha1($target, $salt), "");
++
++open(my $knownhosts, ">", $knownhosts_file) or errout "$!";
++print $knownhosts "|1|$salt64|$hash64 $other_key\n";
++print $knownhosts "|1|$salt64|$target_hash64 $hostkey_algo $hostkey_data\n";
++close($knownhosts) or errout "$!";
++
++exit 0;
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 734f9c37b6..d63d0afbb1 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92388-2.patch \
            file://CVE-2026-92389.patch \
            file://CVE-2026-86409.patch \
+           file://CVE-2026-87865.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
@@ -161,6 +162,8 @@ do_install_ptest() {
 	cp ${S}/tests/*.p[lmy] ${D}${PTEST_PATH}/tests/
 
 	install -d ${D}${PTEST_PATH}/tests/libtest
+	install -m 0755 ${S}/tests/libtest/test3500.pl \
+		${D}${PTEST_PATH}/tests/libtest/
 	for name in $(makefile-getvar ${B}/tests/libtest/Makefile noinst_PROGRAMS noinst_LTLIBRARIES); do
 		${B}/libtool --mode=install install ${B}/tests/libtest/$name ${D}${PTEST_PATH}/tests/libtest
 	done
-- 
2.35.6
