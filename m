Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F86CDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 12:01:26 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.279502.1697630479380958008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 05:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=kVA6CqE1;
 spf=pass (domain: baylibre.com, ip: 209.85.167.42, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507a62d4788so6054730e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697630477; x=1698235277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mEaB40U+u3nn/bEeyzm7t6UtVYmcyOEd+1ZuyF2+9Bg=;
        b=kVA6CqE1w5cyfyYyG5CE46CRTwKq9LGfD7fqu5dx5TnPrV+Z3zysWw6HCLXoQ+49qg
         6aq2sPPj+UROU6Xg8jqf8UF1mnjVKL5ARma1kfrF3sD2S4M1uSLe/ure0r2sNWWqcK6K
         av5EiUiAsJMybaPRl8qwxVBOLI8/afTBBGiPCk0L2CfmiHzsWlXQyqIt7GTSp46Q7dfv
         R/I8ROEYQjueuEr5QAVDMH/GOiMQjVJOcRf9pvVcnNqPN5fVLQ1gh3iDWbg/BTm5vOXY
         l5vePt7IobX/4aDQb1HjbErdh+8kLozHVQSyDAKIVJTe1yA3gUdWgV3Rk9qdO+/hOnnn
         IpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697630477; x=1698235277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEaB40U+u3nn/bEeyzm7t6UtVYmcyOEd+1ZuyF2+9Bg=;
        b=ggkLyfAKPlw+1URgxE2t6rXOpNC05fWFOXrcG/w/oZ2MjWGCgvNoxzpyRHywmQWbo9
         wphBsCgCYa5wOfSoNTKh8kAb5pUXqC532ZNgWwp3DIWPDq6mqsdUyu5zlpqHcIrmUduO
         Q3wQ3m8n/KgOFf4YzTX1Zhcjt0Ph39i2YEionVeE04tN55b8wUi29wP9j6iovx2UY7wO
         O9GCWGun/IefirXKv5R2gLo+CveM1PzKgJESc1n3B8I9tKG3q6rDuxXZi/lmCVgIABAl
         KzJC8L0ytlRQ14wQxsf3TFIwrG0JpizQnXM6KFk2N8NObmfsTNdI5XmQAp5RsxK4Bh5X
         9tng==
X-Gm-Message-State: AOJu0YyIvE5Mje7UBgqkmm6Ze4uzoIEdmO73Kw0zB3EP4Cqghb/6gx/x
	dSYwj2dCQLxTjsc9Q7wVrGdLHxQm8jA6cg4/ilo6mg==
X-Google-Smtp-Source: AGHT+IHj4J89FGh/sDXJRMP4XhNjqfngVIofZZbznZNpsOhqaM10c+7SC6hdf9UHHReGliEtWJE2lA==
X-Received: by 2002:a05:6512:4018:b0:507:9a0b:3fd7 with SMTP id br24-20020a056512401800b005079a0b3fd7mr5062555lfb.13.1697630476508;
        Wed, 18 Oct 2023 05:01:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j4-20020adfe504000000b0032da7454ebesm1960312wrm.79.2023.10.18.05.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:01:16 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 1/4] scripts:recipetool:create_buildsys_python: fix license note
Date: Wed, 18 Oct 2023 14:01:11 +0200
Message-ID: <20231018120114.1222475-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 12:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189385

License field of setup is not always standardized, so we usually use the
classifier to determine the correct license format to use in the recipe.

A warning note is added above the LICENSE field of the create recipe
in case a license is provided in setup. But when the plugin is called,
"LICENSE =" is not yet present so we can never display this note.
Replace the "LICENSE =" condition with "##LICENSE_PLACEHOLDER##"
to actually be able to display the note message

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 92468b22546..d2c7e251bf7 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -254,7 +254,7 @@ class PythonRecipeHandler(RecipeHandler):
 
         if license_str:
             for i, line in enumerate(lines_before):
-                if line.startswith('LICENSE = '):
+                if ine.startswith('##LICENSE_PLACEHOLDER##'):
                     lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
                     break
 
-- 
2.41.0


