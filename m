Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web08.9833.1614349546488679728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mlVbo0Rn;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id q9so8162994ilo.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ifNcojWIFtIviZB7yK1YaH4VsInsd/Jiq0f3BBgdCo4=;
        b=mlVbo0RnnTS2Jyc4qiPcTRQgZ9h6Hzmy0JephnY3KUiO0lqXIBv+ly6gMtBQBmyj/j
         FyqC13DFNB0Upz2RUPi7Wu2RjctLXJx7fbNKPsg4sck+bak58qtrzsda2U49MX3/nRmt
         6UoAyhu0diXW+qLgqzBfTJW/laPWGPPPnO1VYi3vC9N08SRXlv5hTqEhLHwBbxuilLTq
         FjwUUgMuv4SyhhPfqlRUIFb1+s+CuoqoE7Nsret3S04ToogpsLhqc/JedtIdkEVQQD7z
         j10OjNnzlBX68bmAoXLSEsFsB67l0VRj80EHsa4oR5b0a0iD3ayLUPfnDh4UBkSEJfOO
         Gs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ifNcojWIFtIviZB7yK1YaH4VsInsd/Jiq0f3BBgdCo4=;
        b=MclpWYoB8VQi/SVyhHfNfHHJrA1SLdLMQl4nci5PP1GIQCGgI7v9CC0oLdJHb1O/+p
         EvDISiOOtp63oRgZeD8YdrQSIS8FVqkd80fz8WjMzFXcEfKmaHOVZeJnpKQ3PuCmZ8wo
         G9KOQ5dv+15PjgiUTjB4JWYf8kgIE0WnLIdGHyIYeZDm7CQpdZx3Vg4wYWjTnQGjwpg4
         SkUHRojRAEOz/5jP7WUPUCDfy2jkm4aWMpez25SnU9Cx03Q41BW2tCDVQxU9qFHcq+ob
         i9JNzGurKpkOJzTp/CBgd8s7gczq1V+33zYargDcloqoaIqHF9WS0E3LjsGcxE9nrE1l
         OGow==
X-Gm-Message-State: AOAM530IuWoWLIidAuHbFfvSByroFPN59zht33NxlVcYGa8SpLlNMsMH
	idXQbeUTOdeYXspwBQRYJa+DXPYNQKr4JVax
X-Google-Smtp-Source: ABdhPJyxwJ3RtC+kUU79R1Vrnwf6CpBhWaOoxqd3FGEm79WZwdkAAREcWbv4LYwuT+pbimHJA1ChOA==
X-Received: by 2002:a92:dc01:: with SMTP id t1mr2621591iln.192.1614349545313;
        Fri, 26 Feb 2021 06:25:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/40] connman: update to 1.39
Date: Fri, 26 Feb 2021 04:23:52 -1000
Message-Id: <078dcf9e389078b01fccd61747f0357ecc4af22c.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: akuster <akuster808@gmail.com>

Bug fix only and includes two security fixes:

CVE-2021-26675
CVE-2021-26676

Changelog:
- Fix issue with scanning state synchronization and iwd.
- Fix issue with invalid key with 4-way handshake offloading.
- Fix issue with DNS proxy length checks to prevent buffer overflow.
- Fix issue with DHCP leaking stack data via uninitialized variable.

[Yocto #14231]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb20fd47d738f469f7bbeb4b8d85040f9163722b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 1ec530801ae62bddeaa434d792ed9c2640f9eebe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.38.bb
rename to meta/recipes-connectivity/connman/connman_1.39.bb
index 027c41e9af..df42e9ffb8 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.39.bb
@@ -9,8 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
-SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
+SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.25.1

