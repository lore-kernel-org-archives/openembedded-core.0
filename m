Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.13089.1622640444175765724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KCjQ3KAP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso3771499wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1VqcxLulgXckm7OLxGoX3c6IF7WfvTzvgOzz3F30bsc=;
        b=KCjQ3KAPbSwNVXL/SbKCR2kqRg7CZbfT9KqPHMHxeJxkBZvwz/2grwm6/s43l1O2hl
         PNDz7LZSSz/lJPd93YomtV1vkeKN0E5s4ML0YMXBKUaDt42BV8TPJsd9ltlw2xQmchMD
         3pD9n8/qpVvlLnlezIYPjxNke52NxarmERU1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1VqcxLulgXckm7OLxGoX3c6IF7WfvTzvgOzz3F30bsc=;
        b=Lghbz91buA/q7VWBfOvPs8ZPc8dzH+mD2KLmNUnd2ZIfH+Io+k/llmMyroeZAo9ADN
         /2dGYkLIHPjdiVNg1mknUgZMNX/m4OO35fw3+hLASbUtZCDnlmP0Dj9gR6C5tgoRffIb
         hzP3M+BeX5ZdOdvBpJM8QDhbae5A3kgle4WEh7Jc3V35ahR3fDl9uK59ghrxbwvnOvMz
         uLg4Mu+sb7zC5s5cn6q5uTY5ElNGcQ0rbeq5icvl/6xyo893L3MbcF/TEBV81z2ErC+B
         g1CaifJ9DzjLXUKjU/ZI8di0wFJy/T1sYWITxudGFv1shjM/4DtX0rcmfYfmvU/Njxb/
         y7QA==
X-Gm-Message-State: AOAM531EAzlxkukkKctxLuiWU1u0+DNLBjyHbKvYBhNjkVQyYwo8zvRG
	M7CHbnIPJ2I6tOK9qfhTVlO5mriTOX/RLg==
X-Google-Smtp-Source: ABdhPJxbYbZl/rfGlrgnWqgXT4F2yd/mrfNTIaKKUVpzk2gNXOMUsw7Q7aqJ39dHwrLX6GJHK/qUbg==
X-Received: by 2002:a1c:a484:: with SMTP id n126mr5284296wme.34.1622640442429;
        Wed, 02 Jun 2021 06:27:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id i16sm2799498wmm.9.2021.06.02.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 06:27:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>
Subject: [hardknott] [PATCH 3/5] pkgconfig: update SRC_URI
Date: Wed,  2 Jun 2021 14:27:18 +0100
Message-Id: <20210602132720.2921099-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

The git repo for pkg-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 52ef2a97793..7bf68082b26 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
 PV = "0.29.2+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/pkg-config \
+SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;protocol=https \
            file://pkg-config-esdk.in \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
-- 
2.30.2

