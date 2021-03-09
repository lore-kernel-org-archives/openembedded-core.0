Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.14619.1615317830404068827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RtjcUiFF;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id t4so14310487qkp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eWNJpgH9JE20ujZB+3X9NKbTnC/w0RK/PELEZYF97sk=;
        b=RtjcUiFF0FcJWbEnAwB2gLKnhmd6MY2AMxDG/gYjiiVNjjVOGBO+HwrBaOXCfhIp/M
         doCKfKnoFC4qnTIHnkbYQQEpnn1P0TnW/Uu6mj+cG7GCUZwzzpQsxh9ZJKFky4CD5Kbi
         qwlSUd/FOZfDyPeP6FiBCxTKqQhVkXZSJcHEjpNcM2jGPuqLlTihu+3Wqg6+P5aiMQA7
         f56Gjc7hypVAJYkfJulMXVn76OAr9bkHCWMpE/Glxc4ElpOfFO7+R4BvUvTt9Qvi2G+W
         V6pUoU0NmvFm/9fmnfmAhGanSh4UOrn0P1Kmu+uxx4CfHLH/FU3XiMe56LcXqZnUYDcm
         Ienw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eWNJpgH9JE20ujZB+3X9NKbTnC/w0RK/PELEZYF97sk=;
        b=pPZIFnDc7qByNPEk7MLHgK0He6OjeIvnmc4koOHMVar/2tY0Ct7a1giuv9VVMI+fr8
         9jDbU/eKmX10GtcH2hN5RQQNfDWNAnbAWc9KnBYzrI74wFjFwtLtKA3SHBhHpIkKxWGI
         9UQciAbcJVlTBDEd491G5uC2/IOBwdqCAraCxJqhhRlSXrJRLzPhdYBCwL2cWNXZ7Ti0
         wInaTNVkogNOqcZRTym0E/G4GfSKE3TDrHbU3qHKr1JO6YX5lYahU9k/jip/iH6jheQD
         lvTiSa60eq3drcevkMR/KCaPdNMGBF4l4yYmISlIhFjnb+WyJDu0EOUOJt6/ch/baE6H
         rdpQ==
X-Gm-Message-State: AOAM530Zr5R9GM8BsEokDSxuK4CxAuJ0xmqAiXYnD3d9VipuyqvV44Qr
	Mn6wd3/kmlKI6UjeMCbL0to=
X-Google-Smtp-Source: ABdhPJza40ceuK4jhHND95DrfvmdsZ2UMZQfivhsw5dKu1BuE4ZvxCvqDYT74RrF2AHPgEN4HoyzdQ==
X-Received: by 2002:a37:8544:: with SMTP id h65mr26820554qkd.200.1615317829374;
        Tue, 09 Mar 2021 11:23:49 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f13sm5713377qtf.57.2021.03.09.11.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 11:23:49 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] kern-tools: symbol-why fix and README update
Date: Tue,  9 Mar 2021 14:23:41 -0500
Message-Id: <dc0b4f5c195991bdbedd1ad1116cddb24ee63b79.1615317549.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1615317549.git.bruce.ashfield@gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

There was a bad indent in symbol_why, which we fix with a submitted
patch. As part of getting that patch, it was pointed out that there's
no README telling people where to send changes. So we add a basic
README to avoid that in the future:

   8f6aaab docs: add README for patch submission
   9f1a6cb symbol_why: fix incorrect indentation of sys.exit(1)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 70b2908fd4..1d900d85fa 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "73f813024d33432116a122524fd2ae48afc910c7"
+SRCREV = "8f6aaab7f64c6de30d267e31a73f7c3bb30125a9"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1

