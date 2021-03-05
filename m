Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.12796.1614955682287205913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DgpQ8syg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id c16so1543848ply.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mx2A8E9qfaLrUgxkd2g7m98z5RxbPlUFLP2e+5Ip/dU=;
        b=DgpQ8sygQV5TGeGMDhEXjeWIZ1KJuzYIgp99rDi6kTkDFOeMo+MKMiH3cPwXXmHmXX
         2+U+7mU/+pp6EaSymnVPptmOilBc9mkdg8WAntd/1o4o+1+TAZUIUQNMEcyvYOVxQaRe
         B0xEpUElq4oNLdFl2D2W2TTa7yps7l55hmR9bt1cW9HVMetDsfnAsGz9TioLnB2bWhnZ
         225tS4CFcSXu9DmFmW50u0YwFAPDjTBBkO4gZ5VDs1f2IGvdk+nzMooTa911Sr5UPli8
         sGrV75EOb0CUG3uS/IEgDcvI534mB3E+EZWcu3yPM4UgIfUmmi0boxOf8iDP5wlAeob4
         H7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mx2A8E9qfaLrUgxkd2g7m98z5RxbPlUFLP2e+5Ip/dU=;
        b=AGwPxV768aWW4s4WBuO3sN35xpjmUy6CZyvg+up0ZYs1q+YuBeGkUNWiR82TOMRO7j
         FyrZPeGDh3HzP+pYglJatyb1Z7idhGmJH6jzwAvHy5PHLc25UWBypQrBHUc3SMEmd6zt
         ounx1kUJqkTugM9DCEv3+nmvJuVtGaPv0yH7003xEBD25Fu0bdIt3uVKKOyvmDlgTqno
         7cDIK0hosOxguSvTRsZrG/dNrVKH2Gn3V5uYRRfqSPRdo0CknUUFkqE7373a9X2sLEhw
         7R29y5luKbOabhALWDzSgWXzdtPDCoNkKkzJEoNKJZ7U4zdfxs4P8obKq9wbacpYtArL
         jPHQ==
X-Gm-Message-State: AOAM5336/lvwRxgVQQZiz03YXVQlggIHA/Z/EWez9k9qFXEZKmIwcin9
	ZvkkUyAOeAG6bZv3HFzHScimsBqvgVWdu5os
X-Google-Smtp-Source: ABdhPJxxdbzYYxG8WETRgpqobTtWBIMxBGWkMxvFIwzy0E2zRvaZrCQFW9Bd8Eib9o3BCSMGI9JCeA==
X-Received: by 2002:a17:90a:9303:: with SMTP id p3mr10104059pjo.201.1614955681319;
        Fri, 05 Mar 2021 06:48:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/27] bitbake.conf/image: Move image specific PSEUDO_IGNORE_PATHS to image class
Date: Fri,  5 Mar 2021 04:46:21 -1000
Message-Id: <8a6c1c722d7038ef4f3ce318bc3a38348e22ad74.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This path is image specific so we can move to the image class
definition of PSEUDO_IGNORE_PATHS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66a8ca0f206434e0b301a8fdc90f062750d6d118)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 244f5bb8ff..42d2886505 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -180,7 +180,7 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo"
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo,${WORKDIR}/sstate-build-image_complete"
 
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
-- 
2.25.1

