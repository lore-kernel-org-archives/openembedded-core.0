Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web09.4792.1630678312794427812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 07:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C7ZPJfpD;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id y128so7033701oie.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FZrTqHXx/v8tAT43R2NRBYHmm1rmfnabv4dt/bQnNyk=;
        b=C7ZPJfpDXjmnqrYCLV8vuzsvdHBD1dzSOs7pvwtkPoOZKoeinl4BRdKalfH8FgpXwG
         Wr9knIrYrMwl6GyfHrLJ28osCBVJhd3ZkJFHJXR13Bm9WfEkyXl3V8pvNHDHmHofvXlE
         /p0ksUNkOmiyYZ57JJj2YDyS6Hn0hl09oYiGUePf/0G3+E9yVOGmvoCRt5vcVGgZZ/04
         w9ejbHJcTKmUxWvZTK5DHhql46D9QuK0v5tiE/lqz8cO27M4xK0xUZ0MjTr9ioYdzTAQ
         mh+tnbKE1jXpKkHebcIuUaw1Hi/qBrdPLtN8Ou/zfTe7ohUL7LcO408oU7MsSllCZC3i
         v1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZrTqHXx/v8tAT43R2NRBYHmm1rmfnabv4dt/bQnNyk=;
        b=hMjlgILc2Mu0FXDZb3ck95b66yHcgTdHYCPCKamGhOm2Wjm8fsLW4txtP77mT8k6Ku
         JG1hiJubwMMYIpyfexTPIi9+WOugIk1fadI7uBWRnGaoop+BQNej0Lmo94A3Osqib57w
         VSAGQEcRZK7t9zsdblJI3HWgCfmumB22mV1WRncpFok7x9L0OTLRPUB3lDKmx6isSRPA
         uEv09wqvJLznh9xZtoboXIFO7bFkr082Cr7WroD2eTkMC8rfevDFz/xyB6M7YCrBD3OH
         IbrBI0q9XYt/zhN9k0sZuUdZGUNWsSlDfmXfDKT/DAR0YzLyCYSF/BkVV8+FeqfDQLan
         fC5Q==
X-Gm-Message-State: AOAM532phrBX6/NtVffmbOrEVDDcIE4Dl0GjKWGUNgSRpqlJhmvrizpc
	F/InqdQSwRmF/5WwhIyj4HucQTVitQgMciRV
X-Google-Smtp-Source: ABdhPJxLOZjkrkzK6x8tN6C5zaMLGL5bS/7U+u3ekvDZa5WOJ19pqF2A3nhR9a0CDi1ZOprzL5Osog==
X-Received: by 2002:aca:c456:: with SMTP id u83mr2935157oif.150.1630678311679;
        Fri, 03 Sep 2021 07:11:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id u14sm998007oth.73.2021.09.03.07.11.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 07:11:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] vim: add option to disable NLS support
Date: Fri,  3 Sep 2021 04:10:52 -1000
Message-Id: <9224b01eaa46986b1c363a541e88f20387d8c30b.1630678081.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630678081.git.steve@sakoman.com>
References: <cover.1630678081.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrej Valek <andrej.valek@siemens.com>

- Some distributions with UTF-8 locale have problem when National Language
Support is enabled. Add there an option to disable it.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da630d6d81a396c3e1635fbd7b8103df47ed2732)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 878d0f18ae..6fe8fb90db 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -54,11 +54,12 @@ do_compile() {
     autotools_do_compile
 }
 
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny selinux, elfutils, nls
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
+    nls \
 "
 
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
@@ -67,6 +68,7 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
 PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
+PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 
 EXTRA_OECONF = " \
     --disable-gpm \
-- 
2.25.1

