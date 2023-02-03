Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2E7C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.17949.1675446656594965714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IB7xNsst;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id g13so1200486ple.10
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfzxpssNl15bN/Htd2h7K/Su181sATbRuvOLyjhGDxU=;
        b=IB7xNsstbsOCgKeX31ZCkh3AgT7dDNsXimmBH5GYLFRAcQ+zD0e5Z65HNW6/5UxOtv
         TAzDsETzZclVZxp0PslSomwOWOH0nO3QuogI879eLSb0aScM6V6/VM8wSBgGG16Ym2ss
         5LuxnX6aSIDKKSVtcbR45hyP1BjK1GK5prOicLpHK3+E5svItRADdNDTydYTXo8fKL6N
         /I51xIzGuX50e4RKT6+PqaoReWZTLc9bvrXUbMv8fSvDAAgBLbnylW26xUgmGfrOq0pR
         DkMIRld6tIkZUdiZCMzqbsPQGA7AJEqVsUpvUf3wrPAXsDHO/EZ1fwC3CiN8BBY0qbDa
         OwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfzxpssNl15bN/Htd2h7K/Su181sATbRuvOLyjhGDxU=;
        b=Su4x3x6wQXB+tt6yH2Noga5azH3j4aJ8KHceJEQ/DiKpgwYSPTQ6VF5z3BUH8QjuzH
         pXGH83+nnPEHEzLQW1pWFqHSv7tv4fRIAivBMgyKb+GIzx/r5mKi8IgKkrjoHNrx5UKL
         Bx5hSBVLKpa79IQbPrzkl2WoM7jpd6nFCm+7GmfTRtbzm40M54XS5DTapZjBOlUGbK5p
         +SDoPVqFF+uf/BojhQ7eFdBzyET9p3X6cv7GcqgpS+P9San6zmMYsR1TxOZm93fCnU0b
         JNX6/uPD77Az1T7GowlB9UeD+nKBOOIaXdINuc5qtwPl2by/BMs1nVTuGivGCgF+SHy/
         cWuQ==
X-Gm-Message-State: AO0yUKVQ981D+6kS+DpOHzTzXAWRKLG0s91r3lbQ8neA8viD0BCfX0Qq
	mnl0/a3+coyErNHl4Dsd6Qhthj+ydzA=
X-Google-Smtp-Source: AK7set/4eYQGLRJFba/F22wlp3ql8HeVBFKp8kDZjdHY9Q2sI+fMwQxS+EvmOJlu+OBXXhDDHcWkUA==
X-Received: by 2002:a17:90b:3b8e:b0:22c:4f5e:de4d with SMTP id pc14-20020a17090b3b8e00b0022c4f5ede4dmr11526507pjb.20.1675446655577;
        Fri, 03 Feb 2023 09:50:55 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:50:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/14] python3-hypothesis: upgrade 6.62.0 -> 6.66.0
Date: Fri,  3 Feb 2023 09:50:24 -0800
Message-Id: <598c17bc287c78c23352573a4e0b5b51839f9fcf.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176737

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-66-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-65-2
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-65-1
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-65-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-64-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-63-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-62-1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-hypothesis_6.62.0.bb => python3-hypothesis_6.66.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.62.0.bb => python3-hypothesis_6.66.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb
index 4369a697bd9..3101845e48c 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "76f1141e8237f6dd0780a171bec5d6aec873208ccc27b5f9753d4cccd8904272"
+SRC_URI[sha256sum] = "2fb334ab068dc6e7c02d49a1c694f66bd1f681197eeed94406650a59eebef870"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


