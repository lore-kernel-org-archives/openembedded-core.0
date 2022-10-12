Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99413C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 14:22:19 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.20622.1665584529564941654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 07:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LnjeInph;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so2110875pjq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41AjjAbEpbyHCQYxPzsOo3k5CuS0VLNaLzrkgXWYF5k=;
        b=LnjeInphdJNt37QjOkh81HCPN8Fg0yfRXFcqAugysmlCzQthHdBDMRKD50m14q1aS5
         hjcMwWke9pAojs7uXFbiiah9PjTuPoAOynWLt62cd32IqSJpyZuhmj9wyDOCGRjh/lAq
         LV2VhUKOhNUP08+JmdnP6m3aMzbTiwswbAAfA09dV4Uz0KvUVUbvLDpstWIF8ZChnTeb
         MWIT/sxZK3UgzgXBPD/U/kEm3D7rXcevTiJgsc/U9NM+DyCnYb0JSqY2tzrRxIUIaqMD
         HIMOX3UCELv3VYCud9wpUvU1M/aZrE5pS8Jwl3jfTyTZcQtdQ5/wVFvHhcp6bhc3Z30j
         K/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41AjjAbEpbyHCQYxPzsOo3k5CuS0VLNaLzrkgXWYF5k=;
        b=U9tNytOLKd65ikQYnWW2kjqIwX3iqvmgCI/c0wHUOcO1I0iG3/xisTkaNhrczXZJ7s
         qLsbgWdqWDJDicVV28VMfwoN2/D/a5JVAQrkYSnKi/YPuq1iIUiHvT9dF5/m1ItwYQUd
         N0uyYFZf3/5cSVox95dPk6WQQ1t76slooN87N7LcXZwZykxn1IioH4THu2hNcfyZNb3e
         gbrC6d2vHWHzMxRDuA3UbXd7gtPSSsRY+UUgYE8z7oiU5rPgwwN3JaEsp4rI1p2bdnrQ
         95fLQ3b3KvZEsoaRDnZrbz7sopQN92mB7F3joHpgsdv5YVET4n+EfL5Xvz0Poh2405s/
         HTZA==
X-Gm-Message-State: ACrzQf3hFZdYZ/7NDRHQyDz2q2JzTMJIzivEpfgmUFrLJwP3f2ELRBDr
	xA8q47UaIu9CAUnCpAgVrIRlzG/jWwCWHA==
X-Google-Smtp-Source: AMsMyM6N0xwuRptkNf74dkS3rbycs1TMJN8r1xR7sgSFbQ2fJIZC83z3jQg3tkswrp9NYCpmf2qFJg==
X-Received: by 2002:a17:903:24f:b0:178:bf4f:fc7c with SMTP id j15-20020a170903024f00b00178bf4ffc7cmr30130370plh.124.1665584528444;
        Wed, 12 Oct 2022 07:22:08 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5f4c:d51a:946f:edd4])
        by smtp.gmail.com with ESMTPSA id x188-20020a6263c5000000b0056268979639sm11117105pfb.123.2022.10.12.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 07:22:08 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [master][langdale][PATCH] python3: upgrade 3.10.6 -> 3.10.7
Date: Wed, 12 Oct 2022 07:22:04 -0700
Message-Id: <20221012142204.3668465-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 14:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171665

Security and bug fixes.

* Drop 0001-Mitigate-the-race-condition-in-testSockName.patch, merged
  upstream
* Refresh 0017-setup.py-do-not-report-missing-dependencies-for-disa.patch

For a list of changes see:
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-7-final

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
* All ptests pass on qemux86-64 core-image-full-cmdline
* Not urgent, can wait for langdale post release

 ...e-the-race-condition-in-testSockName.patch | 47 -------------------
 ...report-missing-dependencies-for-disa.patch |  8 ++--
 .../{python3_3.10.6.bb => python3_3.10.7.bb}  |  3 +-
 3 files changed, 6 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
 rename meta/recipes-devtools/python/{python3_3.10.6.bb => python3_3.10.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch b/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
deleted file mode 100644
index e19df08f870..00000000000
--- a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 8103b90148e8768456c3ab707de105d63d9d5b20 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 17 Jun 2022 11:53:59 +0100
-Subject: [PATCH] Mitigate the race condition in testSockName
-
-find_unused_port() has an inherent race condition, but we can't use
-bind_port() as that uses .getsockname() which this test is exercising.
-
-Try binding to unused ports a few times before failing.
----
- Lib/test/test_socket.py | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/test/test_socket.py b/Lib/test/test_socket.py
-index c981903824..b1630d18b6 100644
---- a/Lib/test/test_socket.py
-+++ b/Lib/test/test_socket.py
-@@ -1390,10 +1390,21 @@ def testStringToIPv6(self):
- 
-     def testSockName(self):
-         # Testing getsockname()
--        port = socket_helper.find_unused_port()
-         sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-         self.addCleanup(sock.close)
--        sock.bind(("0.0.0.0", port))
-+
-+        # Since find_unused_port() is inherently subject to race conditions, we
-+        # call it a couple times if necessary.
-+        for i in itertools.count():
-+            port = socket_helper.find_unused_port()
-+            try:
-+                sock.bind(("0.0.0.0", port))
-+            except OSError as e:
-+                if e.errno != errno.EADDRINUSE or i == 5:
-+                    raise
-+            else:
-+                break
-+
-         name = sock.getsockname()
-         # XXX(nnorwitz): http://tinyurl.com/os5jz seems to indicate
-         # it reasonable to get the host's addr in addition to 0.0.0.0.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 041a03b0cdf..8c554feb4b6 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -1,4 +1,4 @@
-From 311cf9abc213fcd76795cc3a25814a15fb552065 Mon Sep 17 00:00:00 2001
+From 246c5ffe75a2d494e415d8a7522df9fe22056d41 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 7 Oct 2019 13:22:14 +0200
 Subject: [PATCH] setup.py: do not report missing dependencies for disabled
@@ -12,16 +12,18 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
+Refresh for 3.10.7:
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 
 ---
  setup.py | 8 ++++++++
  1 file changed, 8 insertions(+)
 
 diff --git a/setup.py b/setup.py
-index 934cf2e..ccf83b4 100644
+index 85a2b26357..7605347bf5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -517,6 +517,14 @@ class PyBuildExt(build_ext):
+@@ -517,6 +517,14 @@ def print_three_column(lst):
                  print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
                                                longest, g))
  
diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.6.bb
rename to meta/recipes-devtools/python/python3_3.10.7.bb
index 1f8b60a7a59..3f0f9c510ca 100644
--- a/meta/recipes-devtools/python/python3_3.10.6.bb
+++ b/meta/recipes-devtools/python/python3_3.10.7.bb
@@ -35,7 +35,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
-           file://0001-Mitigate-the-race-condition-in-testSockName.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -44,7 +43,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3"
+SRC_URI[sha256sum] = "6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


