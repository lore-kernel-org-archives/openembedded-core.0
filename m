Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.2257.1623203194713721776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 18:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CnT5sfZr;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: weaverjs@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 5so1715405qvf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 18:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjWm8RpFosbmjuJ+/5mA2AW1YTbDfEMyQ+5/VaSuo1A=;
        b=CnT5sfZrv6s/q7vRyTb/nyyE1n4lqsQYLDiSQWB5nPE0UN+iKc0CHZBUh66Ylt8e5t
         kOI0pWF7cJog4JDquFXpXfMtve8PDR+C4fThdGDBjznaSGFeUQW9opyQt3SRMMATciM0
         4p4fJBYO8zYLv/m5stUCdSa5zVc75irG7xQ54nqodpqlC9CMZXOO7oMEpbf4Hlb8mvAn
         ZBd116hapu9/KSMRPJ/R/Z07FgNHisprS6J54y7QKMZ1CvMijrmoWMIjEhU8wB0OP7jy
         R6LnLchLLIPS0XgOItfyqkCRP9VHpzJ4vBYbxdRTklbKfbK+gaj1HJfX5ZgqatjIaYwJ
         Czlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjWm8RpFosbmjuJ+/5mA2AW1YTbDfEMyQ+5/VaSuo1A=;
        b=BP4JEY/Ybtv3kDc+QSt8iaMYY7CqlpP7jlaNGLZLcSdycZ7ufDW+Mo4hPWZfyYMSlt
         SvGmTH1JJ4S/8ACxcqRhfURKv1JsHj7EgWbCkbCSI2yiF2d3bV/iCs3bJJqF6yNLXThW
         NBBeSuTQVK5y9byI4siIZz9AnCoIUfeQeVXU4JGB7RBrV+BXkDtTAMBnGJlWcVOnTgYk
         zUtD0Sn3odOc0zw/BgtZ2hGB++udzv1owsfJFWOV41qGqZRJfXDv1W1w5hYlSC/QpEUf
         Gqy5bzlSIAFTEDASPo0qlyc6JdwG/RmMaietJ7PPi7LCOD+37nd7C5YrslMPE178r03D
         JSYQ==
X-Gm-Message-State: AOAM532aSWetnHEBu9TUVRqkuTdHiw+B9xwHf9Rtgj/iY2E5+Uit/2jH
	4nC9/JuM1IPa5kK+6i9M8TmqhP6BwGUWDZuEJIYR
X-Google-Smtp-Source: ABdhPJxN3fm4fPIOtUxIAL88onDKvsEnodl0hyF8jA8EjG/1sMSwtCx42Q60zYJBh2IIRjCF12A04w==
X-Received: by 2002:a05:6214:122c:: with SMTP id p12mr3545550qvv.24.1623203193679;
        Tue, 08 Jun 2021 18:46:33 -0700 (PDT)
Return-Path: <weaverjs@gmail.com>
Received: from p-impout004.msg.pkvw.co.charter.net (cpe-69-133-48-66.cinci.res.rr.com. [69.133.48.66])
        by smtp.gmail.com with ESMTPSA id p8sm7482704qkm.119.2021.06.08.18.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 18:46:33 -0700 (PDT)
From: "Scott Weaver" <weaverjs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Scott Weaver <weaverjs@gmail.com>
Subject: [OE-core][PATCH] README.skeleton: add readme to meta-skeleton layer
Date: Tue,  8 Jun 2021 21:45:17 -0400
Message-Id: <20210609014517.237944-1-weaverjs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added to satisfy the yocto-check-layer tool readme file test.

[YOCTO #13612]

Signed-off-by: Scott Weaver <weaverjs@gmail.com>
---
 meta-skeleton/README.skeleton | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-skeleton/README.skeleton

diff --git a/meta-skeleton/README.skeleton b/meta-skeleton/README.skeleton
new file mode 100644
index 0000000000..25468dc87a
--- /dev/null
+++ b/meta-skeleton/README.skeleton
@@ -0,0 +1,7 @@
+meta-skeleton
+=============
+
+The meta-skeleton layer contains example recipes and configuration files.
+
+This layer is not intended to demonstrate a Yocto Project Compatible software layer.
+Disable the signature check when testing this layer using the yocto-check-layer tool.
-- 
2.25.1

