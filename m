Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBA3C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.11606.1634657709573642766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RRDj6zGZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso3650898wme.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vw+/uimYOzuIrzW7E/thVqK1SRDe/bmAykTbKL7cc3w=;
        b=RRDj6zGZrL9LaJtD7mmHQc+81aE57BoGeD3aCk+wj9mQj1KcjudZnDpfIm/oAoiyMQ
         VYMDlwQ27gY7bOrQp6U1BYk6OdxoPWB38f92wIeEm62Q6eaGoISKfd3oFfec0aDDNRm3
         5B5ToUhOI3EdpIcNZsG/G7x1b3EzLeHIiQF3mnEgF1Qo0ACN87Pck4OI180laWfanNe9
         QjDqIxVdmUb0s0pmxyH4yujOT3uzW591SNXciV6Lg2DbddCsAcZn/SAcMtdOJf162Mnv
         f3KQkKFr5CElFqQsMBsArlhcOfBNT6rphnZsemeyIwlfzyEKaa72xZDtRlCeAJUYwCA/
         /pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vw+/uimYOzuIrzW7E/thVqK1SRDe/bmAykTbKL7cc3w=;
        b=ayA068A2nuDXhdVefGgCPL3tgSyWtejgQdzVExwgQ3YHi6sWqdea5dRebxIIQeucg2
         yuArlHzy8BbqzbUgYuMwAEPVvnKOr4gUKZ3YFTPwlkBXCV95dSh1/qVLWcWZtUS56/kW
         Jc5rR8LfmuA2ACRE6IodttJRv2zYC6/kXN/X49B0HefX4WguoK3mXEOPU+9kpbVgTqpU
         d7RHm2PkC1HjN4b2shITjcFqjfhj4c1nhxYDRGineGIt6NqwjmJZU+PQTVrmK94tjkMQ
         p1o1j5En7MAoKEseT1qASDOUWtYvw3h7vJoiK8SIBXwaJXa9uEB5hMdS895704K5b4nA
         QgQA==
X-Gm-Message-State: AOAM533YsXlDrLaykWeZGMpU24x2QDrSWYfx/5lmLTt170S6ACY0xzqS
	NxXGSyROcjk+WlrV3pkLTPzTiwgPxz8=
X-Google-Smtp-Source: 
 ABdhPJwNPmA+Gx8eVAA2NF0YmMGFDpFHBFVbs0dGH+LbN/CD0b8NRpF3cwFgtc9f3pRMi3QoX2h/HQ==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr6922834wmi.30.1634657708204;
        Tue, 19 Oct 2021 08:35:08 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 63/65] gnupg: update 2.3.2 -> 2.3.3
Date: Tue, 19 Oct 2021 17:34:17 +0200
Message-Id: <20211019153419.3319802-63-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157182

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 +-
 .../gnupg/gnupg/relocate.patch                | 74 ++++++++++---------
 .../gnupg/{gnupg_2.3.2.bb => gnupg_2.3.3.bb}  |  2 +-
 3 files changed, 43 insertions(+), 39 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.3.2.bb => gnupg_2.3.3.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index a66a8e62b0..b58fbfe6f5 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From c873c85b1ee1c35ebbba0bc80c2352c64787a5fd Mon Sep 17 00:00:00 2001
+From bdde1faa774753e29d582d79186e08a38597de9e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index d03ea3b..a6dfa19 100644
+index 5cdd316..e5f2d6a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1958,7 +1958,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1962,7 +1962,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index f9f38c2876..53679bf1d9 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 5a68a37ae2649e0988965cfe3a63a0142f0182a1 Mon Sep 17 00:00:00 2001
+From 766d37fe9acd9fdaaff9c094635e06b50c5902d7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -7,15 +7,16 @@ Subject: [PATCH] Allow the environment to override where gnupg looks for its
 Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 7969a2c..06b8016 100644
