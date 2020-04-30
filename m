Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.2176.1588285872325979211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GswVWOB5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.195, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f195.google.com with SMTP id o185so3625357pgo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wmXVlW37v+iA0Nc2t0PM/jQf7hCHMTvPIv4v7Mhg8bI=;
        b=GswVWOB5gCWpBOEHczRxBB0dbA6ozEb+0JJa/cE8kl053TwCB0dAfnPkz7+vpdBenL
         q/Ng7GXS9kd2vdlkAetX3bohsOI60c5catrVmscqCx1g2zsvAdzJdEzCdJ0dtxHaj0xZ
         bnDcQZQEU7sJRIOYWm0YTnfglB4VpvzMCsdcZ3xdkUDekud/hT/eVxO4C1qwAB4Hv4C1
         v4Pbal6ri5YD7dFiCk4JugL/s+Mv0aYge/ov7HyjFuxy3zEDQHPAeKZYs7jwYhiW1tJh
         4S7vFspNrHD5vJrNIay4XS4XDfWGZzH4VrruPUeVF/cIR8KbzpY2rlDuRy2AlOysj4Cx
         YM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wmXVlW37v+iA0Nc2t0PM/jQf7hCHMTvPIv4v7Mhg8bI=;
        b=X73UWx2WF5cDjHYgiOgpRLbqf4vT4WaBBzvw6LgNlIidaxcfFPWhio/+5WqqvADbsV
         RWPUEBf18i26gH4++DATW3pBqunnYV8BC4Yic8kOUL+6LrH6dohpOEoen2pzdKN3ah8N
         02LcjQWYgf9mhHvtwIfWLK60LfzLJuPORxU+Og62vQjN4BdrAa2UpS0M+AMLMAI9UDwW
         O5ptS937FeKAVhExlWWLIPQKjIEJ9gfgdz7LFCz2MN/+U7F5vL/srcafoNlsoUfiINg5
         YcL/E6E+XZ7rJ/SSCDBU+jGnyJANLEeO3jsCZGf1w4fQpOZ3jE+lbY1ixyFRYQ1xlk+F
         wlxA==
X-Gm-Message-State: AGi0PuaBj9Uwu74ANBxJx17rthJRTgEzv969eAgUklqN5JIYMZVuKLHt
	I5hLuNs4PxjkT4W8nmsVmFKmXZx16Ef2Dw==
X-Google-Smtp-Source: APiQypK9AzPFGnwoFKPAYif87RsO3hihjEycLeyJMHlRaGo+RMq2aV/n7nRnCnQGwfUUdUcYg7wTNA==
X-Received: by 2002:a62:64cd:: with SMTP id y196mr1023121pfb.116.1588285871199;
        Thu, 30 Apr 2020 15:31:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 09/14] gnutls: upgrade 3.6.12 -> 3.6.13
Date: Thu, 30 Apr 2020 12:30:14 -1000
Message-Id: <41d9beb709713eb5a16bb31393717dce71db6018.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.12.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.13.bb
index f1eeebc807..f56d42a613 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "a23900f14980a467bdce3a0fd31dfa18"
-SRC_URI[sha256sum] = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b"
+SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
+SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1

