Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E1ACCA472
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 20:05:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.17777.1759694727198751010
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 13:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=co82Oqiv;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-41174604d88so2208988f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759694725; x=1760299525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE0D36syE2KA0xO6qhtEJRGOlnTSVV7CZx5aPHdZwfA=;
        b=co82OqivGgYi91x6rYpAkx39SyHV6lXTnYT2igulzhxg+p28bX2dcmWtTdFaUhLdqE
         O5+de8pBS/a8RgUlTid1yTujHwoMR0xPzx0VPipLu7CC7fy3XeLhjZ3t7b9eH/Ls2Pd9
         t0eyB1i0jWID5nIl10/sG0Ya6uEt9S0ams/LWYITlvCl6OgXKtBsLpv+9uUVpWw7i5JN
         lRMb0V+9dgVyFKbudmuiZyecpSDMu/gmu7c/kmUaxi2Xd/dtzhN8BrhGt5RlgI1pQBW1
         TfWkrFqqZc/ySaoN1X/BH/C2VhHuJPiyFll9Lq9R4gXQhNqhV52MvHKgeXN6HgU0PD2o
         P0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759694725; x=1760299525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UE0D36syE2KA0xO6qhtEJRGOlnTSVV7CZx5aPHdZwfA=;
        b=Z3Jd+gxJogoTYd1wIp5/EueS8XOWL9ii5lVIkglxvSCo2LJwArovvb3hRvePyTGpcQ
         Jwnu38M++GIKl+/b6JxpmdXkZzvmqhBdYOdiGM0OVFhwJmFhgO2Tdd3+mIuIKXKq9US6
         BJ2VNopO4PDGNyKNScSbGj26FQBhabeUcnkqDZI9vQPmBO0WK4BhHWDD7tNkjGUU8lhy
         KoXvGAZlYrCzEDImNbw9/ruk54BFYLMh8fVs1EWy/3bo4j0l5suyagauAAIAjHRG1AzP
         EzWRr6N8qnPLl1KH+dK7OOk8CfoH1pVyzeF2pyU2BANArkAxlXWjsRmcaJraF1eXVhCi
         7EWw==
X-Gm-Message-State: AOJu0YxwBDWEYU4hzTFn6pulYRE90pHJXooRC4/V/iS2fdHUZ6g/DBxQ
	5EdvHc5BdHea0MXV8Q/J/tYZTeQAVcI+GI2q4eut4Lm7X2H3vD0psZOUDVh8Qx487s8=
X-Gm-Gg: ASbGnctB+HT+/HfkqdvQNaz0+SmHzf8T2Tkb2SYeFnpGn8OepqJI9PBlmHA8MIiTjy3
	cnknEE0rfQowexXLRxofn3xge5LKjI07a5XIveuuZEFboawZA93gFhwq7+0KH4bGGC9t3WUMnhT
	5/91oaaFeSOaLcTq8kwBdkFSn2A+wzk28r5KdvzQW3o1maeaZrq68ZhhlK0cX73mwgaL5AEPhda
	X2rnPJtr/Li+2yjZSH0MV3vESHBnZoDBAhWVENCRWKx/0pRM4tG4EV0eD0xJJJ6yW0oqnspUqQB
	IGHJGFMOXG9AUMKqDEFaoh41tNCGcaqlVWkQAVcfTlgbCFnedPoynzBSmMymKTEihACvsfnJ4Em
	39Sd+jnkkEWCiZhI8h7Ng3gOprJrKMr39xNyGAEwz3fFcR1BGOXlKufU=
X-Google-Smtp-Source: AGHT+IGPQq/AGhiD6W9vA3bXrVJzCfo5AbC5BZWajMGJjkCOLC1Y1r+AUolPe1+JlBkCyQSzeBxpDQ==
X-Received: by 2002:a05:6000:2089:b0:3ea:2ed6:9e37 with SMTP id ffacd0b85a97d-4256716d8cemr6279038f8f.24.1759694725526;
        Sun, 05 Oct 2025 13:05:25 -0700 (PDT)
Received: from acert-swift3.. ([194.126.177.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm17487090f8f.15.2025.10.05.13.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 13:05:25 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [walnascar][PATCH] scripts/install-buildtools: Update to 5.2.3
Date: Sun,  5 Oct 2025 22:05:17 +0200
Message-ID: <20251005200517.32697-4-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005200517.32697-1-an010@live.com>
References: <20251005200517.32697-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 20:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224445

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.3 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 50b5487eb8..93f3e2d678 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.2'
-DEFAULT_INSTALLER_VERSION = '5.2.2'
+DEFAULT_RELEASE = 'yocto-5.2.3'
+DEFAULT_INSTALLER_VERSION = '5.2.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


