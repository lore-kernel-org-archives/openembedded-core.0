Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13146FA374C
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.2230.1666901792265795413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HZ1Z8VPk;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id q9so7989651ejd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHFMnmhnkXsyXMn6JBBII2DQGeM7qMEs5XwAsxVb7N4=;
        b=HZ1Z8VPk48pAeCT08RtMtwDmkPkT7IJEjJ89AjDbU9V/xbyUxdjMuCQ+mbrnqIEKyt
         dM8VHHuwqQF9RsKBACi3TIJP4YIF2/QYyBZwq2TEy+fIS+hUQv8y3ieTTdZKBQ0Vcvb7
         rJstm+Prsvbvr/uyiNQ8sGBifpIBtsmips1XhnsTfNoG7f05CVVPZw+UERngEfR9XLdH
         o//oym2mXIIEr4HkTlFGBFCEKqw4qGVpJEg0NcjXN8sv+VS5nyvR9NB5l+gd3YDKzh0R
         Ub87HPRcdcmExeLvzqQ0B2BUCUXbZOjvZ+9pjN8Xchr/Y7NOQJL35E//+MQXYlcAVYMj
         EaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHFMnmhnkXsyXMn6JBBII2DQGeM7qMEs5XwAsxVb7N4=;
        b=syGanV+cLsHCqR7cFzSRG2PhgtAmPl1yUiQEikeUfXRU01IJmH6lT3DyqCgR4GkvO6
         sqd9xmwuXoLvo/dryMixgEX7I7mAMyWcAhnUXB8sosSTs+c0DCgbZUVzlqxT3wbANItz
         R8WRDYnTTgqmtdILyl6138ZNFgPj0UHwD/ddSC/TcYrIZgm03kUizskz09FX1P+d4LTI
         hcGSsW8/eNKvXpMHgU2Zi89dEQUAyL7ia51ns+J+eGL+CoYQw+WX7SvGJdBq59koF2dR
         q/bdDOOCcN0RV8Ur7UxUnoijlRh34p5ptMR+QnxJicOI9Qdj5VzadaUqkHbea0CKD4eG
         z3Bg==
X-Gm-Message-State: ACrzQf3mWJGNbRcNzX0mP2UOuzqy3fJTDzrxTzUtA7lBk+G73swBUYCS
	8WY/P718yCJcH+zs9t3k824wBwZgqJddMw==
X-Google-Smtp-Source: AMsMyM6VrC1IjhLsAUokFyH3wNpBQWPvvs6FOtREzZG6b98P+shsiarNAogW49jUWZPZcsNS0SnfxQ==
X-Received: by 2002:a17:906:ee89:b0:73d:70c5:1a4e with SMTP id wt9-20020a170906ee8900b0073d70c51a4emr41952867ejb.683.1666901790790;
        Thu, 27 Oct 2022 13:16:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/23] pinentry: update 1.2.0 -> 1.2.1
Date: Thu, 27 Oct 2022 22:15:59 +0200
Message-Id: <20221027201611.3644334-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172215

libcap support dropped upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/oescripts.py           |  9 ++++-----
 .../gpg-error_pkconf.patch                          | 13 +++++++------
 .../libassuan_pkgconf.patch                         |  0
 .../{pinentry_1.2.0.bb => pinentry_1.2.1.bb}        |  5 ++---
 4 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry-1.2.0 => pinentry-1.2.1}/gpg-error_pkconf.patch (95%)
 rename meta/recipes-support/pinentry/{pinentry-1.2.0 => pinentry-1.2.1}/libassuan_pkgconf.patch (100%)
 rename meta/recipes-support/pinentry/{pinentry_1.2.0.bb => pinentry_1.2.1.bb} (87%)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index ea08d9aff8..5b0691a9ff 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -148,7 +148,7 @@ class OEListPackageconfigTests(OEScriptTests):
         results = runCmd('%s/contrib/list-packageconfig-flags.py' % self.scripts_dir)
         expected_endlines = []
         expected_endlines.append("RECIPE NAME                  PACKAGECONFIG FLAGS")
-        expected_endlines.append("pinentry                     gtk2 libcap ncurses qt secret")
+        expected_endlines.append("pinentry                     gtk2 ncurses qt secret")
         expected_endlines.append("tar                          acl selinux")
 
         self.check_endlines(results, expected_endlines)
