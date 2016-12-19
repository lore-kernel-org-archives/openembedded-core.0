Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6959773214
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c4so7057585pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Uw0YA2U6TzrNPDVOdOrVCiIuyGD524YTrw+ZAWBJG9A=;
	b=pMXD5eLYAn9CI3hpVrlWcsaWYowu0pGYSq5JUlrJLcz0icemI4gdfBKWM/GETnjVWx
	EeE8i9sSKh9wNg7Nl8Im1c14iI/WKeD9Jj/jH/srjlnRqXr/kPaMKARhZ9R0FEaPSPPe
	/jVOlFpYZIdOIC8LtwdmBvp56Am0Ko6Z1u3W8bvWKxR2qILwkgz2LLWnnf6RU4KS0+GC
	i0mKIvjwO1aNZSHtJMVZOXlIxj1G5OLDjLi2sd0ENppFHkk2aN8bFs2KznaEEH4ozuHU
	kkGBbuRUBmDMuTxufiw4Da8l0ERo7f7HK/jQ6JLObZyoPOiUeOCUcSUMVO3b2Civ9XkP
	Whdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Uw0YA2U6TzrNPDVOdOrVCiIuyGD524YTrw+ZAWBJG9A=;
	b=M+5ytSTZulRS4M7T2Lxrm89t9/j153XFXg+1l9D6+1vgSmvDNfcrKBjPM3jCuPFJJr
	NcMXuD9cj9PCAafGzfq9xP/JJ7s7S7SsOgRpIrzWgOWJd1tzumlXnBT9VVJPIZRVMAPN
	wlUrKn2gw6ZbgkYU53l/nLW5gwVeupXtuKGWOPUXdIhMtAtSv2sPDfqYo8LcoZXs2bhP
	maH49eTWjDvUgQmpxgfhI01RWi4yt+qi5dzvPf4m+bt88Vk5Spz/gFmR670d//JAO6Ha
	b13lPabH1mbSSMDZRJzR8CYnq/PNCJEGtEABwQ/CYnb4HZRFQLTSBsgHdETIJY1UqE1J
	tO8Q==
X-Gm-Message-State: AKaTC00EyP5+V1B1ri6Dis2mA6qZKV6tp0ciTqcLPx3P32rWZorYZqaNAgZMy2QCq36aNA==
X-Received: by 10.84.143.68 with SMTP id 62mr31547815ply.63.1482129608656;
	Sun, 18 Dec 2016 22:40:08 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:51 -0800
Message-Id: <20161219063957.18716-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219063957.18716-1-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
Subject: [V2 04/10] grub-git: Upgrade to tip of master and fix with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index eb824ccc71..f24cc2f1cf 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -6,7 +6,7 @@ DEFAULT_PREFERENCE_arm = "1"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/grub-git:"
 
 PV = "2.00+${SRCPV}"
-SRCREV = "7a5b301e3adb8e054288518a325135a1883c1c6c"
+SRCREV = "ce95549cc54b5d6f494608a7c390dba3aab4fba7"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
-- 
2.11.0


