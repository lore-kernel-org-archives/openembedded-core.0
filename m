Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.11436.1621204377251976089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cDgXSnnA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id p7so725267wru.10
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0HMZHC9ScaM+ZTLDM7RVozjnndgAj76No081GmQF8oc=;
        b=cDgXSnnAMLtnb1kfzdf2wU7rtXBxmMu4XYW6Qo4JFhqDm+Si8WLIs371fz9KTrzDlD
         e1GBxXufAgbfZIzAq4sSr43j/PvKa8lmRl8WXX/rrYYhoPiPcZLMt6LgafC2jDXVcg7i
         I63QIhT0WJIlCzpR+KEGr4PVCNBdj6tl11JQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HMZHC9ScaM+ZTLDM7RVozjnndgAj76No081GmQF8oc=;
        b=X8+ua62m/nJzh6EmvUMzectXpydUkCt/WvJlxVcYBTaT9iUhku/0ybrCJ4XmCbY3Jj
         hsMeiWoZDyNm9p7QwRUPyO1gLx4iOah+JPHxwDNBgrRbKLDS0GI6fYotNHSKcdyTJjRT
         tIOx9vG2zy8wtdmxONUfAN34Rw4DYlNjHgSuv/JmpB05yaYexNWpZY+iFWAdzEY+yyiT
         YfZ76k2DDr14XQL77c+eAtWBdz1xKWNjlpOLRpV+SMYPvH5dWAhAWIuLWwppIr74P42b
         HcYGGd3+TEPeZb7IB54RYuDQO9pPxmzmafVthu13CQXjVp0KyLr/P6WptNw86RSzVKJP
         y76A==
X-Gm-Message-State: AOAM532NuV2DaddHKOCVy1ucGQUosxb2XsX/1Jj4waWLI7QcBj/UQ3/n
	UhUMw2WLMeYXi9ili9/HcZBpB8TI7V8PEQ==
X-Google-Smtp-Source: ABdhPJz7pA5sLK/OM/QWlbi0CakJEaNvNnYUCwQaPWy0xyRcbUe0/5p43rF9TA2ViP3y1XB4AuALUQ==
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr14206523wrt.422.1621204375867;
        Sun, 16 May 2021 15:32:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/27] sudo: upgrade 1.9.6p1 -> 1.9.7
Date: Sun, 16 May 2021 23:32:33 +0100
Message-Id: <20210516223247.2401235-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/sudo/{sudo_1.9.6p1.bb => sudo_1.9.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.6p1.bb => sudo_1.9.7.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.6p1.bb b/meta/recipes-extended/sudo/sudo_1.9.7.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.6p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.7.bb
index b3334591364..4685ca10b51 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.6p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.7.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "a9e9cdc058fafeb9cd3ebfb864c81755e524d98aa022152763f25bce8ca3ca90"
+SRC_URI[sha256sum] = "2bbe7c2d6699b84d950ef9a43f09d4d967b8bc244b73bc095c4202068ddbe549"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.30.2

