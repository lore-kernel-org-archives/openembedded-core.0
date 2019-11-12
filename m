Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id EF4E87FBBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:48 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id j12so8802302plt.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5u7f4br7enc4+26cw+aztyNME67IMvki6ewJeMq4B9I=;
	b=L+wUJQG8Eiv0/KwaSSsk5iKQiiTpkCbLtuIR3OVLiFflVDmNJGD8xyrjXmT3HtTagQ
	atrnb5qKJfYxaRchFyXzNhCiGtihQ/QNFI2tXSde5kYAozGYzLgyn8MB+4W+d6+PT4wd
	I906FicG1V8PalS6mk/mi14QvQslVFsfYOqFC2QvzTemuo1o6Vdsp5xPhBI+0ksYrbAe
	poM0mthbOudBlNVMbRiOKbzSp1+3MJIuEJLxZZor4yByKNbZ6jgzJvlyhCOEzVFdD3b7
	if2dGnHdn5hIN3d4Lj6caIHtQlfDEyJU/p99UcX9QlLIxqGp5RNRfdK3KedIOa3qHk9y
	MdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5u7f4br7enc4+26cw+aztyNME67IMvki6ewJeMq4B9I=;
	b=LrpL/jEhayKD/pJk8kAKCKPAnkpW5ijNIUnTxR14g6IF6kSGLe3mJ9Plnda7peXSB6
	6GfInEbo1PzBEYqLOWruiDAiEjCmQopJtD92G4iUTO37qFr1fIbxykUZcJjhf5J+5xOr
	YlYQmAxMAoL3MvCVExA82I7SycUT244g2V9iM8sbOTgGprowRdLVrXTPHtCvqYV42erf
	zvsaweotWJ+C4MTvcnCZ/AlXWJBmSyxntTEb9O/OaizzjLX5OdRbFY5GCwmYCHM8lGxF
	E6WWxpigOYsxeFwn7B7Cu3TzEJvyxvW1ku59xlo96IkdjcgjCGr5l+r+Rfc5XufgX2C1
	s3Gg==
X-Gm-Message-State: APjAAAUnZWrAWppcTnUY12WyEalYRiOJ+AkTae/bx7W21Q7zEPqLbcJ2
	kgNp1hzp5W0+aaRBZdR182KT8XcT
X-Google-Smtp-Source: APXvYqw/M4Qkh9l3Bk5MvDSCWrrdUoYqDBZb/FJM3qVcf686/ZdJkFYYUKoQzgZ0+ve71Ccps+eZ1A==
X-Received: by 2002:a17:902:9a8e:: with SMTP id
	w14mr30734247plp.215.1573533229806; 
	Mon, 11 Nov 2019 20:33:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:27 -0800
Message-Id: <0dcbf22c71ac3fcd5fa0031392561d393f91987a.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 08/20] manual qa/bsp-qemu: remove rpm tests already done in runtime
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:49 -0000

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


