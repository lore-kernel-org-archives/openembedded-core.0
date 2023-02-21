Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F7CC678DB
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:37 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.43544.1676990491517608605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uSzRh7Jq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id b14-20020a17090a8c8e00b002349579949aso4889899pjo.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doEyWAQuS2AH0ZhTmt3Xkkp28VxvfRP0mJmcRGiegY8=;
        b=uSzRh7Jqdrvrsjmg+TLfJEQNuDyPMXYzqUlDhazRkbtV30u3WFkzoSlTG2Fixyhwu2
         cPzZtdV/zEkW2zaRbA2cWr8cllDZ7Rsj680X0j/H/LXGBxYInZUSnpTtAsNl8RtVJoy9
         uwoXHaZFwRQAOQ/iprSEnOT9ykmNrQw1TACOnqgk3lL47D8vQtAEB1BnHCAquy7V4xGh
         GHj1kDnlvjrVhHThrjKnPoGTyQMEjKxGmJ/jIcsWpt4SFEG9jwrq6q/RS2ER0BIBMB/f
         EU5aXo1XyRRywKRxJAY/WT37RQarZmSkwdKUtzh/JcDNjOs/eLJOWwsX5JKJQugWBDnc
         s9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doEyWAQuS2AH0ZhTmt3Xkkp28VxvfRP0mJmcRGiegY8=;
        b=ipce3myxiL26VPKsl333KDZpLMyXZDYuN7grIZoVENiejE5dQhNU/cYZfE7hEaCpIk
         k1u3ZNeIGXLhCi4DUE5v/e68c04vLj8etARKO9xKWO/JzZ51AvHxy+OziyxRIGWyS4xM
         Ulss3j0UFlzBvvoNiMPrHhvZ1njy8ZEuoGmrEPJ+8X/HtwEKLy9qNIGfNUBV4rrVo1hA
         a4QzFbZhy7ZeCROQ2npGSuD6NZeeEP0e8jE16mbDv8TwCjq9sOXFlffvmxh/+y0DUAOn
         GlivIINT9ai1dPMsDW+21+J50osI/hRVw3DKph+b4DGcoTNnzLGjbtT1HMYXg3UR32Yq
         Ba+w==
X-Gm-Message-State: AO0yUKW7hlga2L32kmdbthULgWS2WHJyHDb4ZmCE3u4tWHCW7LKEliDV
	snzLEt630NrUAY04EyQHmf7voLQa03lgYBOvP1Y=
X-Google-Smtp-Source: AK7set8bkGVUTer8rEYms2klqJXFXKb13g7Z0uYT75Y9wnmGl61mZORm5H2gBlAS/JVHkwn2XFUArg==
X-Received: by 2002:a05:6a21:339b:b0:ad:67fa:8e50 with SMTP id yy27-20020a056a21339b00b000ad67fa8e50mr6136862pzb.57.1676990490570;
        Tue, 21 Feb 2023 06:41:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/23] git: upgrade 2.35.6 -> 2.35.7
Date: Tue, 21 Feb 2023 04:40:52 -1000
Message-Id: <0e7de5066491bc9b860ad4d65965d6f848898aff.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177509

From: Sakib Sajal <sakib.sajal@windriver.com>

Upgrade git to latest 2.37.x release to address
security issues CVE-2022-23521 and CVE-2022-41903.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.35.6.bb => git_2.35.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.6.bb => git_2.35.7.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.6.bb b/meta/recipes-devtools/git/git_2.35.7.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.6.bb
rename to meta/recipes-devtools/git/git_2.35.7.bb
index 0bb4a6a021..7cc8e5722b 100644
--- a/meta/recipes-devtools/git/git_2.35.6.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -167,4 +167,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "6bd51e0487028543ba40fe3d5b33bd124526a7f7109824aa7f022e79edf93bd1"
+SRC_URI[tarball.sha256sum] = "fc849272a95cc7457091221a645fcd753b3b1984767ee3323fb6a0aa944bbcb4"
-- 
2.34.1


