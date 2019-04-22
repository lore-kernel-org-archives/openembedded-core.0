Return-Path: <akuster808@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2E61471B99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:11 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id d19so5166537ioc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5u7f4br7enc4+26cw+aztyNME67IMvki6ewJeMq4B9I=;
	b=iUmAY/T3xm/cy7NPwwObgSWWJkwbX48Z4NxjqDHGyPiiJseIWuz7muK7hxlIz9hDEK
	lK7lr2hLb6S7YlbRoHrRIM6ixZYgZoIpMkYcEyGT6sVUSiWIG8EcbMcu8l5B+byW+Cz1
	uzvh7Ag+Na0mYHAx45F5oA7KwloaI8xn3Uwn15wh+mQR3y7bmR9lHRSwzqTMS0kCTY39
	f2WMQ2hKDiFNimJiDMqmwdoE8np2PtCnvRJIt/KGDMdTZBNTpia+LOE1cv6qJc4uvadD
	8J8UWLaTo576RkwZb70keQq4bPP/y7FelivTVkWsi3AAnVAkYKv9oc2GVdXCdFuTJ4eH
	3d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5u7f4br7enc4+26cw+aztyNME67IMvki6ewJeMq4B9I=;
	b=BZzQkjUefJVvkrOWZUChlcT8KCsHnXVdxAC5p+5O3jhSo1oueasVXFvn6y+hymEk/v
	fdpR5sVPAJZO0h33890/xikom5gCVuL/bhTqSTjtZ6ae6y/4Awr9WJMh1bkkvysRyMtM
	/HkOWLpSAnjKs7gY1mnQxCZUXcsFniiRad8LxKaqk3xX+rqDQzUBg9Ix7F71WB7n+xnf
	EsRk59hTkhevkSzl4R8OmIZ4OW14slK1w4SODchcbNW0ZP5CFyh3iV3KZqXlVhUgjHjc
	CLL7iEjxEz+zfwlquRBOahV1E2z+NFisl/PrHC3Vnnnl8S1w6nIrSMKmRMybsWICgcMa
	lEkA==
X-Gm-Message-State: APjAAAWa1r1jIptEIsDLF8QpEu0rKlZKc35gFHdI6rnBsYXfU/EvfToz
	1gZk9H8hsBfyDs8vxz9jnpS+iyOO
X-Google-Smtp-Source: APXvYqxIiWX16ulcL2V4wBDyAn3R6HRS5xKO78UZk/FTJ+SXZ2f6JVQDEy+JW+0/qUaRhKN3fJ0RZQ==
X-Received: by 2002:a5d:97da:: with SMTP id k26mr12557976ios.46.1555936931994; 
	Mon, 22 Apr 2019 05:42:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:55 -0600
Message-Id: <1555936919-19078-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 3/7] manual qa/bsp-qemu: remove rpm tests already done in runtime
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
X-List-Received-Date: Mon, 22 Apr 2019 12:42:11 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 60 --------------------------------------
 1 file changed, 60 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index cf51b6a..f680f64 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -91,66 +91,6 @@
   },
   {
     "test": {
-      "@alias": "bsps-qemu.bsps-tools.rpm_-__install_dependency_package",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Get a not previously installed RPM package or build one on local machine, which should have run-time dependency.For example, \"mc\" (Midnight Commander, which is a visual file manager) should depend on \"ncurses-terminfo\".   \n\n$ bitbake mc  \n\n\n",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Copy the package into a system folder (for example /home/root/rpm_packages).  \n\n\n",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "Run \"rpm -ivh package_name\" and check the output, for example \"rpm -ivh mc.rpm*\" should report the dependency on \"ncurses-terminfo\".\n\n\n\n",
-          "expected_results": "3 . rpm command should report message when some RPM installation depends on other packages."
-        }
-      },
-      "summary": "rpm_-__install_dependency_package"
-    }
-  },
-  {
-    "test": {
-      "@alias": "bsps-qemu.bsps-tools.Check_rpm_install/removal_log_file_size(auto)",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Get some rpm or other kind of installation packages.  \n\n",
-          "expected_results": "Steps 1- 4 (more than 2.3) \nEach file will occupy around 10MB, and there should be some method to keep rpm log in a small size. (the size of the db of RPMs must not be taking so much space)  \nStep 5 (less than or equal to 2.3)\nThe size on /var/lib/rpm/ must keep around 30MB"
-        },
-        "2": {
-          "action": "After system is up, check the size of log file named as \"log.xxxxxx\" on  /var/lib/rpm/log  \n\n",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "After several install/removal of packages, with either of the install/removal commands   (rpm/smart/zypper/dnf install/removal), check again the size of log file.  \n\n",
-          "expected_results": ""
-        },
-        "4": {
-          "action": "For packages installation, there will be some database files under /var/lib/rpm/, named as \"__db.xxx\" and there will be some log files   \nunder /var/lib/rpm/log, named as \"\"log.xxxxxx\"\".   \n\nNote: You will only see the log.xxxx on /var/lib/rpm/log mentioned above if the poky version is minor than 2.3.For poky 2.3 or major versions this has been modified and the package RPM4 does not show the logs.xxxx. if major, follow the next step.  \n\n",
-          "expected_results": ""
-        },
-        "5": {
-          "action": "Repeat steps (1 and 3)  and check the size of /var/lib/rpm/  \n\nMore info: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9259",
-          "expected_results": ""
-        }
-      },
-      "summary": "Check_rpm_install/removal_log_file_size"
-    }
-  },
-  {
-    "test": {
       "@alias": "bsps-qemu.bsps-runtime.only_one_connmand_in_background(auto)",
       "author": [
         {
-- 
2.7.4


