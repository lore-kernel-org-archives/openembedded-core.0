Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web08.9859.1614349640926184064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y9cvPX/d;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.47, mailfrom: steve@sakoman.com)
Received: by mail-io1-f47.google.com with SMTP id i8so9781550iog.7
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SpNogwdW508ZxSIWYGzOIezYuoBlXyfbBp/k4qjJxCI=;
        b=Y9cvPX/dUKCj7oulauPkNIPza+KBShVv54sB8PABF0abRBjf6pQwRNHy2K3urogkwe
         PEAcImQsTFTQEBb8MX8xocNJoLV5kg+TnZfXoC/An8lRdKh6Bsu86e07E9qrx/zor7vQ
         sBpE52HzT+Rw4ITK7nQ5yVKRbhThEJ3MDLg2OswewTJKbQGRqLLh80sMFKEjxPO1JWoo
         UTRW3YLOciAHd3fPsJaJgz58xrpIKYqAXZyqHMvmoo0tmRkExv+yLm56XVsNQkPr7E+i
         NohBRiHzvhUVm4w1d15MGgbnD5OiEAEKhTiRTS9UPxnqjTGlvwxKqhzaUD/HBCEIGLPH
         6qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SpNogwdW508ZxSIWYGzOIezYuoBlXyfbBp/k4qjJxCI=;
        b=fAxEcPbeYlwylpYirYUxmZQPB/AdZINI33vY6+oITyK1QtctYiyBY0derBpjuKZtD7
         g7mD3vl3gAW3mHQ60x+/ICYr1TpPODXcf9z1PTHIbMGaksnzaiEdkfacSJNKty+Jgw+B
         WKPSin/htAHug1jo2PyRLCmZhMPSdeVuDkn6xpC7L1FQ4ycu7nHLrGKmfrimMxsVqFSP
         5OaMGvlMN78t6Q0xN6S8/6zXVbn0FcxKP7enI8WjOhWeRYAA2v781SGJ+qoLUyCQkjo+
         H6+Zbt6oqU/znWyi32ZdnsLyRq4bjq/YXEQv5LoR87rhKniC1lXNlZkYKYfXe5jp4rEs
         7Qxw==
X-Gm-Message-State: AOAM532N3NCiaDYkmj2NcHR6ZQUyMDjwDXlY0Bq8SnWRZZxupcdtZsWu
	bcaHN9ThkoUiqdug/vp96wv+Y2HyY1GbKDV+
X-Google-Smtp-Source: ABdhPJxEnH9+sxEatHl6AzwTsS6d7I3Xw1rHlIeVDn7se/UyhnC7DqVKW1fglvbOO6gQvJeZU4/Qkw==
X-Received: by 2002:a05:6638:1901:: with SMTP id p1mr3173297jal.124.1614349639875;
        Fri, 26 Feb 2021 06:27:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/40] local.conf.sample.extended: fix double 'of' typo
Date: Fri, 26 Feb 2021 04:24:11 -1000
Message-Id: <be7c74bbf35b82431b98780de3e08f8f546bd3f0.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivien Didelot <vivien.didelot@gmail.com>

Remove the redundant 'of' word in the INITRAMFS_IMAGE comment.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de9544f4654510ac33821b7f170de3074205a221)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/local.conf.sample.extended | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 443b4e83f9..6fc618e7e5 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -334,7 +334,7 @@
 # The INITRAMFS_IMAGE image variable will cause an additional recipe to
 # be built as a dependency to the what ever rootfs recipe you might be
 # using such as core-image-sato.  The initramfs might be needed for
-# the initial boot of of the target system such as to load kernel
+# the initial boot of the target system such as to load kernel
 # modules prior to mounting the root file system.
 #
 # INITRAMFS_IMAGE_BUNDLE variable controls if the image recipe
-- 
2.25.1

