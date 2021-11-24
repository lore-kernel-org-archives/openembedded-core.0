Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE68C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.3499.1637741325489141877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FRl61rwR;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id l16so2586531wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGZDhTdIE9TE5LmNnkRd7vTAPRLgS1KRm13Rsz8nnVI=;
        b=FRl61rwRSkInuvoFgOtFVxXKnX3GWaXaDzssRjQNDOzxj7y91pp0skHjqpDLfNZrfj
         G3NcaNkuNUksEVvXiaMEiq/x/J1P6banK3KXIPkHF2DmAIoqfzPldBUTeR6mDEsYEdN7
         BP/G3CKBMenK+E3ryCUIvYV/JnpUFTGTg4aUaxwvBbHLn4+QNuzlXJhXH1Kg3dVWMkGh
         BWg7pdCvUwZIjeOBqYn5SkJmQ2K5RyRLtaHpU3FD7okr3TsXEHsTbk09oDE04YBTso8X
         i+G/XejftvgsUZF4efC4LZfw8KbE0yA9N926yh5tF4gjWXaWkfOWw1azEXTjhmdSrTx+
         UkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGZDhTdIE9TE5LmNnkRd7vTAPRLgS1KRm13Rsz8nnVI=;
        b=iMufdTvJLH59Nqxl2b//J87+cVVD75wsnmSDvAppdPpMv6wCw2ADV8X3bSjGcqlds8
         LOTYaTxdn0ZUL50/WVP5Peudph23eUTDoWF/KbrU6p0Q1sMSUomYqv5ZmCpI1j+lkyfR
         TCo2RRks4KR+eNOQkyz5qers6kWb9WeHN46lGm8rUbGVFpdRzbSZ1YJUwqn6ElerF9de
         JbtLx4Y6YJ6LA03Yecq1KxGiXxp8/O9ri+e0vGfPjUEz/OOKXgdR0KlZzA1SAzGbI6GF
         HTJ1UkMrJWM1JQoHOPtvoeZzed84rbcvE/DVU+RLMKkbV+2ufHDz8AeMWzo0ulLVeE7L
         6wGA==
X-Gm-Message-State: AOAM533fCW+Uy/pcRwYKl5t7zE9watmuSagiMInFktbbsRLn+rF50scG
	OaBMLng0V/SEThSQ7twyAZUUKB+zPT/2UQ==
X-Google-Smtp-Source: 
 ABdhPJwnFYu0AI5d3i7pLayqqD09H90zmMqahvZPN1L+djqwD6aWG/K7CVXFR1WSL0v0HylgwOg4Wg==
X-Received: by 2002:a5d:6dc3:: with SMTP id d3mr16268276wrz.159.1637741323155;
        Wed, 24 Nov 2021 00:08:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/21] git: update 2.33.1 -> 2.34.0
Date: Wed, 24 Nov 2021 09:08:22 +0100
Message-Id: <20211124080828.530981-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158671

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/{git_2.33.1.bb => git_2.34.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.33.1.bb => git_2.34.0.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.33.1.bb b/meta/recipes-devtools/git/git_2.34.0.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.33.1.bb
rename to meta/recipes-devtools/git/git_2.34.0.bb
index 0dbde7fdc1..fa9299b494 100644
--- a/meta/recipes-devtools/git/git_2.33.1.bb
+++ b/meta/recipes-devtools/git/git_2.34.0.bb
@@ -5,6 +5,6 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "02047f8dc8934d57ff5e02aadd8a2fe8e0bcf94a7158da375e48086cc46fce1d"
-SRC_URI[manpages.sha256sum] = "292b08ca1b79422ff478a6221980099c5e3c0a38aba39d952063eedb68e27d93"
+SRC_URI[tarball.sha256sum] = "0ce6222bfd31938b29360150286b51c77c643fa97740b1d35b6d1ceef8b0ecd7"
+SRC_URI[manpages.sha256sum] = "fe66a69244def488306c3e05c1362ea53d8626d2a7e57cd7311df2dab1ef8356"
 
-- 
2.20.1


