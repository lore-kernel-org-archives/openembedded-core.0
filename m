Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.1893.1630660727284530218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 02:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UpdHhWUl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t15so7246299wrg.7
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GshePSBsIDos5ReATTegHtrvmC7pGCyhMmHK1kuP3cw=;
        b=UpdHhWUlq5O9Lj78iKMP+kzyuR4LxoG8kFpNv0Ct6NTHgTsz+Ovb7paPhXB9FyjMyD
         tfLbw/dMOBDI2e5DHuajjfulLfp/C5S49EsxT/8k4u8HdoAeNDvMQd0jHZ9z4Omn8Rep
         pOXcvturRNjkST2AFE3jgDZcxt1L52DGEoOt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GshePSBsIDos5ReATTegHtrvmC7pGCyhMmHK1kuP3cw=;
        b=aLADaJPsKvhX54ez7Nix2CnjkvVbIku64qPKCvEyPnDoAP0vw7/JdicBsdFDWu3hwg
         M0ThBSOkAoygoyOv1ONraB6W33e9BzTfq7Hscvz9fsoDiLKQxLSkp/KwzgCbTbgsSCi/
         2WxgkakvuXREwSkKGpljQDV6UM1YVbINfmD57cHJfjloM8JWtGoDCRWiW5F9zdK6Pv4s
         A4MMwqIQ6thupUUJmX4FEzLDz6zD7ZEhI9buLWEyQFxj06ljlNizdsmxa680iHmhjTN+
         LDGcVzXNCGj5N2Ct79JiL3LphkD/fX09hiBM92mWj14YTWMeQ5xTAYLMNqOrONgviF30
         T/JA==
X-Gm-Message-State: AOAM531Aauahali+IoHQ4qTsbIDrhJz5hLaypBjOzyBK9r3gHTvX4ss7
	AtRM8GpFs6eNyr++eaMYQgEQhAGajoLgxA==
X-Google-Smtp-Source: ABdhPJxjJlyjCOH8eg3vNo+xAYTRK4clhehfXQsPzywKzBcIV57NxHW8Scqw1e6UmyL58o1v/h8ukA==
X-Received: by 2002:a5d:5107:: with SMTP id s7mr2770248wrt.283.1630660725257;
        Fri, 03 Sep 2021 02:18:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:748d:fb86:ebb2:cea5])
        by smtp.gmail.com with ESMTPSA id d9sm5113570wrb.36.2021.09.03.02.18.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 02:18:45 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcl: Exclude CVE-2021-35331 from checks
Date: Fri,  3 Sep 2021 10:18:44 +0100
Message-Id: <20210903091844.988298-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream don't believe this is an issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index 1e91f0827ed..cb9e486698c 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -29,6 +29,10 @@ SRC_URI[sha256sum] = "cfb49aab82bd179651e23eeeb69606f51b0ddc575ca55c3d35e2457469
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
+# Upstream don't believe this is an exploitable issue
+# https://core.tcl-lang.org/tcl/info/7079e4f91601e9c7
+CVE_CHECK_WHITELIST += "CVE-2021-35331"
+
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
 
 S = "${WORKDIR}/${BPN}${PV}"
-- 
2.32.0

