Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08199C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 23:48:22 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.12189.1680047295324402512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 16:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aVUYGhW1;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id bt19so9161435pfb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 16:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680047294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGDnCTXg3WTroNpEsQFNzpH3HRmlB99YJwzDBxHV5AA=;
        b=aVUYGhW1D13i2yT0xFMiZYJEMNWx5TqmjUfidaXUHwY4QQ+fZx82w5Wbr8tGAIoQOG
         FPSZEUtoHHLi+vAZgXnmAVtuMoum3fV2fCY+BbJd5UGMj6/ezMIE7vsox2jhNT3s4Io2
         f4gK3jn01Xsiyq6llbTm1uounFjGfT5rPqSwhEyP6goUxUGycByk7jZUV0yHHhZEPZP3
         k8nTh1m8mmdKlLuonwBWSTKOwZCcP0XaaBi2ydVwXdmE7BZQ9mBVZ5670VYF+iLPIWA7
         fUnQ2rtsITG/U59UQwqynHPIOltFWFHhV14iPX5IkZP1MOEUvdg3z43QwAnfqVxP0xnc
         2cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGDnCTXg3WTroNpEsQFNzpH3HRmlB99YJwzDBxHV5AA=;
        b=6XwIOiyMdDHy7GxQMUeGMfSz/NqHo+sl2M2K3Q2X97eqy3lQ+/hof40LRUg+blaZFm
         1eWt16ngC7rZJAAT35gc6QQ0dJbT/aRAQqV4rdyY3Uo7NvcwFCn6iNKB4rQfhSPewPSp
         N1B1Bt22HVlH0TG3Xe+/iniKAGgZdTWEvRYVCld6Gh8NM9HATWic9xsDyMWamK201FVR
         jFw0L+8MH6XwDqxPlLic0rxTUIJxAYqWAZeSc+0RHOwDjw+ZvVWj7WWv954wzx0YT1QF
         2yVsDK2CBybnG23w3Yp8DuOAAGLa2EdDW2xphdeG9+cTp/DdLXuZeLIs/gG9+PSngrvo
         SMBw==
X-Gm-Message-State: AAQBX9eaNdOpQHKOn0cT1UjWR9/0ceewzd+fFHsCO7oxMVHOJTkZy0I+
	ifLDVUUOWqm5CIosYc6XKf1y6MJBcNNM3Q==
X-Google-Smtp-Source: AKy350aMg5NxHg54BWH0exPfjxhHBHj/JXM8L4hbNRsyX/KNzSQWadermSg1NR3ijwJL9giyT5Z90w==
X-Received: by 2002:a62:1a85:0:b0:623:7340:3741 with SMTP id a127-20020a621a85000000b0062373403741mr14338306pfa.23.1680047294447;
        Tue, 28 Mar 2023 16:48:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id m12-20020aa78a0c000000b0058bcb42dd1asm21668080pfa.111.2023.03.28.16.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 16:48:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] maintainers.inc: Add maintainer for libstemmer and appstream-glib
Date: Tue, 28 Mar 2023 16:48:10 -0700
Message-Id: <20230328234810.2103043-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230328234810.2103043-1-raj.khem@gmail.com>
References: <20230328234810.2103043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 23:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179252

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2d4aaf029e..47eba69a85 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -39,6 +39,7 @@ RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacke
 RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-appstream-glib = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
@@ -394,6 +395,7 @@ RECIPE_MAINTAINER:pn-libsoup = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-libstemmer = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libtest-fatal-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.40.0


