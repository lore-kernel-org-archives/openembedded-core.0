Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.6077.1592864167221310613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q7RC7iYE;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p20so19528730ejd.13
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 15:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=q7BS4W3m3Qvqjh4WbCNnx9QQP9IfzbHn9XuoZ3oiosY=;
        b=q7RC7iYEz9K3NDGPYmWPUeQ71KEAKyViNbd9cw76+gnDrI8nxEv9RIvMQWfWSwocr5
         FKi/wO6I1ceMBx3QN75sHFoxn40ZDmFmMy0I1zSdQMYcL0C3AxblhRwGcHkLShBk6Hi1
         25+h/KhcSJD6ioiT9pqB5l8xCEte9fAIemy8/Zv0j9KpuTHc62zzqJkwPztbhGYINTsg
         7BYwtzVc/V3D7Txj0SPCQlYoTg6VD3oTtVT78qKvascazHr1f/J8aWgF9z+qaHcTqsnv
         NkRjsscDgLq5yEvynfMN7w3RqXu7Ra+K4YO8PjGMVbiPf1CLqGl9HOPY91hPHvzo2yfX
         2/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q7BS4W3m3Qvqjh4WbCNnx9QQP9IfzbHn9XuoZ3oiosY=;
        b=jBCvdJ1HabOxWOY/7apU2XzjfdaszWaBUnrSpAPYh619ufoDYU02mZFpWpUa9L7fSm
         TKNPb8ZGP3ZrFFVJNmxL3jmpp7rAq7EesPoAJYYb+G5sixonw9XBQW0DS50NhHwc7P67
         53gPmtZOGEb7pbDyAzLDtQi1I4l4LS6jUEo207UrvvmRitV2vjjUskYzkdAA03phJox1
         QvZMBS/Qq5HApeBW4X5h83CXHyW9hUQVKhT6k72elC86COq0LZfo2/F6vaB1SUZ6PBUb
         eWQc1YsDQNeEyT3cjCvzqtXZAV/COrNt3D0IJX+K94euej0jT6dEWOWZvJmdf2vtUzbU
         z3rA==
X-Gm-Message-State: AOAM530rx/tNaXBOHYhWTY8XtzurvuGQ2xjmvmPm/mNUd/Uy9+naO4A9
	yj7IR4P0Lc9CbPSvy8MTIRz0mou9
X-Google-Smtp-Source: ABdhPJwj+SuwFVQATnQvP/ouxX23xnHEolDHTytlLnauL0dva3LEGTE4w/C6L1XyrRGOfOgBmTUgHA==
X-Received: by 2002:a17:906:fa92:: with SMTP id lt18mr18678455ejb.423.1592864165549;
        Mon, 22 Jun 2020 15:16:05 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f481d60137a2e45bfed0e33.dip0.t-ipconnect.de. [2003:f0:7f48:1d60:137a:2e45:bfed:e33])
        by smtp.gmail.com with ESMTPSA id n16sm3703803ejo.54.2020.06.22.15.16.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:16:04 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] file: upgrade 5.38 -> 5.39
Date: Tue, 23 Jun 2020 00:15:50 +0200
Message-Id: <20200622221551.1530869-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622221551.1530869-1-schnitzeltony@gmail.com>
References: <20200622221551.1530869-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-devtools/file/{file_5.38.bb => file_5.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.38.bb => file_5.39.bb} (96%)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.39.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.38.bb
rename to meta/recipes-devtools/file/file_5.39.bb
index 48cf8ab549..0dcc90548a 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.39.bb
@@ -13,7 +13,7 @@ DEPENDS_class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git"
 
-SRCREV = "ec41083645689a787cdd00cb3b5bf578aa79e46c"
+SRCREV = "87731415de945660b00f02207d8e9d986ef9b82e"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.26.2

