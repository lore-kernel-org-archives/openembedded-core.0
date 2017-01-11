Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F75D60750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 03:51:14 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f144so12895029pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 19:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Uw0YA2U6TzrNPDVOdOrVCiIuyGD524YTrw+ZAWBJG9A=;
	b=diKg5D5qnhrixxB1YstoAKPLvIM4FPM/VcNh+YhSMve7gBb7zH8cKlS5CzR07EMSXB
	TXFMDDJS51XHeZMf6R6Yihrogwrds0uYAVNff31h8t0U2dIxVh3nOtesoOzOnZCc0+Nj
	ZexmagMdi6llXHcikznoLANY+OSpMr3ZkVZA2EIPrGSIDMFMDucn+P0H8ySPmC9Nqmjg
	JchNHsYd07ZlMm/OodEYEPs0OPRo6kXLMBU7w2uhG6aq6ZmMWRSuMWHBdhOw2nuzRzAR
	sGBRT1OKWvaBeqSjv+sIOnmZj5DeZtV3htUX6O9t4R5l1fju/AJ5DVPEN9/HRVf1PR1n
	kiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Uw0YA2U6TzrNPDVOdOrVCiIuyGD524YTrw+ZAWBJG9A=;
	b=Uqhsmcjb5JBaU+d8VWjHpaB5lrK36N0TtqwDIetd15WyWRGfCgTPABSiF12iXwYWlu
	xuZKm/22P0yXudIFOKPJgliO9ZZPu/M78l9C3tjV90wVI7LoZNAYNCAw+BnguXqh3PMR
	p52axg1UfKz0d3M0ynrZGwEHFPeBxICwG+YRoqsRNzMSamH4487PUHq5aV2r25QVPuRM
	2RXpx5XvMZKceo4Oii91sCbsVG3fh1bQbIcBId0ti/zhKQraICPeWDD7SmkLMsfvuUWM
	CQwfulOK9PPF9Hf8TkgKbXvtR90YiZoAeql9YuXXpeZKdVMchK/9NSLt1WNJxOBte2aW
	n1AA==
X-Gm-Message-State: AIkVDXJWXtNxs6WHjZfR7B6ziiEfjRIUeqEaIWZQYcW0Uu9Y3ksFKZpoiV5e5s6fMkQ3Ew==
X-Received: by 10.84.216.24 with SMTP id m24mr10087478pli.22.1484106675263;
	Tue, 10 Jan 2017 19:51:15 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	q190sm9059222pfb.51.2017.01.10.19.51.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 19:51:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 19:51:01 -0800
Message-Id: <20170111035102.18447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] grub-git: Upgrade to tip of master and fix with glibc 2.25
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
X-List-Received-Date: Wed, 11 Jan 2017 03:51:15 -0000

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


