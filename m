Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.1512.1588648847005780248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qH00iF5/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id mq3so404014pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AfP6r3yCi16NzJSf7hriAFKaFP6iQ2JtgkDGz0FeMFw=;
        b=qH00iF5/dhqLDYc3iK3D830JK7dZNraUD3ubD3bo6D3KlF0cu6n6zGM8Ze6n2D4yWh
         7+eofBZvjZnosZqhWtZg9vZMayDU9hxYvVAtNqk5AZqDXPO21WY80XqqD5j/yL9nLMIh
         zu6wIDHhhbSVLNXxa8i4+Tr1RoLzl2RI9db3gjoOuy58a9xHrMmVc6l70QN6u/CaPXvt
         TP6r7VbX+DcS0QTxfm9rdP4mUALIyCHHdzP1C0JLlD00dvnK/lS82khA4oBBZtlaYKCt
         xC9QAJ1eLBPySx0gUGsm0n1ovW2GQUvA2JTfPlGaIXQBEj7a7MmVEFQ10nsEo9n/p3d9
         WP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AfP6r3yCi16NzJSf7hriAFKaFP6iQ2JtgkDGz0FeMFw=;
        b=BjYOft7cTm+V5YuUMBRbq12YsQFYmmc/JETqhIlch8xrrUN0zUp00KauQFpyzpHI4r
         LqRRrC4oIOg2k+8RXqHF3UTxzVZMfVvKdWeBPorUyqyjL+I29OXQ0sn1JAdT9ilYh73W
         bksCgFytZYHOBM6xvBaFifLWRU9gXxtavmCTD3h9dYlsHDAufjEAAOStdRbuPQDEVG2J
         N/ZJFfKbuRcsrpt1FcR467ir5w9oJIWwdd6gMD8xVB70zw9wgHo34F/++JWIQRE3bHvo
         +H8wSZtLYTT9ink0Dywic60yj3gKNMwUaJry1RwU81yyEwS4E2N8lHPsWyjxazneRWsV
         I4fg==
X-Gm-Message-State: AGi0PuYTXKZOPpCaMV0X8XnALUvMXzwMyEssTU5ZmFxdtHwk2tgQJX6L
	qkkJY7bazrHW8ERmOm/VugfLt6JMsxygQQ==
X-Google-Smtp-Source: APiQypIIhJbjF/Snz5w1fXBRCZ/nLyxv4A9G3uUu1MJnjg1NsUVOoFHbd/m9bfdte8oaHQh60ZD6og==
X-Received: by 2002:a17:902:8d8d:: with SMTP id v13mr1125502plo.67.1588648846018;
        Mon, 04 May 2020 20:20:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/28] scripts/install-buildtools: bump to 3.1 release by default
Date: Mon,  4 May 2020 17:19:11 -1000
Message-Id: <f1d4da322d607a17de6d9c291562b5fd1128fbc6.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Tim Orling <timothy.t.orling@linux.intel.com>

By default, use the extended buildtools installer from the
Yocto Project 3.1 "dunfell" release.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 9da364981e..c6b3a1eed7 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -56,9 +56,9 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-3.1_M3'
-DEFAULT_INSTALLER_VERSION = '3.0+snapshot'
-DEFAULT_BUILDDATE = "20200315"
+DEFAULT_RELEASE = 'yocto-3.1'
+DEFAULT_INSTALLER_VERSION = '3.1'
+DEFAULT_BUILDDATE = ''
 
 # Python version sanity check
 if not (sys.version_info.major == 3 and sys.version_info.minor >= 4):
-- 
2.17.1

