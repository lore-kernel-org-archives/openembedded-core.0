Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB25C369AB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:18:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.20817.1745723819577045795
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNytIcgm;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224191d92e4so38962565ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723819; x=1746328619; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKPuoPdFPfHETan9jQQ31byIUUcuTmrV0sJmnTbUXlA=;
        b=XNytIcgm7+dHRIcm2qmBrfS05aikdZ4311vuXSPTJ1RLtcYzTYEL9d7cTyNmlaKSx4
         sBWlqFAc2JjdfnxFBDxWCd3GUZUdP13te780Aj/waFmmy5ugNXu4lKxHmstsgaBkMoVf
         uLyfHHww/YJLE8ib0Qub4kzFWmE/FtFw5MjnaUUvhQ2IAqLtKPbjbDRo7X+hXDT6478l
         bsn5cUWbhrk8oJRgHv3TQfgEaPi3FOvfJ3jn8rxlqslsBOgVxRMHVtDUME+HAp79eEqm
         tlK6DrIXUzak4eYbPPLmNGDw1HsnUxGhq+Iq1VK/ZzIzdkFiXprJYH/H3CBS2qhZb/T7
         8kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723819; x=1746328619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKPuoPdFPfHETan9jQQ31byIUUcuTmrV0sJmnTbUXlA=;
        b=g6hUk33677WTgshtMATRP7/KG5KdW56AirkbwPulH1UpQpLsjrBRL+ONa+MV4ouKbo
         ph1iDrDBZD2oNspay3WrE/4Md4LL4qbDMLb5UiibqrZlea350R2ZA23Lu+oQEmsLtLAV
         N5svPXkCLLHMK1QnxloUqN3UdTDAPaFw9sAuVwe0Quqi7crizze5F5SJFy6XpmaqhvvU
         o3zKUCNY8OnBrl3VGOEAgSujydt6pcQirbJJvRzCjV3N+r3GA9bSYa7iK3i3o0fwObqY
         iIC/VDhqQGwMO22dFIjWADEBcRBBnb2gw3sUZYcT69XHc8YiJaBptdlJjX5cPUHEi72J
         bCzQ==
X-Gm-Message-State: AOJu0YxDy/bCgqRRq7gUu/HdANaqXmGayNNGXpaFaVoe8jBg2GzWbpkv
	K9+NraQ7I2fMPkz4X6nkYyaiLMQOuf98Kv4ygUJrp7mBMT7TL5aPqHXhEuWE
X-Gm-Gg: ASbGncuaqHk+0DZesok6LOoXFEHajIBK2cEhkzOGYSSw6azE0rm1BZKfWwWpoEcKIs8
	LdP3YWpShQmlizY5Ro0ciq/0HEgvgDB3+pjUb4JUUfCQAetekUyvxDSo0/yHzDk5+aRCXS3Z1u9
	kOc81WMkc2zQxjWqVhuqVXfNOJGGg7u9JjjcqfP6A4snHR93komfeAAMsD/OFBlEetXZHoSc/1s
	clQyPZzToGW8SDn0/PShEbrT3Q+33QDi4RDbp9MyMfb+B1QARCSKy5B30xp7Snq0VK5SgezA+yR
	Lv0hbnAqnVbbKOq8vBdX5DsAiZ0DOCjR
X-Google-Smtp-Source: AGHT+IEWdCjI/+eniVhRcbCHY5p66DH3K3zOTa5Ip5NQonapkk4hfbQqLn0dWl98shM1bTx7H85lhw==
X-Received: by 2002:a17:902:ccc8:b0:216:6283:5a8c with SMTP id d9443c01a7336-22dc6a54603mr65397425ad.39.1745723818949;
        Sat, 26 Apr 2025 20:16:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:16:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:16:43 -0700
Subject: [PATCH v4 04/10] multilib.conf: Add llvm-project-source recipe to
 NON_MULTILIB_RECIPES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-clang-merge-v4-4-42d205904261@gmail.com>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215535

llvm sourcebase is large and like gcc, it reuses same source tree to
build all recipes using clang+llvm sourcebase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 0b32a62835cd34313eb244bf0d426c0ccfab26c6..86d1f8c144759712c22c15337f493bb75d63d618 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -25,4 +25,4 @@ APT_ARGS:append = " -o Dpkg::Options::=--force-confnew -o Dpkg::Options::=--forc
 
 # These recipes don't need multilib variants, the ${BPN} PROVIDES/RPROVIDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source llvm-project-source"

-- 
2.49.0


