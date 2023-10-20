Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660E0CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.57861.1697817102448705231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ciw4yJ2J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso846229b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817101; x=1698421901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgBHHUNo6p2x9/2KeXvYlyk7ceaNjsjfyo/ABYrk5pU=;
        b=Ciw4yJ2JKHoRXtz2Q+/s7KfYiXbSzWfi4hZnbheHluxIaR9XSnMN9MYr3yIKVAMoBA
         iH1Xk1XJ4mQ8znQ5z4pdGVf3P18MDqtFK5s1GjAmqQkBVSz5CliV3DAviP4PQ0Tw7xi6
         8drnu6/53Yq0bXre7CCGLGxyd2SJD52/Za6xB8gvZKGHfmlXBZbpNuNNY+GMA9c7P8rc
         98wLtE4DHtAGAB2+zShS/7FOwQrEF9XFnbqnGPjbxsgQg8FiwHVyt2k9LucZh8PbwB+t
         NM+2v6plsT+q0MBJt7PYzgsZktN5NN+w+LVCN1jeVG+rWmjQ1b+EBdafpqDd14t7KRAN
         h4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817101; x=1698421901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgBHHUNo6p2x9/2KeXvYlyk7ceaNjsjfyo/ABYrk5pU=;
        b=we+8y0vJN3X4oY3cWDbwNogYnoZ3hVci8cKFWVG69Zo/WU+gikmkmaLMplXOP8VY81
         NpJgLP2TzPOnCTjOb9P/M0ovxWlm3pnZSMQb4Tp1ysvtuDnUq3Hj3mtDVXAc3sKnn/Yz
         GxHiUknahjN/A4YWOi6UvnjVK6xN4NZ//eV8AQ+81mpQRRYVC6AsA/o/DMMKP8iTXnYG
         2zQ4jo1Do2UWWHwyVjKtORPWCU+o74HdA+IU6zX5JsvX8QonLNVzo4MXtxi4Y/LlXcmS
         XzrAVY7tkR/K51R/sJdkBog9fUHZuyBCCpqpjbLtOVK7lnGikN+OYn/Z9Qpd4vNHyBuO
         knOA==
X-Gm-Message-State: AOJu0YxR/OD/BmASDK6jb3aWi+eiVrJVdHgH7l7X1lNTMklM2ZztNkDE
	WC+7CpWwOs+nN6VPeSg6vBfY2RZ27KOAY32hZio=
X-Google-Smtp-Source: AGHT+IGU0yo1ra5JvSegFmPdsO03H1RoSYZMqiXDCknkqZqUQ8/Bw7vjyiPqfeM/6be/2KZ00ndXwA==
X-Received: by 2002:a05:6a20:2451:b0:135:4df7:f165 with SMTP id t17-20020a056a20245100b001354df7f165mr2245394pzc.21.1697817101584;
        Fri, 20 Oct 2023 08:51:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/24] python3-urllib3: 1.26.15 -> 1.26.17
Date: Fri, 20 Oct 2023 05:51:07 -1000
Message-Id: <7466db00ca2f884cf58504c3910b858a87f33128.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189550

From: Lee Chee Yang <chee.yang.lee@intel.com>

1.26.17 (2023-10-02)
Added the Cookie header to the list of headers to strip from requests
when redirecting to a different host. As before, different headers can
be set via Retry.remove_headers_on_redirect. (CVE-2023-43804)

1.26.16 (2023-05-23)
Fixed thread-safety issue where accessing a PoolManager with many
distinct origins would cause connection pools to be closed while
requests are in progress (#2954)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.15.bb => python3-urllib3_1.26.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.15.bb => python3-urllib3_1.26.17.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
index d2de7c4c02..57b166870a 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
+SRC_URI[sha256sum] = "24d6a242c28d29af46c3fae832c36db3bbebcc533dd1bb549172cd739c82df21"
 
 inherit pypi setuptools3
 
-- 
2.34.1


