Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8316.1793225181235536593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=izrl/SEq;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1afdf5196so630840eaf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225180; x=1793829980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTYMigd0+ZyC4B85UyNY8s3jidM5wVxaP5djY52xhfM=;
        b=izrl/SEqBEnV8tDyr6qtf6MIe4oBTUp6j1A2JluJrmEdSWq1FURIj8Y+Jm6eO5IJ9A
         GRQot5fOd0Dbtxaz7IQlSOcbEDI+sh/b7LSWn9YaIkgCP1MTBFE+tAqyWMD4BgeI0TVk
         a1THrBmQO2dSv0dxq9YC7WwLD5QlSBN8Gp7IP3h1Xx0Lm2Q5JmVQ2pluPErSEleObWPQ
         2XApKm7RvYsfRC5CYz8HDeIrWwApsu3WXZ3EYFgeUMteMlHSbuyq/SO1AterLpphsfrd
         9Fk/+bechgxkh6tgQ9aCgtuXvDsy/sRmT7gwNRaJDCHmx+YIM3N2C3o/0anKimfQhcrY
         NViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225180; x=1793829980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTYMigd0+ZyC4B85UyNY8s3jidM5wVxaP5djY52xhfM=;
        b=TLDHpUcmjU/6DUKVssSoFTo/FuiCSmBkNOALmnwAeMKC64Bjf6nTLVdiod+TazNU9R
         FmXYAc9b17ap0y/cSg70NP3VRx/tirYQftg9Nc1oBwSaQXlwtnk4i/8O1D+4cO2NJyzI
         LLgHKmtozzdbrFjYIVwM4AB8PBqlgne9af7C7btKGm3b3No5pIIkpru//HSyxRWTJ7Bm
         JfC2IRcHqSCiGBdy8uc+wiu0xLjC5OOMNKVeYNCq1vBBo4bKUYlfX58agwOCJ00EG0yX
         HtcAObLVu9KYBHCF17RGO4ipBUCR35Du1A3OqpxKAeja10Fc43Mnn4wR9xULmpmh19cs
         A4aw==
X-Gm-Message-State: AFq9FYJkx/Xx1rWX3vISeciwbh1i0CTH4kfN9vB/JnMWBfYK27bop1SI
	VD35fNnzCFZervarr0q7avGIFcqLiQnE20et6U/AHRZ2zF5mq62eUD43jCsY8Q==
X-Gm-Gg: AYBFou1U6yScBm1nVVdUheVsrXcHQh5FAbtyHeStDacBuFa2pnFQbsLUKaDodkjhDn6
	VMhPAmpHT0GEgCs5zZXCe9RZ37sofoDE6JD11XhMSVJbmWAWr8vCs02s7YfxWTs29EvpNOZIqjt
	cPWdcHg6/2nPziMZLur9/lqMKYpcE/X0CaXesr5ynXrdI0UhPh9JH2km2N6Kt8UElBQVTPrMckW
	Gukn98f+TSiEVLo8A9C9QMPCESQoGUQ8CQqou4oRCek+tlHRHke/L0eBtUPlj3pLaoz5B8GxNUg
	v3mLqUf+qawJynM50hTkq7T643G/Nrduw9aV0LAa2KRDZdsg32IfKtp03z1tuLEP+xqHn+6cALX
	3pSmRbtKRSWlL6VgcxF9AWscy6f0g8YdPQehV5eiby2jQNlpkExrN+jo3P/+OJtFtJip4350dfl
	OvRlrh2tQKHD4PuZ522pFgTbGdnqzD1u8YOVyUrRj8ERBOHQ9q37dDIUD7gSS7ROQjqK96YxYFG
	tQDJOHkSIi3bKGXYBqHyLFeK40NerBiRYcP0Uw0tYJjU547t1QlqaL3WbZE8TCjD9l9QYq6fx0A
	1qgWFjfnP6utv6pl7yhbrvhtK2I=
X-Received: by 2002:a05:6820:571c:20b0:6f5:a96d:cbb with SMTP id 006d021491bc7-713ef141eb9mr1328469eaf.45.1793225180366;
        Wed, 28 Oct 2026 15:06:20 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 8/8] ovmf: Allow empty SPDX deploy artifacts
Date: Wed, 28 Oct 2026 16:04:39 -0600
Message-ID: <20261028220609.1348489-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248845
Content-Type: text/plain; charset="utf-8"

In native builds, ovfm do_deploy doesn't produce any artifacts. Set the
SPDX_DEPLOY_ALLOW_EMPTY flag to prevent SPDX from erroring when this
occurs.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index bf69108f0a..7cc844dfa6 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -249,5 +249,6 @@ do_deploy:class-target() {
     fi
 }
 addtask do_deploy after do_compile before do_build
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
 
 BBCLASSEXTEND = "native"
-- 
2.56.0

