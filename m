Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5420FC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 12:27:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.36009.1653913653128397481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 05:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IncTOOi6;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id z7so2466229edm.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iseKisgZTaGPJxDyKMETYXcaENTwcAtAtGT4ekAX4vA=;
        b=IncTOOi67wAkWcOVBFaAq49VLoa2PncFFIk61vNG4jQCcIa/Wnt6SdC6qaatDIapVc
         SlEalZYJ5cbTMPEGBA/nE4/HRAJj+boJaBY1XEym1CbJarqv3sH8KBvq/Y17JougpkX5
         6/hznccNFYdM+0nefT+7VThHm67axAOHq41Km6gUJbVjNY55hOAQI+8U0m8LkIa8iiq1
         Kse6qqb3k78uMrIqgS2NCtMPEJarf/PlWX8a46h8N28gAErtauvsMA6hP5gOYNAUkgkR
         KaEEFYwBURxBbODblh8EhFwHwLmn2OiPj3IZXKetmbtZhwDpEAPZaV8scE1eILEPt5aV
         +h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iseKisgZTaGPJxDyKMETYXcaENTwcAtAtGT4ekAX4vA=;
        b=hdKX/IzrzawJ5+qwWHLemODZRTlbjgu6FA0X/mirF40Iu1LeYrcjIr7Dlx/vlxjy8r
         bErLgE8E33sm7jOzlru9nd+Au9NCJraj2MIAtJgOFdgMIpYRC/fvcFmzyjxodaL9RcFx
         eSzKGdM4Iap3R6tMTEpI7Hp59HPQsOcEFHg66vkwJTaar2uTuQ7N5RIHAjClEfnNT3Zu
         bOEXTrLDdZN9wYTbdO6chEUDqDncyNUMe6IAWaUdNvvHpcrZB511x+iFqSVOC5WHK0Mr
         XAwVpz8xxOd4fNHUPi3dyNiyp4pPcuMcH2kUsG5UIIegCGWUu8VqNjkHR1f5ZQyhpPF/
         DpLw==
X-Gm-Message-State: AOAM532foRxT3YEQdf+mirhOxeJpRsAqTKpKHEMt4g0PFwWkfB8ugb3p
	vJGGO2c/A/i7VuM+AXJcOkW7OvxmtDQ=
X-Google-Smtp-Source: 
 ABdhPJxtAaSqBhvv5UVAWU9g39nx7gWIB3PG2M/EBdAK6TBtPNLgBWnhtXHpizAX62Fw1tdjoTX2sg==
X-Received: by 2002:a17:906:a105:b0:6fe:9a27:85c7 with SMTP id
 t5-20020a170906a10500b006fe9a2785c7mr45765053ejy.315.1653913640523;
        Mon, 30 May 2022 05:27:20 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-153.retail.telecomitalia.it. [82.60.178.153])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a508d18000000b0042dd60352d1sm954442eds.35.2022.05.30.05.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 05:27:20 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH] vim: upgrade 8.2.4912 -> 8.2.5034
Date: Mon, 30 May 2022 14:27:14 +0200
Message-Id: <20220530122714.213070-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 12:27:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166284

Security update to fix the following CVEs

CVE: CVE-2022-1621
CVE: CVE-2022-1629
CVE: CVE-2022-1674
CVE: CVE-2022-1733
CVE: CVE-2022-1735
CVE: CVE-2022-1769
CVE: CVE-2022-1771
CVE: CVE-2022-1785
CVE: CVE-2022-1796

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c5922b7fcd..b22e8016ab 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4912"
-SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
+PV .= ".5034"
+SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.32.0


