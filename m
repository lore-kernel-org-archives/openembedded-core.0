Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.330.1611586303030167808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hemP6F/D;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id q7so9046603pgm.5
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iGiNLx7spXOifSl+EEnDRzVqqy8pschvw8i+9LnSAOU=;
        b=hemP6F/D6XZk6LWKcHJ+oxIIElFW+WDXby81kr/ixToplH5E4YOWqlWia1+WU42+mc
         F5ldJN+DvArakkx2Zh6N0POvLG7sxnypmN4YscScjHbD+ImuwLVhtPugtzWhMpma3Sal
         EPTlRmPMiLmFlbVdVj/VWOC8Y1D03QYXLSG7OBxvz0xjS9wWW+Le/70A+m8bor05gUMz
         rzd/1iiGcyvDhA4ppRY2GPilWylpIYB4pMOz7PVfVOD6gzD8xuGEg4KNXStS0sNHGrDa
         gBk1nRUqEifPK3ZrcxD+O8BSaiZueRWBP6GVvljaCMwHAVXiNx8vuNe6VucU1HPZQwnt
         /uEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iGiNLx7spXOifSl+EEnDRzVqqy8pschvw8i+9LnSAOU=;
        b=b7AhK20BYkQudV5H0usQklQCs2BE6W0NJCkANRSBWNpytEbkml0++oldvB3jPwTmeV
         hm3XVdrzqCkrHeJ19vU51PhYjDL/jwaG/nMIBMMdfCn+xzyT0KL5mo2VqZu4FfTs7n5l
         B3Mb6Ov4ctY1awYdsDWgSq8P66zB4ZuhbwKhbDR9gYF1sTAOyxbvH9KR2WaozVq8NLD+
         ycnAI3qsTqsJfhqecoKOy7/qkvZLvp+V5DcfV7ePloy+wjAzvG0AZABzb4V2DOxz00zX
         GnkbbyPsVHIOi/M2GQ1dkCc01eGIk4+h3u4vhXWN0sOxeDSZxXMyC9jmM4AvYFXQrsHD
         RsdQ==
X-Gm-Message-State: AOAM5334JoqYCSS6RhkL2E0ceABQxrD/wlKsUO9Csd6IEBYs9DyWdqYF
	FNwEk4BZWWcJnEQHrJan3nrlxI7r5mZloFUamx0=
X-Google-Smtp-Source: ABdhPJwO82kQbKgVCk45ZTWoKJFS9LA9oAGY7Ytn5Pc5EmKzjneOvrOWAiSzKhsX18QIX6agR6qsiA==
X-Received: by 2002:a63:5f93:: with SMTP id t141mr932216pgb.299.1611586302152;
        Mon, 25 Jan 2021 06:51:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/47] pseudo: Update to add OFC fcntl lock updates
Date: Mon, 25 Jan 2021 04:50:35 -1000
Message-Id: <ef59a988f9c742e92fc2cf1cf75f1695f9490c89.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This adds in support for the OFC fcntl ioctl lock flags, removing
warnings on some more recent linux kernels.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 234168f803bee2e5b0955aabaddb1d967349fb82)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index fcadfd96ac..9a22304bba 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "067950bd9415fafcafb2bf32c0e10df4f2ac936c"
+SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

