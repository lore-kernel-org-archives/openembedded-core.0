Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44ABFC001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:48:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.78511.1690742912690272982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aPl5Dy0b;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-26826f93a1fso2623399a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690742912; x=1691347712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WI0+BIMmR+SkG8mPJW4jVykjvHjY2aaHNC7jxDjVKRE=;
        b=aPl5Dy0bps2RV8JMI9Aagmv1yVOICNEBFWmdSNNtFI4U0whbkrpecnC+v8sEJ9SvHb
         JaZoZ65LvsvfRB8Kxtf6USE9MWgkH/94GuFv/CnyH3ai8M54kMDbiqiF9T4y0knkahH7
         S6nMzes2h9GV8E7swJnyV+5ynyIBkno9uhGkgLYNIh5hCktW+WIQzGWlnmTjFz6MC8rm
         LNU1wEqn4s/IvKtKiSHUMFdRIafsC2W1bjlUVOV5OViFBOw3wPcB6iFIXi6zVKkD9eOH
         XRDxRSsl+m7A/grB4qEDlqwr43QgOcqSahBJfjEgEBIS7cMNz2aIqV0MzWpfkZ0Iddn2
         gVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690742912; x=1691347712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WI0+BIMmR+SkG8mPJW4jVykjvHjY2aaHNC7jxDjVKRE=;
        b=EEax8S2kJfHoVtSKShVIh1U61+aojRm0tdqeBiGma1tE2dVA0Teoyl10Wo+AQVjLHw
         HkIRgxkt0A2Aua1+rOMwcE+tkmXMpcyXZEdSH3FfHdUMkFY3xDvU6Tssh5GOk+97tP6s
         7QYTwsUaJPGRbEQ3rWL77vhrhltLPMGelcbYrQVoLDV7aDiDW3KBSbZ9JlhOmZNftU5x
         D7FkIci6qPkWi5i7gQo06/cq89oCF5Q/mARl8a/0et1pirYvRk57mqN5STTDGKdE456n
         dKOjt5jpetnNvjUOllxo33LGIdlHjMvjY7o8Q6RQqPgPfjBnmLmsbBXaAh+pZACJ3Tcp
         aUYQ==
X-Gm-Message-State: ABy/qLZVqqtdj9aqjY8V2ufmtKBHc5Jl8hi3YoxhyCoKPJbyToCM2Lbx
	Dvhryz9u3t+1VrSax1jVrf/CogzrttA=
X-Google-Smtp-Source: APBJJlFbewZYU0WWpbO4Rb4uIIwiVuGfwMuj42y+HoT5z0kRuutjz6i+Ik/4Fbjbmso2tGi5elh6MQ==
X-Received: by 2002:a17:90a:858d:b0:263:4962:94c6 with SMTP id m13-20020a17090a858d00b00263496294c6mr7460855pjn.20.1690742911648;
        Sun, 30 Jul 2023 11:48:31 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:6031:b260:43bc:b5ef])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a68c900b00268385b0501sm4908619pjj.27.2023.07.30.11.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:48:31 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-certifi: upgrade 2023.5.7 -> 2023.7.22
Date: Sun, 30 Jul 2023 11:48:27 -0700
Message-Id: <20230730184827.2268059-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185110

No changelog provided. Commits:

8fb96ed (tag: 2023.07.22) 2023.07.22
afe7722 Bump actions/setup-python from 4.6.1 to 4.7.0 (#230)
2038739 Bump dessant/lock-threads from 3.0.0 to 4.0.1 (#229)
44df761 Hash pin Actions and enable dependabot (#228)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...python3-certifi_2023.5.7.bb => python3-certifi_2023.7.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2023.5.7.bb => python3-certifi_2023.7.22.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2023.5.7.bb b/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
rename to meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
index 924b05c12cb..c4e1e7b9174 100644
--- a/meta/recipes-devtools/python/python3-certifi_2023.5.7.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "0f0d56dc5a6ad56fd4ba36484d6cc34451e1c6548c61daad8c320169f91eddc7"
+SRC_URI[sha256sum] = "539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082"
 
 inherit pypi setuptools3
 
-- 
2.34.1


