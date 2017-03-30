Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C7C0377CCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 13:17:19 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x137so4573519lff.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9UFbsNDdC4PCiIW783U/B/SPwbxN0KWtHeu1vFRWtqw=;
	b=ErRYvPS7C8vI8nZSxbC4EYBmfVjmnUA7DZdn/DnJWqMU86lMeDCdbqf4PLeWTfBTph
	rTBC88WBpxTySkKd3xzQXI0u3Ld41JcGbnoB5lX3wdwIlWv2dKM9lCXcB7bjtNaAsvmq
	I8mOsYHzsOjqDTK7wd6Ba5ppIyfRpgWsa8YLeV25l+sEEO6D3+jPe8yszOD9GwN9G8fr
	d+MEbUPjPZbUqwb+OUXXnjFz7kCRI/lbtI6PJD8TPEUCDmv3ajgxRQTZB7rNzAS3dq54
	Xtb6FLBv/pB3sIdyCSEb6a+hY3bGhOPRyxieUPpGjqESgzC4eW1tTMTwalVrWdhZjmD9
	nswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9UFbsNDdC4PCiIW783U/B/SPwbxN0KWtHeu1vFRWtqw=;
	b=UpQ/5dvTCLmAY4EymzeogtexigYQcw1aJU74mpLwFOn8gCOE0GxaEo8CgZGYinOm4Q
	T5/ZiQUC4rCW56+rSofNwHDotbtZbUI9qrsw/NXYTg9WnHF06oHtab7TN/NBAfCvk8aO
	T7B3bddC5o3kSGr/JgqI84grSdGBA7iX9VIGLvul8cY0ll8gGuvxjDktwthlZwEw4UdV
	sgkeCkdPmsplwygkGVJUJMYh/Kgd0wQkhoLanN7Il9vmtR9ycoPzbc8x3huFDDRGhl2E
	hBKsOSJ0KphAy6L0Ql2iVvOSJUt9p0ydgW9LgGwZWlRzPqm1G9fXfS9VEvPqzCNwh3Ns
	2a1A==
X-Gm-Message-State: AFeK/H0y2aCIC9KcWtFcMm6EZRcGaKThrXo4+Sog8cWQlosV5hHtlwC297V0IUAVAe6fgg==
X-Received: by 10.28.59.139 with SMTP id i133mr323417wma.135.1490879839900;
	Thu, 30 Mar 2017 06:17:19 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.149])
	by smtp.gmail.com with ESMTPSA id n7sm4612266wmi.16.2017.03.30.06.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 06:17:19 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 15:17:04 +0200
Message-Id: <1490879824-9097-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] kernel.bbclass: fix a typo
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
X-List-Received-Date: Thu, 30 Mar 2017 13:17:20 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

In a addtask statement, do_strip should be strip.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 244087a..91c260a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -566,7 +566,7 @@ do_strip() {
 }
 do_strip[dirs] = "${B}"
 
-addtask do_strip before do_sizecheck after do_kernel_link_images
+addtask strip before do_sizecheck after do_kernel_link_images
 
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory
-- 
2.7.4


