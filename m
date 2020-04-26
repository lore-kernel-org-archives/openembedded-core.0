Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.3952.1587928386074775279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 12:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pDxeJlnE;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpuhlman@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id g19so22407321otk.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 12:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yLCyds4IPIAvjKw2iVQQjv31WBLygYIH6H9ggCv7G7g=;
        b=pDxeJlnEeofn1cEFLj0CLVxGp1Cqy8D1EATSQ3NiabEf0+B14b7NWczNfFhVD/Fgsq
         Qi+m8LfDFrXk1TMdb9/EEDt5koKP7lS2KzXxP+zVNiLLA9es5/qm+Hb//5n+zlQfTQCW
         h6G6knJ79Bds6iZ2Al7R/9521eWI57XIN2jwOQ8vsDplxDJbHvprXW0kJ2QZT0dgIGua
         OfMcbQU+J6cfabp/VNgZodGVPMDRoOuIZybGh6smMZFdWhhf6qhmwiR2UFRD9dtjbkFF
         lbJFhQQcIRJE6uyLhbYPtVAwPisxzQyNyjh6NIdWfn2xwjfdCqRuCLAix6+nUUm8sTfC
         ENHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=yLCyds4IPIAvjKw2iVQQjv31WBLygYIH6H9ggCv7G7g=;
        b=rj8iJLu9uo1nbOcde82hTqDbYEAEKe0k5NwX/X3F+i/o26B/zb+IaoTNT2I75NxsbM
         sg9bDoQrTezcMG2SpLZRAz8I1p0GfU+F/+aER22Z1EBJavy2v9E/m6cMVdlNPku76vBL
         0BIJAQ0kT/wbwHZNb/50FMkbfQcG9K1d2FKhpZ5S90Lvs+JMEJmBbP/kWAPqOn+LFJBI
         oLGR8Nl4oQWfc2y5wlnc333cZ7q91bg80xDCduU450mECtAmHxyOmDWcaASRNC58MkBf
         1NwF3Zgb2qEMFewUgmqdD5zYEx1i5VvRSm8zrgrZo3uXiohXNJdFabG3h+Lw/It5+Wlu
         8tjA==
X-Gm-Message-State: AGi0PubUCegzhK7syHlN6Me30BX1JRp2ybJzj8TK+hGDcXUPTLRvGW7D
	GizWscN487kc0p5KHjEJRQo=
X-Google-Smtp-Source: APiQypKZ5IE6fMMqaeXROJ79YnWQdgggoCbJvbSdIO2UHDOewBqpykm0sRVAwWLbj+okQ8olLw9kmg==
X-Received: by 2002:a05:6830:158b:: with SMTP id i11mr16511340otr.160.1587928385386;
        Sun, 26 Apr 2020 12:13:05 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id r6sm3418903oom.26.2020.04.26.12.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 12:13:04 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 483172A047F; Sun, 26 Apr 2020 12:13:03 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/3] qemu-system-native: Fix commented out PACKAGECONFIG
Date: Sun, 26 Apr 2020 12:13:00 -0700
Message-Id: <20200426191302.25782-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

(From OE-Core rev: f2bcc384a6e90480b5b0f0c77530f014785b291e)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f17a046fca..7a1ccf2115 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -180,7 +180,7 @@ PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
-#PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
+PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.20.1

