Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.213.1622740937402496861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 10:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CbkL2Lvp;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id s6so8010885edu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SniS2vYUuD3WB2M8hqnqAsARVAClT+IxqMikWYYcIvE=;
        b=CbkL2Lvpx+j18s6yintn7CKgSGm0srp5gEP3RqO9veYVXsSuehQFBP2IixVNauK6wi
         cFRFuLzFs0+ECU4B3Fqjzy1YigZuqw25XiTHLx0S2jEXu2Xy0Nw9G/ZlAGp3b2oUrXtY
         6+WQ9g4AR6/HgTPnG815+sTkdEFzD2f7xq+AXz69GRWPOSoxXyChG7/y8N8PF9pvhb/Y
         xvb/G4ui8g4zln7qx2l5oN4x7J2x9qTiufvweWhnBAszjsP9OUsmx8UZN50tDlhQNDX4
         KSQgOokvdW7Z3GqjGv8rR3nDjUbc7cTIsCcO4x+1Vmn+dA7caO24Il2p/eA1aw+S2X+3
         Z2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SniS2vYUuD3WB2M8hqnqAsARVAClT+IxqMikWYYcIvE=;
        b=hSf1EfATT+QWKRzPqNvcIkinO/4I6GiyrPEWBxdBIgRuMfNc7iVv/69VZnIOreC488
         zNZ66tlWfoz4BYR1dDaf58PH0HcrVBdFkhaBtBb/XysVlybpal643A4hP5QtdCgl8678
         qwuJK1YXt56WGDYqWQDzaNi9L1md27BgXCdHp4fjizsd2D7Bm29oCNFzLwwv13iRc8zZ
         PowLUzV8OAAGEnW1/Ha2di14OzZOBi2FQb60V4GYq9wCCi3MGyj5ld1uQkB2z5Hp2M1h
         4SbNFsGCACK3SzePgZhlc5c4ksI9HrTRObHlr44QdED8EfAAaaU1uo9QHyQpnH6C9hUZ
         upjw==
X-Gm-Message-State: AOAM530pXZLFb6R21mf4OqM6te0F95CEE2eNtPkw78Ubxz8FU3S0WPf7
	Hz+bJoX/Qx5GMs7AW8gpVG2zF+TDpoemspB2
X-Google-Smtp-Source: ABdhPJwF2WKL2nIdFNcTzDw7flgXN7tqeERwCyAzhEDhj7aLTmb1q+vbCuEFTQvvJazeESq3mqm8Cw==
X-Received: by 2002:a05:6402:1559:: with SMTP id p25mr530165edx.343.1622740935523;
        Thu, 03 Jun 2021 10:22:15 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id g4sm2054187edw.8.2021.06.03.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 10:22:14 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/3] meta-skeleton: add a ptest example
Date: Thu,  3 Jun 2021 19:21:47 +0200
Message-Id: <20210603172149.100248-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../ptest-example/files/run-ptest             | 26 +++++++++++++++++++
 .../ptest-example/ptest-example_0.1.bb        | 16 ++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
 create mode 100644 meta-skeleton/recipes-skeleton/ptest-example/ptest-example_0.1.bb

diff --git a/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest b/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
new file mode 100644
index 0000000000..7c80306475
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+# The result should be PASS, FAIL, or SKIP, and the testname can be any identifying string.
+# The ptest-runner does not evaluate stdout or stderr. The output format is a recommended convention.
+# A real ptest would call the unit-test executable instead of echo.
+echo "PASS:  dummy test passing always"
+
+# Optional a ptest might provide a JUnit like XML report. Reports are collected by the ptest imagetest if
+# the TESTIMAGE_PTEST_REPORT_DIR variable is configured for the tested image.
+# Example to fetch a xml report to ${TEST_LOG_DIR}/reports-xml/ptest-example.xml:
+#   TESTIMAGE_PTEST_REPORT_DIR ?= "/tmp/ptest-xml/*.xml:reports-xml"
+# The following shell heredoc is as a placeholder e.g. for something more useful such as
+# my-gtest --gtest_output="xml:/tmp/ptest-xml/"
+mkdir -p /tmp/ptest-xml
+cat << xxxEOFxxx > /tmp/ptest-xml/ptest-example.xml
+<?xml version="1.0" encoding="UTF-8"?>
+<testsuites tests="1" failures="0" disabled="0" errors="0" time="0.010" timestamp="2020-09-20T10:44:23" name="AllTests">
+  <testsuite name="ConfigurationTest" tests="1" failures="0" disabled="0" errors="0" time="0.010" timestamp="2020-09-20T10:44:23">
+    <testcase name="readConfiguration" status="run" result="completed" time="0.010" timestamp="2020-09-20T10:44:23" classname="ConfigurationTest" />
+  </testsuite>
+</testsuites>
+xxxEOFxxx
+
+# The ptest-runner evaluates the exit value of a test case: 0 means pass, 1 means fail.
+# This minimal example passes always.
+exit 0
diff --git a/meta-skeleton/recipes-skeleton/ptest-example/ptest-example_0.1.bb b/meta-skeleton/recipes-skeleton/ptest-example/ptest-example_0.1.bb
new file mode 100644
index 0000000000..02bc9bcfa2
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/ptest-example/ptest-example_0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A very basic ptest enabled recipe"
+DESCRIPTION = "This recipe provides a minimalistic ptest package"
+SECTION = "examples"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# A recipe is "ptest-enabled" if it inherits the ptest class
+inherit ptest
+
+# Usually a ptest contains at least two items: the actual test,
+# and a shell script (run-ptest) that starts the test.
+# For this minimized example there is just the script.
+SRC_URI = "file://run-ptest"
+
+# This minimalistic example provides nothing more than a ptest package.
+ALLOW_EMPTY_${PN} = "1"
-- 
2.31.1

