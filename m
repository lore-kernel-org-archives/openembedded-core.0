Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.10568.1628177771259059098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Kd3scsMT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so5563306oth.7
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ir73Un5Q/fyjaYOpu+RI5vM6ple+LJIXEBQRLBMhmgI=;
        b=Kd3scsMTrul8Ini1HqvbFsnlzCS8r/t8gl92+wv9r+xIPTleSApoo0MK8T7qA14xrL
         pSVbyl5SsgBfmr/8hQTvpprnKbcl+NBjPbMZjAj8Oy0DGuzIWt5s5FCSzMqGddLCYanN
         zViIk21gEo0msPflRVZPKXS9JWNREiWkx7Nn4ywXmrz1lLfMDfMCzoLrnyefEJHu/LXv
         Sk1QyKQclyV6AuD2QD32nRmKB3Y2uYZvaz8iZOgrI+dKvA+udK539gq1PYUXhfSUXlAw
         UnTNzWzjbnYl4r3xZYZxyETBLiA9joc1Cjk5Aam7BLsOXH+XbuiipIsMXUxmu4EOTdmr
         QK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ir73Un5Q/fyjaYOpu+RI5vM6ple+LJIXEBQRLBMhmgI=;
        b=NCsHB1Tq8VlUVk2K9qGkHWSa33ZQA42F356vfnGeIk7qNP9jt23PMVrUwhByOD1XH8
         CzskU0Iz6m2y72t4SuiwGO6lIa0BQTIZNtHm20Vc3Jj8KT8KyqR28tukmVkRNq2RHQ83
         14IolziQdSudRvUwC7sn7jGCJbEszw2TGlCBXqQQ2DPKatGCaGnw6Z1yHMPizkfCBbLM
         XMv+uYLm9jp/ylwnwdGuqqmhLZoG2BGq38R/E3yGMlpn8c1sV7KjBHJhW/ZjgXv+PkrU
         rDH0FNiNpg/eHKgiIkIebAs49V+l/aJT/KQR5SI2f6EDXtCMo87ZK526i1bep1KV6c3D
         i+cg==
X-Gm-Message-State: AOAM532gJ56YBD5oQ0/7CZsyll1scPOCO+4PhVhNiEIKd29RhYh7DUeB
	hojToBg3xTMP4WdA348fqUMX78mqKdg4lB2z
X-Google-Smtp-Source: ABdhPJzt/QIuquheZiVBk2sjRtqYV+ggYgYo/kkdxGo6tvR0aMu4ggDHyXZm0/tz4KkPTe8Oo47t5Q==
X-Received: by 2002:a05:6830:150e:: with SMTP id k14mr4211968otp.351.1628177770214;
        Thu, 05 Aug 2021 08:36:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/33] bitbake.conf: change GNOME_MIRROR to new one
Date: Thu,  5 Aug 2021 05:33:49 -1000
Message-Id: <0fad92768c505967eff71da1320a082674879dbc.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

URI has been permanently moved and returns HTTP 301.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a3a85d54af38a30f6de5f6d23e432afa26859888)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 76942d923b..0141919021 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -639,7 +639,7 @@ APACHE_MIRROR = "https://archive.apache.org/dist"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
-GNOME_MIRROR = "https://ftp.gnome.org/pub/GNOME/sources"
+GNOME_MIRROR = "https://download.gnome.org/sources/"
 GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
-- 
2.25.1

