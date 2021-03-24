Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.221.1616596814717528446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QLU9oU8I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id l123so17480976pfl.8
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0GiYRrUGtXbeKvv7B4UWc1LTU9dMaMq+FcHSUvll2vM=;
        b=QLU9oU8IFbzeCJtV8ElM9wxzg+zXgqAqoEpXTBOl1bE/OSF1HD7Bu+l/GR86i4WmKC
         DVPasYNUEmldxDF9xyKhnmfyIxEaZl9CNYW9euBaJtnaGYO6jbwrisHQC23voba+dakD
         02eWoPI8UDQaB4H2wl5gbEWThoxrb/VlKOJ20Oq5WsAmL/SJC9STiyzdYQGT4sHkkEeg
         mAppR2xswjnWEczcHLy2f0d1tc8WuJBgAMJMiODv7OW8ZzCkYmRRC1lPKd1NJ3Bk07dc
         9VCFjPxL6Au5XOQ/nF5d1npvIWwnijKfZpbGBmD0kHAN8a3AIJWecb3yJcuiwOWL4zeA
         B4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0GiYRrUGtXbeKvv7B4UWc1LTU9dMaMq+FcHSUvll2vM=;
        b=jrf57gi+OTnKOfBc0c47yJQyuoda1Yh+evh6x/BboAYT0wGKMM5u3pLYhXFWsTiuZu
         1d78lTFp9YCURj3CSDlMxY6YqdeC59ulX4WoWK0yBsqVlYptxPsaZfb9yYarqBb0p1rv
         CYkvYUPhqLBbZb2wnH9Khtlkd/osv3Xg5YZ/9Bv6YOYDPY04NKE5F0kxkxVJhOi0nPF5
         Rp/uRBkQq/n8Uekz5tgtT3yL2fBdiBq+weH6YS0HBhezuVORlBhvo3RtNnxg93grsrDM
         uEBxDzFPflnuVy0I8gGDNvPMjLzRsSQJ/uVR+84wnKRH7IFLgxFQX5ox96jM1r/O83Z8
         ZPxQ==
X-Gm-Message-State: AOAM531tPGHeNoaUGRgNkOnLVICQQMTpoS4kNEQoDavyHJzgWqpVokWH
	OSH2CxLIXjCpz03dA5/xw0/Q7ky+0L8AOSGw
X-Google-Smtp-Source: ABdhPJzwyvxzLhHS8w+IuApTzBoms4BVbOETGMkjEAPje6b0O6yv0QVwTYv9pGBWXvJfqQhSpyT0TA==
X-Received: by 2002:a62:e90c:0:b029:203:90f:6f34 with SMTP id j12-20020a62e90c0000b0290203090f6f34mr3508349pfh.29.1616596813662;
        Wed, 24 Mar 2021 07:40:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/21] scripts/verify-bashisms: Update checkbashisms.pl URL
Date: Wed, 24 Mar 2021 04:39:12 -1000
Message-Id: <34e1adf61a84ad2e697112a7582d2d5dba3cd4cb.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Petr Vorel <petr.vorel@gmail.com>

anonscm.debian.org is not used any more, update the URL.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c89071a2c19a522c1df5919f500b88339ec6294)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/verify-bashisms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index fb0cc719ea..14d8c298e9 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -100,7 +100,7 @@ if __name__=='__main__':
     args = parser.parse_args()
 
     if shutil.which("checkbashisms.pl") is None:
-        print("Cannot find checkbashisms.pl on $PATH, get it from https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl")
+        print("Cannot find checkbashisms.pl on $PATH, get it from https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkbashisms.pl")
         sys.exit(1)
 
     # The order of defining the worker function,
-- 
2.25.1

