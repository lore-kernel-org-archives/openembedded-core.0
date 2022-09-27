Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C672C6FA90
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:30:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.9363.1664274617507038437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=T5jayMK/;
 spf=pass (domain: qtec.com, ip: 209.85.208.53, mailfrom: daniel@qtec.com)
Received: by mail-ed1-f53.google.com with SMTP id c30so11423420edn.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VEpwxjYND/EP1iTyQVwdpt5rW8YBYTBHlQUxCLEJOg8=;
        b=T5jayMK/DMqo4tppQH2mjBfe8HmTigv1ffQE5dzhEmjYRt8UdcamfRl41xvOMOGe29
         jty4mWrCMPoaOkl2auxq99M/z8LweVzO8t2vfaWGx/itSA06n/+shwAxc6LQH9HQ0oxK
         m/NOuVjmPldvQxqOBJqnRt9vDHFmkfCLvO481VG8akm7EDNCK8vpo79saaQibc6BNSfR
         YN+xA07i5otz5c0UKy2q6iCeNGHwWWYSBDxhWYhdk4goFyLxOnzzvEogNo1lXXfm8VgO
         vnI5h6qjBVreIa7XX0ofUFaCrMEjiCwDmmHZaQR4QIp0O/LPi2zCUL0NarbR/wjFlHpL
         AtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VEpwxjYND/EP1iTyQVwdpt5rW8YBYTBHlQUxCLEJOg8=;
        b=HK4spQPQQOIWTIMrU+jiX7kVsxhNWgqKWXWWgPs/EOldPhBkEr/AdG+kVzOmpS+Pyr
         tw0KYtcdWzbWdESSGH4TBGzp5Sx+3GOuTpjm/HveTmR7/9DPwErR+F/4s12HPS6+hzYe
         sQFQNiEZk8Nt9jJUX4J1bfdKkwhHD6mQzRXgaC0e7TPVUqULnwbG6aG0BPfpzvD9hRih
         F6Vx9BCKy/blMkClHjyxj1gOH45cY8P7ayJMQFwguXq6+NCNwfTozOsQ7ac6dvQm5mI5
         Tf4yIWmKMI5bGe1U8CZeOsLbFxoR3iiAoh81m5xUgkZB+E2qZYSqAxEoWqmPTcmIxfnN
         qjcw==
X-Gm-Message-State: ACrzQf1dyqirYwEojdJo1PAG+Tb37Q/DHvMEuKr1ihhQub00M6fGvXFG
	H7Rppx7uAK+eh6cc7rZQOYeJIz0FKGBiYHVGqLdr1BiNEIrUha2yCAX+2kc4gBqKf0ux3/ahoVY
	0GWJs3jbGq0coUn7TeW8kAw4UUcCma7r9G0oFqMqpr8uKcVTREPL4foxnLCEe6EHgR3h1ZLYSY3
	S+AFCYDUePcFdL
X-Google-Smtp-Source: 
 AMsMyM4heDCST84WRkL6IjEzo/GgHCTMTOVBacU4Gfd8SR88nTQEuJ3juk3k1yTpaVv6MVq9UO351Q==
X-Received: by 2002:a05:6402:3582:b0:451:3f7b:a7c5 with SMTP id
 y2-20020a056402358200b004513f7ba7c5mr27678964edc.63.1664274615422;
        Tue, 27 Sep 2022 03:30:15 -0700 (PDT)
Received: from datops.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 2-20020a170906308200b0073d70df6e56sm585941ejv.138.2022.09.27.03.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 03:30:15 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] rootfs-postcommands: Remove dropbear inconsistent
 comment
Date: Tue, 27 Sep 2022 12:30:06 +0200
Message-Id: <20220927103006.722389-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:30:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171091

When allow-root-login, remove default dropbear comment 'Disallow
root'.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 74601f0829..690fa976aa 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -204,6 +204,7 @@ ssh_allow_root_login () {
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
 		if grep -q DROPBEAR_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
 			sed -i '/^DROPBEAR_EXTRA_ARGS=/ s/-w//' ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
+			sed -i '/^# Disallow root/d' ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
 		fi
 	fi
 }
--
2.35.1


