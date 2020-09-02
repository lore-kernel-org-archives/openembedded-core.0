Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.906.1599081246451768161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VXI7ot6A;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id l21so444744eds.7
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fAgj9Y+BP5Yqpc6zmkgY8RK2JwNzVKRPF3NtHWRSftA=;
        b=VXI7ot6ARBOioElnpbUq/Bf9avguf+1ZyZ/SqJwQ+jRCrnKvmkmrUi0plpMwG10Tuh
         JecDp40gIJzfR+w/XCx2VRyPdd6b+PsOprj2wWLcw7Hro1J6hCPJWOHcCDPeC9cohWf1
         y7/+DAYCJD1ByNmTSWkcbX6OeCzEsE7J+3hfxRzBCs6DHSJUoMfMnLgkiDCDbPrFFbCi
         SmLBqZdap6pOuo7srMcSpXYAIF8fc7YgDkYXPsfzgBuubyQg0opoOU36EMCzJ3MEn2hy
         ioFuJAyuc4M7CEwU+I37fwh3afpKRH63qzCzJfgAAPj0uYPxdd15ma1v+2PZMZpkemzZ
         DKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fAgj9Y+BP5Yqpc6zmkgY8RK2JwNzVKRPF3NtHWRSftA=;
        b=JDb05R8sdb2tFZgjvDib6NuEEirQ4IZQk1Q5t9TbnhF27/IpLKIpt/y9csoG0vFKLK
         cMaHwtpBxhm80E5qnxMZfyrTYoH3Gn+NXUYcbnLG5gpa5/RpeMI4mNA+psBkEIb9vbtM
         WpCwpURHtw/AF9pvyHQ6Z8I7Bl+uqEYh5c3xPFJ7NFOlRzxKQxnX6Y+aBOCiXrBuvfd3
         5lwlK7PGcQusZwtqlD6WXTnSHvZaAJk6epP4Su4D9KLMNXv7WYH6ru1+2T4Kl8JaEFAV
         Y/zpue/xTcUJHk13iAynYrFlBNXFoYEP1ht4Ui4HFmp3qQ9pjeYzy7R4AD6oSXH0N9Nd
         Q06g==
X-Gm-Message-State: AOAM533sVVm3TGOESpYVDVx/GU6Qtuiw2/OYi3PHfvx2rCCTXxyZKYCW
	YXAmUpkjnJYF6mqOnCNymi3+cuKA0UQ=
X-Google-Smtp-Source: ABdhPJwDtaFAu1SWB9quhAWXLhnWJ0KgS45x9Ct6+tBEacVeJIy+eafScFZ9IcQTRw7jn6MW16fjfw==
X-Received: by 2002:a50:de04:: with SMTP id z4mr2122147edk.10.1599081244715;
        Wed, 02 Sep 2020 14:14:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/23] msmtp: upgrade 1.8.11 -> 1.8.12
Date: Wed,  2 Sep 2020 23:13:17 +0200
Message-Id: <20200902211330.4853-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.11.bb => msmtp_1.8.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.11.bb => msmtp_1.8.12.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.11.bb b/meta/recipes-extended/msmtp/msmtp_1.8.12.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.11.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.12.bb
index 804ed59b4e..54798f9e6f 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.11.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f25f0fa177ce9e0ad65c127e790a37f35fb64fee9e33d90345844c5c86780e60"
+SRC_URI[sha256sum] = "a86fef9477339923afefe974988a38e32d0feb90dfeeb88f7f55aac356a96354"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.28.0

