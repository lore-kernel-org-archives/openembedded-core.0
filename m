Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.7140.1597314095190561215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 03:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kIsnS9Nr;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id m22so5541639eje.10
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j+6clElh7oHu3YURAt4E4P4ALjttHyvHhBNu2s2t3Vk=;
        b=kIsnS9NrpxXyQ5vzT5Idsf0cWOTb1W7CvasnUrfNKwIthPWdDWub3gHVOHqFVWJY6a
         ToGZPmyEBwNt7e4oJrbLucentYqc+afhuyjibPUEjUkwyVccJWqjZ+kKUGh8INCmwGWp
         HEnG1T2L893qY0bNLcOog7o+2oGgDTWEX5UxR3dDPUIIelwy7huuGH6GNMuEOmVI6BY3
         jm6T8ixFcsO5VMumHXkWaY4U2ZcmNGqXIxLh0mf5SXh+z7mbARKCU5ijZqySMQ8XQSIr
         sv08yvnUVIvk8H42kF0rL2kYsWOZDyY0M7/Ol9+LDJEMjuX2G9MZZmVsG/KZLKxSQMIU
         hi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j+6clElh7oHu3YURAt4E4P4ALjttHyvHhBNu2s2t3Vk=;
        b=Na20mX28liUN/hM/4xw4Cr2zCyhbHaVLbNS9g5k0tUhOjHuIgpCINvfezaUZ45dfqi
         KnWGogX2+1z9ecg37CVNsG+gbj7+HPIt6lIul+FScGDfrbK2KLQ90l1vNphN8UtG1z3J
         3e3OKVwmnndI03fxUG+9X5EZrJQ6YVHijP6S9SK+FsFgwDcL0i59cF0d/9uFe3J+hU5+
         oDxNzuBahI6MzyW28bfzIekjAHNpMz+qP44TquRDkcrbG6cRQUJbUP18FOJip+kLP9tG
         xHUIA2vOqBJvcxe/MA6P5I9BK94QK74HBvQ1RmkR+NuwzMRT9GpKaJGgFlEifbMSb42v
         gnmg==
X-Gm-Message-State: AOAM531Kg6AeMjBLsgKt0BKCjECkadBTq7YY5MqFULbs8u6g14Lgk80H
	VhAWTCVNqNC7DFsA7Vh3Eiqqko9HjHs=
X-Google-Smtp-Source: ABdhPJyaeKIJYywQj3/+/s9tHD9goca+2kp0w7VVlDFw+n1ZA3k1u0jZobZ76ldtTvxrKo+8jVbtgg==
X-Received: by 2002:a17:906:ce3a:: with SMTP id sd26mr3889615ejb.489.1597314093467;
        Thu, 13 Aug 2020 03:21:33 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id v5sm3288017ede.13.2020.08.13.03.21.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 03:21:32 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 0/2] libubootenv: uprev to v0.3
Date: Thu, 13 Aug 2020 12:21:15 +0200
Message-Id: <20200813102117.8726-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Changes in V2:

1 Added u-boot to NON_MULTILIB_RECIPES.

Ming Liu (2):
  multilib.conf: add u-boot to NON_MULTILIB_RECIPES
  libubootenv: uprev to v0.3

 meta/conf/multilib.conf                                     | 2 +-
 .../u-boot/{libubootenv_0.2.bb => libubootenv_git.bb}       | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_git.bb} (84%)

-- 
2.28.0

