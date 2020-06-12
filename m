Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.25780.1591983218667840820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id w90so7725526qtd.8
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=G45LuVvuSZd7hc9+7HuSuxJxvncu/l4wYbdM5cnd79M=;
        b=A92M51GDOgZYmIzaYdNMh9NXT4GyBKfNua27I8P38nzIlYqPswNOgGXJY+Z4XP1Ftv
         ILt5uUMjSl7wRjEskk3pNpiJESYWrhz4y53WbqaTcJ8BSKDr586IzxuBcJNHynRRh2ut
         O5mxbRm7U4/s0qFQDETJvp2e3MWAte0/66ZphOyXpbcruGezEPy/05HsuWiYQGrIIpAc
         TjIT7CgSjvK8nTtv+27IiRAavzPBCi7csFBpTtdwuajXVlplBUriJekHR/cKFOOHfFns
         5Y7P1xOxzMUeEsx6G81CJFazdL3EBhr2y5ivZZ+GBKps03R/ZR1Fid9bp3+IuxLyYe51
         HMdg==
X-Gm-Message-State: AOAM533lPw0v/KuGCBSOr/60XZ1AhNOfIIu5R9n+v3FUiN7SMpBtL3JG
	9b7n/MPCmNAX3ogCTTYF/sUyiqcIUjQ=
X-Google-Smtp-Source: ABdhPJw/QVq8TL461INEJsan9g5jYV153rAAmK68W8idC+7Co1a8dxJ6b/i7vwPgij2CSb0wq6blPA==
X-Received: by 2002:ac8:34d0:: with SMTP id x16mr4264464qtb.300.1591983217593;
        Fri, 12 Jun 2020 10:33:37 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id o66sm4937440qka.60.2020.06.12.10.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:36 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport PATCH 4/9] dtc: update to 1.6.0
Date: Fri, 12 Jun 2020 14:33:13 -0300
Message-Id: <20200612173318.103232-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

This also fixes issues with gcc 10's default change to "-fno-common".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3acc1e5d5bce4e229801c9d66391e007390fb373)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.5.1.bb b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.5.1.bb
rename to meta/recipes-kernel/dtc/dtc_1.6.0.bb
index 9df8a06d47..92df70d9fc 100644
--- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
 
-SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
+SRCREV = "2525da3dba9beceb96651dc2986581871dbeca30"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0

