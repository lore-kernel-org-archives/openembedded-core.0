Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 37D6B78430
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:48:43 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l20so40869549qtj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 10:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3n67T3Z11kOGfvsDzIf+3i0VLfhYHHdzHYtw0QeBUsM=;
	b=nckcj8mu/jePVPxL0DbPkkToMn3PUXY2aUZpszM9SES7GHB1LzGFybiPc1C+nnbp+a
	xAZ9BEblSpU55Kxu/xBorKscm1W5oweI7w4xHwyfTADtCb4gTFlS+zdXzmBJUXhy5jBH
	67ZchFq390tju2FU0+2I+TCtyagfQw9TUy0U6HQ5BtKieDiO1u+GsMVwV2raWg+g+7v0
	fCYXW9oibFoAt+KoiNuHxpx4vJQcpzFgSt3uAzWsjKiERNnabaGsTe8yNfx+oujEydti
	pjOgHcGESzOYHjkb0EDpcH0I7JZ/G9rPsrGTBB7iDoyVyQNgpffvWOAc9TGV6Xw/T7sv
	eqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3n67T3Z11kOGfvsDzIf+3i0VLfhYHHdzHYtw0QeBUsM=;
	b=Dqld2cToDnZO3xw52/WRVuIZ8ImQkP82BhKdlgHa+HrTFQEOsE+uwAlJQ2LsEXBTdX
	Z4ItJJmAsnVzTLSMwwtoIIxUB1n72noRuXVkADTs6Q4MVWg+/zPb0U1atWBIEuBopO1z
	lWBga05Aj4naB2NvOCImzjvEv/Snp5ATPvD9m9ac29h/R90TiBQnO8JK08XiMPudEiFQ
	+WS936AIS2ppKyDxX2qiYu2yjDqkErspQTLwioHnENcNaKQS4jvrrmcqNZsTegtFa74Y
	Ibbzo0fEzes9vTzyun/pcd6A/umBgwm9UnjWD/L/PSoFSogR6xiHTOJCk0VIWCgVXs+O
	jHGQ==
X-Gm-Message-State: AKwxytdS8L4a8bIDBcErsAepEVZiziqGKIOv5pLixDTK6WuMfajs+LJi
	sNcww6nILQN7kxn9Zzns1k8mZCb2Wg==
X-Google-Smtp-Source: AH8x2245zjc9IBsq+gCMLAioKaat+WCoY5OzYDGtlEQX3KQhfEEkS8nRXjdCdMyMgDJZQxseF6yOhg==
X-Received: by 10.237.35.38 with SMTP id h35mr26706492qtc.300.1517856525128;
	Mon, 05 Feb 2018 10:48:45 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id q2sm6387005qti.81.2018.02.05.10.48.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Feb 2018 10:48:44 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 16:22:30 -0200
Message-Id: <1517854950-14727-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] grub-efi: add grub target and image for aarch64
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
X-List-Received-Date: Mon, 05 Feb 2018 18:48:44 -0000

Add missing target and image for aarch64, as the current revision is
already fully compatible with ARMv8.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index a72b189..a5235a1 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -21,6 +21,9 @@ python __anonymous () {
     elif re.match('i.86', target):
         grubtarget = 'i386'
         grubimage = "grub-efi-bootia32.efi"
+    elif re.match('aarch64', target):
+        grubtarget = 'arm64'
+        grubimage = "grub-efi-bootaa64.efi"
     else:
         raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
     d.setVar("GRUB_TARGET", grubtarget)
-- 
2.7.4


