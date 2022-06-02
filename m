Return-Path: <anolgajbhiye99@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A82C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 12:21:00 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.5726.1654172454033890413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 05:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cr2g5Mu6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: anolgajbhiye99@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id 187so4614395pfu.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=VBoCx5dQZP5+hh/3rm/dDjYjblqsNwiJXnudEnK4j1c=;
        b=Cr2g5Mu6D37O18Yfrvb3wOnx9SXLgww0/JVSSUW8GJTbE93/Uld/KOSxPjl+rYVP9a
         oIq8+PghvO24CYhKe1sYNv+Q5C8XW7Ga/2wwN7jFFKes9CflkQJOyk8Rs0nPrf63eNjo
         SeRWgM1rOOt9sC21RlCX89bpCymvOLsHtsPYUYhn58jkR8lFURhAkbXf//W4S4Vci7lg
         Q2jRCmb5uCrk0uHjgKWDdVq1rPmXSINLk4wkGSzEQxTc5oMHrykU15gNexO+58fFdjSo
         Je4vrztEFVx3tvAdSdTnwcy2m9XFf/nlQdpWy77b0QMe259XX/OSZBuIimzulsg4RYSP
         NHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VBoCx5dQZP5+hh/3rm/dDjYjblqsNwiJXnudEnK4j1c=;
        b=ceu2yGVWmHtnXLh3d9jZwuT6DO2eA6gw5SoptCEJiNLdZIhv2lgZZAm/tCGwAqG42Q
         FbDs5DD9dEV/bOCJq1sum5eVdBDs51AA7SHBRb1t/78wA6TVYBdlRJIt3BivGUwaTYWX
         n40S47vxYSbFUa7BUvJvl/VoV8dms6OTw5nKRseHQsp/6PFCSB4Zk4/P1sq4rxtAX9eb
         fgOjA+WD3BHbDJa8gi/HYeobBqhPOUWl90RSkJRr8/KOPGQHRdj5gbWWXRULbD+rHsz+
         0p/PFqL37qGpldU6sIed8gtZD3WstLDB42IoAZ4CBrZgPFKLfI7hmRqLWFa2lHQX52Ta
         WrRA==
X-Gm-Message-State: AOAM531Lvgo+EmEzt5WPWj2NqJ6EDLMvRXA2vTBxK2Uf/klzo2rZjjhI
	Tzb2WQchFwb4el/JhTGNVQmy1QLXZIxf+IR9
X-Google-Smtp-Source: 
 ABdhPJz6YvMw+POvs8322btks2mLczPNP5NJOhkA8y7Uhvrh31NTUYJaP1YcUOJqQ0Ivx/6EBdemTw==
X-Received: by 2002:a65:6e9b:0:b0:3fc:587a:6dcd with SMTP id
 bm27-20020a656e9b000000b003fc587a6dcdmr3990709pgb.200.1654172453269;
        Thu, 02 Jun 2022 05:20:53 -0700 (PDT)
Received: from localhost.localdomain ([160.238.79.63])
        by smtp.gmail.com with ESMTPSA id
 ij4-20020a170902ab4400b0016632179ec8sm2561324plb.219.2022.06.02.05.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 05:20:52 -0700 (PDT)
From: Amol Gajbhiye <anolgajbhiye99@gmail.com>
To: openembedded-core@lists.openembedded.org,
	amol.gajbhiye@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [OE-core][dunfell][PATCH] systemd: Whitelist CVE-2018-21029
Date: Thu,  2 Jun 2022 17:50:05 +0530
Message-Id: <20220602122005.17173-1-anolgajbhiye99@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 12:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166470

From: Virendra Thakur <virendra.thakur@kpit.com>

The fix for this CVE-2018-21029 is already available in our code base.

Reference:
https://github.com/systemd/systemd-stable/commit/38e053c58fa139e0f546f327b5d8ce3db7cf1647

https://github.com/systemd/systemd-stable/commit/7f2f4faced3fda47e6b76ab73cde747cc20cf8b8

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index a648272bc0..711d23a26e 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -65,6 +65,9 @@ SRC_URI_MUSL = "\
 # already applied in 244.5
 CVE_CHECK_WHITELIST += "CVE-2020-13776"
 
+# Whitelist the CVE because cve patch is already present
+CVE_CHECK_WHITELIST += "CVE-2018-21029"
+
 PAM_PLUGINS = " \
     pam-plugin-unix \
     pam-plugin-loginuid \
-- 
2.17.1


