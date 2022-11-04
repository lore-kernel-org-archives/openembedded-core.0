Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F030C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.7184.1667530909029209279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=12l9VNaP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id y4so3729596plb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13mMlarCT89+FXhdb3+Pczr3UqiMcXQnbGhONwD72Jc=;
        b=12l9VNaPM3PWqPpH2baXX8gqQjmhiCzDsn7tJNWYaFWouDXzNnD6/1TUcUhNpmCbbJ
         uHB4Ku1i/2BKVFA4+qaXvaS4cWT17yYnGehzDAMIA7K3fhqVSSuf1/eIHF98iMfttgS5
         UoPUWucQYEbouUi+VqoOZmfN+AjXXByqGVHqOwC80s/TzXK6xof1DccX62EppPaZTSkB
         vOq1vDOMnrGRlz8lSMFSEPvt/wTtk1kJ0L96oGl29ebzxcS8HUW9PmsfC1J99C+1JbNc
         F37wMbkXhntZjSl5ZjzJWl1GfKN/J6nRd4nuRazbb2EH5fFXsRaCnJgzSlGBx+Fhl489
         BUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13mMlarCT89+FXhdb3+Pczr3UqiMcXQnbGhONwD72Jc=;
        b=H9ZHlEKJtqaFZyUe1crQKAKenSLDO08JEsZpTUzBTw86SFb22BSf3C8NoYW7BGdd9y
         o/OppxwsusoABXfI4cwoBVCuTEaMN/FJ8RunTYYAGhggo+G+roifmtwahwvf4wYoBZlW
         6k6TqJtPop8DRWOoE+YYqW60ybEAqA6SfcG662t6eiQWQJ08304H6M77wJ77zAOYswDb
         7cjQreRDqjs1ddZG/4WoimZPQwIdYubxCaOb6iHOfJ4LRsD1WRnv+w6VujT87utB74Pl
         97vIr0xMVJlpqeYbfSjzBZOeNKWuJ7BzJ9t4O3NDjlhtJeHS4aPLX68UKkWV6Ci7gEhd
         X5QQ==
X-Gm-Message-State: ACrzQf3PxIjWxnOqazNiXbX4Px0sYcVSxGBZAaFmQUu/be0qVx5t0867
	jh0qCbA5EGaH+Aoe6RIpxQnIwFpW+m+ZZpxS
X-Google-Smtp-Source: AMsMyM7oeABxsjgqvsnX/v1p/AwvusjqtghLkut6HTAFnClB3iTVN5RSEJiHQaaF23MSQxtO3jhy7g==
X-Received: by 2002:a17:90a:f507:b0:211:e623:da5b with SMTP id cs7-20020a17090af50700b00211e623da5bmr52630250pjb.37.1667530908106;
        Thu, 03 Nov 2022 20:01:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/31] psplash: add psplash-default in rdepends
Date: Thu,  3 Nov 2022 17:00:50 -1000
Message-Id: <358a9528a633de9e0e89225fd935b2a7dacf1652.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172676

From: Thomas Perrot <thomas.perrot@bootlin.com>

Otherwise when the installation of recommended packages is prevented
(NO_RECOMMENDATIONS = "1"), then splash screen will not be cast.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a0928532b8303858980d6df6271669dbb69e224)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index edc0ac1d89..9532ed1534 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -58,7 +58,7 @@ python __anonymous() {
         d.setVarFlag("ALTERNATIVE_TARGET_%s" % ep, 'psplash', '${bindir}/%s' % p)
         d.appendVar("RDEPENDS:%s" % ep, " %s" % pn)
         if p == "psplash-default":
-            d.appendVar("RRECOMMENDS:%s" % pn, " %s" % ep)
+            d.appendVar("RDEPENDS:%s" % pn, " %s" % ep)
 }
 
 S = "${WORKDIR}/git"
-- 
2.25.1


