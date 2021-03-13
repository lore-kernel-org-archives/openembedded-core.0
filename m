Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.2794.1615661562272040667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uE6kEnQ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id o22so20692745oic.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AiKFIyoG5UGp9LBBHyhAcO1wtY6nsiOrgCx4t2Rir5Q=;
        b=uE6kEnQ/YnoLaQE7+dWTN0HVevpMrYfnHcpwXwcQVOzeu7/rJxpi1HXlPB/ljbvHKa
         7dqzkGvwyYLOM74wiokSdjuqcmuxJP+uFXkZnJwTmEPGl5uEa5TjBqhG2dz/clYk3l1T
         658UnYe2Y99SGqyRy78hCJdUpqUqXNblfXfrO62huS8YPYkpC6A98zP15kP/bajn7thC
         xH1nKtOaPzwVoWgmO9bsyl8ziH6SQIXG5Xqgm9VYc2spyuH8yqTqkDW+7l9/q0INehWi
         yZCj9faUVG5v0IyVeJ3dOrUyvFLAZbc0n4UYga7j1gaOCkLJt80QV4mMRiE85kck8+YG
         ZY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AiKFIyoG5UGp9LBBHyhAcO1wtY6nsiOrgCx4t2Rir5Q=;
        b=hcie/wX+mfEuN52OUurYfr5RFmLcETuSJdH30gQobS2q/hX3WXeGudQxI5sRxNhHJd
         Ab0ByynNZuui3JseAuhUZAMIRWeQr55hf+lJKffe8UbLbrJbu7u72vt5muZgqcp9bSeZ
         dBW7VdF9wdxJlLrGbGLmAT9t1pWJitr3Jz4ArlAAZdDR+wxz+aZuCusH47iy2VVDBdNh
         jddWr2vkQkZ/M0TtqkpK0/bFmF62WIMcxtUBiJdbdHtv46tYF8mjhwM8EI8QP8q269bO
         wg57zFeMyt7yXykgk4fkfe35yScgYGMyDIsC24cp4LS7aA4wWbAMisbVkjM9+U3hXUuA
         K5dA==
X-Gm-Message-State: AOAM530aDAIxfuZPOC/YLJOd4Dyj1xhleFsOfAwRG9dkzdW99nRildM3
	+ZLs0Jvlo1Gfi+ttV5oBhg4ZX849/5ct3c5T
X-Google-Smtp-Source: ABdhPJwptduUaqD8SMwNNqmEa61KmXWUHaiWrU3pC4t3FrEY4wIOXNL6N1V7j9nnL2aNy9zTagsFxg==
X-Received: by 2002:a05:6808:a8a:: with SMTP id q10mr13454481oij.167.1615661561172;
        Sat, 13 Mar 2021 10:52:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/38] bitbake-bblayers/create: Fix incorrect priority help message
Date: Sat, 13 Mar 2021 08:49:23 -1000
Message-Id: <4557255a95f9aac8c1e955c078ca05f995c1299c.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charlie Davies <charles.davies@whitetree.xyz>

The help message for the optional argument of setting
the priority of the new layer was incorrect.

Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d10d928c6030951994bc2404cde78137c86917a4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/bblayers/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 542f31fc81..f49b48d1b4 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -71,7 +71,7 @@ class CreatePlugin(LayerPlugin):
     def register_commands(self, sp):
         parser_create_layer = self.add_command(sp, 'create-layer', self.do_create_layer, parserecipes=False)
         parser_create_layer.add_argument('layerdir', help='Layer directory to create')
-        parser_create_layer.add_argument('--priority', '-p', default=6, help='Layer directory to create')
+        parser_create_layer.add_argument('--priority', '-p', default=6, help='Priority of recipes in layer')
         parser_create_layer.add_argument('--example-recipe-name', '-e', dest='examplerecipe', default='example', help='Filename of the example recipe')
         parser_create_layer.add_argument('--example-recipe-version', '-v', dest='version', default='0.1', help='Version number for the example recipe')
 
-- 
2.25.1

