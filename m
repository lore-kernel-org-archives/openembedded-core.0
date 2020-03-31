Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.724.1585697560092071636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 16:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id c145so25123457qke.12
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 16:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=27u2nQqXJu0D3IGDf7jGLW29Qki6LR4/JOpeHKpeTZ0=;
        b=mvpVuwLQRPULYyTWihiv0MaavfZSKCgFdQ852PLb6rZ9yNY7PGUEAg9omDTzwjTvl3
         M5xY4iElulDocRKJ8NvopQ14VgXRVASzmbDfgbczneTD3MVi+qw+jZdT2o5wdmM9YjNm
         7FRFY49gDyqFacK8AZ6ipQvCw1KsNUbfd6BaHT9pvqDG7nitn+GZEyqRS7vKKlLDsWdI
         BNL4XdWSIo2bbrN3BhE7QFJeErPf37oMzhFPCUE18UTN/lqi5upXNmWFSAnjSmUWIVlk
         djUIPaaJmgrsuO5pLxON30fA++Q9oL2a6IcCxga0awupXBGFSuGcvS8GJjBAlChUbuGo
         t9ug==
X-Gm-Message-State: ANhLgQ0CK1BbLBDeIn3mkNAPBmS5uPAQQHLiJcnJxd7hkqS64Ds8F+oi
	SL6dytQJBhL7yds9jgTgQl4Kqk5i0oYT2Q==
X-Google-Smtp-Source: ADFU+vs04TCRPxEXKlBtjIZwrI5MCdBRW31b1v0YqrOXDo4MnY9oBy5sQB/wXvhw4avCIE5JBDBIKQ==
X-Received: by 2002:ae9:edd2:: with SMTP id c201mr6926280qkg.366.1585697558908;
        Tue, 31 Mar 2020 16:32:38 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.114.167])
        by smtp.gmail.com with ESMTPSA id l13sm286745qtu.66.2020.03.31.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 16:32:38 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Stefano Babic <sbabic@denx.de>,
	Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] default-providers.inc: Set U-Boot related default providers
Date: Tue, 31 Mar 2020 20:32:28 -0300
Message-Id: <20200331233228.1206088-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

We should set the default providers for the U-Boot related packages and
recipes. Multiple providers are common to be found in the field due to
custom hardware BSP implementations.

Following providers are set:

 - PREFERRED_PROVIDER_u-boot-fw-utils ?= "libubootenv"
 - PREFERRED_RPROVIDER_u-boot-fw-utils ?= "libubootenv-bin"
 - PREFERRED_RPROVIDER_nativesdk-u-boot-mkimage ?= "nativesdk-u-boot-tools"

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/conf/distro/include/default-providers.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ea88bd4876a..7cde1b5c17b 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -58,3 +58,7 @@ PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
 PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
+
+PREFERRED_PROVIDER_u-boot-fw-utils ?= "libubootenv"
+PREFERRED_RPROVIDER_u-boot-fw-utils ?= "libubootenv-bin"
+PREFERRED_RPROVIDER_nativesdk-u-boot-mkimage ?= "nativesdk-u-boot-tools"
-- 
2.26.0

