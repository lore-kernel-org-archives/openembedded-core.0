Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.80319.1629437257345242653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fIzzOh8U;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id c17so8060613pgc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SdlEbCtPziWN8Ut87lDiDGWWY2XUXkHERczd33bKDUk=;
        b=fIzzOh8UD0Om1hS+PX51LMFiuUghRxrS8fQMqdU/8I3kr4cyE+/UnkaIEbQACARIbc
         1SgNx0+Wv07XVM8hyOawRjTec164vvNVUqnOuJkM1BOJKlLRoQIE+VgUZLRE9vOnCYO0
         WjJhk0iKlIrca98BrXdR6aAF1vDtq2jhGCWaK/zY8Oz9jzN24dcIuHxlbmPfo0I20US5
         Tj6cc+AbXlyymrDFb5VuBRwa68FEIDp8vh0cc4AHTys0IMQEMriCvh3VjcrzrL3wwmpW
         WbTNAYSOUWYbkGfchCzzcbqLG6A/0XPYkm/XrHCjSuBq4v3bE4yl2I/ooSigECIDVaiV
         z+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SdlEbCtPziWN8Ut87lDiDGWWY2XUXkHERczd33bKDUk=;
        b=XoI8j9kX1jcSBAkFXPIxhioC1WLBCZAud57EvkJaSxUIyFq6orO7k8m9pPAY9uDrpR
         eRe0EUjDvpIk+VZa7Cqr2mSX2IBljv/vRqEJKvp39IkPeOkjE1N60qJb8CuYs5Tp2DrC
         NmkdZ2sisps6pc6ecDi3BNjyWYcEZ9P7peEEWUcZJygacbJ2VW1cAcUr5iTAnAPBdwUn
         lxDWW1iiZe+K+Q2GjXV7/BClfe3ezvqyg45D5kbri8H1DH1YeEUimnDRcGpKa3Bb3x0J
         m2oTFOHicmVu860hXKMCi2VSsyeP+jV+ygUVJASyBSjCQEASUAeXjli3C5b2Scn/4uwT
         Kpow==
X-Gm-Message-State: AOAM531DDCO0LEFjgLuzhUN3gnkO98+iJFN6ik5upiiKJJGZP71G3HzG
	ZK5U0LQpU7O8inHvV9TkW0gtfI3PKyh4Ow==
X-Google-Smtp-Source: ABdhPJxZ2nXQfuVcYO34XABKQzT4ba7fGpTMv4/tek4hWxnLwwSyCHzgvQtdHeEuNoY4duMC1Dyl4A==
X-Received: by 2002:a65:6213:: with SMTP id d19mr16782199pgv.110.1629437256803;
        Thu, 19 Aug 2021 22:27:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id c7sm3642131pjc.31.2021.08.19.22.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:36 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <Saul.Wold@windriver.com>,
	Saul Wold <saul.wold@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 5/7] gnupg: uprev 2.2.22 -> 2.2.23
Date: Thu, 19 Aug 2021 22:27:30 -0700
Message-Id: <20210820052732.2606-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820052732.2606-1-akuster808@gmail.com>
References: <20210820052732.2606-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Saul Wold <Saul.Wold@windriver.com>

Source: poky.org
MR: 105607
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-support/gnupg?h=hardknott&id=0c06506d42f9e1f43a54a178cda47cfea3f12f81
ChangeID: 4341d0331368d6cd51d635d2c70555b3dce61792
Description:

This addresses CVE-2020-25125 and provides some other minor
updates and translations.

Updated commits for reference:
  e234d04c3 Werner Koch Release 2.2.23
  aeb8272ca Werner Koch gpg: Fix AEAD preference list overflow
  038314665 Werner Koch po: auto update
  1a4b0fd79 Yuri Chornoivan po: Update Ukrainian translation
  93d10403a Jakub Bogusz po: Update Polish translation
  a8a8105bc Werner Koch po: Add key-check.c to the list of translatable sources.
  cad9955ac Petr Pisar po: Update Czech translation.
  896c528ba Werner Koch gpg: Fix segv importing certain keys.
  0a9665187 NIIBE Yutaka scd: Fix a regression for OpenPGP card.
  bcae9cd4e Nagy Ferenc László po: Minor update to the Hungarian translation.
  d2fe2ffd7 Werner Koch sm: Fix a bug in the rfc2253 parser
  f799b3ddb Werner Koch Post release updates

(From OE-Core rev: 965683336816eba7cb0548e59faf224f74b306b1)

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c06506d42f9e1f43a54a178cda47cfea3f12f81)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.22.bb => gnupg_2.2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.22.bb => gnupg_2.2.23.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.22.bb b/meta/recipes-support/gnupg/gnupg_2.2.23.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.2.22.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.23.bb
index 887ab0e1f2..fc157c7906 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.23.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "7c1370565e1910b9d8c4e0fb57b9de34aa062ec7bb91abad5803d791f38d855b"
+SRC_URI[sha256sum] = "10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

