Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411FFC35278
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.2926.1702391288439228837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zO6qXOA1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ceb93fb381so4015667b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391287; x=1702996087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnABpOBf7yedF9HGKfBasf0nGv62b+GB9WEIXLKmUz8=;
        b=zO6qXOA1H8D2atLjwlFrkqC1kcvE8jLYJgSIug+92lXvgyU6nQinPJDptByCLWnQhb
         Oc8EP7uo+cb/t7QvmP1BJRs0uMcU0yMLn70AJcrm5domxsjsoUOWBoc3aUIhKWSRoKF+
         09KXCTHrGZIYudXQeckMkQAHqvTBoGnD0T5LAWBBsc1S7gfb/uIGXW93azjSyrwx1hrm
         fpISjenR4ncZ4z10MaaW8+cwVOz4AXnMrewc5fFkteAyy+fcWeicpMuD5UOqaZEgriKJ
         Kigg34U8/B9bgkWMaLsAnuGFRHENA6ks3zkyvEhWTL+wAlqziZrvjdkF58z9l4FEjfin
         50rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391287; x=1702996087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnABpOBf7yedF9HGKfBasf0nGv62b+GB9WEIXLKmUz8=;
        b=HK7azOjSK8wuvkLL++qzlW+kU0F10/rWyDXOi9INFyA4ak42+2WGVT2xzmaWgGNmMK
         wETzrBQn6Mm2hhoTkWWlFPvuWivZtXilKPBNfpkBhmWf3DII5SucSrNy7V9hRVnO+LUR
         ryg/VFES1grM33bpi9I155gkm6rb0awdfJh0lUHmbzxgDXdg7FkggR8mVqRsA84QQmhw
         Wufjl10UgQYVdp58vpf4sOtIE/Sr1KUX1txQIDeqDsSUjEjHoX9C0jI2DEGbgTGesZ4z
         EbWXt7wHZBVtIJYPnsFHwXvKh9TqpPndJetRrlZdYxsUgyxgoKlAniOvYVwvpriC3Ive
         FpzQ==
X-Gm-Message-State: AOJu0YwK6ASV5FAdxXEM76oM9rul5sEVyAXWMRuOP41g+9RGOTDLNWAC
	abC9qub6btPQnrgqpb0cgBl4IA8zcrFwjlEWrbI=
X-Google-Smtp-Source: AGHT+IE4DsBdB8Hk0IGMJyWAAvKNLl4hHnQBydP52TJXGw5C0k0E04WxQp/06Y7D5zgmF/JZ400rRA==
X-Received: by 2002:a05:6a21:7889:b0:18f:cb22:31ae with SMTP id bf9-20020a056a21788900b0018fcb2231aemr7541699pzc.54.1702391287569;
        Tue, 12 Dec 2023 06:28:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 13/29] kern-tools: update SRCREV to include SECURITY.md file
Date: Tue, 12 Dec 2023 04:27:19 -1000
Message-Id: <2da5d792eefee1f32b0432ae429fc8e4c0d19956.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192217

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To be compliant with the recent security policy, bumping
the SRCREV to pickup the SECUIRTY.md of the kern-tools
repository. It's contents are repeated below:

   How to Report a Potential Vulnerability?
   ========================================

   If you would like to report a public issue (for example, one with a released
   CVE number), please report it using the [https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Security
   Security Bugzilla].  If you have a patch ready, submit it following the same procedure as any
   other patch as described in README.md.

   If you are dealing with a not-yet released or urgent issue, please send a
   message to security AT yoctoproject DOT org, including as many details as
   possible: the layer or software module affected, the recipe and its version,
   and any example code, if available.

   Branches maintained with security fixes
   ---------------------------------------

   See [https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS Stable release and LTS]
   for detailed info regarding the policies and maintenance of Stable branches.

   The [https://wiki.yoctoproject.org/wiki/Releases Release page] contains a list of all
   releases of the Yocto Project. Versions in grey are no longer actively maintained with
   security patches, but well-tested patches may still be accepted for them for
   significant issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fbdfc28b290ea3ed2dc3dbbaf461adc2839eb8f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e4b5eea659..941160ea9c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "0ae81fdbb1ae1546371206aeb3f5fb530dff8ddc"
+SRCREV = "7160ebe8b865dd6028aef278efa219433db93f7e"
 PV = "0.3+git"
 
 inherit native
-- 
2.34.1


