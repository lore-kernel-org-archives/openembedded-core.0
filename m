Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.5025.1631832012287347312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 15:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=LWGANv50;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id p4so11455549qki.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SHTbfuUwM5QMMsh05mNYdN8rdNqoR5KQrdU7qKm094o=;
        b=LWGANv50cQJXwZIlAUae7Ra6lBhoN6cLm8tFxu2imItLOMv7du5b1HlOnH/V54MDNt
         qQWN+cFS1NlWRZxJQTNoe6GY7Puh8m8j1JXY2iGUaehyHjApmmrnoVnrRP6UoxR6NYX3
         pWblZizDH3a+R2oBQRkWm67Uy7+bLkz/pgBXDkfreQVyDj+EeA2TTF6Q0RyjHrsUiM/N
         niVKyHdbW9SCvqhT3wbJmdo46S9uXupGyQOscYOhY1yNeZHdexZ7Ff22qcdZfT8HKSXa
         oMJRdhX49PtzBN9OsQ1jQ5tT+wlkRQY1TVVyxbSZdyvChcVJTurkAZf8ukM+94eIaiFA
         GbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SHTbfuUwM5QMMsh05mNYdN8rdNqoR5KQrdU7qKm094o=;
        b=IQvFQIyepGbq9Az9rlrzZeIs+9Xm9sqz/Uk4LAA0UPdbD6o/Q7pG9OKzQsXuMywtgZ
         HEtEGd229TT7OAbv95WJrQF7gzjtfRTwGUEATVgVT8JdylGyrkJ3RLmy91sMrfLQDdyo
         djKxCLNw3+1je4NBqFWTVRoTUrQ5Z1pG8tINClb+DBAyKooIGSKbLpERYPdHBPLITr1T
         qwmQL7ZWi8ETb+Dol5/K6usM+C//1bx4TMT9gx2s5tEwZh8TqoTjo8MZUI1/cgNRF1s1
         KorGzAiL3CDtGt0eVcbXNFp3Ztw7g8QwIWvJccV+MyfjFe5GUahW3UfC7hLw5mBmDeZb
         LgRA==
X-Gm-Message-State: AOAM531R3NGuEyz9Zh80goqOCIiZ+l7gMLrhlY/HuYs57GBUIo+SD+gg
	oCUaZOeZr6Qdz1FwhHPt/wbS7Todapdwuw==
X-Google-Smtp-Source: ABdhPJx4HziIb6mIqtRWnw89NKM0i/Jvj7vYA4r7SvyIfad7GlVA+AzIrJN/HCAuecWzzrvXYV97Qg==
X-Received: by 2002:a05:620a:199d:: with SMTP id bm29mr7360736qkb.14.1631832011304;
        Thu, 16 Sep 2021 15:40:11 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a650:b700:b85d:4277:577e:3e0a])
        by smtp.gmail.com with ESMTPSA id v24sm2205669qtc.96.2021.09.16.15.40.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:40:11 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] dev-manual: update mailing list address
Date: Thu, 16 Sep 2021 18:40:08 -0400
Message-Id: <20210916224010.21213-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 7c13eb96004f..96b9fcc40234 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10480,7 +10480,7 @@ been followed:
    and email address. In this example, the email address is a mailing
    list::
 
-      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@yoctoproject.org
+      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
 
    You need to follow the prompts as the script is interactive.
 
-- 
2.20.1

