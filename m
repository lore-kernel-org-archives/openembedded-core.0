Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.298.1626714857794560865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 10:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V14GIsYU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso13321302wmh.4
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=stGQMfIYRovIoVC0YVCmX84REYva+P1VjyYDa6Y6N8Q=;
        b=V14GIsYUmRlI7hFOrY+MdVTRXFhmFpuMggw4HUMmUgBNn/Z+4OO3/wMQrH8c3MQoPv
         jVCDK4FaFm4KssVpqmO8IIMTO6+h5DLks0ewO/C/qLbQS48TTa1yJ7mTHqo9YYtUfm67
         NCovnSXTULKkk6A2yqT4m9opMFACFioGyA4Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stGQMfIYRovIoVC0YVCmX84REYva+P1VjyYDa6Y6N8Q=;
        b=VTgpWs66dRgodZ0EX85hJ0a2JZAdlBB84n25yg4aOl4+aqvo8De1VZ2iQtvfV1ZHYK
         tl4bY77u3Ou/GY7+070w2sa6CD3bzF0KBkSE/1akaW8J8jRawyWO2UuFa6NaXmrFsFJO
         JC5WRT8WIFIC7Zh6RZ7KxBiyCrUxaYOsgMViYE350JDNWkpsiO7Okxq5O1iTn3W1y65V
         /iBKfDE6C9+NYuGOsk4Eh0X3wLHGN5S0plgKdtGOF2Df364aTTu4sNWJqgP/lh+FVnAK
         l8Wxo4eAgF5sogrUsY0UEfVsatGb7zSibCZrAQAX7EbCj4XU8KuNqNZYjLEQQmrli7vf
         UhSA==
X-Gm-Message-State: AOAM530YBznlhz7aXnhW87T/z5GdyzjRmY+QyBhH7wWhF3iMez3wfdKj
	M/yzC+Dp+FLZvCkG21qEwmuWSByTi4Z7/Q==
X-Google-Smtp-Source: ABdhPJx9YIB+KefjcpstH/FwUrwFTOoTR6mKXmYPYFN2MEaZVJimfgQ6rCwVv1rTJ4daAWumL6eMlA==
X-Received: by 2002:a1c:9807:: with SMTP id a7mr26875164wme.129.1626714856081;
        Mon, 19 Jul 2021 10:14:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7b26:3bea:6cc:da6])
        by smtp.gmail.com with ESMTPSA id 129sm17704161wmz.26.2021.07.19.10.14.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:14:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] README: Point at README.OE-Core
Date: Mon, 19 Jul 2021 18:14:14 +0100
Message-Id: <20210719171414.3009854-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210719171414.3009854-1-richard.purdie@linuxfoundation.org>
References: <20210719171414.3009854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 README.md

diff --git a/README.md b/README.md
new file mode 120000
index 00000000000..4d7e9e8b429
--- /dev/null
+++ b/README.md
@@ -0,0 +1 @@
+README.OE-Core.md
\ No newline at end of file
-- 
2.30.2

