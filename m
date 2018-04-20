Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6A874682
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 16:34:05 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s13-v6so5541266plq.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CZtc2UvIAoS7X2lX+SEe4ego1KtXKaCluSrIkmYNxZg=;
	b=tDt5O7mnBZUKEufgUG5JnXHAEQSEGMhsHE90XxETlIYEzq9flQ77VrjCu1uTSiQxv6
	YTdi5YErIivZBVkF0zorj5NygCRML0Iw4i27xMi2/O3bCaXWXAO5YfmBefY4+6eNqEv1
	hVPHcxZe9iCB2hmelpzJPeVI4ruChYVzGD4Eb32LPI7Dl+Zia9QDJ2VDklTxxFpskqFA
	MMrDHe6brM+4WGyGIuzkI99s/v6SiCfLDAimazh3RjcxEGld6yEZx0yiG0Wv6vHtdtED
	FPUl4/y7H5fmC+t/odkXWLVLqoo2G7ZE984vrWjCdEA99lGG10rczmKWvHBSsSLAdL6Q
	1j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CZtc2UvIAoS7X2lX+SEe4ego1KtXKaCluSrIkmYNxZg=;
	b=YDoZ4BIHDqusSeZRil92g1KJ28E2GL9c9yyJYWr0cwPCRVYI7BngPvraGpWMLVCw44
	y8avd2M9/qvRW32l8zbQtccrsoSdic1arcGGSxVmeDrQ9S6sbR/t1yd/26Ve6j3Fy9kJ
	GSM2Txb+/N9QL3Bw5IMmctrbilv8HlpdiAcJyZmVPooCT4XAvhxMEpz+dKSos6fWOYq5
	xmoVXcuH4gjg18mLrZz2SFgDEsfjX3sG16o/3cq7KaWGfJBkEm+jikk4Tut/3bk9Dl31
	shQ8MME78NY0jzP4THKS/K+0ilq6RFm465b4s+oY5y06EB5zQUUwJv6NwHGvSFUBd0Cn
	cN1g==
X-Gm-Message-State: ALQs6tAmWhR7n3DBy2EOzN1RbSC8sZTIhf9s/b5ACuWXNGbK+ZuRKuW2
	HtVgcuOPZbRjpiO2a0zPc7R+0A==
X-Google-Smtp-Source: AIpwx4+5ofenObw5lc1WMGlLVcp7YoPRgMQzh61qW/7gFwofSipu63C2y+5++PWmKPi/bKlCRFamug==
X-Received: by 2002:a17:902:b112:: with SMTP id
	q18-v6mr10967432plr.371.1524242047056; 
	Fri, 20 Apr 2018 09:34:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	204sm13450925pgf.61.2018.04.20.09.34.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 09:34:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 09:33:52 -0700
Message-Id: <20180420163354.12065-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180420163354.12065-1-raj.khem@gmail.com>
References: <20180420163354.12065-1-raj.khem@gmail.com>
Subject: [PATCH V2 4/6] libunwind: Drop adding libssp to linker flags
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
X-List-Received-Date: Fri, 20 Apr 2018 16:34:06 -0000

This is no longer needed as gcc provided libssp
is not built

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Rebased

 meta/recipes-support/libunwind/libunwind.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index b9c532d3ad..36851d07ed 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -14,8 +14,6 @@ PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, lat
 EXTRA_OECONF_arm = "--enable-debug-frame"
 EXTRA_OECONF_aarch64 = "--enable-debug-frame"
 
-SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
-
 do_install_append () {
 	oe_multilib_header libunwind.h
 }
-- 
2.17.0