@@ -166,11 +166,10 @@ class OEListPackageconfigTests(OEScriptTests):
     def test_packageconfig_flags_option_all(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
         expected_endlines = []
-        expected_endlines.append("pinentry-1.2.0")
-        expected_endlines.append("PACKAGECONFIG ncurses libcap")
+        expected_endlines.append("pinentry-1.2.1")
+        expected_endlines.append("PACKAGECONFIG ncurses")
         expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
         expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
-        expected_endlines.append("PACKAGECONFIG[libcap] --with-libcap, --without-libcap, libcap")
         expected_endlines.append("PACKAGECONFIG[ncurses] --enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses")
         expected_endlines.append("PACKAGECONFIG[secret] --enable-libsecret, --disable-libsecret, libsecret")
 
@@ -180,7 +179,7 @@ class OEListPackageconfigTests(OEScriptTests):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -p' % self.scripts_dir)
         expected_endlines = []
         expected_endlines.append("RECIPE NAME                  PACKAGECONFIG FLAGS")
-        expected_endlines.append("pinentry                     gtk2 libcap ncurses qt secret")
+        expected_endlines.append("pinentry                     gtk2 ncurses qt secret")
 
         self.check_endlines(results, expected_endlines)
 
diff --git a/meta/recipes-support/pinentry/pinentry-1.2.0/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch
similarity index 95%
rename from meta/recipes-support/pinentry/pinentry-1.2.0/gpg-error_pkconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch
index 507c0c3917..bb7e43b1e7 100644
--- a/meta/recipes-support/pinentry/pinentry-1.2.0/gpg-error_pkconf.patch
+++ b/meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch
@@ -1,4 +1,4 @@
-From 54a4c9d3e5f1897ed4b978d5cdee646ca7a4f637 Mon Sep 17 00:00:00 2001
+From 785777dc0bc6b69ff68c91547ec6b6634049662f Mon Sep 17 00:00:00 2001
 From: Armin Kuster <akuster@mvista.com>
 Date: Fri, 2 Sep 2005 11:50:01 +0000
 Subject: [PATCH] Add gtk+, avahi, dbus-0.34 (.36 coming soon) and
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Armin Kuster <akuster@mvista.com>
 
 ---
- m4/gpg-error.m4 | 159 ++----------------------------------------------
- 1 file changed, 4 insertions(+), 155 deletions(-)
+ m4/gpg-error.m4 | 160 ++----------------------------------------------
+ 1 file changed, 4 insertions(+), 156 deletions(-)
 
 diff --git a/m4/gpg-error.m4 b/m4/gpg-error.m4
-index 56a5d07..c0bec1f 100644
+index 4b5cd40..7dfbb83 100644
 --- a/m4/gpg-error.m4
 +++ b/m4/gpg-error.m4
-@@ -26,159 +26,12 @@ dnl config script does not match the host specification the script
+@@ -26,160 +26,12 @@ dnl config script does not match the host specification the script
  dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
@@ -135,6 +135,7 @@ index 56a5d07..c0bec1f 100644
 -    fi
 -  elif test "$GPG_ERROR_CONFIG" != "no"; then
 -    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-    unset GPGRT_CONFIG
 -  fi
 -  if test "$GPG_ERROR_CONFIG" != "no"; then
 -    req_major=`echo $min_gpg_error_version | \
@@ -182,7 +183,7 @@ index 56a5d07..c0bec1f 100644
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -193,10 +46,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -194,10 +46,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
diff --git a/meta/recipes-support/pinentry/pinentry-1.2.0/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch
similarity index 100%
rename from meta/recipes-support/pinentry/pinentry-1.2.0/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch
diff --git a/meta/recipes-support/pinentry/pinentry_1.2.0.bb b/meta/recipes-support/pinentry/pinentry_1.2.1.bb
similarity index 87%
rename from meta/recipes-support/pinentry/pinentry_1.2.0.bb
rename to meta/recipes-support/pinentry/pinentry_1.2.1.bb
index e6cc71a547..7daf80f36e 100644
--- a/meta/recipes-support/pinentry/pinentry_1.2.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.2.1.bb
@@ -16,14 +16,13 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gpg-error_pkconf.patch \
 "
 
-SRC_URI[sha256sum] = "10072045a3e043d0581f91cd5676fcac7ffee957a16636adedaa4f583a616470"
+SRC_URI[sha256sum] = "457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "ncurses libcap"
+PACKAGECONFIG ??= "ncurses"
 
 PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses"
-PACKAGECONFIG[libcap] = "--with-libcap, --without-libcap, libcap"
 PACKAGECONFIG[qt] = "--enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase"
 PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0"
 
-- 
2.30.2