+index 455c188..55049db 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -918,7 +918,7 @@ gnupg_socketdir (void)
+@@ -1155,7 +1155,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -24,57 +25,60 @@ index 7969a2c..06b8016 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -946,7 +946,7 @@ gnupg_sysconfdir (void)
-     }
-   return name;
- #else /*!HAVE_W32_SYSTEM*/
--  return GNUPG_SYSCONFDIR;
-+  return getenv("GNUPG_SYSCONFDIR") ?: GNUPG_SYSCONFDIR;
+@@ -1187,7 +1187,7 @@ gnupg_sysconfdir (void)
+   if (dir)
+     return dir;
+   else
+-    return GNUPG_SYSCONFDIR;
++    return getenv("GNUPG_SYSCONFDIR") ?: GNUPG_SYSCONFDIR;
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -978,7 +978,7 @@ gnupg_bindir (void)
+@@ -1223,7 +1223,7 @@ gnupg_bindir (void)
+       return name;
+     }
    else
-     return rdir;
- #else /*!HAVE_W32_SYSTEM*/
--  return GNUPG_BINDIR;
-+  return getenv("GNUPG_BINDIR") ?: GNUPG_BINDIR;
+-    return GNUPG_BINDIR;
++    return getenv("GNUPG_BINDIR") ?: GNUPG_BINDIR;
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -991,7 +991,7 @@ gnupg_libexecdir (void)
- #ifdef HAVE_W32_SYSTEM
-   return gnupg_bindir ();
- #else /*!HAVE_W32_SYSTEM*/
--  return GNUPG_LIBEXECDIR;
-+  return getenv("GNUPG_LIBEXECDIR") ?: GNUPG_LIBEXECDIR;
+@@ -1250,7 +1250,7 @@ gnupg_libexecdir (void)
+       return name;
+     }
+   else
+-    return GNUPG_LIBEXECDIR;
++    return getenv("GNUPG_LIBEXECDIR") ?: GNUPG_LIBEXECDIR;
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1008,7 +1008,7 @@ gnupg_libdir (void)
+@@ -1280,7 +1280,7 @@ gnupg_libdir (void)
+       return name;
      }
-   return name;
- #else /*!HAVE_W32_SYSTEM*/
--  return GNUPG_LIBDIR;
-+  return getenv("GNUPG_LIBDIR") ?: GNUPG_LIBDIR;
+   else
+-    return GNUPG_LIBDIR;
++    return getenv("GNUPG_LIBDIR") ?: GNUPG_LIBDIR;
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1026,7 +1026,7 @@ gnupg_datadir (void)
+@@ -1311,7 +1311,7 @@ gnupg_datadir (void)
+       return name;
      }
-   return name;
- #else /*!HAVE_W32_SYSTEM*/
--  return GNUPG_DATADIR;
-+  return getenv("GNUPG_DATADIR") ?: GNUPG_DATADIR;
+   else
+-    return GNUPG_DATADIR;
++    return getenv("GNUPG_DATADIR") ?: GNUPG_DATADIR;
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1045,7 +1045,7 @@ gnupg_localedir (void)
+@@ -1343,7 +1343,7 @@ gnupg_localedir (void)
+       return name;
      }
-   return name;
- #else /*!HAVE_W32_SYSTEM*/
--  return LOCALEDIR;
-+  return getenv("LOCALEDIR") ?: LOCALEDIR;
+   else
+-    return LOCALEDIR;
++    return getenv("LOCALEDIR") ?: LOCALEDIR;
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.2.bb b/meta/recipes-support/gnupg/gnupg_2.3.3.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.3.2.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.3.bb
index f3b277b0a8..5614ac6473 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.3.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "e1d953e0e296072fca284215103ef168885eaac596c4660c5039a36a83e3041b"
+SRC_URI[sha256sum] = "5789b86da6a1a6752efb38598f16a77af51170a8494039c3842b085032e8e937"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.20.1


