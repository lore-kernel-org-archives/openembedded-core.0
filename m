Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CA7C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 23:44:28 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.42626.1704325467463007306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 15:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPk1WL+W;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4283ec43d54so1910511cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 15:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704325466; x=1704930266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/y0mL4BeY8wkryreV2A6kmeLQ7ePdpHhOXrmSdYQlQ=;
        b=VPk1WL+WAZfKMbJoPfJhhpZprwwnQskjR6WCCmZ1dfb8st1lEdOMVvsslTk7W4Y5F3
         bH454LbQ+HZMZwVOuZqZ3EpLQLw+dlty9Ik72yXFGznIU4mN0MdjVYnwIb6u6fL9CyaI
         Z/lLYdrTX1wJrEC2akFcOz9anDb1v4AwjHWX4rgSwqwXKVQR5f8nCeHrBE6xtFPSwPcZ
         spuWPpw7tHVwNzau8vD8EO3NB9x+928PYK62crBmnvXUxsOcHX1rxYhj4lUQqx7PitWj
         ONcVXbcIyt9h+hSW2JTi6nL1u0WD+Ydd5gWKo4XsaYPw5P79d76vLy/WubM2Z1e/dpcX
         HvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704325466; x=1704930266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/y0mL4BeY8wkryreV2A6kmeLQ7ePdpHhOXrmSdYQlQ=;
        b=X9KVmVSZLrAonNhxcsuK+I3jN+NUH4FnECyP56kcFnkVYsFSj7FgeNXFOduGv91uDS
         Trh1wypVpw+wVEauSkSiZZiA2Mn8jAwsc411OGsis36j5nkwTITyMbrz3+mGaxSg42UX
         psCMPaKtAdOnkV2lhd96A+dKzpxi3fLJGVQfBkXBQ+vG/kQcBL/U5upwuOD7Lq1cJ2Oo
         Zw8PVueWQDEliOmi5ilh6FZF8R/25sKyqHXJLE6ir0mL/+i1NC7xwyvRPfir6yuzV1dT
         bEHRka4qs6zc9tWxHHtIVS1FraepvVkq338xiWuNN/8h32yTZbxP/ThSeSPf6B7V3pyu
         ImAQ==
X-Gm-Message-State: AOJu0YxpzuMgkgXG5xJKdF26wbuyai7hGZVSMBj6L5waVytE9DkXmhJg
	0TO5AOzzoSlkBiPBeTd9VQU=
X-Google-Smtp-Source: AGHT+IHGCQew/aePoQTkX/aICzJzlknA7p2RVbhAaCtUaxCzQFQs8xO9Qe79o2ObSepWxP02BKf+DQ==
X-Received: by 2002:a05:622a:1888:b0:423:77ae:f96e with SMTP id v8-20020a05622a188800b0042377aef96emr27859540qtc.10.1704325466427;
        Wed, 03 Jan 2024 15:44:26 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id l8-20020ac84cc8000000b004257bf9a394sm14409874qtv.14.2024.01.03.15.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 15:44:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-rt/6.6: correct meta data branch
Date: Wed,  3 Jan 2024 18:44:24 -0500
Message-Id: <20240103234425.2767497-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 23:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193297

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The copied 6.5 -> 6.6 linux-yocto-rt recipe missed one branch
update to 6.6.

The scripts setting the SRCREVs of course are using the 6.6
branches, which leaves us with a fetch failure.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

Here's the simple fix for the testing issue with 6.6, apply this
to the end of my series and everything should be good to go on the
parsing front.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 8c348a4605..bcbae7eaf5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -18,7 +18,7 @@ SRCREV_machine ?= "64c1e51bd051a3d0b32c60467dc14bc91bc9843e"
 SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LINUX_VERSION ?= "6.6.9"
 
-- 
2.39.2


