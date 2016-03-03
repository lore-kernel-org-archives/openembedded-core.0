Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 426ED77103
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 19:22:49 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 4so20143434pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eyvEi/7nNy06mevjq7FA/zFpWi9n4Xc6lhkW5AtwrtU=;
	b=SZ55IePM5AqihSEOu3irqQrIpw5W/r5uu7lGQyFgsKLMfccvz6wsriCUVVkaeTe0WK
	UVrCq4ao37XsusUOB/bBTbwQegWo6vTNqGG6btdEInBuFZx86dSsrSNBHlSxYawHHW+y
	X1OiF3vBHv/U22i9vHwVoFsVWCnGkeLp1f4dMrU31VBxF1LRB/b8l4H0sjOgmdnaNgHA
	WNo2bOeP3cZXWSvJOVZHrhtJ9yJq1PfQeGeI+ligeoYij0tUSgpJeGu3lZo6ZW+JRr41
	k70Bh/PduIzm3vtgKs6ZP9BdcvXGEb61nNlIvYd7/lW9VjXjz+uFlmPDi+Ib6tWfICYb
	uPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eyvEi/7nNy06mevjq7FA/zFpWi9n4Xc6lhkW5AtwrtU=;
	b=TFEI4gjUIVy3mDwhBaS92D6VCfPTL92aQEW9fGNjPaHPIGBQDWXp3iyBQZozW9Rn+K
	7uu9/NJpIRP3e0dDW28TWQz/zEsif9FKdFLGdRJEOeHWXeZmNe4qfXV7u99G47c0ztJh
	N4aNR0s2Z33wuC+Kc3UHRlQW+J5Xxmvh117ubUx/8wopEzUthBg8+C64HMKSt1V4HcQd
	Fy5mK0yj+8xBZ0BVh0IFpg5yVDi0bCEoi/IM56fs2ZQN0KHAfoOqMl1SJ5QvVh9v6Ka1
	o0zp7trhxHA5MQwYydOtIjgvZnGc48pnHMEmNdp3Mu2doexzesJV0vRmVMqgabQSLIBi
	aqvg==
X-Gm-Message-State: AD7BkJJT7bwrqxPSgsMN7KbbiCxLLBQ8gwsHkd9ryVv2wgzNOeQUO77eBx0kMajCDPZA2Q==
X-Received: by 10.98.87.90 with SMTP id l87mr6099940pfb.70.1457032970865;
	Thu, 03 Mar 2016 11:22:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cq9sm62404105pac.26.2016.03.03.11.22.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 11:22:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 11:22:43 -0800
Message-Id: <1457032963-27692-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] arch-x86.inc: add leading space to MACHINE_FEATURES_BACKFILL_CONSIDERED_append
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
X-List-Received-Date: Thu, 03 Mar 2016 19:22:50 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/x86/arch-x86.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index df568a1..ba7be8a 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -25,7 +25,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
 TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
-MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'gobject-introspection-data', '', d)}"
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'gobject-introspection-data', '', d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-- 
1.9.1


