Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA098C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:27 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.29870.1641226767389323970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id v22so30830919qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=54BheYLQHhW4OCnC55uly8iOM8zXZja1//qxiDSB44M=;
        b=ITILW6AtKXSgIqvW016bRxYxiDLOiylUrvbq1yMF9z5LDkp/aKPlhhh75n86QAwxS+
         sW6vH6kSMrOH3c83Sglg8DyU3gGIDdZbFvD3u2l5WK3aciSrxxqcE2uN0nEfAsVacgJi
         8ctRiirOPKPnAUj0yObe3XUErT0jG5Qc0S53z8V+X1m8rg+fufX6JuWUqEsVMmEYwhzG
         L66xInm2TMyBsHemh+zk7LFlAyFbz8XpA9slTniXesuS56xCYH9YOF2onMQWOoQF/Zjz
         8LpOf4+c9OUVd9BnODuSGlAWtSed9tIJcpsnmJm7aoiGv+aUkbOh5lPkyBytnzRuH/DS
         xsVA==
X-Gm-Message-State: AOAM5300SFa8m+kMOCPNq3YMzYuJOs9725/ackxymR++MLvPCzvmwurR
	KBwTWU8+2YdWP1WPNJF8fydRMGHX5b5kOItI
X-Google-Smtp-Source: 
 ABdhPJxUAhw5eddxFcHkFOZrQC2Y7brO/BwlUGZ1jMRUoWKsNRwoDrVh5U33vYWmUe5+IdO7ROhW3w==
X-Received: by 2002:ac8:5ccc:: with SMTP id
 s12mr41811612qta.466.1641226766333;
        Mon, 03 Jan 2022 08:19:26 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 o9sm30328816qtk.81.2022.01.03.08.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:25 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/24] gnupg: upgrade 2.3.3 -> 2.3.4
Date: Mon,  3 Jan 2022 13:18:37 -0300
Message-Id: <20220103161854.301148-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160124

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...-a-custom-value-for-the-location-of-.patch |  5 ++--
 .../gnupg/gnupg/relocate.patch                | 23 +++++++++----------
 .../gnupg/{gnupg_2.3.3.bb => gnupg_2.3.4.bb}  |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.3.3.bb => gnupg_2.3.4.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index b58fbfe6f5..d97adb1410 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,8 +1,9 @@
-From bdde1faa774753e29d582d79186e08a38597de9e Mon Sep 17 00:00:00 2001
+From 1dd6b8e97c101390a24c4de6d5e67ea835979a8f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
  gpg-agent socket in the filesystem
+Organization: O.S. Systems Software LTDA.
 
 This should avoid clashes with the host gpg-agent observed on autobuilders.
 
@@ -14,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5cdd316..e5f2d6a 100644
+index 313b113..25ded07 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1962,7 +1962,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 53679bf1d9..085726a15b 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,22 +1,24 @@
-From 766d37fe9acd9fdaaff9c094635e06b50c5902d7 Mon Sep 17 00:00:00 2001
+From a6e914220fa5b28e545122c992fefbbf6f8aa986 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
  own files. Useful in native builds.
+Organization: O.S. Systems Software LTDA.
 
 Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 455c188..55049db 100644
+index 174d961..f4c25fb 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1155,7 +1155,7 @@ gnupg_socketdir (void)
+@@ -1161,7 +1161,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +27,7 @@ index 455c188..55049db 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1187,7 +1187,7 @@ gnupg_sysconfdir (void)
+@@ -1193,7 +1193,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +36,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1223,7 +1223,7 @@ gnupg_bindir (void)
+@@ -1229,7 +1229,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +45,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1250,7 +1250,7 @@ gnupg_libexecdir (void)
+@@ -1256,7 +1256,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +54,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1280,7 +1280,7 @@ gnupg_libdir (void)
+@@ -1286,7 +1286,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +63,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1311,7 +1311,7 @@ gnupg_datadir (void)
+@@ -1317,7 +1317,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +72,7 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1343,7 +1343,7 @@ gnupg_localedir (void)
+@@ -1349,7 +1349,7 @@ gnupg_localedir (void)
        return name;
      }
    else
@@ -79,6 +81,3 @@ index 455c188..55049db 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
--- 
-2.20.1
-
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.3.bb b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.3.3.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.4.bb
index 5614ac6473..7faaffbc27 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.3.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "5789b86da6a1a6752efb38598f16a77af51170a8494039c3842b085032e8e937"
+SRC_URI[sha256sum] = "f3468ecafb1d7f9ad7b51fd1db7aebf17ceb89d2efa8a05cf2f39b4d405402ae"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.0


