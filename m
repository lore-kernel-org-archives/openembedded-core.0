Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 63014788A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:29 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j4so13866366pgp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7lEg7zwywMoXzzyfmIK0VJN/YPpjS8MTjyjy3mm8/Go=;
	b=f8hhFGK2sXkzGZQP46NxUiRksKdSBTC/NXmfzRzQj6Pf/4dnX5b67Q/I0R5/JUV2Ij
	ghKXIAMdGNwUE9YnLZCl1n9K5FVmOistnCDPQm2GslPjmGLxvVNvNwP4Ixc5sjanc327
	Kb9ExZFgzsvmF9nzNNhTYj5B0fNJP/z8sd+EtNfypHuNtdayaYIFsDD8j82fQX+um3bm
	nw6z9bP84U8hTDNvwjkWnNg0fWs7/Ohav7DmSDbgDGw7BMgv/NOybLMXRWiFoIKi1LUn
	qV53hUBl74eyL6p89SEweOKtoOuO0CRqZ3sw0UC7nDrvocOGUOIYHevMGGWPjtSpeI69
	krIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7lEg7zwywMoXzzyfmIK0VJN/YPpjS8MTjyjy3mm8/Go=;
	b=GsAbFVXk2coutjQtsi0/QfRy1FupolXwyoW/O3IMEy2NghE5MCRkVobO2X9SSd4Zxx
	hafadOGllnj9/+SESQmOk+jjDZ2M7r+rYzcqxSwyKDZshFONQGcgPZurYxpK6+ChxFmR
	aipdMFBwIl5f2s+tekCkw5r2HmFwyxNcrhx5csc+uYe4n4BEV0Wlf3tCTAK8CFPH+tNs
	GDFQMl+88yxVO1x/aZYtpIZ4AhsB+Iy7hEuQOpBtIiw9R8nTRI/prxAae1sadVRdzHZx
	gLFVJzXF1WvaMZx5+Xo9KbegrZAkWxcHYTii4U0exlZTym4t3Xz8BY9NCIAePQqAqEkH
	Qi0Q==
X-Gm-Message-State: AKGB3mJQKfd312aBHBgwEWwRx/2H3Xrzlr1LCeEkxXuok2FugWXT59PK
	ka8NWHJDKj9OOkfps/+CZu1ebQ==
X-Google-Smtp-Source: ACJfBosj1SU3SHJk4cuxYsjxfZ4wZgjM11vnTNX/6beiEWM0UHcap7/3l/LdNv0GtcSSR1wHZ8hICg==
X-Received: by 10.99.119.67 with SMTP id s64mr2613397pgc.390.1513099410804;
	Tue, 12 Dec 2017 09:23:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:13 -0800
Message-Id: <20171212172317.601-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 5/9] musl: Disable thumb1 ISA
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:29 -0000

From: Andrea Adami <andrea.adami@gmail.com>

thumb1 is unsupported see http://www.openwall.com/lists/musl/2017/10/20/10

Fix
[YOCTO #12336]

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 56c9d7fe17..9af1172ae0 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -26,3 +26,8 @@ INSANE_SKIP_${PN} = "dev-so"
 # Doesn't compile in MIPS16e mode due to use of hand-written
 # assembly
 MIPS_INSTRUCTION_SET = "mips"
+
+# thumb1 is unsupported
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+
-- 
2.15.1


