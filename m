Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.12687.1615311143819554857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E4I4iT6K;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id kx1so1239685pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W64YpL9ZNrzsVJBp8o1YpMqsSf8Pckm/APaYA/plVCA=;
        b=E4I4iT6KoAzEy1iNM7rhtHDDj3SdV1mJy2Aah0lGH5++Z1R1uEmJCPOPhLmjhx6f8T
         xOoxUHbUYhkFdxu87oCR3hgPsC60E9enWHpPRIz0ye7fw15elxGKUiHNFXjBMtEkQe15
         qF+xW+NUOqSCgaEfvNY6w1AoeKjfKaDYOXTLQiWnLe4eLfbLxpkVLRjpbQihc5u8G/xB
         0BxGK5ONCh8ayfn/5bGz98dGqVZADw3CwAwsEq6eKQS0D5UBaZCEIOPyn20Gos7oRQWF
         kzFgmaGvuDugs+rlr8NRNhqXWvVkJna/InZftv4ozA7XwW2Ge20mq710s+yrEfFavp2p
         +TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W64YpL9ZNrzsVJBp8o1YpMqsSf8Pckm/APaYA/plVCA=;
        b=RC3/YzBXjnEJJl1BmAtePnmqZ0451sa3LQ3bT8U9IX3n19Tp+EUX3csorm+OETRQBb
         VTAA+Ot1+RWyrdMwO0M7C3KN6XZ3M/FjDbK7CSOUlbhWfGuCAQoyeYezJvx1Z3H6sjJP
         sMV/dAthu44qRJ3GxecsSO4qaup/SfGQRdXUH4mtLC5QDGvRdve1XAOAVmr1XVrL+ReW
         tlbCINuySAXmoo12/fo7BivNgbA/HexQst0B+JYGm0Eoncx5bmcGlI2cF+9RL+yHxNWR
         vc8XzHlr2C/wJdYhpTKawyXyUQq9noU63j1d3wPHpVwlkhptoPJIQazdhlTnoq/awmgQ
         vv0A==
X-Gm-Message-State: AOAM533ZqdNhG8It/ABMMk5+yKVYlvANfI8eiHiK5p5NWvDkTk91uRf+
	pGtZUwhk/cfzp3oX0T8zmVGa+b0tdnc1Dg==
X-Google-Smtp-Source: ABdhPJwXtWYQSM3I3lS0iVaEIGnNdiH+azVdvsa1h5aTn/FabS5dO6IDbqoHKO+dNgPl5O4fjb9FqQ==
X-Received: by 2002:a17:902:cec8:b029:e4:a497:da92 with SMTP id d8-20020a170902cec8b02900e4a497da92mr4923885plg.74.1615311143053;
        Tue, 09 Mar 2021 09:32:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id k128sm13541568pfd.137.2021.03.09.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 09:32:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] formfactor: Add machine config for qemuppc64
Date: Tue,  9 Mar 2021 09:32:08 -0800
Message-Id: <20210309173210.295033-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309173210.295033-1-raj.khem@gmail.com>
References: <20210309173210.295033-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/formfactor/files/qemuppc64/machconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc64/machconfig

diff --git a/meta/recipes-bsp/formfactor/files/qemuppc64/machconfig b/meta/recipes-bsp/formfactor/files/qemuppc64/machconfig
new file mode 100755
index 0000000000..e4717730ea
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/qemuppc64/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=0
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+#DISPLAY_WIDTH_PIXELS=640
+#DISPLAY_HEIGHT_PIXELS=480
+#DISPLAY_BPP=16
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=vrgb
-- 
2.30.1

