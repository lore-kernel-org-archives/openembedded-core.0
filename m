Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D074C3DA55
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:33 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.11483.1720800209291954500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYzhbpdi;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5cbc5b63939so914636eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800208; x=1721405008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZLoqttQQd0sTcjjmtleS0ipsYhkshkbTe3nrVGzReY=;
        b=PYzhbpdi1xpX1OMoZUtxywZjTk9NafRd3Oq89bllz575Buj44DJrnmv6FFpYZZwzYi
         q35tmyVWKEg4w0nzo+Gly9qaajBgxXt9YES2hYb7r1pDrSLM5NI0R+YTqjYKW5/VqPAa
         WhPllJMgXS/H84I7SqHHMVqlxksO54sBLJyWZoZPwkic3zDlnJzK6THyUuuWUwWhr5mh
         WBH2e8OPAk7QXo8jpNOvUXE57uwM47VxUkjRhIFKuqbSZWqkbcy0JvkDil6NSuLp9+J2
         GeHd3l68M29aaHiXVA5z9IHQkivvbfi4WSuLNPEn4X5ob2RquR8Nk0zq1U4YHbQ40PfR
         OE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800208; x=1721405008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZLoqttQQd0sTcjjmtleS0ipsYhkshkbTe3nrVGzReY=;
        b=KusDgPfpBCXlOtbzpyJPBNjjp1WMciaV4SSx05MePmc2fXz6QFoI9cskF2zvo5TzBK
         jox9S50++lo8xbgpp+ECiu4bwweeVpd/OGpZpAFeDR9GtI23j+iqQq575/28I6HPJPMi
         gJby9v53lFd8/OSgP8/FI3j8p0d7cfJTXac/bw8gmfajHFAKD7lB2cE3frJoIlR37KxB
         BH7ButYyufJyTYqIR+1O1CvoPUyPKmyAn5PYADJaKYsajX9/CNoxDX0WgQo2ZjHiUASo
         6wQTLYa2RVkPpCB1a+h757c/cIKKur2tpkkMzOHU1etOyJe04z0M8AheqaGvrDwaYWFQ
         e/mQ==
X-Gm-Message-State: AOJu0YzZj8woZbJOGsSVYu+hz7iZGIkWvlQWqjm25rFgeFjJmwMYGFxZ
	GHkARpnsp9QY0Vcd//k7xKHlNkBILLw/juzx1B1phyO86teuTAE84l1MeQ==
X-Google-Smtp-Source: AGHT+IHG9qmCw6f8+pnJrp4xWxdPePDak4ioFKAczkznh8E36JjLPuclsvfay6qLCV2RGcd7brGLdw==
X-Received: by 2002:a05:6870:310e:b0:25d:f8fa:b53a with SMTP id 586e51a60fabf-25eae7ce03emr10657049fac.9.1720800207905;
        Fri, 12 Jul 2024 09:03:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 12/12] Switch default spdx version to 3.0
Date: Fri, 12 Jul 2024 09:58:22 -0600
Message-ID: <20240712160304.3514496-13-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201846

Changes the default SPDX version to 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 19c6c0ff0b9..b604973ae0a 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -5,4 +5,4 @@
 #
 # Include this class when you don't care what version of SPDX you get; it will
 # be updated to the latest stable version that is supported
-inherit create-spdx-2.2
+inherit create-spdx-3.0
-- 
2.45.2


