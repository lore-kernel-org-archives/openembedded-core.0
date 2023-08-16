Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D882C27C6D
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:38:55 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.174467.1692225529469493161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WWehI33I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso6150506f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 15:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692225528; x=1692830328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAc4GrJOhGEXu08ZuFF+HZLqkF+v5lpTD+H5EliuQTU=;
        b=WWehI33Ibmoc32cT8SHkPXO4Eu4hceixk/S61K5vlJ5mprz+723REgp/dTBClO2O6U
         xjcyuU8igMFmI/+OZ5VOhPBqpjFgaJqGxaa6LXOT+NjIcGmT4MM/CuZP4lTWlX6MjroX
         P6kjx+P8L03DEshPvu38ZxcERSFbEWjNeoTc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225528; x=1692830328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAc4GrJOhGEXu08ZuFF+HZLqkF+v5lpTD+H5EliuQTU=;
        b=Xh3iiXnvmcfEdX5ksyVz4fA74Ai5/iWks3dK2sKUDsCxXsOXByWtatANeLrlwe26pl
         BVLrMYoVoQnXL5o40XQGW3ngTnSgrYaGUMpbUwguuFHYZLWBIxCQ5MvbzJw3uHkcr7vC
         kQfHbzQSy0IqIS7TKwqXiUUew3cWTmh84jFFhg5lLMRl9GnhpPCa6e9qaN1jr6/5tsA1
         QplA8+MslpUqP3C9f4BhkPuD6jR4Dd/5Rdy39jw4JsymeHZrXGxLOGMQzYqNJ29Evg5F
         95mTm9s2wgDUZNTYaYsLR+/5yk7bVqtD6VvcvgIk9W8Y+qM1X4Bjxd1XPZE44Ve1GR0u
         s0OA==
X-Gm-Message-State: AOJu0YzpbS9uRxJ8BKaPltK83bhqwt3WAaUsa/EV71Qsj8N3SM+fw8wF
	N9eFtMSIjeG8M/m+0J1kbQm8jkVynWCglkDN+0w=
X-Google-Smtp-Source: AGHT+IF5Ndb813/N8CChulHt9YuRV4FhKMDRAe05B4OdQ1ENDnBKjwcZJcQWyMMEL0xMLSwLQcy91g==
X-Received: by 2002:a05:6000:1051:b0:319:6e91:eb43 with SMTP id c17-20020a056000105100b003196e91eb43mr2425163wrx.31.1692225527624;
        Wed, 16 Aug 2023 15:38:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce81:b365:d63f:4c86])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5546000000b003142e438e8csm22620389wrw.26.2023.08.16.15.38.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 15:38:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-tools: Upgrade 2.13.9 -> 2.13.10
Date: Wed, 16 Aug 2023 23:38:45 +0100
Message-Id: <20230816223845.590090-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230816223845.590090-1-richard.purdie@linuxfoundation.org>
References: <20230816223845.590090-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186263

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...a4a793c81221a28f822d07135069456ea021.patch |  48 --------
 .../lttng/lttng-tools/gcc13-ptest-fix.patch   | 107 ------------------
 ...tools_2.13.9.bb => lttng-tools_2.13.10.bb} |   4 +-
 3 files changed, 1 insertion(+), 158 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.9.bb => lttng-tools_2.13.10.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch b/meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch
