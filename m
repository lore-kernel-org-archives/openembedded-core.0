Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2741EC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:37:55 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10678.1652193472586085842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xeV/NTTM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id g8so15104052pfh.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+dIQarRPcBQurkwbXz/zaIgyPbaIXZ9M+dppEQL7noQ=;
        b=xeV/NTTMGSPHVJvfcX3IvkrsaOjyzcMQ6EWm99GHABB8kkHnYrXhTQgnyUq3DCBZZG
         ny8A2uiOWp/ArSfBSDfVBtztmhtmwoGXty3AXe5Uja5w31OLATQXcx8KPq0TCdOc3HCC
         /nIUVzkWR7P1GL8VjOjCntEqV1ZLY7D9ovZRf4mGgaJmZP+4dTCtnEYsAeWvusrvMM5l
         ZvAWxkPXErG7MqpPW53F/KgwHXW7r69vPAvzkcK0oD6XpWg0lZIUd/5VgGX+6pmbxzvj
         r9eFoioXuSacSO1WdYj3TVepz2RdEgnslFPheNL2diIfblW3tBn1jmmwyYl6yx72FAKj
         U4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+dIQarRPcBQurkwbXz/zaIgyPbaIXZ9M+dppEQL7noQ=;
        b=vYGmLnU0Ailh5FbYAAgSlD/VAThMj3O3hf0+iUVCKCYbeWtoU+rYCbIbyBKQONaD9h
         wuToNtTal9RPzVZlq8LuNAZ3IN9sQCWrLxm4FO+8PjdF9mcG6XLcoWTI0ne7gz1HMufe
         dJQTCaWZ1m0bFTz687tGETFaMsupyrCDnWY6U+h50XLpNpvfPkO/3OGyhlW15CcljH4z
         /LYcnX1P2y4yOAvhly/7tYERE3W9Z5XLC0kcbE5frM3QoQdHl+UEeO6aBFkJ4+nJIpPd
         2mQeJc2PyB41egA8q48vRzW4Z90vHFeBPHGmBv7uN3LM8CYvHWEhe6EJTaPkxHWRbMn1
         +p3w==
X-Gm-Message-State: AOAM531MAa2fk1mLmh3WJkRxXDQ7uQC8+Zkd5SBwMWlEBAhfjC3cV8GP
	V66+Po5ocZPNyAGFoUL0GxnvjhdVFUV8GyWO
X-Google-Smtp-Source: 
 ABdhPJwS7p4GkvJKHzOmXEQHpbqxjrEJpg/7YJbEXfrMcW+uYhG+DEeNq6zQRJV2VxvI/aA6T6lSUA==
X-Received: by 2002:aa7:8888:0:b0:50f:2e7a:76b7 with SMTP id
 z8-20020aa78888000000b0050f2e7a76b7mr21025950pfe.48.1652193471449;
        Tue, 10 May 2022 07:37:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/40] go-helloworld: remove unused GO_WORKDIR
Date: Tue, 10 May 2022 04:36:44 -1000
Message-Id: 
 <2b5c773637317b812f5bfa167a70d858ad5274ad.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165422

From: Chen Qi <Qi.Chen@windriver.com>

The GO_WORKDIR is used only in go-mod.bbclass. As this recipe does
not inherit go-mod.bbclass, this variable is useless here.

This go-helloworld recipe was made to inherit go-mod.bbclass and build
in module-aware mode. However, it was found that we need to build go
recipes in GOPATH mode in order to support offline build. As a result,
this recipe was changed back to only inherit go.bbclass. But the GO_WORKDIR
setting was not cleaned up.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70bc5b6d40f94bde82415fb87db37fdf2606c2fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index b3a8631794..0055b32d60 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -11,7 +11,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
 GO_INSTALL = "${GO_IMPORT}/hello"
-GO_WORKDIR = "${GO_INSTALL}"
+
 export GO111MODULE="off"
 
 inherit go
-- 
2.25.1


