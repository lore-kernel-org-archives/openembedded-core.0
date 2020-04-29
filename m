Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.4548.1588176723522799043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cTOfKlgc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id n11so1220818pgl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Qgy4ShhElQg7wIxa+Jcc8rRod8zeLzFLsOIuaeCRRIw=;
        b=cTOfKlgcqBAdPitWNyLGfgikNRfg8g6lX1YRnIuMfKeKqG/13LqIXIX4eNIzeY9qDf
         TvVJeScOi1eszydnhiuc372PbpG31KbmQXbLyvmhVc+VisEOUU5oO6uSfWaeUVNA6Cqw
         MQOJe4Yi4tNIHk/FyzlYrIN/NLDAMHhlNfZnb3D5JtRaKV1VWpDOg7Ei6CDXqMK05j6c
         Ts+IcB68Q3EJo9pgxr+2VrhW15rKMlTENAJoeeB3Bba2vUKj5AlZIBHo+S9Cb/LEUYqf
         9tc0xCAaqnVCDIcI0PUb5B0dPVLBGNgV4lY9vCo/GorgbDSaG5KhMRuowVcwCa7raH6+
         MZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Qgy4ShhElQg7wIxa+Jcc8rRod8zeLzFLsOIuaeCRRIw=;
        b=pZwSgI4ITZYQhoSVRqVqklvAAi43jJxL60GgU00u0smM2QJAGD6/UgTAqTlml5rZ6k
         Rqju0+qc3trncrfrF16AeF6U1y3p23NLfVR4Eg+idwM6euMVObDzKdf0PDXbESkO3ZLZ
         ZQiT0NZN1WtPoRBp08AU/QmdzeziNhkUrv9VVU+ftRqao95iZLorJKEJc5TiywrlwQx+
         FAAwR8r90smQMjSv8WsornSd1SF+4ckPHHsLSBa4QPfEhKzW8YY/BalS8BaEYtRZP5KJ
         bXhk76Fqe51YEdhNiSTkvhDfvxMFzaUI4BQCaxeZEXSJUVRMUddVk4dcXC18cB4RbTE2
         fXfQ==
X-Gm-Message-State: AGi0PubNVrDT13kTJe5YYESIfOZlUrkewDPozpMnwJAkDUuOiFf/r9st
	0qkI7QOWoDPJ3Ql/8ZISUgyoZyfviwQI/w==
X-Google-Smtp-Source: APiQypIoAmoOQ7Rx2LIaROmALZh9Qdxg5SDL8W6bdDk1WjHFj6qbfctaE8LUmd1mnjizrH1zfKbOdg==
X-Received: by 2002:a63:1160:: with SMTP id 32mr33253748pgr.441.1588176722629;
        Wed, 29 Apr 2020 09:12:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.12.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:12:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/16] qemuboot.bbclass: don't redefine IMGDEPLOYDIR
Date: Wed, 29 Apr 2020 06:11:01 -1000
Message-Id: <e989f74493fc7b551f8c8b8d6b28708234ed1d38.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This variable is already defined in image.bbclass and there's not need
to redefine it here.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/qemuboot.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 54044c38da..68f7a03619 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -83,7 +83,6 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
-IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-- 
2.17.1

