Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A42C52CDA
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:17 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.55654.1722258792327892698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q6QqMdYU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso2564811a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258791; x=1722863591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxCvmq91ys0sy+E1dDGFdkwlkikIWRPLF3wky7JG3iE=;
        b=q6QqMdYUo2amA7iJfPOB6+hrRl+xYJE2so22Ari8FBk5KE5m/rqlG272XZt7WcnH6j
         4KyCcea5yAkGbJpd2B7M3TG3hg3QJEEdmKGBA8gadddxb5gYhLJRkp1TXosfwccfIlsh
         tYMfHDy3KgjYXSJSsmT2z6CofI2DZ0XK3Wnc2My+tTJhBdJqTT2e3MWpqej9V8mB6+pd
         2qarizQFreSXOIKP1Q5khuyzQTi2NozWyqqvaxYE+js/1fx8bjYqm61cbT4MG7464Khw
         7IrRRNdQBb+3vcxoUf+7XoGxpuwdnGcJx6bgH3EBdejccTPKeY/8SHaLL/i5K/pjyiQy
         VMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258791; x=1722863591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxCvmq91ys0sy+E1dDGFdkwlkikIWRPLF3wky7JG3iE=;
        b=laIaqcpmi2PHHSUb76iASO6xi/neNBTvGcgMFGba5qybinMTbeD9BmC1wM9LkuP23I
         yaekpz6ilNonHc9uvXVNpsDOYZ9x8PeNnsZ7NG2p/PU7AJ+hwLEvyYrAne7uy0zD1b/C
         YrLqyM3mUBAIj+gOJm80aBhJ+RFpEJdp7UO+3s+GF8ETfCZluCnaOtGRC/PVfXkLYh9G
         m1p56AJXdySHPfE6kArkhzSgfSiEpA6HXy8kXbGZYUy+xit7Cq3/0B2QDZKfaHNFNrkw
         HSg+xuKeN8lvAUCaT30qdXqFNkPzQP5cTuUUG99vCvkIC9fb4PQ0i1wGD1Q+av6Wl8DJ
         VveA==
X-Gm-Message-State: AOJu0YzfF6Ks3VsGmMBxE7PaKh6vXT8YM4rzfkRg1Ox5rfVHPQJSVjMO
	G98nN73JzYN32Ize6TYeM+MGZSmuyiqhPBjnGowVUN4WgBy3TaDoe7ntNIz71EcmyqS/QMTSYfq
	O+P+lyw==
X-Google-Smtp-Source: AGHT+IFQfqleU1yEzOiG7x9EujEdjIsRyEwFLzxooPU6cjREdUBFW2R/rqjWH+lb8LMYApgL9MGsng==
X-Received: by 2002:a17:90a:e64f:b0:2c9:7611:e15d with SMTP id 98e67ed59e1d1-2cf7e20a113mr8613383a91.20.1722258791523;
        Mon, 29 Jul 2024 06:13:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/37] gawk: update patch status
Date: Mon, 29 Jul 2024 06:12:21 -0700
Message-Id: <dbf22d49c4b4c5e26a7aa05b2368c44bad562318.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202625

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d9052884f6eefdf65acbca76e1c39556d77a1af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gawk/gawk/0001-m4-readline-add-missing-includes.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
index 5be2fd97ee..6fffd1f373 100644
--- a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
+++ b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
@@ -14,7 +14,7 @@ conftest.c:146:14: error: implicit declaration of function 'open'; did you mean
 Add the missing includes so that the check doesn't always fail due to
 these errors.
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gawk/2024-05/msg00000.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=c1613c310d71b87f509458e0259ecd10eda2b140]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  m4/readline.m4 | 2 ++
-- 
2.34.1


