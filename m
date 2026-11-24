Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30981.1795560748472252533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=NQ/gneMs;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a358881793so2633146f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560747; x=1796165547; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dk0uK9q85mABu2Ho2mkRUMGdbW6Tk2Utef8CbeUZNhI=;
        b=NQ/gneMsJJJLGHgtP1jKhvMl20UPCHV9N9/0MYsi7KGxDR4wurd5SiT/KxgKqORC4w
         GJhbMvPTKCxSBOllpXAjNYvSH8ZwBJyCXto4F4RYVsz87/NLgfzY+vRAg8zim3pH/SVO
         tR37Tf0wv8ojgg8DV0I00dpUVg9AEiD1nMtUxHlnNSfAXIHN9z5qNhVL7eDmXTocLn46
         yb38n9ovUe2KFzZXJnmBmB9mmfrKCnoO+HxpXTikGSyNCiKNFWfvaglFJ/IApuRFZEMM
         4dgZJN7BEOKSF33OCX+2uSrBJLkmv04G3iUlUBj+qJBy41uKi4QyY2lVMWupezTKmOz5
         KxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560747; x=1796165547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dk0uK9q85mABu2Ho2mkRUMGdbW6Tk2Utef8CbeUZNhI=;
        b=eJT3K5kM8QY57PAPxZcfbzXLjlAWW/mNDwyGDnzH+S8J/lotnCOgdz6zQVcoKTtaBC
         rDJkOyz4/ozpoKqdVm1Z8Duh/HyA2OAZLhZY3MH1/4C+mWtX8T87MzO1dsCGQmLGuiwF
         zgcD6xZ7/VuYyS13gif69KQz+ojkHxWP3eqWUJcssAxAq4XUcF38pub9p5X8mY338kMx
         1F94gCdg3qNdDDWhFjjC23Ghm5bqCMSIdKpTiePhPU8l+kzaPP8l3h3XBFucsWd0iyhu
         GBxbsb8nUI13Yqe4x5gcdS+jYlYtpL7A9igmopuhJTYz8beHFaqrIAQk4Hk/dGG0k/x+
         pwEg==
X-Gm-Message-State: APuU4Z+6poZcntpdS/mqMGJRQM1KtaRrKADhNIYfgJgDeR6xmiiYZ+FF
	ZsDv6cypTtXgSBrfGGtwz+YZXpVcuLP4Wy4UZJObx2s5cwZ2llTUX4jwk8UVBWpjZW13HnPj8HR
	p+Cqf/8I=
X-Gm-Gg: AZFdTZekPW5hoWm6/P4kv8EFgqYAueo/L13Z75EE2P6zt7pbtVJH/7mdPAMEnqiJ8A2
	EdOfS3hPQAAhNLTQ4MRZeDszX2lonfcrca86v+JrzXHWTFEyyOcJlqA3XlNXhDioJ0q0xxjSmgm
	rtbgNRY6Z5BcBeEgdMojuCZLVKbL+SdyxAw6QCtOGUef083XKnxgHSOT+56iELMNZbR8k7uZvpD
	F/egA6KDbeoBya4YioVQp4GVAl8R7fofgiYBmEPacODZNlTOJhCqH+hRshLkgIbd270i+MwKd0h
	g3q326Bzgekbvtc+XRtMrCvhuCcCtAiId0sUGJXUt0ELlbEGkdPwfepjJCDW4qHuI+3UjjzhTQG
	PU1TGjR7U0YCrfTS+iQ6ZxqbKq+3dSoobkqby5OZU9AsljDmKHTxS3uCSuF5THtQMtETU/zpUbn
	KJb0uFyqje0YP2glM9bZJm6Wu9fM3G9QB1nJYuU31MtCUFh63F0WZ0iFqkToXMgGjgK/l+tvaxs
	Ut4mH4HUXiwd5qcALSSPwoJfASt7iYHsZ9rPlLZg5sW0jtvDrMdhXAXx0kAGf/zly67KbQC1Xxa
	o8pmw5uH21uEd3BmVWJE6jtROH2vOjSwfXnwoqMSaZGlaYjX6CvYhQlS5CSqAfCv8i8FIzSJzRU
	RAgCAMKQxWKSm03dlnrYISZ5rOWrWMQ==
X-Received: by 2002:a05:6000:2906:b0:4a3:777a:a964 with SMTP id ffacd0b85a97d-4aba58de987mr30800486f8f.0.1795560746550;
        Tue, 24 Nov 2026 14:52:26 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 12/21] curl: fix CVE-2026-87865
Date: Tue, 24 Nov 2026 23:51:19 +0100
Message-ID: <5dd778d9f5be936ba2c553e496f0fce5d8f379c6.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251092
Content-Type: text/plain; charset="utf-8"

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.22.0.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-87865
[2] https://curl.se/docs/CVE-2026-87865.html

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-87865.patch            | 216 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865.patch b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
new file mode 100644
index 00000000000..32a7441c95f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
@@ -0,0 +1,216 @@
+From a7622dc02ccc01f7438227f1920db08268a6ccb0 Mon Sep 17 00:00:00 2001
+From: Bobbeh Rhino <bobbeh@rhino.Rhino>
+Date: Tue, 8 Sep 2026 06:33:27 -0400
+Subject: [PATCH] libssh2: match hashed known_hosts entries by host
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
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
+Upstream-Status: Backport [https://github.com/curl/curl/commit/323c184b6bdf5b1988a10c0a61560]
+
+Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
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
+index 24a651d30e..cd28cde76f 100644
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -685,9 +685,19 @@ static CURLcode ssh_force_knownhost_key_type(struct Curl_easy *data,
+             break;
+           }
+         }
+-        else {
+-          found = TRUE;
+-          break;
++        else if(store->key) {
++          int keycheck = libssh2_knownhost_checkp(
++            sshc->kh, conn->origin->hostname,
++            (conn->origin->port != PORT_SSH) ? conn->origin->port : -1,
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
+index 3b32fce7bb..4a27927b1c 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -2090,6 +2090,8 @@ TESTCASES = \
+   test3400 \
+   test3401 \
+   \
++  test3500 \
++  \
+   test4000 \
+   test4001 \
+   \
+diff --git a/tests/data/test3500 b/tests/data/test3500
+new file mode 100644
+index 0000000000..1bcf3bc17d
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
++%PERL %SRCDIR/libtest/test3500.pl %LOGDIR/server/curl_host_key.pub %LOGDIR/known%TESTNUMBER "[%HOSTIP]:%SSHPORT"
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
+index 74eb150742..8fdf484b55 100644
+--- a/tests/libtest/Makefile.am
++++ b/tests/libtest/Makefile.am
+@@ -49,7 +49,8 @@ EXTRA_DIST = CMakeLists.txt $(FIRST_C) $(FIRST_H) $(UTILS_C) $(UTILS_H) $(TESTS_
+   test1022.pl \
+   test307.pl \
+   test610.pl \
+-  test613.pl
++  test613.pl \
++  test3500.pl
+ 
+ CFLAGS += @CURL_CFLAG_EXTRAS@
+ 
+diff --git a/tests/libtest/test3500.pl b/tests/libtest/test3500.pl
+new file mode 100755
+index 0000000000..d95f54cecf
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
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-support/curl/curl_8.22.0.bb
index 95d5801ad55..979e416249c 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://CVE-2026-92388-1.patch \
     file://CVE-2026-92388-2.patch \
     file://CVE-2026-92389.patch \
+    file://CVE-2026-87865.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
