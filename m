Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA2C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 15:15:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.22480.1645370157095219788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VzSibhrJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so11957023wme.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9pB7zXHj27Jv7958jTAyVwSvlgwiCOLJ0MleQ+/e48=;
        b=VzSibhrJ17YqlIUA7XNZJwYMZ/v3z5OfqNcrnUghJ69AFJqp0Mrh77HHVMAC/BrNp3
         6NVKwC6yBbrVRuZs6wIKb7oXq1Gym5whzyHJI2xE0S4GRTwwHKCCR3moea+nwCMQOSAl
         9RJXJVbM9alxF5VSqUZ+XbWzNGNjafU2MH7rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9pB7zXHj27Jv7958jTAyVwSvlgwiCOLJ0MleQ+/e48=;
        b=2rh8t12jBZapho644XPVjXvZh3GcPUkRpfFccEXk3KhlD0aMQV2Zy0hLQgDYCNdgxJ
         NVLRdkArs8JUu2pXVspGfRy9diIKnkKk0caJ18x3mVSIrgEtDikt4mCjqF9R5fcqZLR7
         E7Ax7oTsmE3dWt0EMPjdYe1OgB0qFpJpKOEEUiaNXtGxWMZFmQQXJamB8K58skDjCnlv
         hgdb7gA7lH9yyaXKshiemBoI8v5/Yvdui3QgnO3u/6fWmlpcDCKQNnC4tPG2zBFfPPJ+
         5Sul6/jJMQn3N+ZRuHcVqvcadKbzWXdawT31K1rOSLeldpPGwLN1GcD0AFuWX1hnYzdP
         tm5A==
X-Gm-Message-State: AOAM532DrVFRaGxrF4rbOK3QGmKUuwUriZg+MCZAq1ZrUTiIMYhtyDmX
	Npf74TU+6rVy4U2YyZgRlQG36Bi0X4IGFILL
X-Google-Smtp-Source: 
 ABdhPJzk9sn4PZMbCMPzMXBgGs5u5/7/PadtLI6qGOI9KZ4sG3vUfYgsbgANz/B5kRNSMVG30o+sEg==
X-Received: by 2002:a05:600c:3056:b0:37b:bbc3:95a6 with SMTP id
 n22-20020a05600c305600b0037bbbc395a6mr17674682wmh.46.1645370155020;
        Sun, 20 Feb 2022 07:15:55 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9355:e71:cc42:42f1])
        by smtp.gmail.com with ESMTPSA id
 q76sm5329883wme.1.2022.02.20.07.15.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:15:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] vim: Upgrade 8.2.4314 -> 8.2.4424
Date: Sun, 20 Feb 2022 15:15:52 +0000
Message-Id: <20220220151553.3117584-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 15:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161987

License file had some grammar fixes.

Includes CVE-2022-0554.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f9b6cd60d0f..68051f9b923 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=600a38dc53e8931fdfb1238276ee09b0"
+                    file://runtime/doc/uganda.txt;md5=a3f193c20c6faff93c69185d5d070535"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4314"
-SRCREV = "8cbf2499179db39a46e700ab04d0b36e22bcc1bb"
+PV .= ".4424"
+SRCREV = "cdf717283ca70b18f20b8a2cefe7957083280c6f"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.32.0


