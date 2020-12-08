Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.9786.1607440046167207050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e+N7e9ek;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id q75so2662763wme.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OozQ74bgcmZ1gjPB8dykQjpNAvRMBTjCTW7ZuojekV8=;
        b=e+N7e9ekFEsXbc6fjW4aRUdFTBoaYKnetfsBntMPdQ+r7V3aSOOUGMdW1438dwawUo
         V57UmsklyG1+tkJeA8qa0tIY5MQV94inY4fT8qA5Azds87ofXNvq2e0WhXl7WXKLePFP
         c5N9Yv2CRRPZ4KmnABz67Szp8w5G4HP3ZxML5SIdBkmicsLZYtYAoXjQYGl3G/Jjtq8z
         lpMfkEBT5GV5ySj12/cjJKEXpT0tY+yDcUjfXQ4Hg3JMts7+CTvuAOyw5ojsGbzjxGEq
         C4osTNoLCSPEb8f8xC0IaQ/cnF/O/3eIMYIEXQyagzWom4R/fFgJo4htNll2m7N7CQ0N
         Zb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OozQ74bgcmZ1gjPB8dykQjpNAvRMBTjCTW7ZuojekV8=;
        b=VfxlAsJBLpQXodLvi2uw+OyIvGTyltyo7X1m8CcJCk+Jd+GVemATJMObujV/6lO/Eu
         9buZxXax5dIiafhPPlBP+ElranuaiTp25YkbqZ6KqyKj0OIcoivwHuReQzZwuJLVZhRW
         jS2OLMUNQ9Yv4KESD54RP9iv0XnYrdDxywkC9x+3HS4iV27hEyQiKSvws8ouZ+i7JEQo
         k4Ic8AJj/EyhouXLO4teu15c6TVfbUmVV/Mzvovq/cPUH8EQ8UvZZ8SoqrGYOO36cz4c
         JMmJvsIQ8VFlHtSoiPDGTWP0xOlw4uP3NsXmFFa2JUebPwlYrYrqXBAjmLRmOb+8R5ua
         HjbQ==
X-Gm-Message-State: AOAM532Vra/kG6wiQstLjqQLFRvP/97pCFKIHaoCJkcSA2XcczBGdtTq
	+FbyCjIycGAf0BrBdp/Of+f+y1seGgQ=
X-Google-Smtp-Source: ABdhPJzDQexJqBOeLeGWXhTfYMwEu1KO88zaZNCbccWrrOTo2qO1xf3k049AptBze5IoNjPc0MqMYg==
X-Received: by 2002:a1c:f60b:: with SMTP id w11mr4340675wmc.180.1607440042467;
        Tue, 08 Dec 2020 07:07:22 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id c4sm4308882wmf.19.2020.12.08.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:07:21 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] gstreamer1.0: use the correct meson option for the capabilities
Date: Tue,  8 Dec 2020 15:07:07 +0000
Message-Id: <20201208150707.744490-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
index 0fb0bcebc1..cce0f99226 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
 PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
 PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
-PACKAGECONFIG[setcap] = ",,libcap libcap-native"
+PACKAGECONFIG[setcap] = "-Dptp-helper-permissions=capabilities,,libcap libcap-native"
 
 # TODO: put this in a gettext.bbclass patch
 def gettext_oemeson(d):
-- 
2.29.2

