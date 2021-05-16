Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.11628.1621204378876871373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TQb554G3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id d11so4447508wrw.8
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IjjHFptbVoL+BBeTjkCNCZACfe7xtJhLaJhjAAqjkaQ=;
        b=TQb554G3UIE7Zm4sNzwr/EMGI+pvX+wdc+ZThugb4KJopJM5ol1yXFf5YnnJP4pnNR
         ftCB4fOKoPefd1+GZATY46TuVtxh4QUJvy4j8rITAVV4Omu7WTFklGr/przh2wH/jWwP
         WOFw7Hz3ZrqnoemQj8SJXk9gL74NmXpzC73QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjjHFptbVoL+BBeTjkCNCZACfe7xtJhLaJhjAAqjkaQ=;
        b=FcCmq4CZ94nwva5dKDJXNzMAQKF9imvnZjAGoR4SBT4zaGmyzQGNXSUoZnvFMDWBDL
         DnDeiaIZFGiAHGK7/iYkJjcKvKX7+BM4w1+Lyp4Mr0Kl4PVuMxPIo5JT+H1DKiD4gpZJ
         L/143PBq7ttnBEOv8NHntKjEC56lxWalTcJV+0ZCuXm5iYjKd9GYn5bUQQl2dPwZRkVB
         E2JlaweES4gNW8MOvNfZnCjqdrIE9Ayyby1APsN9AmqJhNjwbB8tat5GyrPRo6NBdFGD
         WQ6HIUAlsOg25cWGx3iNQbvkiMnwfCxR1SA4ncDKvrZhDE2yNZANRIDBVUOMyI2uQycR
         tJUA==
X-Gm-Message-State: AOAM530CEsVOh9AzDGSjGnImHS4GEXV7enfQHlLdNwxfF+rIh5x1HRcX
	TOQ3NM7TbtS+G7OXbk4fWRi/nD9Fr5BvPw==
X-Google-Smtp-Source: ABdhPJwXmOveuQIUrQmLvqkUxtVLzq6fG8r3DCajRV7UP+432oa3phUaC0tHVMXsJ8ClGBEA+FX01A==
X-Received: by 2002:adf:f9ce:: with SMTP id w14mr12676256wrr.387.1621204377409;
        Sun, 16 May 2021 15:32:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/27] libinput: upgrade 1.17.1 -> 1.17.2
Date: Sun, 16 May 2021 23:32:37 +0100
Message-Id: <20210516223247.2401235-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/{libinput_1.17.1.bb => libinput_1.17.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.17.1.bb => libinput_1.17.2.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.17.1.bb b/meta/recipes-graphics/wayland/libinput_1.17.2.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.17.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.17.2.bb
index 9ffb22876be..e4a8e1a3d8f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.17.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.17.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "e51c50f3ce253961bed452d9f93102cc26128406975ab88ff9ec9e6c3b875137"
+SRC_URI[sha256sum] = "b822263086b6588b9a9a153be97dea409f63927fb67b9a241748e76f222a5be1"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.30.2

