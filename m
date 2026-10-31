Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3763.1793405775906644148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RCOr0mEw;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso6350635e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405774; x=1794010574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oSuRNpCkLciRTiAnT1te9553WS6fCMULCLntkdxyba0=;
        b=RCOr0mEwGIaQ4inpv8fjBxi+vHOPAQFqbw0awJCcIRzzal6haqPIk2O6Si5MqtNhzS
         GjezR4kQE9LkyRiKyOCfwG+fe9UDIwqr/evbNuQk98JGQEh+Fq6+aNVsJVL90SjgXjUl
         bX93TOYWNvfc0VT7M3J3cvR0Ev/8FmgvKGWycuMLDtvWzMANJZT2S3NL2QFT633XRb3f
         iLCm9wgCn929E15LCR0pGYVJ/n588WPa3rY3tqBevvI0SJhE+BZ/IOMro86B5O5hmZwn
         tojdjWU4NxdrM26VkSUMLRl6ufDm7IUD4PQrqByxbSrWc5M9S1qQW+9HLen0CT/oWBjj
         wyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405774; x=1794010574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oSuRNpCkLciRTiAnT1te9553WS6fCMULCLntkdxyba0=;
        b=oTrMkZckHevXEk8yVLUFQVO4tvQ1EhTbyNqB/svSlWgFkJWdaM34a67mqOS1yz+rE+
         b/vw+qVYWYV8KcXslRgjA1jIskAvNa4QWyVkfXypiyQ/kswZ8oJypeMvyQbvYRtumscM
         SHf8MNvlnyQfDpTTrf0xDA2BYF3YrTibxYu/kXrmTa0MCUPRJgGrU5Qk371vvFqQT1Yw
         Bq84RUZ62tmnymFYdJaYHvS9c3vcSggrKT+QZH6DU86C+X2ZhkWAADmFIoSseteFCDet
         si8aZHSOQmson+wONq+TB2w5VrjS0rlRC/oToAIE7oM7XhF+qYIOooSEntQqlRhgcGxd
         EJKQ==
X-Gm-Message-State: AFq9FYInJ2eabv79jEg4oFuvAUHo2vD5h95waBdPUb851K//03fYSZwt
	tA+ltS6+r53di2CKYTPLeSY+15dgJJGSnn4FmdHrp7DsjCzqQFmROXOVdEA6BYwe/TQccHomsV0
	bok/mdQs=
X-Gm-Gg: AYBFou2BQrVWtE0xaBx8sQORLcDvrsl3Po5eOOyqxMYBtR7Dv7CxlNw9JXDrmmV87ku
	gGYpY7xmPNgZBYGAmLaYGgc3M73EnE7+jOMGk5EhHQbETVc5kih5fIJrq0Ja/kZ1igjX63P+w6o
	+LV4qlpi4OCW7C1DjUab5pR1hDvd4fc09S52H5jhyry9XHcwGYu69LaSUj7uiPCAKyZGreRxS9o
	4WJVC4YMFLezpegeZMONCNBzlLMu7Iq3yQUTwijgP94Vw4JjIycjMdEp9nCHdVU+y6Fs3ktMbiR
	m/Bostrc5KYNiVfn7qnOhDyHcTPIevxSPp8BQxDlkcvZ9xs09bVX6aajsucaYFrchoiEDGFonja
	BRYccf+CoLeg/WDASbPSSIKLuzHs5egxW9NEbG7ia3nCofwuRXeLXijzrF3e03vpeLuBRr91IIK
	c2tYpS8RBMcIhZN+51Op5a3g1r92gihQZtmiLQidyCPcD6RALe3Hg9bwPMuaed+fpVoPzvORjmv
	+s9bXadgQYMbraiz+9SMCxfOszWTYaVon7UoVP61VTAn//+/VQoUP0rEFgs6QiLeAxpmfpO0/ra
	XBCWe8kIg2qoOpghsEaqzytXwZr3FmCSQIHRLINXFHBWPigEI9E2RWAjRDc5fchvEeCQApAeAEi
	gAoKWEJdJUB4iUG+qx/NL+elecAJx
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr81998845e9.27.1793405774161;
        Fri, 30 Oct 2026 17:16:14 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 51/55] apr-util: Fix CVE-2026-32327
Date: Sat, 31 Oct 2026 01:15:12 +0100
Message-ID: <efbc8445744294b52407d66762d1328388e1b15b.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249126
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream test compatibility prerequisite [1], which is
required by the regression tests included with the XML nesting-depth
fix [2]. The fix addresses CVE-2026-32327 as described by the advisory
[3].

