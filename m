Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C22C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 08:01:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.46519.1695024060670924307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 01:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fMLIzi1H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso3704490f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695024059; x=1695628859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yvhT04q2+moIMIOUzE43tk/uNuKb2e+L3SMi7osZaE=;
        b=fMLIzi1HN5Y/0sivSnm1DlJUwf3mpZdbqKASA4/lb6PP44GeAycjmvdynMkEafFWZf
         RrMeQuV8Yhf9irNx/YgtYSDKWxSp32TCLq+Jr4VAe1bqkfRRkg5BNfuDjnynLvt2LBdA
         fOPPgK1OQ5naDv3RYuVGIqVDF1LhlGR6I9LWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695024059; x=1695628859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yvhT04q2+moIMIOUzE43tk/uNuKb2e+L3SMi7osZaE=;
        b=C7FzYCWqT8Ujy/bX6De9rkt4enNEpMUjLEDs2Vaz/7W7On74NmtKiD164dtQgbLNJ8
         NQQd0H+DmzFSCye8w+RLTOJdSicg8+bzQbFGn//viyxwrUYpDoaCLquTWfiTRfdaoqPu
         uVllaUPlPO0npOaBBBCyqlNqdQh9qPpKMiTXGaZ2lBMRG8MBCLBinvZ+Txs4QdudHeZL
         Q7vrzQNOAPmzVuxW5J2zobFYTmnMuNobclPYy799k6qVe5uT7tuO3QJd2R4n+8mBVZ2E
         BKGaXNEM+wihVRNHGzfdAomTaqhgpIIs1swOfT9hPROhA30bRnFSiZS66ma2sJ0qAiFi
         L6pQ==
X-Gm-Message-State: AOJu0YypngPDVaRQz6jwOaj4zk+FpFwcC3pDnbop9cFPc8HTfLAjS6HU
	rQ3r+BKkf1ScToGGpv22HSabu3kPgyEBbMyluG8=
X-Google-Smtp-Source: AGHT+IFHR8uWqpVf0pEp4GBDN/WPGXtJWwu5h7Mg2M6kXxeuKhJWQVE2OFhuns/8Jxu8EVBGpKOJSg==
X-Received: by 2002:a5d:4cc7:0:b0:319:52da:8f0b with SMTP id c7-20020a5d4cc7000000b0031952da8f0bmr6817207wrt.17.1695024058428;
        Mon, 18 Sep 2023 01:00:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c207:9dee:97a6:8348])
        by smtp.gmail.com with ESMTPSA id l22-20020adfa396000000b0031aca6cc69csm9333334wrb.2.2023.09.18.01.00.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 01:00:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-tools: Upgrade 2.13.10 -> 2.13.11
Date: Mon, 18 Sep 2023 09:00:57 +0100
Message-Id: <20230918080057.655957-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 08:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187820

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-tools_2.13.10.bb => lttng-tools_2.13.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.10.bb => lttng-tools_2.13.11.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
index 20e6375a9bb..44415fbf2df 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
            "
 
-SRC_URI[sha256sum] = "e5d1095ec1322565f38f149346f71967496c281eacc51ec5c77994b850e7d335"
+SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.39.2


