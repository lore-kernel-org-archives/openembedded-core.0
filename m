Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.978.1603478628956942297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iv8c2YgB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id l15so2991774wmi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypq5RPiRpvu7MH3MKXQBG8rF8jSyKnp96BG8nBC2uV0=;
        b=iv8c2YgBXBsJ/s9UB65+X0Lme1/pT/Ox4qya956yGZbwwDfFj+LGAf7mMidWs+l9Ql
         VasBCStvBcP7ejz2c9Vm427YkjvqWwcRDspjH7wXOsXkbMNDSAB/Wdq/J/qGzGNjVkVj
         uP/a50oSvH+B0BvKD2Me7trotpwimGcv7EudNdVcDXq2GK5fYDSwBfxScl+Ecbc4+laL
         qpema2UxUJbhdJyovap5xBbaT96hLvYqbhA7HIqiRgTfw28Bp4TwO5h3weXyzygcC2l9
         kUlB5Ks7cEFyOgvs5gME59Tmd8CTXrUYNWxnn/tFV40VE21hn4dD56VaGpFqTZkd/zIG
         ZEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypq5RPiRpvu7MH3MKXQBG8rF8jSyKnp96BG8nBC2uV0=;
        b=KXFaQ/RZfqjIpr9nk6oLnEhpKe6E95hM++TeDU6FaNkbzZo+Hwbh3bCoFQN5SYm1E7
         zdhEUVfYeqrlciO4xTcvscQESmEABHbLSqCk6iZic4wD8SAh8eZtsSIQSKhZLzGbZYAf
         /QxyDTu/Zy7wKJegU5ehWUZMcIo0ue/OSfjMDXP6uanhN4rsjU/k92+6KFX5j67nntuQ
         r9M1AhQoc5XnbvG6z+3U/ZyxavKWQjpN+LUMgVjf1AC9v6kY6l2Vuq9tAQRzrFPwwCRs
         Rn0U6yFN+m+ATNlvopC8cCtM3HMBZCEYfby1Py/Gbpcem3nq2k3uPmmzKKndsIbGG2as
         U+vQ==
X-Gm-Message-State: AOAM5304w5zZ6jGhglZJj9KMUe10IgkgB89uiHabbNNHvniloTajqkIm
	eGKN9q6Y8puuGnZ7Hx+3bYjOvu24iJTj3Q==
X-Google-Smtp-Source: ABdhPJwY4+MJNddLd5IeUp6dNNDrCc7wJ4DoDBVs13moofoEgsONNNqUdkHVHvrIJqNdg5hzQrfmTg==
X-Received: by 2002:a1c:2ed3:: with SMTP id u202mr3687096wmu.85.1603478627411;
        Fri, 23 Oct 2020 11:43:47 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:46 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 06/21] gstreamer1.0-plugins-good: disable new meson options
Date: Fri, 23 Oct 2020 19:41:17 +0100
Message-Id: <20201023184132.3208737-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
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
2.29.0

