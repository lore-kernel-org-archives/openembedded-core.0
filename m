Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F23E1093176
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 07:38:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7273.1774078712266107723
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 00:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JyHekUSF;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso18610605e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774078710; x=1774683510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pAuPCffmI0l7GT0NdpkMsNQvN4viNHGyzrJdk88Flzk=;
        b=JyHekUSFzkN1WeAvoI3r7Z4BbcEWEWfmHb7W4kSz8QpIQ3LENdz1WWasoKYt3GmeWf
         XDTVTQOOPTPCkhqbWCrpvKXI1AqwUyk/90dg7xaQeHyZXWZS0UCGDUKhAf7wQMB4ETjJ
         2uJLGJ9Y906YSoPLQoba2+h0jpIFMVuIIR+HQ/P1QQv6bNd+4D85eHkBak+zYs2ip+AK
         ynTRzva9U0gQ3M566uqyTUQ8LcCd1QEpmxoet0r5phxe3f08hoI7E6a6zCeFKl5zUrgb
         JrNR4ko1y2SUGp9Uw7xroG7vrKXr+8qCWJ24AAGNqMSeMI4V0arILYXTAk1Lc70UfiZg
         kNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774078710; x=1774683510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAuPCffmI0l7GT0NdpkMsNQvN4viNHGyzrJdk88Flzk=;
        b=BJ/69tcgL/t1x6AKD/Ym+DPFfTIva1uhh2WwdCUi1t8TJ0Xh6Z9/uGUBMliA+3rQtB
         oee1jmsz7CaQZZGFNyJzJusnte4LatGf7bNVyTkuIvVTxdQYbUqJRSxqMccyO1DcQ+W5
         aVlEJJLLzEvBe7/sVq2at5eg51FjbatVwTtWIlWzD0whgnvSVUmIsbgmsJHVH73217Ta
         rUpirbD58wuHy5PTf6kVk/sia4zTSVZ1zC/1R5bnFCgGbee4ifKS3d4/vR/1KL9jzib7
         rxe97HBW3WVYd+OB3+LvV7EB89Rd8GUuNF8AaRrtFAdZb+5jDrElfUzDpc0TMe1uGJBR
         fqPw==
X-Gm-Message-State: AOJu0YyuXQDrObt6dkaVERHrOfLI602AiSz6h4GrRYRMUtAWEiHcrj4l
	0P9BGHKOxtqkrlB3HrRsrNjqRwivQKqJoCD43FAWUHe08ljH9aRCW1enXCkyIg==
X-Gm-Gg: ATEYQzybJ1WaqG4ztDB/HyODNidx7kjmL8maIeyYTVcd2eOiZ6l1Rl+kMcl9u1fNqFV
	qvqYew2tTgxwf6QCvlU8WuFhu6x+zV08J+zxAqYSx9Kd5hiNiIgmYgiOrKwhoKQNF44kiqMOYab
	BAGKek6nnQw2Ueh0ilBCJ2llsgm8tNPNUsnxgiGyrkXtCGhrLN6sY11/AwZ7uhDdJs2Rl41iEkd
	UJY4Sq9aQJnLZtJt7Lv3QTp7+wvD1pHkf+zzJEjesDGx38ESvl6i1rKxiMftL86kKIVR84IzpZX
	3u6o4AnBAUcJF2KzrngxauOTyxvgQtxg4p9/l75xa/Mkpc8/la85qS0sr8md9klnwUNOTchFYT8
	cnGFZQ7eNCeZLwZiby4p8iMi9x1XjqaQKEVejGUmoMMV1gc6TN66KrBkVwrjHZz/Zgd5vJWNDTB
	WH1ITYAg+u4ftJbQ==
X-Received: by 2002:a05:600c:a416:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-486ff02f9eemr67973805e9.23.1774078709798;
        Sat, 21 Mar 2026 00:38:29 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm149916245e9.4.2026.03.21.00.38.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:38:29 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [whinlatter][PATCH 0/4] gn: upgrade to latest revision
Date: Sat, 21 Mar 2026 08:36:36 +0100
Message-ID: <20260321073820.1403645-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 07:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233646


The latest revision of gn is needed to build Chromium 145
for whinlatter. Nothing else.

See https://github.com/OSSystems/meta-browser/pull/963

Please merge these into whinlatter.

Thanks in advance,
Zoltán Böszörményi