[1] https://github.com/apache/apr-util/commit/dba5d434dba0547478f411d6fa068766455446ce
[2] https://github.com/apache/apr-util/commit/414e12e427c89f135d8ee66ab1203feffd3e2bd8
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-32327

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../apr-util/CVE-2026-32327-dependent.patch   |   34 +
 .../apr/apr-util/CVE-2026-32327.patch         | 2162 +++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |    2 +
 3 files changed, 2198 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch b/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
new file mode 100644
index 00000000000..c3c570f4070
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
@@ -0,0 +1,34 @@
+From dba5d434dba0547478f411d6fa068766455446ce Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Tue, 19 Dec 2023 11:20:33 +0000
+Subject: [PATCH] Merge r1914772 from 1.7.x:
+
+* test/testutil.h: Define APR_ASSERT_SUCCESS for compatibility
+  with apr trunk.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1914774 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-32327
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/dba5d434dba0547478f411d6fa068766455446ce]
+
+(cherry picked from commit dba5d434dba0547478f411d6fa068766455446ce)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ test/testutil.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/testutil.h b/test/testutil.h
+index eaa7e759..4c5e30b8 100644
+--- a/test/testutil.h
++++ b/test/testutil.h
+@@ -40,6 +40,8 @@ extern apr_pool_t *p;
+ /* Assert that RV is an APR_SUCCESS value; else fail giving strerror
+  * for RV and CONTEXT message. */
+ void apr_assert_success(abts_case* tc, const char *context, apr_status_t rv);
++#define APR_ASSERT_SUCCESS(tc, ctxt, rv) \
++             apr_assert_success(tc, ctxt, rv)
+ 
+ void apr_assert_failure(abts_case* tc, const char *context,
+                         apr_status_t rv, int lineno);
diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch b/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch
new file mode 100644
index 00000000000..a0c4004709c
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch
@@ -0,0 +1,2162 @@
+From 414e12e427c89f135d8ee66ab1203feffd3e2bd8 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Mon, 3 Aug 2026 12:34:32 +0000
+Subject: [PATCH] Merge r1936807 from 1.7.x:
+
+limit XML processing depth
+
+Submitted By: jorton
+Reviewed By: jorton, jfclere, ivan
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936815 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-32327
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/414e12e427c89f135d8ee66ab1203feffd3e2bd8]
+
+(cherry picked from commit 414e12e427c89f135d8ee66ab1203feffd3e2bd8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ CMakeLists.txt        |    3 +
+ test/data/nesting.xml | 2001 +++++++++++++++++++++++++++++++++++++++++
+ test/testxml.c        |   32 +
+ xml/apr_xml.c         |   21 +-
+ 4 files changed, 2056 insertions(+), 1 deletion(-)
+ create mode 100644 test/data/nesting.xml
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fcbfc582..65b9194d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -288,6 +288,9 @@ IF(APR_BUILD_TESTAPR)
+   EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E copy_if_different 
+                   ${PROJECT_SOURCE_DIR}/test/data/billion-laughs.xml
+                   ${PROJECT_BINARY_DIR}/data/billion-laughs.xml)
++  EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E copy_if_different 
++                  ${PROJECT_SOURCE_DIR}/test/data/nesting.xml
++                  ${PROJECT_BINARY_DIR}/data/nesting.xml)
+ 
+   IF(TEST_STATIC_LIBS)
+     SET(whichapr    aprutil-1)
+diff --git a/test/data/nesting.xml b/test/data/nesting.xml
+new file mode 100644
+index 00000000..a4efda86
+--- /dev/null
++++ b/test/data/nesting.xml
+@@ -0,0 +1,2001 @@
++<?xml version="1.0"?>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
+diff --git a/test/testxml.c b/test/testxml.c
+index eed10672..5284f888 100644
+--- a/test/testxml.c
++++ b/test/testxml.c
+@@ -20,6 +20,10 @@
+ #include "abts.h"
+ #include "testutil.h"
+ 
++#ifndef APR_XML_MAX_DEPTH
++#define APR_XML_MAX_DEPTH 256
++#endif
++
+ static apr_status_t create_dummy_file_error(abts_case *tc, apr_pool_t *p,
+                                             apr_file_t **fd)
+ {
+@@ -166,6 +170,33 @@ static void test_billion_laughs(abts_case *tc, void *data)
+     apr_file_close(fd);
+ }
+ 
++static void test_nesting_limit(abts_case *tc, void *data)
++{
++    apr_file_t *fd;
++    apr_xml_parser *parser = NULL;
++    apr_xml_doc *doc;
++    apr_status_t rv;
++    char errbuf[256], *err;
++
++    rv = apr_file_open(&fd, "data/nesting.xml",
++                       APR_FOPEN_READ, 0, p);
++    APR_ASSERT_SUCCESS(tc, "open nesting.xml", rv);
++
++    rv = apr_xml_parse_file(p, &parser, &doc, fd, 2000);
++    ABTS_TRUE(tc, rv != APR_SUCCESS);
++
++    if (parser) {
++        err = apr_xml_parser_geterror(parser, errbuf, sizeof errbuf);
++        ABTS_STR_EQUAL(tc,
++                       "The maximum element nesting limit "
++                       "(" APR_STRINGIFY(APR_XML_MAX_DEPTH) ")"
++                       " was exceeded.",
++                       err);
++    }
++
++    apr_file_close(fd);
++}
++
+ static void test_CVE_2009_3720_alpha(abts_case *tc, void *data)
+ {
+     apr_xml_parser *xp;
+@@ -198,6 +229,7 @@ abts_suite *testxml(abts_suite *suite)
+ 
+     abts_run_test(suite, test_xml_parser, NULL);
+     abts_run_test(suite, test_billion_laughs, NULL);
++    abts_run_test(suite, test_nesting_limit, NULL);
+     abts_run_test(suite, test_CVE_2009_3720_alpha, NULL);
+     abts_run_test(suite, test_CVE_2009_3720_beta, NULL);
+ 
+diff --git a/xml/apr_xml.c b/xml/apr_xml.c
+index 2685a9a5..a2535f98 100644
+--- a/xml/apr_xml.c
++++ b/xml/apr_xml.c
+@@ -61,12 +61,19 @@ struct apr_xml_parser {
+     int error;			/* an error has occurred */
+ #define APR_XML_ERROR_EXPAT             1
+ #define APR_XML_ERROR_PARSE_DONE        2
+-/* also: public APR_XML_NS_ERROR_* values (if any) */
++#define APR_XML_ERROR_DEPTH_LIMIT       3
+ 
++/* also: public APR_XML_NS_ERROR_* values (if any) */
++    /** depth of element tree. */
++    unsigned int depth;
+     XML_Parser xp;              /* the actual (Expat) XML parser */
+     enum XML_Error xp_err;      /* stored Expat error code */
+ };
+ 
++#ifndef APR_XML_MAX_DEPTH
++#define APR_XML_MAX_DEPTH 256
++#endif
++
+ /* struct for scoping namespace declarations */
+ typedef struct apr_xml_ns_scope {
+     const char *prefix;		/* prefix used for this ns */
+@@ -154,6 +161,11 @@ static void start_handler(void *userdata, const char *name, const char **attrs)
+     if (parser->error)
+ 	return;
+ 
++    if (++parser->depth > APR_XML_MAX_DEPTH) {
++        parser->error = APR_XML_ERROR_DEPTH_LIMIT;
++        return;
++    }
++
+     elem = apr_pcalloc(parser->p, sizeof(*elem));
+ 
+     /* prep the element */
+@@ -327,6 +339,8 @@ static void end_handler(void *userdata, const char *name)
+     if (parser->error)
+ 	return;
+ 
++    parser->depth--;
++
+     /* pop up one level */
+     parser->cur_elem = parser->cur_elem->parent;
+ }
+@@ -499,6 +513,11 @@ APU_DECLARE(char *) apr_xml_parser_geterror(apr_xml_parser *parser,
+                             XML_ErrorString(parser->xp_err), parser->xp_err);
+         return errbuf;
+ 
++    case APR_XML_ERROR_DEPTH_LIMIT:
++        msg = "The maximum element nesting limit ("
++            APR_STRINGIFY(APR_XML_MAX_DEPTH) ") was exceeded.";
++        break;
++
+     case APR_XML_ERROR_PARSE_DONE:
+         msg = "The parser is not active.";
+         break;
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 7b5a04c4350..00a9589ae83 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -14,6 +14,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configure_fixes.patch \
 	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
            file://CVE-2025-49506.patch \
+           file://CVE-2026-32327-dependent.patch \
+           file://CVE-2026-32327.patch \
            file://run-ptest \
            "
 
