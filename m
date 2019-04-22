Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3956D5B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:35:17 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id x132so17586053itf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Q/nu1EsyRsOItVRTC5caXNwMwPepQlCMSWf0ZwwGNhQ=;
	b=sMJjRTP8PemaM59AtHnGdBrRbTUq1WGUZ5n7xHsjPmJlbe4yZMrUo9ZiDFyDCaX8jN
	Mk7m0iJ6EfVUwXcPuij2b96U5vTlYqioYu6Zg4/QBf3enYg73sEIccGP4pTunPIWwLDO
	tA1ieVnUS6PZghyJw6t+E5smWa1DGzft8ozL0XGIL6dDpSGylp9MoyaAWe+A+y/9TZT8
	gZ1WkAoefbMmkqhqIe3v3UbdVDTYdHTnxh2b3sVwzxOy4nKCad5YThkNOnbMDgBB1ozh
	7tm17HRTeKsKFN8W4DCEEbac5INK/9/RY2UtAXSns13W6lSZw9O67k5+VwyjhW3UVfb3
	j5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q/nu1EsyRsOItVRTC5caXNwMwPepQlCMSWf0ZwwGNhQ=;
	b=M9Jo0D8JGPDOTWzWXIIab35r3yu+q+wyjaPk9HlikPvdqfFk4gxLpynouo7PbwL2dZ
	p6rEYuGRpPR1PSp6kTHoLM1G5MzOIC1WorI64ontd9OD/JtO1EJo2tH6qnO0xcj9QsTT
	PEd8/9xtSKFVd2/Ag3HOjPM9z03LtysgvFetebH/BA55gR8DgrkQ6/EJmPjOM27unc9A
	3fWJyuknD58Vt510+TSuDyWqh1ONa7qogmdS5PiTy7KtxG1bNTc6SqflwrhkgAiYvkOk
	N+3SN0frPqTOdtHJ6C0+Kx43HFlbzOpB6ANyIAvYoH0ASgCuoh/JV/HxcWcYUpLX1PaP
	0gqg==
X-Gm-Message-State: APjAAAXXbREutNSntfWaOidwpFL7x7qQvsypXGFbzYBjBsWWnOT7sxwH
	aMdSYN2yKTDAhDn8dUI3kzQKRArB
X-Google-Smtp-Source: APXvYqzx7A+WolRhUHydyu8BRcQQfbJENRqpndi9SP7TfWw/mgJau7CblCVfMFssIktMmqcR2KyNGw==
X-Received: by 2002:a02:b88b:: with SMTP id p11mr12849601jam.82.1555936518207; 
	Mon, 22 Apr 2019 05:35:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id b1sm4012051ioj.82.2019.04.22.05.35.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:35:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:35:08 -0600
Message-Id: <1555936508-18954-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [QA][PATCH] manual compliance: remove bits done at runtime
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
X-List-Received-Date: Mon, 22 Apr 2019 12:35:17 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/compliance-test.json | 90 +------------------------------
 1 file changed, 1 insertion(+), 89 deletions(-)

diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/manual/compliance-test.json
index 982f0b4..8c13b68 100644
--- a/meta/lib/oeqa/manual/compliance-test.json
+++ b/meta/lib/oeqa/manual/compliance-test.json
@@ -1,94 +1,6 @@
 [
     {
         "test": {
-            "@alias": "compliance-test.compliance-test.LTP_subset_test_suite",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "For real hardware, run following component, \nsyscalls \nfs \nfsx \ndio \nio \nmm \nipc \nsched \nmath \nnptl \npty \nadmin_tools \ntimers \ncommands  \n\nFor QEMU, run following component \nsyscalls \nmm \nipc \nsched \nmath \nnptl \npty \nadmin_tools \ncommands \n\nRun Instructions: \nLTP download: http://sourceforge.net/projects/ltp/files/LTP%20Source/ltp-20120401/ltp-full-20120401.bz2/download  \n\n(link is outdated, always use the last version released or the one found in the image)  \n\n\n\nbuild steps: refer to http://ltp.sourceforge.net  \n\nRun steps:",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Build LTP with toolchain or in sdk image. Or use a sato-sdk image which has LTP already included in /opt/ltp",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "For QEMU, create the qemu target with \"-m 512\", which makes some memory stress cases pass. For some issues, we could only set 128M for qemuarm and 256M for qemumips.",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Copy LTP folder into target, for example, /opt/ltp if you have built it yourself. Modify the default scenario file \"scenario_groups/default\", remove test suites not to be tested",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Comment runtests/sched: hackbench, which is not suitable to run in emulators. Reminder (comment it also for Sugarbay Devices).",
-                    "expected_results": ""
-                },
-                "6": {
-                    "action": "Comment oom01, oom02, oom03, oom04 in runtest/mm, which consume lots of memory",
-                    "expected_results": ""
-                },
-                "7": {
-                    "action": "From /opt/ltp run: ./runltp -p -l result-M2-20101218.log -C result-M2-20101218.fail -d /opt/ltp/tmp &> result-M2-20101218.fulllog \n\n",
-                    "expected_results": "Check the result on wiki, https://wiki.yoctoproject.org/wiki/LTP_result, there should be no regression failure met."
-                }
-            },
-            "summary": "LTP_subset_test_suite"
-        }
-    },
-    {
-        "test": {
-            "@alias": "compliance-test.compliance-test.POSIX_subset_test_suite",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "In a sato-sdk image go to /opt/ltp or get latest LTP sourcecode,  download location is  http://sourceforge.net/projects/ltp/files/LTP%20Source/  and install it.",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Go into the folder of LTP, and posix_testsuite is under testcases/open_posix_testsuite/",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Run connmand: make generate-makefiles",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Run connmand: make conformance-all",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Run connmand: make conformance-test (this step may show errors, ignore them)",
-                    "expected_results": ""
-                },
-                "6": {
-                    "action": "Run connmand: make tools-all",
-                    "expected_results": ""
-                },
-                "7": {
-                    "action": "Run connmand: sh posix.sh > posix.log, posix.sh as below:  \n \n#!/bin/sh \n./bin/run-posix-option-group-test.sh AIO \n./bin/run-posix-option-group-test.sh MEM \n./bin/run-posix-option-group-test.sh MSG \n./bin/run-posix-option-group-test.sh SEM \n./bin/run-posix-option-group-test.sh SIG \n./bin/run-posix-option-group-test.sh THR \n./bin/run-posix-option-group-test.sh TMR \n./bin/run-posix-option-group-test.sh TPS  \n \n",
-                    "expected_results": ""
-                },
-                "8": {
-                    "action": "Check the posix.log after testing is finished",
-                    "expected_results": "Compare the test result on wiki, https://wiki.yoctoproject.org/wiki/Posix_result, there should be no more regression failures met."
-                }
-            },
-            "summary": "POSIX_subset_test_suite"
-        }
-    },
-    {
-        "test": {
             "@alias": "compliance-test.compliance-test.LSB_subset_test_suite",
             "author": [
                 {
@@ -191,4 +103,4 @@
       "summary": "stress_test_-_-ltp_-Beaglebone"
     }
   }
-]
\ No newline at end of file
+]
-- 
2.7.4


