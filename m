Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5B6CCA484
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.8747.1654338391668538044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L2NCD34x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q26so2916640wra.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ItFSxChfghlrFdTvi11gsk7bslFVau0uQlIp0NLaUzs=;
        b=L2NCD34xkHDd6v6FkmTUOVbIyJ5rtlL+lyRtqHBQrIWrj3VdZEBMoWrM0fnrEQzBxW
         Re9JmwYrNyTkGXfk4OblSZ6XzZIyBKanVNXTjak5OOy2JG7S91mz3CXS0LSuAWzyfmyv
         D+97SFVfA8pvYK0gpgkU0EGmDGdx5HLGNdxu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ItFSxChfghlrFdTvi11gsk7bslFVau0uQlIp0NLaUzs=;
        b=maakdzJHhqIkMORPYMiTnYCFQZ93HA/rf4g9mpejIgcyJXdftwXMkr4bTJNcyVKRBo
         00X00IWtdjhfHwp5QVT4TZz9impp3zxh7+KrineuClS5gZctpVmgp/wJECXxqK6vC1NZ
         9k6N9VDn3WiZBp6vMqETiOzt0Lud3Td3MX9NKpRpwba3mbq5TMJOTsOGLVC/I0YtABNI
         ZBUO/7nxIpZIZHEBttHBdH3dRbxewBt7Q2ZgtKwzS5injQF/Mzz9ey5Key6Cnat1XM9l
         CQtr8rXYCgckygQ6DYcAPZsKe/tYfFZx/kh0Ypnj3iKCHtkcKo96iB7+fFhaergjgH87
         lxKQ==
X-Gm-Message-State: AOAM532LBXKf6ALkYTQU5DjAzrw/z+7Msb1HsTP24u29LpLqnpwAliMY
	SpICjo43zbeBGIs7wHGl1xkuCXCWNzgVD1sd
X-Google-Smtp-Source: 
 ABdhPJzzAXGiAE2rsVX5d0wN0U1FIDLcC1X4bGi6/d3S0RfpjX3GmZ6Pc+INeYOk4rZ+5872A471bw==
X-Received: by 2002:a5d:6e8d:0:b0:210:2ce0:e2ae with SMTP id
 k13-20020a5d6e8d000000b002102ce0e2aemr12171595wrz.364.1654338389307;
        Sat, 04 Jun 2022 03:26:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/17] python3-dtschema: upgrade 2022.4 -> 2022.5
Date: Sat,  4 Jun 2022 11:26:11 +0100
Message-Id: <20220604102625.199845-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166549

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-dtschema_2022.4.bb => python3-dtschema_2022.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.4.bb => python3-dtschema_2022.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.4.bb b/meta/recipes-devtools/python/python3-dtschema_2022.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.5.bb
index 7bc89c844c6..0520dd76aae 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.5.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "c70a644e0100b5bacd44839a2316291d8eee91f6535a8419459de59fd0fcf6ce"
+SRC_URI[sha256sum] = "147ff18bf446131d3ba14bc751febd84f4fdedf06130f53e193d3370052dfe3f"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.34.1


