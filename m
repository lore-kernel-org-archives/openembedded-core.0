Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9661.1603981697178357187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XYubpK/A;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id e2so63537wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xMrnqNgt/9cDu3RJNJEcbrANA2jfhcO5KnMQLE7R9co=;
        b=XYubpK/A1ZdvbhgAORd76AqKDjMM3A+3QDxyyOZ4mTOw4dUyhOwyFDQDaXQXXozWhN
         fCd6sF16PDM0k415A/DqypQ6NOB41DkHRi5Ls8ryLX+dibDMIqQEH5K4CqJCPJELcP5A
         /fIJHY/w2k/cOX1PHOfEsVB2Dl/y+0a/5biCeXad3HA/whzvxnUf/pDv/1I+SYcY3gPg
         QvbZQyutlPgp9Njl6zXI0WXdMj3xUjHHLLscU5YJD5W8v8jJwKKpPlU99LyiHPDhmFFf
         VOJN1r8fEcucIr644EOes5WdemjSVsW45VrMSK4etgyhuYNM+YDnfe28lOpmIUakAKMZ
         ZXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xMrnqNgt/9cDu3RJNJEcbrANA2jfhcO5KnMQLE7R9co=;
        b=uZ5hTVXi1UTHGzly4EurCXdG1tdcPzPn1TWa6KbK0ob24DeD8hfL1Jb3CWnDqt9CM5
         HULR5aWU37V18dN8Ofngh3pJ86hY8BG4NEh+l6cKEIZFYs21AsaMQrT6b6O6lCwl3VXs
         Hk+UIvdDmnZyo3K4TDwtfG6y6ydTs7Mq5fX/ozMmYBAQeBeUaKJigru8bRL3dctS+GB+
         NW0+xhIPROvGH5RnUcyHBL/cGAP7u8vAiQUsaePcPpNHfKu9e2HRqRFszPK60YZUXYDs
         +62GCbOv8R+u4MMYehJ32te4rokxxU2J8QzIQWhdzLe+DZwWiKiu7FxYGn9zOhZ6kwgU
         xosA==
X-Gm-Message-State: AOAM533iAwEkgMdINc7Uv078Pyf+7hQ/5s04Q7lmxFvOu6sL/J98k/Ic
	60FpIoVJEW/4zkggVJoIuZMfdmUAzKXk8Q==
X-Google-Smtp-Source: ABdhPJyCJl2UX4MWNyhysFU4EqYEWbkcDnru2reysfer56KbjgnAQO1Xd7iRJnrZu+xV0QZxK55SZA==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr126239wmk.44.1603981695552;
        Thu, 29 Oct 2020 07:28:15 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:14 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 06/22] gstreamer1.0-plugins-good: disable new meson options
Date: Thu, 29 Oct 2020 14:27:50 +0000
Message-Id: <20201029142806.1830504-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.18.0.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index c112f336b2..ad3eabd0be 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
@@ -60,6 +60,7 @@ EXTRA_OEMESON += " \
     -Doss4=disabled \
     -Dosxaudio=disabled \
     -Dosxvideo=disabled \
+    -Drpicamsrc=disabled \
     -Dshout2=disabled \
     -Dtwolame=disabled \
     -Dwaveform=disabled \
-- 
2.29.1

