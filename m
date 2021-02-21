Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.26681.1613945841552989502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G1akJ06D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id m25so3196093wmi.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8wn27TzACfqXDHs0Pufqvw4nqZS8ytYIBOiWIcvOv2I=;
        b=G1akJ06DCCuYS6IVslqPXZh0YZh95U/eB97bVL0Wu9H9MR/o5eo281m0Nh0MVuou+9
         7CzSV/4u/CGi0y80UF65AVs9I7I0qnaUyg5sCGRc6FbvdAP/1QOXVbC8wguLVsq+aZAO
         mwn17yX1Uzj/G7tB4LRMLuzy/6NlPQx8p0/Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8wn27TzACfqXDHs0Pufqvw4nqZS8ytYIBOiWIcvOv2I=;
        b=pX0MGtNwyhItSNs+CrzQgW9+tz25Dy2AgqFR3QsBXvKuQgrWlKcpRYgJhNudlf3KaE
         wTIC7jSGH28GJU6f4ZPHaoZShIyHHn4KxD3+PEEWFvNEQHEkuziQpzx85W4u/zNPLKxw
         xlG/Yh0jKZvU/KDhNdUjb2vZfOdJar+tnRphEN7l+VjBsIkQGCSIvPxsjm9+/+RSHpDJ
         VY7mhNdKUp4OHTeU+q7YjzA7YqqPLCcmUb8pbz9cOZwEWaVgaD9NCE8CpBkaZeHzETBB
         1EL+TqEEDdl1YHt8nRXc9XylzvHtjadq85uVS0V8ju7pFExIQdu9VUOaprC/mVGRtqLw
         hs1Q==
X-Gm-Message-State: AOAM532N3zCWf1ZUu4CNGBGDgYf8mrz/olEwsdLaG6Z97BxTKOIgHexh
	56k58iulqcT5IOd5huBqwCHObNI9rp8KtQ==
X-Google-Smtp-Source: ABdhPJw7l7kusjl9A2Ybk9CkW0rbjVn1RrZIAuLIWo5jt4lTHRfHZmqGcBffk3gsw59wwTYe/qzjnA==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr17877926wmq.159.1613945840028;
        Sun, 21 Feb 2021 14:17:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id m4sm10196612wrb.87.2021.02.21.14.17.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:17:19 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] libevdev: Update patch status to backport
Date: Sun, 21 Feb 2021 22:17:15 +0000
Message-Id: <20210221221717.3714714-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch was submitted and merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libevdev/libevdev/determinism.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevdev/libevdev/determinism.patch b/meta/recipes-support/libevdev/libevdev/determinism.patch
index f6b7fc82d3d..71cbd876eb6 100644
--- a/meta/recipes-support/libevdev/libevdev/determinism.patch
+++ b/meta/recipes-support/libevdev/libevdev/determinism.patch
@@ -9,7 +9,8 @@ Sort to remove this inconsistency.
 RP 2020/2/7
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
+Submitted: https://lists.freedesktop.org/archives/input-tools/2021-February/001560.html
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/8d70f449892c6f7659e07bb0f06b8347677bb7d8]
 
 ---
  libevdev/make-event-names.py | 6 +++---
-- 
2.27.0

