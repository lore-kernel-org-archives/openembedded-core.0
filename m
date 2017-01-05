Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDC671B98
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:39 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 3so51662082oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DlmK+RZR0WMJ8LIy8oqR1GD9lm1/v6CZ45AWjc/640s=;
	b=eRAprTxu2nrdzZjnCY90O4m+88EAo3GtGmkxL+XP6gEV0KdOv0oLkco858B/zPJtBj
	SdLuLTe0m/IGndMWSNJ2UlvNAgMIaMYNbqhkSbnbjuPWZD8txwnHHjQVndDxOTn840CT
	kW2cTIVfQOiOLrozLifYdexLGY9Fnwwd6RXvO6dyOeRrYcucdOAmXxO1hrsdYeM9nSfZ
	CZUGhAjKzOXIpzz/eHlbi235rlm+C3EjA1Fmd8+DK4VjG7sCwAOC81Rj4mlQO5nuHPwQ
	CQl7wHyJyoBU3gi++A6ilvCfvZRPJREJ5WzJTD1R1Ai3WPKJuxSpsUzvmZCHvaXym6YT
	39EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DlmK+RZR0WMJ8LIy8oqR1GD9lm1/v6CZ45AWjc/640s=;
	b=eanya324ecx4eVzVh/5EI82GUlSMahtsXU98YFnleeHkbJHXNzi0CpQ5x9331Cwh8A
	K2j8pHYsOaE+1dsoWkhYV5JHPK+rIW4ypYnmFKA3L7VoDXruLRTohThpp+15krEqZsSz
	lWAmLF4e8dfo11cjG6btE9KG6zsGG/Opjke1nt1/OgUF9BppiIupGiv7kJnADr4pjto6
	neEOEY5cuiXOtGM5/Lh/DsslVTIghCl+uvHno7mwH45i9FOBOMJX/8NO64PmUUbVY/55
	W8g1Qa8txb94bbTYmrSn8n/TMb4yuoq0p7H/b9vC/isf/Ehuz53nJtdm/7PcBluDrEJB
	URaQ==
X-Gm-Message-State: AIkVDXIlwRb1cEdyVyfmHKsh3/I/kr7IUkPY0RKitowwB6rHh+a+07PgUO4jGmvL+vOLkw==
X-Received: by 10.157.14.85 with SMTP id n21mr31847487otd.244.1483645600187;
	Thu, 05 Jan 2017 11:46:40 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:39 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:18 -0700
Message-Id: <d9cc4721a2f154d1390e388232521d96bb6fdf29.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 06/16] gnu-efi: ignore arch mismatch for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:40 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
index e55ab7f..f95029a 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
@@ -46,6 +46,9 @@ do_install() {
 
 FILES_${PN} += "${libdir}/*.lds"
 
+# 64-bit binaries are expected for EFI when targeting X32
+INSANE_SKIP_${PN}-dev_append_linux-gnux32 = " arch"
+
 BBCLASSEXTEND = "native"
 
 # It doesn't support sse, its make.defaults sets:
-- 
2.8.0


