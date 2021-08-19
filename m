Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.74174.1629400115561011350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=B5iD4AHT;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id u10so9852787oiw.4
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y8JxgWd0hOze2GjFReph1AKXeWCWmbzJXPZxH/9JRJ4=;
        b=B5iD4AHT1g81AC4jpc9IMSjo5WtryTwSDzPUX9kDSMF4z2MEPwDZOE98Klcu5Usmhn
         IpFUDksKnUMqgKdlGghKb62lY+F8zO3XKAJs46w8q7v6AhNBT0pw5vgjSdREW85sXrla
         36Vpa2pQXAot0zsyUABZrrmDiVIANbTMJOMFaLMRBexrplfWMMoBYp1PYf181Sp+3r7X
         S/yyHrq4YBYg6+lyq7xFQ9YtVKT0ydDJ9TiVZetsHawIa6MqJYgD4meQ+3wkUGoE1aG5
         mDxeRS+kuZUMHqlkwXNQ61PTZ1CVAIn3LfG0o4NrPOQGa9GNIlLktb7DiNIeqt+u/HcQ
         NzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8JxgWd0hOze2GjFReph1AKXeWCWmbzJXPZxH/9JRJ4=;
        b=SQUX74OXwDAlnAYWLP4YfK0OjNh+zwqOPYu9zteowgWRXnA9fpnp+I2Uv2IUgnwAxa
         lroE7W57Ec+UAyDscU0qG3X0Don2lGKKJmuhpi2zP6sKECKN2fZMxplkjZ8hAsLK9YFN
         j7f7XOtvxYi+Y6BIBYSwvA3XGh9m0fgd5YrMlGWfEwsScw4SjSldCLJvl79G58+0Hz4X
         jduIaaQLihK599KedASvhgMkMcfRAJXW8IjLH7D12nA5diDbBbCNiYgERqYEHR4Emcbx
         YmSPgXC/S/QhNzIYO3nETApXWdY0tOJXRcrpofIp3Dqkenk7RvcYHF2vf7ReAL0TzjHD
         8SVA==
X-Gm-Message-State: AOAM531sbNg8hUa/gu5dXBiqpThVW0d41qLeCbHlKk11H51urCY33hP7
	I7wGG254k7hPuqH03uayO4Ndltw3kBLclGAS
X-Google-Smtp-Source: ABdhPJwjrGfnVU6L0xz9wrOJP8AypXtDqmflOUhDbwCu1xetcAYjKNWAVqSa8TRp7qlGtXvFU+9Ofg==
X-Received: by 2002:a05:6808:14cf:: with SMTP id f15mr168924oiw.145.1629400114502;
        Thu, 19 Aug 2021 12:08:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:08:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] tar: ignore node-tar CVEs
Date: Thu, 19 Aug 2021 09:07:52 -1000
Message-Id: <d1b09f81ad80e5099ae670c965dcf7d39ad09ac1.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

These two CVEs are specific to the Node package node-tar.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc7216e8148d0dee7b56e6851da6615e93647a0a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/tar/tar_1.32.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 3ae6d674a5..0fe0b801c2 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -65,3 +65,6 @@ PROVIDES_append_class-native = " tar-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# These are both specific to the NPM package node-tar
+CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
-- 
2.25.1

