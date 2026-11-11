Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5586.1794387815568514032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Q/+Txxs6;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so21515215e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387814; x=1794992614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pI2pWpghdr533+926R8B6yD+oWpH8dC/g2U6DhucaII=;
        b=Q/+Txxs6IrF9EBstio3XWVkTDO3MQeODqP2W/pAmpsh6iabzYq09CAuQ/BU30viBM/
         KuzsTW/28TmcB+L/t9xa7kOSigXefBcQPmyHKFNQheVZoH7jz5q94DvwgxIg8YW3t4LI
         tU+lMeqyllOKMIBqfq/dfR70rzvQ17KOS5lb5enIeIcZelyieWJFi9YBiZLXM6/VY7pS
         oaC4gRqqNoP3OrcsGC40neVKiMEUTYiNvw2K3JZc7MEkEqy3NpEro2NhWXkYKTw9YUzG
         OrIws7GDHNOy9BWAkUmGpChyAxeCTAoWvHa6062pdpVgGpcUXsQuokYFYxpeTw/n1h9c
         FbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387814; x=1794992614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pI2pWpghdr533+926R8B6yD+oWpH8dC/g2U6DhucaII=;
        b=MoYIKPudgQb/X5La22hfr72uDY6NYuAiLVLnShhllnCRVKD2EBaowNfJT3z1AQS5Pi
         kILZ0A8FrRqbCDcA1RDXGUXx/OdJSBl7o55j4gFmuIX7O8QhRr3D7P5WneAJeNDT+DFG
         RCPf+uNhWtV0y3Df+7WZSNd6wu6C67eRkeoGhYbQcUNXNVJo/Wwf1nMsBOarDYA1q5A6
         sZw22gLmLjU/2YPm+tEZP0gonn7ug086Cqc332dnP0/XEO+wcdlPwnj6z5eqUcxpFnlq
         87LdxaS1+gpxqmaGcIzemH7yPTQy1ILHyI5/x2yW7ddn/tU8WzBYLaXIxpiOOW3QaVUQ
         7WMQ==
X-Gm-Message-State: APuU4Z/g5MQEXY5NQlRQTkbe6y60rV+ycQOOORIeOesQBUyNTF6MwETt
	+Yo2zTO3+aGqJxgbSqAOFSQLGJZ8EKZSvXViL82N4rkyok/vElTocLz3N/hBAmUulaBM+FKirNk
	Krc5UGvo=
X-Gm-Gg: AYBFou2B2UhU7U/oAExwfwyX1qAIucddKaOQrwPtI2NsQoHAnHDGR7LtAtnf8H6BYXy
	JyKKE1FOFivW7O6trpsFyJz8OlR95WPB/7A6LnuXWW/yF38ytxZch+aqD9kaqZ4/dLvqOWXR9TF
	tMSyasABwRoN/5mjYWRIwURFTrkAoQYbIUkeTc1Kx7Cpdspjq8BunnFeGIryrGeii5Lklu8BTxB
	y2iSliB8pCqasCM4Kt+3FrQjUnq/wHSAwqqdhAiv2J5TqCgrPpJKhcIEjfeLKY5FggFvf+JK+9z
	CXlbOmfgS9U4rl2VL+HQALF4k7gzLkvzUFvq+MqufgCpjyYVR5X/agE398Qwv3uhbW8lCShX++W
	clsdgwaZ5L5DmZl9ALOsnvGVc4UTUwBCFpYnCiJtDxw6+ci1B5LDFNCVjgVZOLFHcihzcMoB6y7
	y4izm8v+uWmI2n0Vgx/Djhcws6Keam7t7XhDC0GZh/m6QtG63CkaJuwXDsUnG+JPDBsILeRuiVB
	Gh5KEO6YiCiTyOBWMZ+GSE/QzYnPNAQl6XLMg9KmUmAh+uE5S4jQAPSbxdWaQwUNgYl1gvEut0X
	Hn1ot805Fh4XAaKs15FvvFSI01Pvava9zjtMyfk+0ug+cG27ToDwR6HXFhqxcUDl+q2lsbSpgrD
	BUX8t7PDBUA7+KgZX4LnbxlyO4PMZ
X-Received: by 2002:a05:600c:b86:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ba0931efefmr32016775e9.4.1794387813773;
        Wed, 11 Nov 2026 01:03:33 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/35] python3: skip test.test_readline.TestHistoryManipulation on musl
Date: Wed, 11 Nov 2026 10:02:45 +0100
Message-ID: <729419b4855231191f47c84396686744fb256b16.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249991
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Fixes to the editline integration have sadly introduced regressions on
musl:

FAIL: test_append_limited_history (test.test_readline.TestHistoryManipulation.test_append_limited_history)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.14/test/test_readline.py", line 208, in test_append_limited_history
    self.assertEqual(readline.get_history_item(1), "second line")
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: '_HiStOrY_V2_' != 'second line'
- _HiStOrY_V2_
+ second line

======================================================================
FAIL: test_write_read_append (test.test_readline.TestHistoryManipulation.test_write_read_append)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.14/test/test_readline.py", line 101, in test_write_read_append
    self.assertEqual(readline.get_current_history_length(), 3)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 4 != 3

A ticket has been filed upstream so skip the tests for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ba31b6a42f884964d2cff04235a930f757b9e4b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
index 73d6e89854d..a4cd0697d2a 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -274,6 +274,11 @@ SKIPPED_TESTS:append:class-target:libc-musl = " \
     --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym \
 "
 
+# https://github.com/python/cpython/issues/159424
+SKIPPED_TESTS:append:libc-musl = " \
+    --ignore test.test_readline.TestHistoryManipulation.test_append_limited_history \
+    --ignore test.test_readline.TestHistoryManipulation.test_write_read_append \
+"
 
 do_install_ptest:append () {
     sed -i -e "s|SKIPPED_TESTS=|SKIPPED_TESTS=\"${SKIPPED_TESTS}\"|" ${D}${PTEST_PATH}/run-ptest
