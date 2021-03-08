Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.39155.1615222061426012043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qSZ2tJgY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so3307868pjc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r+b/iNPaMnLqb9csTkPlpObnKaiwtLLfw0pDoYI2ZlA=;
        b=qSZ2tJgYXt4G21MoDJy0N7EA0QM/iSKV1wQao/bJgbbp16O7Ijo/GF5w8SDOu30Tc2
         o55Kf2PQHE/oaH3Tix+Hah+9374RTf9oSRhmh2aq3GEennsNvLz6c+xgoWY+rVq7PEQg
         7sV7HLGGIuvTtr7RwDSds/jDAvhM5502VBS8uSxmJ61SHJgoLyzfjvqphAKjm5CxsoQG
         WK8hrpVwNeYBZjbtvefd8ILOYRcop4jiBVz/sHQIAM15V6jBydt1wbdhTi10KT5/kFQw
         vP6DX/9YKqo14RhYK5V/bhmMmvsWM0DGuS8rBaiN9zmaw4Ks96SC3wBf5UG9Ln6f04iL
         gP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+b/iNPaMnLqb9csTkPlpObnKaiwtLLfw0pDoYI2ZlA=;
        b=H5xRiQWN1+Igw5omHia9xEN5kI4PohNWnm3+E89YJW6bvofE2gk5GkM0sbqrZfsLLq
         hJCxqHi0/lk96Vnfn9Xm20Mf7Y4SCoaTS8vf6RYQEpO1y1hpz/IYAMxCAa/X45s7kc4a
         3l+XlG3axW96VgFWX1ECzHhdg3Bs9WgxQg8IV/aZQmmpB+xMzGKkPSYZFuOH2Iw4pmoe
         5StpyLe7FKetbZVT8VlW8Q7clyQKtvqpUqIIgHfZOLyxYhybTH3A0l1wW676w96KjyBh
         0EZx4qqrPYg6kpghdXB+jydSkkvsStG6KcrSVm2YP065e7nMHvh0ituKB+TUVgsQRq+7
         Ginw==
X-Gm-Message-State: AOAM5324XKwpjALJUj/t/7zGYY5zBYFs5VSIoLLa0QyDUpB0w0hpOBuA
	iux7gFRDduRCu0i/gs172/WAqA5fso0EtyaGd1A=
X-Google-Smtp-Source: ABdhPJyNaceBg2hd/wEwj+41Q5gTac+7VUFoVsl4Hje5X+iZzAFPjaDgLbp8chlxDF9TI6UQKvVZgg==
X-Received: by 2002:a17:90a:dc08:: with SMTP id i8mr24747571pjv.153.1615222060241;
        Mon, 08 Mar 2021 08:47:40 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e12sm11256506pjj.23.2021.03.08.08.47.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:47:39 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/2] yocto-uninative.inc: version 3.0 incorporate seccomp filter workaround
Date: Mon,  8 Mar 2021 06:47:18 -1000
Message-Id: <f5965d74822513e1edfc796b646e8a1ca2a50d65.1615221849.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615221849.git.steve@sakoman.com>
References: <cover.1615221849.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 317f8bf320383e81085f5740e202a7edb12932c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index bc47083978..a2a2dd18ec 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.11/"
-UNINATIVE_CHECKSUM[aarch64] ?= "fa703e25c26eaebb1afd895337b92a24cc5077818e093af74912e53846a117fe"
-UNINATIVE_CHECKSUM[i686] ?= "638901c990ffbe716a34400134a2ad49a1c3104e3b48cdafd6fcd28e9b133294"
-UNINATIVE_CHECKSUM[x86_64] ?= "047ddd78d6b5cabd2a102120e27755a9eaa1d5724c6a8f4007daa3f10ecb6871"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.0/"
+UNINATIVE_CHECKSUM[aarch64] ?= "1c668909098c5b56132067adc69a249cb771f4560428e5822de903a12d97bf33"
+UNINATIVE_CHECKSUM[i686] ?= "e6cc2fc056234cffa6a2ff084cce27d544ea3f487a62b5e253351cefd4421900"
+UNINATIVE_CHECKSUM[x86_64] ?= "5ec5a9276046e7eceeac749a18b175667384e1f445cd4526300a41404d985a5b"
-- 
2.25.1

