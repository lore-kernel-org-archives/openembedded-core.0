Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.1254.1604335820740843650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMna4oiB;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id s25so5883576ejy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N4OHyu13jlNFnH8WbjqSDzHkFzzX9l6melTvWfACNkY=;
        b=MMna4oiBRXiCvEfKjo9CG1tIQyxxRJhB8XgZXaRhdrGOCpQ5JIK191P0nK7GzW7c0t
         DkqqqKJtdx60npUECpLCMjyb512VRXtWuyqQHpCh/mBFuATZGE1y8Omg9tqD2uJFA+6l
         bqocz0jPUZ6vFx/xkgoymS250t78D4k7YVF5sNYHzJN8n9LOcP3JKlhrsZMa9oDHyh7G
         mF0mlWSt7YTsJJfUOJVkSq8foXoOYc7VCAcmLG9lJis5Aa5ZFIqWvs3S40Y2UXsNdtN2
         x5bodyKLy/3/BZdDcwmaXjj1lTZ3z5F1IR9EFoMzDdyggAMz02G3O8IF5OixbvzByIbl
         1BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N4OHyu13jlNFnH8WbjqSDzHkFzzX9l6melTvWfACNkY=;
        b=qFoYIdeY+WfQ+Uo89M/xFOi+ZcxOvTemoDc2Zwwx2vWNo2m5IA/sJqun+gh1Wv0shZ
         hFivhjftJ2RUVrmBCrPBFPLHFAB5EhahR5nVtAEMye6k27nTCBW/BjT/iIIM8L9eAqvU
         jCToJDW0phnb4JFg8dCFCnuRLd2rdJSGEd4F48FBZnGDE663zRtK/kDlGy8aTKgMOwkR
         cgQGAGbBRLZ1rIc3zSWGzfGWKDIzWsPHc5lkkXG8TQ+c57cRl1e6ZE4ODngG12+LJbiq
         ifTuBwWG3MI76mUW3ZY4Sx+1NafYQ4LwoxIQX89UXJvLnUOdenlOUrzErt/G5Hzf1BEe
         /cow==
X-Gm-Message-State: AOAM531vL4gDsznEkqR0Qw7xlO5RJhR2z1/OtoJzUWJXSgyxvHsMhG/q
	Y/8ferSvUBoKHx0VnBBrT3uOQonQuUXaVA==
X-Google-Smtp-Source: ABdhPJyxQS0HRFFgN9IskEhx8KBuxWNKzdSrUsnp9rTt1vycHIgfCaHtMTvp4nTz2wFQrtjXFOf2Cg==
X-Received: by 2002:a17:906:ec9:: with SMTP id u9mr16173892eji.400.1604335819145;
        Mon, 02 Nov 2020 08:50:19 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:18 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 69/80] x264: upgrade to latest revision
Date: Mon,  2 Nov 2020 17:48:56 +0100
Message-Id: <20201102164907.27572-69-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index f226fec3c4..25ab72c66d 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "cde9a93319bea766a92e306d69059c76de970190"
+SRCREV = "d198931a63049db1f2c92d96c34904c69fde8117"
 
 PV = "r3011+git${SRCPV}"
 
-- 
2.29.0

