Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4452.1793777792484065324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CrlGWnTI;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13831; q=dns/txt;
  s=iport01; t=1793777793; x=1794987393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jELyVuRCIr3AaUGWAzvJBqOJFz1qipTK9uVY0Pnd9Nw=;
  b=CrlGWnTIncwaXmBDG6YPbesW/karyUbxZumskz+2XeePPcAxHwFiDM+u
   VYSukX2t9oR15eDnuhZcU31w5AsqnGIAl9dbLv+Q833HYYwN0leaH+Mxx
   +qzHe8r01gzL66q+el6IP8N2/EkXB5AOxeBgpwIOnKydqThQrHfVnWtJh
   /m7Pjs/Qk0yLmZAkBERhZIkkhSbPzWD8wR7+qYAuILHJHTj1XCBGpDa8F
   4EKH/kmizBYB9I0tZYrryvejJ7RoZCfW71L+j/DJBAWQ7CKyzep09Ij2D
   s0m5nNlqDFy65u+Uxl46S5zWsmRmfGtxJT09umUSJX5BfwZAVjnnsVoYa
   w==;
X-CSE-ConnectionGUID: kiy3oGpCRL6nanRQQWK0RQ==
X-CSE-MsgGUID: J8S99k5DQPabfx9IArXiZw==
X-IPAS-Result: =?us-ascii?q?A0ADAABQ4Opq/5L/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBglZ1YENJjHKJWQOBE50NFIFqDwEBAQ9EDQQBA?=
 =?us-ascii?q?YFxASCCcwKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGFQEHMg2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEQa5fBs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMwELFAGBOAGFP4gjXRgBhH0nGxuBcoEVgnN2gQWBMioCA?=
 =?us-ascii?q?YEiJYZeBIIigQyBWh4yMwmMDwKIQkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAbChQYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSLYJkLQEeEikGASEMAQciAhcYYgpnOwseknQRkBaCIYE1n?=
 =?us-ascii?q?1wKKIN4jCSVOhozhASBV5JCklQLmH2OCpVpGQJNhGmBaDyBWXAVgyIJFjQZD?=
 =?us-ascii?q?4M4iHeBfA4LgXiBaIRQcX/IGyYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:JkKeBaMAxAp7uH3vrR30lsFynXyQoLVcMsEvi/4bfWQNrUpx3zEHn
 TdLDTuOPq7cYzH1c99+O9u+8BwCupTWxoQxT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2UsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/ZvHRoxEpUzwMIpB2hIz
 8UhFxNVVCnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsjOO8YYGFK4biqcN9vBaj9
 zPFokjAOhgQOszO6BOfwnOembqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:KckHwKAlZ7OrHDvlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AQA+VK2hyz4EISZGIn31P+OtaqDJucXzMl3D/O2S?=
 =?us-ascii?q?CLThvQbuvcGav2/teqp87?=
X-Talos-MUID: 9a23:SQX4pwY2tajpneBTlW/X1WBhaetR262kBlBcsLwci8i2Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543993892"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 87B2F180004AA;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id DDF45CBEFBF; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 10/12] curl: fix CVE-2026-87865
Date: Tue,  3 Nov 2026 23:36:25 -0800
Message-Id: <20261104073627.302002-11-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249343
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Match hashed known_hosts entries against the requested host before
selecting the host-key algorithm. Adapt the connection fields and
SSH test fixture to curl 8.19.0.

Include the upstream follow-up [3] to cache key types already absent
for this host, avoiding repeated full-file scans introduced by [1].
Keep both upstream commits in separate patches and retain test3500.

Install test3500.pl into ptest so the hashed-host regression can run
from the target package.

[1] https://github.com/curl/curl/commit/323c184b6bdf5b1988a10c0a61560666e1588149
[2] https://curl.se/docs/CVE-2026-87865.html
[3] https://github.com/curl/curl/commit/dc055e8a9eefe65cf63cb0396668a37c0b7c474a

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-87865_p1.patch         | 225 ++++++++++++++++++
 .../curl/curl/CVE-2026-87865_p2.patch         |  89 +++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   4 +
 3 files changed, 318 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-87865_p1.patch
