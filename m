Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34AAC04FFE
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:55 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.24881.1713386148929236163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 13:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aDRjJ27H;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so900888a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713386148; x=1713990948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxvxWhbbEm7g4ZgX9PfB4UETGetKt7sOS/3R1URp8ao=;
        b=aDRjJ27HmDS8/XKWVc5eAhQdTDZdWA7LFDUnJ5YQBf2nbFkKVUebtZ0uFljqA8kTEX
         bnE9eb5qigPOu4NMxL5ZvYvBbJCGEif2az4j82JtE3KvqC6MX3ks9iThKePocL0TNLSl
         w29xLt9WqCHivUH+IoNBuElX72dcwmA9syF+mEYeFasNpx9kwHkIdc1j7LJ+Mrhe5zc/
         QqkqyX6jS4UVCsspIn61xgYzHfR3IrIfM7qHgk4/XXcnovpN1DgLoWOwNEKaainXHPwr
         G+lvrqCh4iyrBNEmRmaB9zq+6pJTyymiunirER9m/suGRbDw7XUvMB1dxwBh4zj8bKzk
         x7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386148; x=1713990948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxvxWhbbEm7g4ZgX9PfB4UETGetKt7sOS/3R1URp8ao=;
        b=qsA3NyZgOpHX4oGzPgu5wTKZsemjCHFui0jXTbyayfdsOjjr7VddiXZhttcR10OaHi
         ILPVr+7OnaMC1DZunynLd1WDIOxiuFzmwnDXSto+FD0CC6Qal8177AgRYLiph8+J7lwg
         CpuMiEXzM6Ws74t4nO6MjJSUTTnvX6rktZQc/N1cFQigvHE1SEoZC+nVoJvmmRehseUr
         WpjTiv5eH5+cEZpj6GhcicE9J7nHllGMDlrsQ0EoJ+p+auWXTE8iLqUNYqIjdL6rILFA
         1G8uEF03OCYrBF4yzXtt22jdImt/rnX9JYg3hS6rommgqP9VrD2clvJ6C8h4PJtLS5UF
         yuvg==
X-Gm-Message-State: AOJu0YzcS/OtQKFQKC0AHc/h51FRqlk8lMIVeH9n8oej9t9KoQefU005
	Z6HVttgPBpDXD9YREEAWrnLA2iZlz3jWXM7K5+ItKuitB8B28jH5jy7vhZgMC5bfOyuNrhSYz2m
	JLNY=
X-Google-Smtp-Source: AGHT+IGnLcksM0VHNKUf6E6g42BZGzrtH2k/HzKe4YgMkWUOtnnMEDBSTzuu4yo2lb4GkCEDVt9PXQ==
X-Received: by 2002:a17:90b:1090:b0:2aa:c389:c9f0 with SMTP id gj16-20020a17090b109000b002aac389c9f0mr329585pjb.12.1713386148212;
        Wed, 17 Apr 2024 13:35:48 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm76876pjp.1.2024.04.17.13.35.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:35:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] ppp: Add RSA-MD in LICENSE
Date: Wed, 17 Apr 2024 13:35:30 -0700
Message-Id: <915df62abd2986b2f9d73718e702cc6ce088d52b.1713385733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713385733.git.steve@sakoman.com>
References: <cover.1713385733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 20:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198483

From: Poonam Jadhav <ppjadhav456@gmail.com>

ppp package has "RSA Data Security" license text
in Message-Digest Algorithm source file md5.c and md4.c
Add RSA-MD in LICENSE field for ppp package

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index 7e3ae43b58..b7f71b673d 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
-LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD"
+LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
-- 
2.34.1


