Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.25187.1591602518244255830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tGu6uG4x;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id m21so12562687eds.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BGmTr5cOagKErepoq/FeOQF0l2mSQ9Br2nHu1dZQz4g=;
        b=tGu6uG4xGsZLpwHFj9GBGnekClE4iLICD0JaPuOw/WClwu3tp9fOAeDvGw5dSjHmHT
         zp1nNyXKUEhH4HUroXZqVgo9qfGi8pKpbFAyjOq8auBJ+rgJxLp6IAevUor2sh4RZFWn
         lqwaECrwOeAL4IeCZo4HnWMISXaUqyeaxQ9M/Dur9FdxjyySVjcSiEgtoqhMtDV5WBfu
         7Cfigbio6LPNJ87BNtWbC0SQxVjHFD3nAPdgYloLjsIVCAbxJPI+GnFXByzMTI9zKtOQ
         KMMUx799UxlvU/0TNcTJ9if57MfxFdsjSl2CiGStUcnxdQyFnvPp9XzfREbCrO4kiEJZ
         2xhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BGmTr5cOagKErepoq/FeOQF0l2mSQ9Br2nHu1dZQz4g=;
        b=PunqCEtNkrCAFTdFg3z6lRyTSDIRmg1XvR9M3Jhmy3Jj1qlmW49xKWKFv0YSUO3iKW
         mmidu+fjvS0J3U0HzZOX99jR9+WOjKFkbS6C+V/lb1NIb6twix+5s/vOSdkiS6z6MGOF
         /h+8grE6V+pCQzNy8oOurNpTYS1A/bOjoRTwjXLFG0iPPinuj8hCVhBehBAP/ebp7C1I
         dBKF3M34Qk/a14HT6aF4209YZbb6LmWRZXv1uemA0ghAOa/wh0F5GXh+sYGTkX7k6HZT
         t7YVzDqxlcHkfjZdjbW8xE8QQMmK3MrjREqAGr3cMBSAf+4YxkF1nm8UFR+5wuJnBywL
         8DHQ==
X-Gm-Message-State: AOAM53315wHbVVD7usZm3YGLWIJEs91XjvQ1tyNXUxNmf45CkkKQXz8+
	ARfiJbZoNhWOA/4DWaQXJIgoTZe7JZk=
X-Google-Smtp-Source: ABdhPJzARVdqHgTNFhsVwOXXQuUqFlYNGPWG1d2YG369ABnwFQoWNA5oNuqB0xVjYJH54hoqGpLoWg==
X-Received: by 2002:a50:954b:: with SMTP id v11mr21045508eda.273.1591602516637;
        Mon, 08 Jun 2020 00:48:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/42] vte: upgrade 0.60.2 -> 0.60.3
Date: Mon,  8 Jun 2020 09:46:43 +0200
Message-Id: <20200608074659.7051-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vte/{vte_0.60.2.bb => vte_0.60.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.60.2.bb => vte_0.60.3.bb} (92%)

diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/vte/vte_0.60.3.bb
similarity index 92%
rename from meta/recipes-support/vte/vte_0.60.2.bb
rename to meta/recipes-support/vte/vte_0.60.3.bb
index 8c7054913f..01c48242d9 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.3.bb
@@ -20,8 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 SRC_URI += " \
             file://0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
-SRC_URI[archive.md5sum] = "1a0b5395915d2f3c88484511b38cc584"
-SRC_URI[archive.sha256sum] = "35a0280e3f12feeb3096da05699191373c47a4a20c55cb7081e828e6015f8ca5"
+SRC_URI[archive.sha256sum] = "feb76e1181a357d86112d447a08d127e2081438df76ece83243b18609dd9822a"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.26.2

