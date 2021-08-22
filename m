Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9574.1629636679766040837
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ohHgYH2T;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id g138so8776593wmg.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y9GNftu6y1cK7sNCCNbzLkqsJTCe/IxLQcMHLmumiu8=;
        b=ohHgYH2TAoEI+wfk4reUzH3negBShInVhrwT3fWztl953IReSXT6rqba1njgACv611
         mvAyeyXhD6g0fQmbAAH0ityxp8d/P4dZCcQ/8fcOzbU7y8Ijan7Rjp56SiEVHUJkBP74
         IdU3rak6yvDIhed+zIOWMtXWTmMFVfXb+EaGSe8psdauZkDTIut7o4hl5kIbq6/vi9b/
         0Jgrpwt2JlL/xZ9uSj9wz6oBbr2CablENPOdM7cOWa+Fy0JenHEg7/DFUscW8BfP/hxF
         0HDYkr/om/vvlENtO+xGjtxq0CdJ03YhCkLptHVN4Ih+7PuCCLSZHr8zg1cuPZ+HrbRu
         In9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y9GNftu6y1cK7sNCCNbzLkqsJTCe/IxLQcMHLmumiu8=;
        b=n7rTzv6r8dLPEZZYvxvW0yjZBKxC2IREiNPzGTbQ8narlo8OCqD1LfnFvObnaxDkpb
         oqElK86nlWhlod4c7HsMfadNTNohKT++3ZSujaRVOMbBKB1oxfIK4mIX34BYNwm1ZmmP
         oFvQC5ejNVeoA0lnXHf6pv6zVHp0eHsL3BDDCmRtL33jHPQn5zEjv5DoS9GYu+HEcCOd
         4HzFYLNCgPX5QZSRTU7ASlKdN7pchV8o9bb1MuXdnsPRV/7U0/h3TVh2KIGQHuyXNb3L
         bJLvZmKLJOxOMZP23H5MOZAAaG6IKr/FniT1Zco2sBYSzuaCahkKdIRG2Q7qejFodYCO
         mtuA==
X-Gm-Message-State: AOAM530SIlE7zdpplZTJj160d1MOLJT/ycOyerOvxRMsd3Nfd5fC9pbt
	KlZGH2sVRliRof4UIwEtMnqDHU7MEfuDSg==
X-Google-Smtp-Source: ABdhPJwD1BApfiiFeqWg/0izn14SVlAJ3CEgp0Rjb5hWYyVN/s+9AqYtqc8Jntk8CDSMza92anr7Pg==
X-Received: by 2002:a05:600c:358c:: with SMTP id p12mr11661499wmq.173.1629636678272;
        Sun, 22 Aug 2021 05:51:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/55] mc: update 4.8.26 - > 4.8.27
Date: Sun, 22 Aug 2021 14:50:19 +0200
Message-Id: <20210822125103.310416-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-extended/mc/files/nomandate.patch | 24 ++++++++++++++-----
 .../mc/{mc_4.8.26.bb => mc_4.8.27.bb}         |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.26.bb => mc_4.8.27.bb} (96%)

diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
index 48bd73b110..c01d065b0e 100644
--- a/meta/recipes-extended/mc/files/nomandate.patch
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -1,6 +1,14 @@
+From f02010965af21db018c4e108b2193c872406a314 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 4 Feb 2020 18:12:15 +0000
+Subject: [PATCH] mc: Fix manpage date indeterminism
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 The man page date can vary depending upon the host perl, e.g. in Russian
 some versions print 'июня', others 'Июнь' or Polish 'czerwca' or 'czerwiec'.
-Rather than depend upon perl-native to fix this, just remove the date from 
+Rather than depend upon perl-native to fix this, just remove the date from
 the manpages.
 
 RP 2020/2/4
@@ -8,14 +16,18 @@ RP 2020/2/4
 Upstream-Status: Inappropriate [OE specficic reproducibility workaround]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: mc-4.8.23/doc/man/date-of-man-include.am
-===================================================================
---- mc-4.8.23.orig/doc/man/date-of-man-include.am
-+++ mc-4.8.23/doc/man/date-of-man-include.am
+---
+ doc/man/date-of-man-include.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/man/date-of-man-include.am b/doc/man/date-of-man-include.am
+index 3a4e599..f11e9b3 100644
+--- a/doc/man/date-of-man-include.am
++++ b/doc/man/date-of-man-include.am
 @@ -1,5 +1,5 @@
  SED_PARAMETERS = \
 -	-e "s/%DATE_OF_MAN_PAGE%/$${MAN_DATE}/g" \
 +	-e "s/%DATE_OF_MAN_PAGE%//g" \
- 	-e "s/%DISTR_VERSION%/@DISTR_VERSION@/g" \
+ 	-e "s/%MAN_VERSION%/@MAN_VERSION@/g" \
  	-e "s{%prefix%{@prefix@{g" \
  	-e "s{%sysconfdir%{@sysconfdir@{g" \
diff --git a/meta/recipes-extended/mc/mc_4.8.26.bb b/meta/recipes-extended/mc/mc_4.8.27.bb
similarity index 96%
rename from meta/recipes-extended/mc/mc_4.8.26.bb
rename to meta/recipes-extended/mc/mc_4.8.27.bb
index d5619675ef..bc2348432b 100644
--- a/meta/recipes-extended/mc/mc_4.8.26.bb
+++ b/meta/recipes-extended/mc/mc_4.8.27.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "9d6358d0a351a455a1410aab57f33b6b48b0fcf31344b9a10b0ff497595979d1"
+SRC_URI[sha256sum] = "2f52dd9c75c20d8eac7701bd3a8c6c125aaf8cdd9cf12b78ca50a0102b543407"
 
 inherit autotools gettext pkgconfig
 
-- 
2.31.1

