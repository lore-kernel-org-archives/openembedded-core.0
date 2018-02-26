Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id F19B7780BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 14:38:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id d26so6573117pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 06:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IqdFamF/Vnqmq5NEd/i78uDkPTGL7tJ2ifz5zPvyywg=;
	b=HxRMCDPKf3MJhguiim4cab3JfgawdToIsRU/4eWn7oTlARlM379TRbJGg750v0vHfA
	fAnnOX6jq9C84Z7T5XVPRdQb6OgjoWqNXu5EhevgZk3cnFX31vrYQkLeywOWOL1rLuQh
	4ryBVEZ0Z6j7+ZdbiQ2gr8TbzhL8dAtmdpfq6NlWV7kedtUBZH8EoMPktZlrF2oa4NAX
	CSb/yC+mFMS8wVot5mfGcHu6NQWmBqR4IKB6cuEFgcembuvGhO4YWuju2kIqs5VW06eV
	bBwI05x1KBLDrfxBGvrzbj6j15qRoTcp95BHuZCH/FZ7THuzFbsVrsaeeOZ/5uP1Jbpf
	fuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IqdFamF/Vnqmq5NEd/i78uDkPTGL7tJ2ifz5zPvyywg=;
	b=JFWk6fhk1p5PvgfGbfR+3MRT339/KRBQdIfFJqAtEd1kwCkqtwF/2ZYIfJf53BamfX
	Ny+K0DPRi6KlOnNJalpSN0cuw7NcSo/eB7wvVOKW79TANP83i4gnIfiXVMPiSkSW3dhv
	NAO8Z4U+C0EVWMSTktI9GhK+NZCWVpYfY29i8Byvcc4UOLLsDT6Cziq+atidXJn3RUoY
	5/a8MZwD/JpO5ktQ3k9cG2TZ84PK3fB87uzJfK4u5CSBgbas7YIMbk43bHFFXgyI12gT
	pFAgLGGsHAA/YUk7BNSQeKm6zKcYoB0oI+DCG7tboHH070TeKzIl7boFBVGTm06HBwX7
	HXPg==
X-Gm-Message-State: APf1xPBQ3CP6t4tipwnGEVPcOBBeLtNWa+0kCWRT816PIBUWl+TSSFRA
	QF7IR8IZCaBRr3GeIbTvuDTPTQ==
X-Google-Smtp-Source: AH8x224BEFvOQsUj5Ele3ivGk/1Mx3hjIwmrrNvMRSAZf2fwbBVhWm29a2CiMOGhzBAeRhWJMH7Qmg==
X-Received: by 10.101.88.76 with SMTP id s12mr8423873pgr.385.1519655905802;
	Mon, 26 Feb 2018 06:38:25 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	y6sm13512190pfg.71.2018.02.26.06.38.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Feb 2018 06:38:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 06:38:13 -0800
Message-Id: <20180226143813.21159-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180226143813.21159-1-raj.khem@gmail.com>
References: <20180226143813.21159-1-raj.khem@gmail.com>
Subject: [PATCH V2 2/2] musl: Upgrade to 1.1.19 release point
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
X-List-Received-Date: Mon, 26 Feb 2018 14:38:25 -0000

Changes from the current commit

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=628cf979b249fa76a80962e2eefe05073216a4db..55df09bfccbfe21fc9dd7d8f94550c0ff25ace04

Summary of this release
http://www.openwall.com/lists/musl/2018/02/22/2

Author list has been enhanced no changes to license itself

https://git.musl-libc.org/cgit/musl/commit/?id=1366b3c5e6d89d5ba90dd41fe5bf0246c5299b84

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Fix license checksum errors

 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 9af1172ae0..ba9b1a046c 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7928b7ad32ceda04932478e330e52f7f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2b9032093c4765e49ae85ddeba29afff"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 8b2cb4d49d..8906ac6beb 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "628cf979b249fa76a80962e2eefe05073216a4db"
+SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
 
-PV = "1.1.18+git${SRCPV}"
+PV = "1.1.19+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.16.2


