Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98004C636FA
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.9866.1649929317339686522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TIvSUU6J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id r64so2691280wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJJzL1YyqX74ExJxr+3YPahNAEqbWdZpEJ9k8+aCMHw=;
        b=TIvSUU6JpJFRmDT4RWRIso+BMVFiOeCOUfQf+FJHl2MfmFZihnjW++fJaDjkPZtirn
         bnNKTnWGyxUPSlYVHfy3jLtW+GoJKeLICwC65piSJ/JOkOFdniZvtCgtRC8GRKvAGToD
         EQQCZ9YwHsvwIgeXuiaic8pZT5GuntxmfWIEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJJzL1YyqX74ExJxr+3YPahNAEqbWdZpEJ9k8+aCMHw=;
        b=o2prZmlzD/lw7GSEOOoVQAkeqpcC5J+p4HlHVcpCY/d8Mu3mpF0550CBNqg8MVKrrp
         FuvMuNzHuBMomz2XSZw0MdVoH8ONViGC+KlCFz0GStxGfPM+bFPvb+69Mjjhf5elCP43
         Q6hMe5DeX4AWVN5cha0pKEoU/RySAulWSvvoGk8QnVSwHt2A5cPlCuCOEM4hVahn7SZn
         8Qwni1H28Y58Mcze9Vnl8+MjT0Y8IyFcCJ6ZIMnw0kAqLYTaiIo+FRDVPHPlpDYpfgXm
         Fsx5AplVphTEDCtvzwpATmrorE2fHkzCcca1DDjRvtTayW/OKNYFhptBqAiGsA3KIHAZ
         8DAw==
X-Gm-Message-State: AOAM530ItWbBbOMGt8IjzGHC3YgjAGONHMSN+uAKk4daV9zFCYSIj0Ub
	zkmvZNOylLBLuaBhi8qFovz9r1aDwipPTg==
X-Google-Smtp-Source: 
 ABdhPJxSJEcFfoqlZ5b3pEP384cvVhOxwhgM0GdDddn9IFae/r8jTO3NL/PL8pGj6DKTAO/6Oith8g==
X-Received: by 2002:a05:600c:4f08:b0:38c:93fd:570f with SMTP id
 l8-20020a05600c4f0800b0038c93fd570fmr2367477wmq.136.1649929315463;
        Thu, 14 Apr 2022 02:41:55 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 g11-20020adfd1eb000000b00207aba911aasm1698629wrd.3.2022.04.14.02.41.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 02:41:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rxvt-unicode: Fix icon name
Date: Thu, 14 Apr 2022 10:41:53 +0100
Message-Id: <20220414094154.2235950-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164404

There was no icon being displayed for this, fix the name so that
is corrected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
index 882ea411366..6b7978afc94 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
@@ -3,7 +3,7 @@ Version=1.0
 Name=Terminal
 Comment=A unicode capable rxvt clone
 Exec=rxvt
-Icon=terminal
+Icon=utilities-terminal
 Terminal=false
 Type=Application
 Categories=Utility;TerminalEmulator;
-- 
2.32.0


