Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id BE8227FBBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d7so6940518pls.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=le3rjCzoU3lITaeSJ5+9duxJy2ECTSHabT5Dt7hwaTc=;
	b=YCh174BZ9NnjB/I1m0JMSqyFN+2SeDfvw6a3tI3tfI1l86jp+3fKTxWLFOx5uPZ56t
	URlT8LHh4L/6osyjNjmrQKf4vwndl4lF0/r3bAOPJWwTTxKHXE4ktsLm5YniTKiWS0yi
	Qa/I1GSEHLk6gmDBVNu7klm7zvQCXcdLMKuYquLs3ewyglW+C55s1Etv2ejKxblMtEip
	VbRqyOig8FHZEBIhOcm2cH3fbMAa4oqGWJPTkfHU5VwVmRRRA8aR6vWtVvv9eI1Jfhwt
	xEhLIYnBtYeUEYh/00T9p/VWL6Kz+OlH9Q7zNQy4FMSHRUmr1puxGUTtAIOHGoxtXwUF
	6Mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=le3rjCzoU3lITaeSJ5+9duxJy2ECTSHabT5Dt7hwaTc=;
	b=TjBhFmwVwjqPkvJ34PM5hYwGJ4JHfdI90RDZH7w5uXkxSt5vLAPPqDxBt+TNCkuby+
	2xSz637BJWV6FDmVmSPcJlAXgHtfsj+xLqYihHed6YBjKsI+gcOa1kkjL0f7SHI0au09
	S96QTId2kTTO4C6zJCGQHmkVWeY+GUL0ibnPtQeYXyyBMirv+t4h1pzg2fZGZ0rh62nj
	+sHVOa6mLVwx1NWLcze32aieF6ifGos56URDUsyymfusAFbmG4OBniTStBFGev6++68Y
	3CJz6N+pz8lN66L++RuWB5OsVEKhbuNX0+9J2ydwdnNMNm3U+SxaDF/gYOL/J1LZPaEf
	wT6Q==
X-Gm-Message-State: APjAAAUDBVh6PlIgu6jGv9vzVFz3/yO4MhvuegkWUdhF/iWYazW4tWJo
	4Gy9IQxbbF0B0lmS97NCSrci1AIc
X-Google-Smtp-Source: APXvYqy4jZfYyLa+e2CoQmFgj+YfbRaBqYNS03vYCVkQwrKJrTcFo4OePNqSCXzeAyF/l5cyYwhZKA==
X-Received: by 2002:a17:902:b20b:: with SMTP id
	t11mr30146058plr.211.1573533230708; 
	Mon, 11 Nov 2019 20:33:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:28 -0800
Message-Id: <f8746c4c6debd2ca20ccb768888a1499d74f7787.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 09/20] manual qa/bsp-qemu: remove KVM enabled which is already done in selftest runqemu
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


