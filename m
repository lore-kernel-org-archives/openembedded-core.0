Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.17619.1590940419092789430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r4maFdMy;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id k8so5424191edq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+Niqo0L+ZuPQl37jkccvJJHzSmsfYQsEuP+V4ucNuA=;
        b=r4maFdMylD9GUQ3rMAUgTtfE5uGMt9t3MIVae384fWS5ZhqLxB1u4mjGtW953e8pmh
         JaMIcPiz54G+WX9Hsehv9GkJLqgIjkG3wFw7XC72Lmr1Bti9OHtGP+LxeqxBXeDFGQYT
         q3zPw5hPu+WznWjGxYuujX8FxAhCbt6lf6ZctJnUDAtPTwX6d1cHN317Y3MHVsdqo1wR
         f+3LYztGtLiITepxZ1+yqRmSNSID/A5N/xRUmDLNR25DtoBYvBms8yrMMczyrR4ShlAU
         Gr3+mVNQRSlS2rk5L4C2KG9ckAGSlfzzGel73bpPMko99ruf2AkJfBzLRL9loHFibwZZ
         +LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+Niqo0L+ZuPQl37jkccvJJHzSmsfYQsEuP+V4ucNuA=;
        b=pJvpGVoUqeiLyBOpXQvwe2l6TdqwdIpCT0HFCFJ3ne0PPTbmkrr20uUlErBJ7Av5SB
         TxS6FsegDbxHHJq6U/TfkE2H4/0ULFKsOjnNrPvWZicI83ZwOvSAbWDq6K3TuGah49Eq
         Pom6CW1qnzw/NRMyhM1y+bET//N6kPS29tPrhShJD9g4ZNy7/5Pt68RYhuw4qiKNygBR
         LHljWu56TlihYy9u2RpSW1D+JG8SlRb6g9jcfadegk+HL8ftqMIPCcCtKJG4VTClF8xi
         FEc3NbRtNOshn23OQkGERFz8KX3et8aGzi2k2OaW/IwnTv5YDyY8rulK3d9XAiUkArcr
         oxAg==
X-Gm-Message-State: AOAM530tV6+EZthmulGvOtaliutyHTYnuncmVZnwMEFlNP6klPhcECiF
	g7g9bMaONFf7gr8+HXFe1eivEgrY
X-Google-Smtp-Source: ABdhPJy6jJ2SA7c6NZoAwJcGHnKaZQmz7VFVtVhgnEym2mzYGzu1y8rdAql4qtqmj/WMdpa+xeVUvA==
X-Received: by 2002:a05:6402:959:: with SMTP id h25mr17267270edz.287.1590940417491;
        Sun, 31 May 2020 08:53:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/70] python3-pygobject: upgrade 3.34.0 -> 3.36.1
Date: Sun, 31 May 2020 17:51:56 +0200
Message-Id: <20200531155254.10283-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ython3-pygobject_3.34.0.bb => python3-pygobject_3.36.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.34.0.bb => python3-pygobject_3.36.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
index 6babf0cae8..0a34d4373f 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[md5sum] = "ca1dc4f31c1d6d283758e8f315a88ab6"
-SRC_URI[sha256sum] = "87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdacf5271a"
+SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
+SRC_URI[sha256sum] = "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-- 
2.26.2

