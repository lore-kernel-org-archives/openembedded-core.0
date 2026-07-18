Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF50C4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 13:25:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5897.1784381122991197815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 06:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aku2PRri;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49546c690ffso15995055e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 06:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381121; x=1784985921; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWC0+sJ5bvXbcVrprNQPyZws1y+qC7W9KDHnm1XldNM=;
        b=aku2PRri79Pi6ky4izMMBwudb/1bygLYKFcPb+0iCfyVVvSt+tJ/VImAje2T5SKmmJ
         WcMPEM21PUNo00JIEzuLPR8IKdYwVtXPhMYN1F9RTg55WObYvtqF04qOR3/YG1Kl38WZ
         ZgcDua6/3o7OtEYoNrQhIceiW8lt6Yr+/aNPYlOEXeEhbQAXGHxgQ5KbT5DNK0z60aHV
         /sVF8/lIsuvfW9cO/tPWaWy5A6Ps22ditsm5lcB3sE62RZYskGA3Q6NA992hSWlKWK27
         vZGIU79QJyhxycvZsltwaXi7G+vx91nw7W9+zy2uCSAarQxq2VuR8Zcvbkebh4tARQXY
         bLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381121; x=1784985921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWC0+sJ5bvXbcVrprNQPyZws1y+qC7W9KDHnm1XldNM=;
        b=N0m4UuHNLHCTFtf4K2FiuTrY6Ic2/DY5h6hmA1qgHVXLSgQ3plEQaPk1Vqcu2/2n5k
         vEBvlSkrNp3nhBQJ6miKfOy8CsshgDfZnP7C/lvZsY2B68y+gg6y1sGCr6SscBl8d8C6
         4QE2vrnETt/0LVI6BlJ+H19dRKI5KnPj2lQZbf3Cb8ilO9zphSF9zsBZYbu626BiEvMW
         +EsxiwcR9guHjsEpqtfZh7SnGz8OplTGuPWJnn20fxBW1H3Vwy2lyWp2OGsDbGBpWxee
         474TmMlM3sXEoGnxDOSHjUGUKJn55iXsVtS9gFc82czH0pxCKyCWpM0uZ3J+PymUEAup
         x+ow==
X-Gm-Message-State: AOJu0Yx4OX7U9Dy1W2LQoeW4uDlynoqymg8JdGL7W2yxjQv0e4cx3Cob
	VFDyJfPNhEjALDrCD0Jiey3S0RyJ4+PIKhLsofopXVzPBmcwnUgMOIVOGQxGow==
X-Gm-Gg: AfdE7cn5g06Yt1hF7W89i80JSimLqjWi/Zu7jrVJaQ+mqJZHiG6ZZ5acpC6MBIN3/M+
	VjllwgMoS1nC31ylAtrBbZQCAQJSjR0ECO3q5v6Hi0JYskzlKrL1EKin4soAx6dcC5fG/8lKxRa
	A5Q90t6IKipsia8L3QyKqNN75g73fPdwlpBKpWKsa2r4e1gt/UXuGzuFnT3W8pPx4b3GvvZrNBJ
	+4rxib9+jirXtB/hV9jRGDbWyRZZp88MSWfvUf8pRxFyZfpMz6eE4gtBs3WV2ZohcJIFvxdSGly
	zINJlSYNShL1ixZ3MNcIHDiGOy7abuM6Zi+aF8eRSox66HMF3Qlx9pemeDc4c4mA6WEDUhLDomn
	bXJG9AVDo4juSjaRn0mSHyDmL/KSTu+mvY0hnC9sWUCJxcWnjeNROZ898TOlP017/Zwl1TYLEm1
	77wbD51OZq
X-Received: by 2002:a05:600c:3510:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-4954a3e20b1mr76319095e9.8.1784381121102;
        Sat, 18 Jul 2026 06:25:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:689d:c0a3:3de0:7033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm136563175e9.2.2026.07.18.06.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:25:20 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Jul 2026 15:25:10 +0200
Subject: [PATCH v2 4/6] wic-tool: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-extend_recipe_sysroot-v2-4-b7cbf35d00ec@gmail.com>
References: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
In-Reply-To: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784381116; l=781;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=YU28Y8JSD8xvSl39KJDd1MzMqm6AjAI01oi1UROXesU=;
 b=17EcLq74HLoPtkSv5lCHaCqzqufNwq4TZ7gXX8c0UqVDoKmtT1eSjBq3xDypql3brLFbBhPjC
 L4J1LHuNujtDQ50shcDLkA7Y//wDzgM1qbDP1NbqvJ+bahgU9XDNcrg
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 13:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241262

'do_build_sysroot' did not declare this explicitly,
 but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/recipes-core/meta/wic-tools.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 823dbe6db6..88fd2dfc19 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -29,3 +29,4 @@ python do_build_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
 addtask do_build_sysroot after do_prepare_recipe_sysroot before do_build
+do_build_sysroot[vardepsexclude] += "extend_recipe_sysroot"
\ No newline at end of file

-- 
2.43.0


