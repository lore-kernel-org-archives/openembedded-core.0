Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1ECC63702
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.21689.1650136507823067322
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RlyVhbrT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id t4so11951824pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KKPILMfSaettxrcdvjHl4HxdaSiZuHM42d21K3gOFp0=;
        b=RlyVhbrT3ohkIpwjpUUS8RNTIqc8MbtmTdmg1LdUdJsoaxHuQ6cRgcKDwSfQbCBQBg
         NW34ddqI31x4a/zg39oXpRVlm/mFRonxUU4Wg8cpvkYVVehFL9VZ44utbfVZlsEVjANy
         6FQpXy6kTfdNb6cj68AHuGItT6pR7kgSoOUcrvs+bP5a0VlWLdvWIbbmNZFkyhE3uDv/
         E0b9MJiMztlpEdIA8mra+tkGV5VyKmySlvu52KzyH0hsTa0qFOnMdY8tbE/TMGix4rF/
         69sO479pVZPA5gbSUrsk5qZgr4XCRsSp6DqvvYyukIGPNFdRkRLZ0+QcmuGwaCEhY1vw
         wuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKPILMfSaettxrcdvjHl4HxdaSiZuHM42d21K3gOFp0=;
        b=lxreFRIu8WMTCR9bgE6iU7T2dBUheUKip4lx9TLAHKCAhC4QSr3FUvzLoQE8LkZjXq
         nHuLc+6N6hLdslT2Tv2Eu5yspvSEwg4vtpEZdTFbZ13DMDe77hGI3HOtBNJ/HH5AJ+np
         GUZqMXK46UzD9BUah3bzjlIHPtb47mP6sYhMu5fxxipWNnvGh16VBlf/LKuh/F+YTcRq
         5vbvB+oJAGdiAfpw5v3vBLrpMGDMZSED7bhB1NdpH5Xh5FI1Q+B1DWcToWOgTpEEQ+qa
         BmHCU8wk2aKsCYZPcIGktCazY9z6C+EPl7+SrMyQoLl6+IgKRrLpslCak+VpO7J3PfzP
         N0LQ==
X-Gm-Message-State: AOAM532Cx5XijfvDh9m3jz0NzObyG0TdolwIMLGLQWPBDSHgvIr3zf5M
	DKtMXREnt938Hx7vLIaojYavx4QaNTYotEoFjtk=
X-Google-Smtp-Source: 
 ABdhPJyLgkjxxgDl5TidfsGfJRuAUZoIWlXv5PF8gbQ9sTJ76fiI9t13uK2RAIRB2RPLF/EpCixGJA==
X-Received: by 2002:a63:5b0d:0:b0:39c:c393:7e7f with SMTP id
 p13-20020a635b0d000000b0039cc3937e7fmr4015080pgb.16.1650136506970;
        Sat, 16 Apr 2022 12:15:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.15.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:15:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] license_image.bbclass: close
 package.manifest file
Date: Sat, 16 Apr 2022 09:14:26 -1000
Message-Id: 
 <3e88c663e65fbc1b2e77a8616af4371224ed0ca5.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164554

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes:
  NOTE: Executing write_package_manifest ...
  DEBUG: Executing python function write_package_manifest
  /OE/build/oe-core/openembedded-core/meta/classes/license_image.bbclass:23: ResourceWarning: unclosed file <_io.TextIOWrapper name='/OE/build/oe-core/tmp-glibc/deploy/licenses/core-image-minimal-qemux86-64/package.manifest' mode='w+' encoding='UTF-8'>
    'w+').write(output)
  ResourceWarning: Enable tracemalloc to get the object allocation traceback
  DEBUG: Python function write_package_manifest finished

[YOCTO #14772]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3114d5d438b7a63a276b4e825b62f3b1ebceed6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license_image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 1396a95f47..9f3a0c3727 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -9,8 +9,8 @@ python write_package_manifest() {
 
     pkgs = image_list_installed_packages(d)
     output = format_pkg_list(pkgs)
-    open(os.path.join(license_image_dir, 'package.manifest'),
-        'w+').write(output)
+    with open(os.path.join(license_image_dir, 'package.manifest'), "w+") as package_manifest:
+        package_manifest.write(output)
 }
 
 python license_create_manifest() {
-- 
2.25.1


