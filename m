Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.19732.1621260867508642561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QDAVHxwW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id pf4-20020a17090b1d84b029015ccffe0f2eso5653480pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+iwDPAioOW6zpMp6/Ifom+T9aw7c8ABy8YCXpF1AHPs=;
        b=QDAVHxwWpOPwuNIhoAsET0KE1HYZrLGDXYswJkwgh+mEy+xFsJ6zNjsmQITy2HOje1
         XjxEPHIOiIJs35LmWaKAq6ao+tWDURYzcpvj6As6oIotYRxS1pwzxP3ma2NUJY2AQ0nZ
         qVJdE09aN+4Cl0xZO6zP6r018MSWID0x/NILjEd9dLeeLPBwduRBdOOlIPBqC43oStR4
         192BzqGaXopC1txHRetPW9zwCgTX8+Ef5kPEQEDKBP6svMPW42/jLOKvDPtuTlbTqfwb
         2uMagiI8umm7dJM931l7w8ghGFv1asD+Em8WUK7YwNWf4y0cxMSCY76RdD6g7coiku2u
         r/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+iwDPAioOW6zpMp6/Ifom+T9aw7c8ABy8YCXpF1AHPs=;
        b=CSOkdFGZdnJvWM6TKQRAvWQ5ss8LiEuQ9ktn56v7z55FZl6bzhkDiTF1WnrrXSfUwl
         CHpbLUd0MMEvC+Iwh8JSvtM6a+u6USFwPJojzbynf0dX6JDmK86JBkFBkj+26FPQK36v
         bV/csA3qvwbpuWY2vsDF7kaCvHdl4fbJqD6oKVXnChcfj5IEWoicf5+Rjw/pMb6vff4C
         di1SVxY6fVE+6fC8wxKKP4cWK8sgY/Ixx/8T/rlQ8tfIJIjaSPM6u2SYbzS8AU4LR+iR
         y6T9vKnSHzMUVccGj1aNwAxUR18TDXI42fylWEA4itjz0Q2RZZFecW1Cz3p8unzkmR7X
         lNbQ==
X-Gm-Message-State: AOAM531SncGMYNubxSadHJyLDnCiUa4Dzf+1dqV7/eHVL+y/tlGxwgFs
	GKOh/2E8Uugd8/pIGUgKEVzJ85/6W0Z319v2A5Y=
X-Google-Smtp-Source: ABdhPJxcAw7w0oOsiozaKcDaHDrwkNTBw642L8tDTsVxDn7vHruM8zK+5ac1t5RZSM+uEhGikxO8Fg==
X-Received: by 2002:a17:90a:fb98:: with SMTP id cp24mr65817493pjb.24.1621260866569;
        Mon, 17 May 2021 07:14:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/35] jquery: Exclude CVE-2007-2379 from cve-check
Date: Mon, 17 May 2021 04:13:18 -1000
Message-Id: <d18ba3735ff3438ebd60b680e6bae5227c85bccb.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE is non-specific and depends on the users of jquery, doesn't
make sense to have this flagged against jquery as there is nothing we can
do about it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f82843584f6d2843c5bbd2fe5dcbc654a0fbcfb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/jquery/jquery_3.5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/jquery/jquery_3.5.0.bb b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
index 35ce14e152..efffe05fd2 100644
--- a/meta/recipes-devtools/jquery/jquery_3.5.0.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
@@ -17,6 +17,11 @@ SRC_URI[map.sha256sum] = "3149351c8cbc3fb230bbf6188617c7ffda77d9e14333f4f5f0aa1a
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
+# https://github.com/jquery/jquery/issues/3927
+# There are ways jquery can expose security issues but any issues are in the apps exposing them
+# and there is little we can directly do
+CVE_CHECK_WHITELIST += "CVE-2007-2379"
+
 inherit allarch
 
 do_install() {
-- 
2.25.1

