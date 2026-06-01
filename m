Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D7DCD6E66
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:01 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5850.1780337576068625917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UiJM4MVw;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69d8e55e76fso5808287eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337575; x=1780942375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72ohMQAbbj1RRWUXjIbHe5URijG1t5Vo0BZIoid+8RA=;
        b=UiJM4MVw+jmfI66tkhxp63pJVaLh3IONHEhRAUnkS1fbA3skUD95cw/dhPptQJPmcJ
         hIHAiaiv5477MhoNUdCusg5g/4qsVjVMrfNsP3OGyNv6jpe0+Pr6PT9ViXz6qT7YoPbg
         Kj4xwlV14jhMF+sv1Ef9ngz61wSnqbe7YKq/ySUBqseMjo3OnLJjkxBkdLfq6++GVEOO
         EmmQqvPdYzrUlcITeWC6AyoAPD6gukJJqmKg0Ef9+DAAczLqylepn6xJiGwBWy5Q5x35
         5WWwgFsw23mahAXcnJmbYc/H5FEY1if1kesFZHbctg7AwBn6vkN2WKW763uXZItOXefu
         H/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337575; x=1780942375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=72ohMQAbbj1RRWUXjIbHe5URijG1t5Vo0BZIoid+8RA=;
        b=C9BufEXqBJpN3368nky/GYXNHAT1MgL4V7ZQSVKLOK5QpPOG+SR+QLmbFXjQnDW6BZ
         7QDb6kcuNhKJFjaYq3ATEIdWU2Qc+akLighrIwn2Pp7CCPnpsFqVcjqp+iWPonHiSWVV
         C92wSRSggL2k9ihpL9hwoeD+XaGFFNllLhNCLAyCcG1l0Hl91b27d78/4DiX25VZSNhY
         RPLUHSSlC7euJGR5NcrdydLC0Tevw+rH6IcGoUBJf8kJyiEPOvA84uA12lpnUQ8N7ZwF
         Fv/9b7p0kWTiogG+NBHWkkrZG97CJwkVVIJhvN9+TjXki4vJ6Ad2KjMn9aWy7AkMIoXV
         AslA==
X-Gm-Message-State: AOJu0Yyl+F2LFv03uRxatKzcnjx7/M8DbfiTQ7wUvga6QY4ZZW1MCWQc
	NivhSrJhxbX0IhdtpMofg66fzaYrI3B3v//QEOdZ5VhZmqlVMf67AR8mbzPStw==
X-Gm-Gg: Acq92OFPIKDjrYH+V0+nShpLQobeGeAjtwjMCjoMoE+v1soynQy9qFvuXJ9zhp8X+9Q
	wIt7uXl8/aTETA+DiDept5TEzGU/vhls8/QmR3TaMRhkowxWh4zqFfYhGQZxsfuGOZZj3a+tSGV
	66B827hRXyrDuUOmCJ4/zUqXTX0E1yGZoXdwtg1wiflB/2FSKjj7W5kS3t8XK7Uf7AsCrLCVC44
	VPQ8L+A4SgvtzWYC8M+4fRNlnLw2sn6q6yW1rBbHeKyYwEidpe8zPkpCB0WBg1ObAiqFCvPG43h
	FDirFHTL8P7/pLhJOD6hAEaLOFU5V5G7UsV8zdcBIUdGZegf+1U/CRD7Os/Uyo5RRZ2YiueWylh
	Xts4+zcS0zBKIJXW/iT4UbN/lUoPRZZh+WtRLSM+aTryQd2Byk5mkUmA8yWj1iU6mABq6TbUB8w
	x6TeglLwC1ZkS+TrCXbpg7Qxk5qeNb2Xs=
X-Received: by 2002:a05:6820:1885:b0:696:2674:8a1a with SMTP id 006d021491bc7-69e10576b18mr6654072eaf.48.1780337575215;
        Mon, 01 Jun 2026 11:12:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/8] mobile-broadband-provider-info: Fix license to be CC-PDDC
Date: Mon,  1 Jun 2026 12:11:36 -0600
Message-ID: <20260601181251.123019-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237976

Careful reading of the license text reveals that it is actually the
exact wording of the Creative Commons Public Domain Dedication and
Certification license, which has the SPDX identifier CC-PDDC

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../mobile-broadband-provider-info_20251101.bb                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
index 441732afe7..a4e93a97f9 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
@@ -2,7 +2,7 @@ SUMMARY = "Mobile Broadband Service Provider Database"
 HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProviders"
 DESCRIPTION = "Mobile Broadband Service Provider Database stores service provider specific information. When this Database is available the information can be fetched there"
 SECTION = "network"
-LICENSE = "PD"
+LICENSE = "CC-PDDC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
 PE = "1"
-- 
2.54.0


