Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF77C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 07:46:18 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.25791.1685605576676876015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 00:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iX4FYYqP;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso859888a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685605575; x=1688197575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SCrP7NfHNjZ0wxgBs6xfTItz2eYH1jUqHfRYk9afII=;
        b=iX4FYYqPujCCIOi3sZFLKPmX05fbqj5fb97Zkvb+jvOCXAsD+Ul8uq4K603+Dk05+b
         sg7hgkpTkOScLWAgrhduZt0iRv5w75YXMnHmw994ImYZqkPD1q+ssr3xwthKUf197uje
         JG8oC068QOjWDj0cIYFTYls+M42FezukLi34GF/QREU+CEQgkXEKMzCxXRKcho7c8ATv
         p/GGscS1d91xDGM5grBU/0hvafYx2vRtp9OEea4/nyIkWkjpjizuOaojMncrmPAOqEbA
         igwwOwxq+pX+lt7ocddRZ1+tnNvX+wdhDjJ1/U77xUjhD5vngzmIX++NVZb5jPEVHVF9
         dPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605575; x=1688197575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SCrP7NfHNjZ0wxgBs6xfTItz2eYH1jUqHfRYk9afII=;
        b=ZKd1DOZyT55noIYWAW6iFa1kwUU2NpipEX+deQJrKPlFYqXrTOe9L96YGa5yTqth5K
         ghGrxgRNSoLJx4OZm311JQwo3QKydf4iZY6T0LUYnWBjJcREwn8QOixepByIkUXvN3NP
         CA0YyALvY5AQOUvL2Y6yXD0vPhkHzZJyC0HFUYuShLUAFFu8zCq5z7pDHzAoT1R08j96
         iEn75HN4zSpQeHbyTihBWEUy3fHHeSYc9wd11tzphC7tVmQRn/VPgRpYPN0QZ0C3R3Zx
         vQc6xqvXT5ivoohB0DFmpyu12tU9BB2mRFNKqdJJQ6usT4vry3JIfaPQygghImhz/Sc6
         qMTQ==
X-Gm-Message-State: AC+VfDyY+o4pA/YaQADa9h+eNGt2fKBWphjEoEMLxP17yFdTdVEG1K2N
	Lw9kdknszXpeFmT7Km2tEAvHVVbbwZfFXA==
X-Google-Smtp-Source: ACHHUZ4RVqXNsTYfR2JPqfK0zc2q1I67iWPNaQ+PMShi9jKheFLCpE7UyUlTMNl41Eu+WOv+dOL0Qw==
X-Received: by 2002:a17:907:5c2:b0:960:c5fe:a36a with SMTP id wg2-20020a17090705c200b00960c5fea36amr7357356ejb.61.1685605574626;
        Thu, 01 Jun 2023 00:46:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709060a8b00b00965bf86c00asm10291546ejf.143.2023.06.01.00.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:46:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] maintainers.inc: correct Carlos Rafael Giani's email address
Date: Thu,  1 Jun 2023 09:46:00 +0200
Message-Id: <20230601074600.307696-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182049

As confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 80109c6ff76..669a02587dd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -299,7 +299,7 @@ RECIPE_MAINTAINER:pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-kexec-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-keymaps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <dv@pseudoterminal.org>"
+RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <crg7475@mailbox.org>"
 RECIPE_MAINTAINER:pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
-- 
2.30.2


