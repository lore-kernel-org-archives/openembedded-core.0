Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1518C433FE
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 12:43:59 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.16305.1652618635944853345
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 05:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J1upmlk2;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id h29so21678505lfj.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ETEI9IjNA61JPcUw+ibCEB9Nt4nGwurarcwN3/r0UyY=;
        b=J1upmlk2DO6402WnEFbrJ//dokJDCSenyYTE4VddkxeHFVnY3pIQXTuYghQ0uBkqt+
         vQhKWKizELGuUnnIERrkoWMrRjEK0WHAqFNolWik2eyoOvYsNhJbIsIc3F9ewrmg6BlA
         sKU0UgDESY7dBarqmTtACHxXYhWzuZC49YFJrq9JFGFiudgYJb/8LP6D+J8PcpWGZB9f
         3TkuYNAF2we1Akm5hJpB5f6hz6bOEJKkfr307hZlvq1E3XFnbsNo0j/VORhNaqS7qoTS
         EYUgwl+ei6bYEmaRiJUYo4dNbz+hK/ZXDYDas2yVHkNVHm+lZDpG0uY9Do6Zwc2df5wB
         L9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ETEI9IjNA61JPcUw+ibCEB9Nt4nGwurarcwN3/r0UyY=;
        b=h89x4T7gBlIlt53Q65Fr6FxZGrzL5QHTemjOD8t4S6PBIffCw0egLfLUnBQDDLxZHg
         zgy/pACoGqrdwrH+fSdLY57uPgaFAdPW39CmwXHrdiwd9nO1Sff1zumi7d93T/K8yzlb
         aB7XGKpNhwjXiBt/CKRA4xy5SfpX1pkrBAAT+10cxfWL87xAdVP/lFW4jE8z6+x29bIl
         PxWasRFlBh9DucBtVm3xztdxP7EcdbhSSINHWlyO1kkX5FnMu5tRCuLjGwH/owK0sfov
         lqBVG8U3+REUcpJJJb9wzcaUWvp9t7nIIJjDiBlandfHEhke/I1ylcRYRfvb22wKKuTy
         fjuw==
X-Gm-Message-State: AOAM530Erl+8Jcyw3+hUPvKF7gqRRCMe1zNADjI1c3r3hcRHbGCEc0vI
	2VoRYD4ERbbrOGTouKa8cN386rw03i0=
X-Google-Smtp-Source: 
 ABdhPJzDDrNUVvlEUJCCIE968Ygalu1WwPFK3B0OPQMTTteTXq6JMFkWP/4AiyqZnCAAA2IkS6mldQ==
X-Received: by 2002:a05:6512:34d8:b0:46d:4a1e:7c9a with SMTP id
 w24-20020a05651234d800b0046d4a1e7c9amr9865455lfr.336.1652618633275;
        Sun, 15 May 2022 05:43:53 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 y22-20020ac255b6000000b0047255d21123sm1007828lfg.82.2022.05.15.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 05:43:52 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 1/1] mmc-utils: upgrade to latest
 revision
Date: Sun, 15 May 2022 14:43:46 +0200
Message-Id: <20220515124346.8095-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220515124346.8095-1-liu.ming50@gmail.com>
References: <20220515124346.8095-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 12:43:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165602

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index addefe9abf..3e611d1306 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "4303889c8bd9a2357587eb6ebacecb70098a264d"
+SRCREV = "b7e4d5a6ae9942d26a11de9b05ae7d52c0802802"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.25.1


