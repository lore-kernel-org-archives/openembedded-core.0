Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0148C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:48:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8180.1784270898147510483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gey/p9lO;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: lianux.mm@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cab973140bso91786785ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 23:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270897; x=1784875697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qI4LHNEN/wOzx35wKbrZnkGDgjgqHnB8pvhyEhHnrVs=;
        b=Gey/p9lOcrbecJf0pB7X6T9mBw6LHoMYNLJkRLI/1pRc23f0DtV+lteIU5iab+kP+q
         /ctTe/Z2r5CE84zE2ZAm5IuqocpAiOvs7Aym4QC6xf+gUeVzTvqt4UUvsXi3PSNW2o5L
         awIDchTPQdIn1jLZPaxeModq+Mq+Q0gyo3BDWmHNnOaX7DJXGpBAxGRKrcvlOevN85Hi
         vd6kGz6ElOazaOj0Mz7IoapKcWT5qo/Kybljs7gSOjLrw+JE83R8yI+89Hn1uz+zT8ot
         XsT3RrBz/9xjS/jEO4Wzl0zKj8rvexorubdm0cemKHqdaUNsVeE+5xKjBCtaWVCh1Yg2
         CsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270897; x=1784875697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qI4LHNEN/wOzx35wKbrZnkGDgjgqHnB8pvhyEhHnrVs=;
        b=AttJ7TJV1eZpJfJcU0z5Pek+v68IVSlKLFT9KoA4nIlyL/zbkw/5c7g/5cMZqgJLIH
         MOOTq2RwemS4HuliTHDwqOKdHT0C+6xskT2r8vZOc6qT+dAAptiykxi1akhjBwr0Mox1
         +9AG82ionTo/NBMkV9im+w2PHryrNY1Kkc8B/ClGf6wj71+0pa3yeyqCXtcb+NaOfbQY
         9B0jAqGMek6lGhRFp/Fo5yWKnWL8VMdBbu59kF5VvuC2onxN6Z/LA468mbLjQerpuINa
         /BLpxJ/DzUEvyg4JfhKaY0dcAY+ActtPrOtUgUtLlTokiIS5kj1wCRkWz7eOFDxfq8Eg
         cOfA==
X-Gm-Message-State: AOJu0YxdSZEArJaH2nOXCllR/bzxhXCgbPkgL/JPhp2BtBxQdQ/2ZE+Q
	cI5z/Mvibr3bf/CJpC7NOMNOqtBIGGM0yTumBZ/4TeB2IGpofXNnfpv5E4QcbMkUbj0=
X-Gm-Gg: AfdE7cnVNSuSRek+t3wFQV39yAQzuRcp9OXsNqTmHtIVRs1U8GWvmDq9CiX9RwjHzVr
	c+B7NJiorXp/m6Z8uQn0++UWvFiLtx8Y48+CPWWdZKE16ItH8WxkwS4FxKOeYsXfmmhi0xWa9xH
	Ovvv3YHPrpTFdxpuTm+8fF3jCpx+Mhtfeih1YBJP+G1+nSu8TDpHuZNyDKt2AdlAgFgEIiyU3N7
	ApXFBTMMlUhY2bBW5Z+MYvsTNACDz6QShH20RxnH8j691UVRbhb0oQkw+ah4OGmdtMs+LTKQyqJ
	jqPGNAWiwhSPeeCycqulXwBpAt+RfaQtg9R0qEndrT4kbBSjgdJv+Z9OK+yiqSUlnSoO9nZnY+9
	rtHzP51wGNUaJq32On/j1JUe+5Lj3d5xl88N/02L1yXgbisyxLK2reaAEl/IWMa/qiKxM+UZBeb
	SHmJA2gsTpYw==
X-Received: by 2002:a17:903:1b66:b0:2cc:e620:e307 with SMTP id d9443c01a7336-2cf34868aa0mr13993825ad.20.1784270897449;
        Thu, 16 Jul 2026 23:48:17 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344df393sm5189005ad.30.2026.07.16.23.48.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 23:48:17 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rsync: upgrade 3.2.7 -> 3.4.4
Date: Fri, 17 Jul 2026 14:48:09 +0800
Message-ID: <20260717064809.51124-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716071942.16681-1-lianux.wang@processmission.com>
References: <20260716071942.16681-1-lianux.wang@processmission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241154

Hi,

Per the stable branch policy, please ignore this version upgrade patch.
The existing 14 CVE backport patches already cover the listed CVEs in
the recipe.

I will follow the stable branch rules and send individual CVE backport
patches for any new CVEs going forward.

Thanks,
Lian

