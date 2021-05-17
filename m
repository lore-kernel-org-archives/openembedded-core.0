Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.19537.1621260917711148111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XOWTjMlH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id h7so3224459plt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RcrrIdoB2CuyBsBPTf+FM64sIw3JAD6D8qEjkbT3cyk=;
        b=XOWTjMlHdIaWGJUUcuomtMBYhxyONwHMikOEgxDemlCBEPNAaPw1A+/hOd+l8Zi3In
         0MYHOzZhL2ZJOzSpMIDNz/b2YjhEyvN4pECjzEjba69/uiN7db/2c8Ri1G8GLx5p4lKP
         CZ3o8ouAuRuXheQIJO0kfkedz5I+OaFAx99IjtmCLK9g9zEuPP20LOcJ/uw0+6YWDwAv
         kXCwORMUoyuP+h3sscm+vNGCi0+59CbIeY26mVO2yUtiAYRuP94tbEn62ciyLj+ewujl
         AZh9+hOg9NVXJuyhQuUnoJXn83yXyk2MX5nzMro8bx+eWd2N7aWnZUIIHxNZjsSH2k46
         dIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcrrIdoB2CuyBsBPTf+FM64sIw3JAD6D8qEjkbT3cyk=;
        b=PA75W28bp9iv4JX1oDdC4/gs+yRcKurvmFpojH0q3TeQHDc9ajKmDQ2roHIBiXeCTE
         +G55bneaZmSwjwo+eGCYIs1+v14PXFfcoTBBlaeqXSdj2lbVLERsIZTHzljxtlwk6gSo
         zbuUgKLEUq+JspLTQP0huT7WCqvcyUlOF68zvHCCUS5TsPd/xjdSf6WnDoHVfWxb399m
         7dvqZFNynsU47mAQMxKt3/nJuGP05HD32DVkggoureywxb87KhtGPQpz/jXOX23o2aFS
         E/OdGoQlymoWC9DSVFYGF7EdeT0mkcjTh0POvPXdYKwZT/NKVtolQmTU5DSDsG/nc2Za
         NAmg==
X-Gm-Message-State: AOAM53256lXucuZEwF89WZGvr24ThPBZ7FlY9J6kwomOH9FOJ8h2wNEc
	tf/iCb3Qz+VEE2XcLDm3v6zOtw9K4sDE+ABEUn0=
X-Google-Smtp-Source: ABdhPJwiI5M9PZCWs3Z+0UEXe95OVwcgBZHtXExsC0v8CaszfQwDzrpXAdG2vv4D3kkUbjMF+jpMGQ==
X-Received: by 2002:a17:90b:4812:: with SMTP id kn18mr18617629pjb.188.1621260916742;
        Mon, 17 May 2021 07:15:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.15.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:15:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/35] meta/lib/oe/rootfs.py: Fix typo "Restoreing" -> "Restoring"
Date: Mon, 17 May 2021 04:13:41 -1000
Message-Id: <cc49591d84d241d90e3dccb3e174ddfd737de311.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2621dbbc1181808f18ca4ae79408d0d5b557670f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 23e156c47b..9e9f7f1f08 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -167,7 +167,7 @@ class Rootfs(object, metaclass=ABCMeta):
             pass
         os.rename(self.image_rootfs, self.image_rootfs + '-dbg')
 
-        bb.note("  Restoreing original rootfs...")
+        bb.note("  Restoring original rootfs...")
         os.rename(self.image_rootfs + '-orig', self.image_rootfs)
 
     def _exec_shell_cmd(self, cmd):
-- 
2.25.1

