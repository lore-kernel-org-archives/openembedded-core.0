Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5042AD25028
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 22:45:32 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.522.1768085130689712403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 14:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eBh/pNK8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202601102245264e1698e6a5000207f7-o6cjzf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202601102245264e1698e6a5000207f7
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 23:45:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8MfxHUss3X84P39ikFgSVZFTHv2R5jgEjljBMIcxE5E=;
 b=eBh/pNK80lateRYg8ILU+hw/nPZHGVqQKvjkvmlgUqRiaatZeE7IHfqfsn04adMT3f02Oe
 ZlUrJzfWVbDPoYre2Ik4alYg5NHRyKfolkiZvn2rHNpFXYeipPSnfI0rbjabJ31Y9Rk3tYRV
 lcSLgh88Pj7cVyQiy/SzsV1/oUMZPTwVLK/QvcdBEQ9QMkCifGaraaNIhLzAVqDL2tURdg0W
 zUcB/9OdOGkSYj0pCl8DlQmbZHZArn25YaeEk+4+rx88uMdI18fZB4LtJjnp0kSQgZpXjYZb
 kw7ZXyuHnQj15vckMFgwf+bVBjm82qK2M6H2d6VBpcRVedq5c9FcfKbw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Date: Sat, 10 Jan 2026 23:44:53 +0100
Message-Id: <20260110224453.395105-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 22:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229168

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-68973.

Refresh patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnupg/gnupg/relocate.patch    | 14 +++++++-------
 .../gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb}       |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index ea0252026aa..655dd3d0ce1 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -17,7 +17,7 @@ diff --git a/common/homedir.c b/common/homedir.c
 index 6f99f3e..f22aa9e 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
+@@ -1294,7 +1294,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +26,7 @@ index 6f99f3e..f22aa9e 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
+@@ -1326,7 +1326,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +35,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
+@@ -1362,7 +1362,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +44,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
+@@ -1389,7 +1389,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +53,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
+@@ -1419,7 +1419,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +62,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
+@@ -1450,7 +1450,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +71,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
+@@ -1482,7 +1482,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
index a6e777abf89..4f60a4e7b28 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
+SRC_URI[sha256sum] = "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \

