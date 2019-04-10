Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id CECB37D909
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id h18so2544614wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HkOw4wgqka+VI35G+JCsB6yPtHQdPeOdi7Okv9YIXn4=;
	b=saDui6mqhyg75SjnlpcYwbDeF7lxlXJpw/TLof7d6Iwo0M+jhu4csxnf3sAZx+g+9Q
	2cDjWaMEdN5YrDgeSTnux9YyktKIKBv5p6tKRoy/On0EWKcOAO7sZbT9xUFvmJq0d7xp
	hMWPg5HTSd7dVPgpMc+Ul/EVn+KRUerg4VZ7xSeho4qs6TmByk/ZKEP5u9rs+705H87W
	V5qjMPdqi+AgCmjpd4pxsqnjRo+5+8lhGgnlwG4l5tPNxJZ9PgxHHr9bED0a49DFq0K8
	tWQxJK6IgRsH+/hkK1EXEwCC2Kp1n8+JcFJAM/BH3MGhoPHAGIWiNkp7UBy2D819fu2b
	Va7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HkOw4wgqka+VI35G+JCsB6yPtHQdPeOdi7Okv9YIXn4=;
	b=fWKQ6kNQe41Wa0atcWc2pvWRUC24pJBeDlNUCwqhEuWmEP5rEn0068X6eJLWylNtcq
	Mpz4X6tfbiPKhnuRKhPhHnqbeTxFyzZIZpJ5oaGyhLx6xMYFNUqZNZrV0V+gDz+YawDQ
	fuYiYLfa4+1AV9pXNVCZbO6O7CB9tCEFaqADF2rgDRALIQXC/Q27Mn9p8ii/r1CJEiHZ
	osRSj8ziiK9I9bUoUnAiNNd8qL1ZMZ0IVjtwb3cN+H7l3UqooN/5ddnYXhGPiivowY1b
	Jdz0XTwDPnRU8qHm2r+YI9yLBfNXKKViiOBqmv6Quz1QiWzkIQzM9wmvCdCbEDkz7foC
	YzhA==
X-Gm-Message-State: APjAAAX9c6thffn5bn/h87K1XtBBztBOJ+6ejJT8TmaoQT8PwynsSKxE
	+CJuDUvPsdOyIm7vMCXDEBtybu68PZU=
X-Google-Smtp-Source: APXvYqypyHI+fgeLZKzWPQEZ7gxdTZWAAROp2k0wUV4Bb+jBE7LZf36pvK8Ek00hy+8/xPoUSzCchA==
X-Received: by 2002:a1c:9ad6:: with SMTP id c205mr2913771wme.46.1554901927357; 
	Wed, 10 Apr 2019 06:12:07 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:24 +0530
Message-Id: <3f143119def5a84430762790f69b426fdc8ad281.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 05/33] oeqa/manual: Add manual runtime 'compliance' testcases to json
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:07 -0000

From: Sudhir Sharma <sudhirx.sharma@intel.com>

Added json file for compliance test cases to the manual runtime tests

Signed-off-by: Sudhir Sharma <sudhirx.sharma@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/compliance-test.json | 142 ++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 meta/lib/oeqa/manual/compliance-test.json

diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/manual/compliance-test.json
new file mode 100644
index 0000000..7adf8a1
--- /dev/null
+++ b/meta/lib/oeqa/manual/compliance-test.json
@@ -0,0 +1,142 @@
+[
+    {
+        "test": {
+            "@alias": "configuration.configuration.LTP_subset_test_suite",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "For real hardware, run following component, \nsyscalls \nfs \nfsx \ndio \nio \nmm \nipc \nsched \nmath \nnptl \npty \nadmin_tools \ntimers \ncommands  \n\nFor QEMU, run following component \nsyscalls \nmm \nipc \nsched \nmath \nnptl \npty \nadmin_tools \ncommands \n\nRun Instructions: \nLTP download: http://sourceforge.net/projects/ltp/files/LTP%20Source/ltp-20120401/ltp-full-20120401.bz2/download  \n\n(link is outdated, always use the last version released or the one found in the image)  \n\n\n\nbuild steps: refer to http://ltp.sourceforge.net  \n\nRun steps:",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Build LTP with toolchain or in sdk image. Or use a sato-sdk image which has LTP already included in /opt/ltp",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "For QEMU, create the qemu target with \"-m 512\", which makes some memory stress cases pass. For some issues, we could only set 128M for qemuarm and 256M for qemumips.",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Copy LTP folder into target, for example, /opt/ltp if you have built it yourself. Modify the default scenario file \"scenario_groups/default\", remove test suites not to be tested",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Comment runtests/sched: hackbench, which is not suitable to run in emulators. Reminder (comment it also for Sugarbay Devices).",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "Comment oom01, oom02, oom03, oom04 in runtest/mm, which consume lots of memory",
+                    "expected_results": ""
+                },
+                "7": {
+                    "action": "From /opt/ltp run: ./runltp -p -l result-M2-20101218.log -C result-M2-20101218.fail -d /opt/ltp/tmp &> result-M2-20101218.fulllog \n\n",
+                    "expected_results": "Check the result on wiki, https://wiki.yoctoproject.org/wiki/LTP_result, there should be no regression failure met."
+                }
+            },
+            "summary": "LTP_subset_test_suite"
+        }
+    },
+    {
+        "test": {
+            "@alias": "configuration.configuration.POSIX_subset_test_suite",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "In a sato-sdk image go to /opt/ltp or get latest LTP sourcecode,  download location is  http://sourceforge.net/projects/ltp/files/LTP%20Source/  and install it.",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Go into the folder of LTP, and posix_testsuite is under testcases/open_posix_testsuite/",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Run connmand: make generate-makefiles",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Run connmand: make conformance-all",
+                    "expected_results": ""
+                },
+                "5": {
+                    "action": "Run connmand: make conformance-test (this step may show errors, ignore them)",
+                    "expected_results": ""
+                },
+                "6": {
+                    "action": "Run connmand: make tools-all",
+                    "expected_results": ""
+                },
+                "7": {
+                    "action": "Run connmand: sh posix.sh > posix.log, posix.sh as below:  \n \n#!/bin/sh \n./bin/run-posix-option-group-test.sh AIO \n./bin/run-posix-option-group-test.sh MEM \n./bin/run-posix-option-group-test.sh MSG \n./bin/run-posix-option-group-test.sh SEM \n./bin/run-posix-option-group-test.sh SIG \n./bin/run-posix-option-group-test.sh THR \n./bin/run-posix-option-group-test.sh TMR \n./bin/run-posix-option-group-test.sh TPS  \n \n",
+                    "expected_results": ""
+                },
+                "8": {
+                    "action": "Check the posix.log after testing is finished",
+                    "expected_results": "Compare the test result on wiki, https://wiki.yoctoproject.org/wiki/Posix_result, there should be no more regression failures met."
+                }
+            },
+            "summary": "POSIX_subset_test_suite"
+        }
+    },
+    {
+        "test": {
+            "@alias": "configuration.configuration.LSB_subset_test_suite",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Get lsd-sdk image and install it on target device or start the image(if it is QEMU) with option \"-m 512M\"",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Comment in /opt/lsb-test/session any tests you don't want to run.",
+                    "expected_results": ""
+                },
+                "3": {
+                    "action": "Run /usr/bin/LSB_Test.sh which should download the LSB suite and set it up. Some packages may fail to download because their location changed on ftp.linuxfoundation.org. You need to manually update /opt/lsb-test/packages_list",
+                    "expected_results": ""
+                },
+                "4": {
+                    "action": "Tests should start automatically, you can use the web interface to reconfigure the setup. ",
+                    "expected_results": "Check the result on wiki https://wiki.yoctoproject.org/wiki/LSB_Result No regression failures should be met."
+                }
+            },
+            "summary": "LSB_subset_test_suite"
+        }
+    },
+    {
+        "test": {
+            "@alias": "General_Runtime.General_Runtime.stress_test_-_Genericx86-64",
+            "author": [
+                {
+                    "email": "corneliux.stoicescu@intel.com",
+                    "name": "corneliux.stoicescu@intel.com"
+                }
+            ],
+            "execution": {
+                "1": {
+                    "action": "Bootup with core-image-lsb-sdk image",
+                    "expected_results": ""
+                },
+                "2": {
+                    "action": "Execute the crashme test with below command  \n\n./opt/ltp/runltp f  crashme",
+                    "expected_results": "The stress testing should not make the target crash. Check CPU usage and basic functionality of the system after the tests are over. "
+                }
+            },
+            "summary": "stress_test_-_Genericx86-64"
+        }
+    }
+]
\ No newline at end of file
-- 
2.7.4