new file mode 100644
index 00000000000..52cdd65e200
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87865_p1.patch
@@ -0,0 +1,225 @@
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
+(cherry picked from commit 323c184b6bdf5b1988a10c0a61560666e1588149)
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
diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch
new file mode 100644
index 00000000000..0bf7cfea3c6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch
@@ -0,0 +1,89 @@
+From dc055e8a9eefe65cf63cb0396668a37c0b7c474a Mon Sep 17 00:00:00 2001
+From: Bobbeh Rhino <bobbeh@rhino.Rhino>
+Date: Tue, 8 Sep 2026 20:24:35 -0400
+Subject: [PATCH] libssh2: skip repeat checkp() for already-absent hashed key
+ types
+
+ssh_force_knownhost_key_type() called libssh2_knownhost_checkp() once
+per hashed known_hosts entry, and each call itself rescans the whole
+known_hosts set. Cache key types already confirmed absent for the
+connecting host so repeat entries of the same type do not each trigger
+another full scan. checkp() NOTFOUND for a given (host, port, type) is
+independent of the key bytes passed in, so this is safe.
+
+Behavior for MATCH is unchanged, and only store->typemask is read
+after a match, which is identical for any entry of the same type.
+
+Tests: runtests.pl 3500 1459 600, full SFTP/SCP keyword set (58/58),
+checksrc.pl.
+
+Closes #22905
+
+CVE: CVE-2026-87865
+Upstream-Status: Backport [https://github.com/curl/curl/commit/dc055e8a9eefe65cf63cb0396668a37c0b7c474a]
+
+Backport Changes:
+- Use curl 8.19.0's conn->host.name and conn->remote_port instead of
+  conn->origin->hostname and conn->origin->port. The older connection
+  has no origin pointer; preserve the -1 lookup port for port 22.
+
+(cherry picked from commit dc055e8a9eefe65cf63cb0396668a37c0b7c474a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/vssh/libssh2.c | 34 +++++++++++++++++++++++-----------
+ 1 file changed, 23 insertions(+), 11 deletions(-)
+
+diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
+index 7c18ff4..cb214e3 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -622,6 +622,12 @@ static CURLcode ssh_force_knownhost_key_type(struct Curl_easy *data,
+      !data->set.str[STRING_SSH_HOST_PUBLIC_KEY_SHA256]) {
+     struct libssh2_knownhost *store = NULL;
+     struct connectdata *conn = data->conn;
++    /* key types already confirmed absent for this host, so repeat hashed
++       entries of the same type do not each force a fresh checkp() scan
++       of the whole known_hosts set. one slot per possible key type (indexed
++       by the type shifted down) so no entry ordering can overflow it */
++    bool absent_type[(LIBSSH2_KNOWNHOST_KEY_MASK >>
++                      LIBSSH2_KNOWNHOST_KEY_SHIFT) + 1] = { FALSE };
+     /* lets try to find our host in the known hosts file */
+     while(!libssh2_knownhost_get(sshc->kh, &store, store)) {
+       /* For non-standard ports, the name will be enclosed in */
+@@ -655,17 +661,23 @@ static CURLcode ssh_force_knownhost_key_type(struct Curl_easy *data,
+           }
+         }
+         else if(store->key) {
+-          int keycheck = libssh2_knownhost_checkp(
+-            sshc->kh, conn->host.name,
+-            (conn->remote_port != PORT_SSH) ? conn->remote_port : -1,
+-            store->key, strlen(store->key),
+-            LIBSSH2_KNOWNHOST_TYPE_PLAIN |
+-              LIBSSH2_KNOWNHOST_KEYENC_BASE64 |
+-              (store->typemask & LIBSSH2_KNOWNHOST_KEY_MASK),
+-            NULL);
+-          if(keycheck == LIBSSH2_KNOWNHOST_CHECK_MATCH) {
+-            found = TRUE;
+-            break;
++          unsigned int type = (store->typemask & LIBSSH2_KNOWNHOST_KEY_MASK)
++                              >> LIBSSH2_KNOWNHOST_KEY_SHIFT;
++          if(!absent_type[type]) {
++            int keycheck = libssh2_knownhost_checkp(
++              sshc->kh, conn->host.name,
++              (conn->remote_port != PORT_SSH) ? conn->remote_port : -1,
++              store->key, strlen(store->key),
++              LIBSSH2_KNOWNHOST_TYPE_PLAIN |
++                LIBSSH2_KNOWNHOST_KEYENC_BASE64 |
++                (store->typemask & LIBSSH2_KNOWNHOST_KEY_MASK),
++              NULL);
++            if(keycheck == LIBSSH2_KNOWNHOST_CHECK_MATCH) {
++              found = TRUE;
++              break;
++            }
++            else if(keycheck == LIBSSH2_KNOWNHOST_CHECK_NOTFOUND)
++              absent_type[type] = TRUE;
+           }
+         }
+       }
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 6cf6e328272..f2de4dfa042 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -58,6 +58,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-107928.patch \
            file://CVE-2026-87864.patch \
            file://CVE-2026-92389.patch \
+           file://CVE-2026-87865_p1.patch \
+           file://CVE-2026-87865_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
@@ -172,6 +174,8 @@ do_install_ptest() {
 	cp ${S}/tests/*.p[lmy] ${D}${PTEST_PATH}/tests/
 
 	install -d ${D}${PTEST_PATH}/tests/libtest
+	install -m 0755 ${S}/tests/libtest/test3500.pl \
+		${D}${PTEST_PATH}/tests/libtest/
 	for name in $(makefile-getvar ${B}/tests/libtest/Makefile noinst_PROGRAMS noinst_LTLIBRARIES); do
 		${B}/libtool --mode=install install ${B}/tests/libtest/$name ${D}${PTEST_PATH}/tests/libtest
 	done
-- 
2.35.6
