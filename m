Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.107640.1597919103032158913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cbWZk0dV;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id jp10so1902562ejb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EIJtADBfGOmSr1H8Z8/AhJZ+79TNL1337ZWYMFPzeas=;
        b=cbWZk0dV/0joVT+urAQRUezaUsGe8xazyxWnYuUEEAKAyIAn0HuhAc7HlYbsZyezUK
         zHUDUdFGS1RtngoP7hfgObfXGBoQjumAAn7bkpk5ZmmGouHmudbuL8rG33he6LLltjzq
         TZMtrBCui6yX9yklOpJFU/pY3POgaj1qm/vl8oyDGWwcC4156saUHW2YyBOb+AVCx+Qe
         bXEltfmNjNnOwRLV5WxfnOuZn0dPmO03fyXkWKEjRp9of7+eRkZGECswr9hlyLUO7IOk
         iZWdkViK5UIAG1V2b4I7bBvgLbBw88JokMnMu0InPJJeVQDJcyo3kGdnjjJfChA0o9v8
         kPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EIJtADBfGOmSr1H8Z8/AhJZ+79TNL1337ZWYMFPzeas=;
        b=msKqgvghmOTpCr4DdR3fVr8nOUugxXSWyJRITnp2yueaiKK5odZWuMeiNVxJCwkZFr
         M934DY9ftezlu5gOluP2ScsT2/lCBbddcM4eNnEruBvEIob9DPcwM87AKBUIR070ntyp
         GDLj0OoKHNiehpiX8CbEV0jGL0fdA/1yPcQUzPYCkTiPbm+tcY18yQKUlM3FEGKCSdk3
         2wxez3cNiIlkWmUGUBzg16nEVKf5v0nzlBkum9CrhTVdzg2QazwD0Xft4a2K0JyLuv/t
         TGG2xGs7sY2zJe3Xc8W747VbPJln8VL6Dkjn97d4mztuWS5w7qgn5EdgzqHb9c0wr96q
         ILXA==
X-Gm-Message-State: AOAM531hrwkZfHqNZbZro9fKmbg+/lN71zSfJqC5kXFp6B8CG/N/FcFc
	cM93Nw4Uqaloq+5lO+N15cNobyaVB7LoAx3q
X-Google-Smtp-Source: ABdhPJwG0fEUFT6E5OAwFDxFQtoQfh1+AgizEfkCz27fajfK/krKtLa+koRCeeuQqJDr+odu2BEBkg==
X-Received: by 2002:a17:906:6d54:: with SMTP id a20mr2641077ejt.501.1597919101165;
        Thu, 20 Aug 2020 03:25:01 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-76-105-136.eu-west-1.compute.amazonaws.com. [54.76.105.136])
        by smtp.gmail.com with ESMTPSA id du2sm1230795ejc.2.2020.08.20.03.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 03:25:00 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 7/7] systemd: Upgrade v246.1 -> v246.2
Date: Thu, 20 Aug 2020 10:20:41 +0000
Message-Id: <20200820102041.28077-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820102041.28077-1-alex.kiernan@gmail.com>
References: <20200820102041.28077-1-alex.kiernan@gmail.com>

Commits:

  946e4c43bb4a tools/make-man-index: fix purpose text that contains tags
  dae0586e9193 test-fs-util: skip encrypted path test if we get EACCES
  0d026c9b0d2f Newer Glibc use faccessat2 to implement faccessat
  fde6520d468f namespace: fix minor memory leak
  208ba581f44f man: fix incorrectly placed full stop
  6c81d578289b man: fix typo
  53a8d2588e72 bless-boot: add missing verb to --help
  4cfa0ac4fdc4 user-record: deal with invalid GECOS fields gracefully
  ae5234ef4838 user-util: add mangle_gecos() call for turning strings into fields suitable as GECOS fields

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_246.1.bb => systemd_246.2.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd_246.1.bb => systemd_246.2.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 25f80ff237a2..b0d4fe403329 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "7fb880ddf101b871f68aae0d86db652e2c13c5db"
+SRCREV = "91b37e6f0982e1e64c63017000248d7441a83a2e"
 SRCBRANCH = "v246-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_246.1.bb b/meta/recipes-core/systemd/systemd_246.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_246.1.bb
rename to meta/recipes-core/systemd/systemd_246.2.bb
-- 
2.17.1

