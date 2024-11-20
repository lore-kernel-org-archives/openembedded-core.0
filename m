Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446EFD6394A
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.13830.1732111037215335077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BIIiecWx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-211fb27cc6bso41193655ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111036; x=1732715836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBBzBGnjdiEFtMuFB5ydikN/fGwR6kl2AclzchrWmLo=;
        b=BIIiecWxLYh+CPt4voM/j/xb3q5cMLwp6TPxZHX6E1ahPA+ApIOhQ0SeEiQok5JJzg
         jJ+7PnHkyg7MbsGYi2743eARQqya6ryMCyct3FAGOo8FSgj3/yrwfkOC5CwZicpqZF45
         ySrVbEcxgKmG7zOOuVb107EaalO/SqkgtY3MNEXMb/xu5C0Yc0F3udefWTb3t6n6F4TF
         9FHl5ggibxdZW+DadqD10tU3vGmDQdX8W+2ENAbw0QWt3Ktq+80cjxwX1HoLFMOHPfp2
         U3W8k9Wfztq/33z/zRo4CEBHF+yq0EVggAMuAy86MQvMkRZM0mQxJRDx65B3dsSwTVBE
         C1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111036; x=1732715836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBBzBGnjdiEFtMuFB5ydikN/fGwR6kl2AclzchrWmLo=;
        b=DE0BoYN21Y3Z2Kv0AmSEbHuaqP8kcWxM4n1XhtUwMLTp4cMlpw56WMhVmDOVmdE1oT
         aI0qor1bC/ZTnjKarhQAr9IOwhwttn82ADOK7cHhsmSoSGAy+FJp8nOtYEbfs6u2A0zM
         VGS8yj3XY03qEGPJFS5C33kkXRofkGLmvfNNPKw2dvB2+YNObFDfDGMmj0lR/ZawvGHU
         UXKu+VmNMDxWZhYTXbLwABHOu3n3OkDb4jJ8BCeBzAeCk2Cl/usFNyllFhtjJlRje3V6
         NxeNU7lhP6POPwt5f7sYKYgnPrJpELffMdqObDEn0A1S+DFENuQzjatM1+QrBBXnQz4x
         5Nng==
X-Gm-Message-State: AOJu0YzhgAq2MPr74t1MUmZimZs1iuJYbLEi9t029ERIU1KWRZujEErV
	+B7HwuJ7RErEF1mv6CISKQvgaFEWnx3BbZgkVvn8iGoouN165Ebf8hliWwexmvrvE03RbTpblky
	4
X-Google-Smtp-Source: AGHT+IHPAJkrxEPOnamlYNRjoxSJsk6KalaaFocWZ+h6J/svGGZedh9H4r/ujZ69B/e5LXEB+K9Uug==
X-Received: by 2002:a17:902:fc47:b0:212:996:3536 with SMTP id d9443c01a7336-2126ca4eb28mr32577955ad.10.1732111036537;
        Wed, 20 Nov 2024 05:57:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/31] xserver-xorg: upgrade 21.1.13 -> 21.1.14
Date: Wed, 20 Nov 2024 05:56:35 -0800
Message-Id: <68d511dbde5efad9e40ed3918c15bba629130437.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207427

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix CVE-2024-9632

Ref: https://lists.x.org/archives/xorg/2024-October/061765.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
index 1f18c22fa8..28c98eb527 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
+SRC_URI[sha256sum] = "8f2102cebdc4747d1656c1099ef610f5063c7422c24a177e300de569b354ee35"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