deleted file mode 100644
index e338eaff2b1..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 40b2a4a793c81221a28f822d07135069456ea021 Mon Sep 17 00:00:00 2001
-From: Olivier Dion <odion@efficios.com>
-Date: Fri, 10 Mar 2023 13:17:46 -0500
-Subject: [PATCH] Tests: fix: parse-callback reports missing addr2line
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport
-
-addr2line from binutils is required for this script to work correctly.
-However, it silently fails. Fix this by using `subprocess.run' with
-`check=True' instead of `subprocess.getoutput'. That way, an exception
-is raised if an error occurs.
-
-Fix the shebang by not assuming where python is installed while at it.
-
-Change-Id: I5157b3dbccf6bfbe08a6b6840b38f5db9010fe96
-Signed-off-by: Olivier Dion <odion@efficios.com>
-Signed-off-by: JÃ©rÃ©mie Galarneau <jeremie.galarneau@efficios.com>
----
- tests/utils/parse-callstack.py | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/tests/utils/parse-callstack.py b/tests/utils/parse-callstack.py
-index 3bfddd9ef..c3f0e2e9b 100755
---- a/tests/utils/parse-callstack.py
-+++ b/tests/utils/parse-callstack.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2017 Francis Deslauriers <francis.deslauriers@efficios.com>
- #
-@@ -24,7 +24,9 @@ def addr2line(executable, addr):
-     # Expand inlined functions
-     cmd += ['--addresses', addr]
- 
--    addr2line_output = subprocess.getoutput(' '.join(cmd))
-+    status = subprocess.run(cmd, stdout=subprocess.PIPE, check=True)
-+
-+    addr2line_output = status.stdout.decode("utf-8")
- 
-     # Omit the last 2 lines as the caller of main can not be determine
-     fcts = [addr2line_output.split()[-2]]
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch b/meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch
deleted file mode 100644
index 52c4ec9f8ef..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 844be4dc46deeec83199da80e9e2a6058e9f5a53 Mon Sep 17 00:00:00 2001
-From: =?utf8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
- <jeremie.galarneau@efficios.com>
-Date: Thu, 25 May 2023 19:15:20 -0400
-Subject: [PATCH] Tests fix: test_callstack: output of addr2line incorrectly
- parsed
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport
-
-Issue observed
---------------
-
-The test_callstack test fails with GCC 13.1 with the following output:
-
-  Traceback (most recent call last):
-  File "/usr/lib/lttng-tools/ptest/tests/regression/././kernel//../../utils/parse-callstack.py", line 160, in <module>
-  main()
-  File "/usr/lib/lttng-tools/ptest/tests/regression/././kernel//../../utils/parse-callstack.py", line 155, in main
-  raise Exception('Expected function name not found in recorded callstack')
-  Exception: Expected function name not found in recorded callstack
-  ok 10 - Destroy session callstack
-  PASS: kernel/test_callstack 10 - Destroy session callstack
-  not ok 11 - Validate userspace callstack
-  FAIL: kernel/test_callstack 11 - Validate userspace callstack
-
-Cause
------
-
-parse-callstack.py uses 'split()' to split the lines of addr2line's
-output. By default, 'split()' splits a string on any whitespace.
-Typically this was fine as addr2line's output doesn't contain spaces and
-the function then splits on new lines.
-
-Typical output of addr2line:
-
-  $ addr2line -e ./tests/regression/kernel//../../utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack --functions --addresses 0x40124B
-  0x000000000040124b
-  my_gettid
-  /tmp/test-callstack-master/src/lttng-tools/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack.c:40
-
-However, with the test app compiled using gcc 13.1, a "discriminator"
-annotation is present:
-
-  0x0000000000401279
-  fct_b
-  /tmp/test-callstack-master/src/lttng-tools/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack.c:58 (discriminator 1)
-
-Hence, by selecting the second to last element (-2, with negative
-indexing), the addr2line function returns '(discriminator' as the
-function name.
-
-Solution
---------
-
-The parsing code is changed to simply iterate on groups of 3 lines,
-following addr2line's output format.
-
-Fixes #1377
-
-Change-Id: I8c1eab97e84ca7cad171904bed6660540061cf08
-Signed-off-by: JÃ©rÃ©mie Galarneau <jeremie.galarneau@efficios.com>
----
- tests/utils/parse-callstack.py | 25 +++++++++++++++++--------
- 1 file changed, 17 insertions(+), 8 deletions(-)
-
-diff --git a/tests/utils/parse-callstack.py b/tests/utils/parse-callstack.py
-index c3f0e2e9bc..029100b618 100755
---- a/tests/utils/parse-callstack.py
-+++ b/tests/utils/parse-callstack.py
-@@ -26,14 +26,23 @@ def addr2line(executable, addr):
- 
-     status = subprocess.run(cmd, stdout=subprocess.PIPE, check=True)
- 
--    addr2line_output = status.stdout.decode("utf-8")
--
--    # Omit the last 2 lines as the caller of main can not be determine
--    fcts = [addr2line_output.split()[-2]]
--
--    fcts = [ f for f in fcts if '??' not in f]
--
--    return fcts
-+    addr2line_output = status.stdout.decode("utf-8").splitlines()
-+    # addr2line's output is made of 3-tuples:
-+    #   - address
-+    #   - function name
-+    #   - source location
-+    if len(addr2line_output) % 3 != 0:
-+        raise Exception('Unexpected addr2line output:\n\t{}'.format('\n\t'.join(addr2line_output)))
-+
-+    function_names = []
-+    for address_line_number in range(0, len(addr2line_output), 3):
-+        function_name = addr2line_output[address_line_number + 1]
-+
-+        # Filter-out unresolved functions
-+        if "??" not in function_name:
-+            function_names.append(addr2line_output[address_line_number + 1])
-+
-+    return function_names
- 
- def extract_user_func_names(executable, raw_callstack):
-     """
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
index 113720ca5cb..20e6375a9bb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
@@ -37,11 +37,9 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
-           file://40b2a4a793c81221a28f822d07135069456ea021.patch \
-           file://gcc13-ptest-fix.patch \
            "
 
-SRC_URI[sha256sum] = "8d94dc95b608cf70216b01203a3f8242b97a232db2e23421a2f43708da08f337"
+SRC_URI[sha256sum] = "e5d1095ec1322565f38f149346f71967496c281eacc51ec5c77994b850e7d335"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.39.2


