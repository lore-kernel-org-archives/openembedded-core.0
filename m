Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.19352.1621260849879870700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kyz8r/Zb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id w1so2377063pfu.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZpO6oN36Zo4CJzzM2XCqxpuUSi+xuX0lbsHd9Qjjj2c=;
        b=kyz8r/Zb8KmcJadJ1ai4LAvj9yBjOhHLiucp1S9byo60UWdZ9Imhma8JIRSDUy44dy
         Rq6B5t85jGXyfMRP5WJYXWGSrR2wlm+Gvf+3pLYqoyRD82/lppbepo2+AgIw/n4zBCQA
         K/e/3rIc6pucMKvjCz0PXPGOGVwkxG0ASye0i2JZ4ueM0GohevVtRjNKkd0j/lRPWzjC
         +3sl1KI/KWKa9BklxPCjV3oLsGLvFaX4eZqiFFiWmXFhVc6hqgoFclosoNcInhFdwIfk
         7MOvCYMAfcxi0SsJ1qvxh+KO9EE/ZT3dhK8k3MvDXKbysykSGGXcXsJZqNRLApSPiQXU
         tM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZpO6oN36Zo4CJzzM2XCqxpuUSi+xuX0lbsHd9Qjjj2c=;
        b=NhHk8yyBoOLt/JHbsQWQvU4VmQ2MlCOFjkEvd/R0Yn+v6/6xryTMDHQ6cExE3HgAK4
         YKqDafyWCPbwGxQ3pKrcFrsRBLsdhhNWae6lnKrm+WLhUvORHa/Ts5vpw92ibLIQl5C9
         VsVlYkPXJkHrh5VxJfICzUhs2K4R3Bd0zCLicYIFNXikFu4kKtCUnaWzYMQ9V2Uf8UWW
         xGBuOUZQg7fDZUozgtKcZWexh50lf2yd3uFuRn9mx03QFgGenV/RR0fAcStCeipyhwMr
         PALhq//RYo963eqsrWstav1qSYSbNGQVQcFgjdmfAxc4Ud4q6ULpxE31tYEo6CrxYWM1
         gsVw==
X-Gm-Message-State: AOAM533hJKqgXnaGymz2uQruK46g6ZseLli/nXaYGwbYg2UZmkEcH8AD
	FsNsqGtNh6oKESvOCHoWdX+4idW7u6F73SIKzU4=
X-Google-Smtp-Source: ABdhPJxDrJixpxBxgdLtXD+ZVKhc0P48Vv8XOgzM2AakiE04gBZ3CDoBmWZ3TmgcKAPYp6AWdHvdEw==
X-Received: by 2002:a05:6a00:88a:b029:261:6d37:dac6 with SMTP id q10-20020a056a00088ab02902616d37dac6mr59958342pfj.18.1621260848940;
        Mon, 17 May 2021 07:14:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/35] python3-jinja2: 2.11.2 -> 2.11.3
Date: Mon, 17 May 2021 04:13:10 -1000
Message-Id: <9485d568b2b9e2143e1f46859a5c1de644c69b94.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fix for CVE-2020-28493

changelog:
https://jinja.palletsprojects.com/en/2.11.x/changelog/#version-2-11-3

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 45167d52a2..dbdf563f87 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.25.1

