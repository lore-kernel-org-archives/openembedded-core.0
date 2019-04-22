Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD7BF71B99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:11 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a190so17572884ite.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=le3rjCzoU3lITaeSJ5+9duxJy2ECTSHabT5Dt7hwaTc=;
	b=cUkr3qDSjVDld+3rmenS7N/C4JOVYA3VjePYeu94zLfu9VpH7UQPX9PCfUxlRSRD7W
	5N/eoXIgqWbo5xcFYQpwimEZ1leDedYmxZu7Xkb6f8uTf4+jaA8zu7T7fM2ER1gCZv1P
	v+84EECbyfmITZYDUz3+hcGa3u79eogVF9tExFNavjW4fezXXv6nhbwPOu/NhZklIpVT
	qf1VwEfZ4fGM5qS63q7rJSf2C4RgA+/aAjpJmFwcc4Ntwxa2fw0qzPmUrSx2zW8kDKWK
	+4YYcFTwe2GNGGQTHp75e0xBrkfcDbp5N7P/lVG0W9PeWquntT9yzQ+b2D3lOl2fX6q0
	ubKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=le3rjCzoU3lITaeSJ5+9duxJy2ECTSHabT5Dt7hwaTc=;
	b=QYCpM9o2T81FmEpb/cy7RKjuY1HBL+TYn6zAT0anMjigOuXhjCJjOHiQRsMtcM6mk2
	4+vuPDWOyFat1aE8F8w+TnuX1G4wl/5Sol8RJCpr3qc7Ep3vonpBKsqc99prm5Lx8Dd1
	1YCXbbt4GFLSFj3en09Fk8xGdNu3s5EEwj4H+LcDMUHY59/DKXhsF9vl4lUhamzaEkeA
	ipgPu2U41MwtLf1prUX0HgBvxDfH8v/ggWDmqBtd3HdX1fO4Wny3E54jJQLhQYpuZbY4
	OX3El29tU+NG0AlneBWmbXRHjlM2vj8hhepHsse/Ukr667jjZiOS5tdFstOFNtUEa6Ea
	ZElA==
X-Gm-Message-State: APjAAAWxyx+00jewi22lGWkkn0KyGB/4VlOfrr58trIwSJjZkTnktfpx
	ZZ5Nf0hJ+7n/we1XOxhoFUdhIe/8
X-Google-Smtp-Source: APXvYqyQhLimor6peoqz9qH+ThJ/67R9IdDXUiyLslbzb7uXNgUY8z7HOjbFkRdJYqzWRVPw+KrYBA==
X-Received: by 2002:a24:6495:: with SMTP id
	t143mr12061504itc.156.1555936932808; 
	Mon, 22 Apr 2019 05:42:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:56 -0600
Message-Id: <1555936919-19078-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 4/7] manual qa/bsp-qemu: remove KVM enabled which is already done in selftest runqemu
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
X-List-Received-Date: Mon, 22 Apr 2019 12:42:12 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index f680f64..b49abf4 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -1,36 +1,6 @@
 [
   {
     "test": {
-      "@alias": "bsps-qemu.bsps-tools.qemu_can_be_started_with_KVM_enabled",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Build a kernel with KVM enabled  \n\nIn Local.conf add  \n\nQEMU_USE_KVM = \"${@ '1' if os.access('/dev/kvm', os.R_OK|os.W_OK) else '0' }\"  \n\n ",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Start qemu with option \"kvm\" with runqemu \n    a. If you start qemu with kvm failed, maybe it is because host not install kvm and vhost_net module. Follow below link to install them. \n    b. vhost_test refer:  https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM \n    c. kvm refer: https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "Check if qemu starts up and if kvm_intel module is used",
-          "expected_results": ""
-        },
-        "4": {
-          "action": "If kvm_intel module is not used when starting qemu, it will show 0 in \"Used by\" column when you run \"lsmod | grep kvm_intel\" ",
-          "expected_results": "KVM enabled with qemu \nExecute \"lsmod | grep kvm_intel\" from your host twice, before and after you \nstart the qemu with kvm option. Before start, the number should be 0, \nafter start, the number should bigger than 0."
-        }
-      },
-      "summary": "qemu_can_be_started_with_KVM_enabled"
-    }
-  },
-  {
-    "test": {
       "@alias": "bsps-qemu.bsps-tools.Post-installation_logging",
       "author": [
         {
-- 
2.7.4


