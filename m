Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B70FC433FE
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:33 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6304.1636603772132417357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YsFcyvkO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id b11so4668113pld.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lfiDCCE8Ub7ngD2wvjAqDkDO25weq2UgGTvpcUrmLNs=;
        b=YsFcyvkOjzs8OsxFp37ck42sH1l+1ELXmF82qpNiwo9hUmm1Lz9drM7OGH2STzvp7S
         gNTGjbI9SBTb90rpQKLaZvMhdi+RULlT4KVpjLQbtpUty7NNvwl7uISAqtQ0DVeBKD34
         wUAUr+4DPtKQwT256T4QZA9928668miOcGaohFwm7uPi8RLCxlEiAefGxYFdTIygBKFc
         62EQ2SIZWhZvViOA1a2gI+ZLAHdX7S4Sql9DSKcNHSDKLRjpudZgerSd3XbfPHLa7WYy
         qdbkZsU90zYeQxiZ/G6h9rdFHNb0eT7uI1jnfXWPPaex+9JZtG+zWAqbVnDnvGL9PO1A
         tIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lfiDCCE8Ub7ngD2wvjAqDkDO25weq2UgGTvpcUrmLNs=;
        b=r0P0vyH0xAhSITvoN56yswN9plLQ267rDyn3HJ8iNF2dipg4s9UK7P2AK+ywUsvUHz
         Ga7EgR7QfSw43mho3w98YEDubk8kFmuDbqFqD1eQ0rTz+N6ueOalgkS99DY1Ws291cBm
         HmSPC3VCThts9iO+1h1zi1PlmunBfgU/2CcDNrZQVt7NuN6OPxNNuR5P/opL5P8xolIq
         Zjgh5PQDKVX/7k1gmBpaR1dQoks8mC6N1KcLXDg27gGWeKWDR6nVjRKZl24F8Q52ROO6
         KqYf5hAFfk4S2Yj4AXE2LBmWvYv53BDgE/t8Cx3bXJzTmixYtzvhKNk5R9V+8b3yE4Cd
         04Eg==
X-Gm-Message-State: AOAM532UWaaaf/vxKhGGbpwt2rwiZTc3Q+fPPO1qSh5rdR9HPnzdte//
	bx1IasyAW0EBBSeZgYktGLpFvmVuggSFS4cXqEU=
X-Google-Smtp-Source: 
 ABdhPJw4wPCwBUZ/4nDOrk2rgskW9wM2vrOm7vI8EvB+nGwyCnopwba74rzVnQZeB6DCuVAE/V7Fgg==
X-Received: by 2002:a17:90b:4a01:: with SMTP id
 kk1mr23279006pjb.7.1636603771250;
        Wed, 10 Nov 2021 20:09:31 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] selftest/reproducible: add webkitgtk back to
 exclusion list for dunfell
Date: Wed, 10 Nov 2021 18:08:39 -1000
Message-Id: 
 <0d3603f9433266b619adf59bf5e5d346b0405062.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158146

We are still getting occassional failures to reproduce

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 60ddc76340..4b606e7e64 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -59,6 +59,7 @@ exclude_packages = [
 	'systemd-bootchart',
 	'systemtap',
 	'valgrind-ptest',
+	'webkitgtk',
 	]
 
 def is_excluded(package):
-- 
2.25.1


