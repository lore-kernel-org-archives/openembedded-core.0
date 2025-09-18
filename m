Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AA0CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:47:33 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.14829.1758203247649058340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 06:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B3fTxSVm;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32e74ae0306so1651607a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758203247; x=1758808047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16nM0t+oDYXVXblvFndiQ8aHpKHqCPl6eKfXDofg+lE=;
        b=B3fTxSVmOqrn1yFtEbFwTczzCmGxymKSKFyyA09Zo+8F0D31rTxRsYlI7VdP+d869X
         d7Lm6mc5rvWAzmvM7F/tMPHEyL0FaWzdqTbYAR8OkWzphqubEaXiQtRnrVSpINhUG7f+
         LKmKhSem75SIi7udnP57nMdXqoBYiWW2svjb/0C6FBMIvQ46ULO/lxPpfbTMpzCrtkDS
         eJ8mO9s2+g620SiZUH8Cj4EAdrd9EGrl5zg+YSlGFtuPlTgd6A72UC455pl7/F6qZAAs
         y4PBA1M0pY6Xrc+iFkZYwdw1e+flraaz3WvgxSd2VjJkMUanSMIn9GO1yawa5acPlPAT
         64+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203247; x=1758808047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16nM0t+oDYXVXblvFndiQ8aHpKHqCPl6eKfXDofg+lE=;
        b=K/Zbn+uLhtdHoYUzthz7Tuj8PzjYd0MQwFpibu3Vhq8Jrf+5dE53dtG1/EfeKEpela
         mkDao80HOYP6H0F/BCRzwoUq/gcvmS8sBaI/0cD0F/oyjwhhdBeNzRob9QGLo25uZUIO
         D15JNVg9dHg5TA7sOX3dHlM0yt6KiqP9BOub67SEaY513ThimH05bb/Do1zjtadzC80n
         WuGMJJFGctiYdfc1V9/SmU+JHqCv4vvcHRFC9K5euPrft68XA6JvXpVNSBJDFP03UIHr
         jnwe/u65ieki06q9GjPoBdPhnAf1HsjUBXrfY89Ouc0T691cDV2v8DiHmLtzvrCK4MpS
         OfjQ==
X-Gm-Message-State: AOJu0YwL2Pbp5UGxB3SYSIUWg22N9Ym7ZU2Tg1/YX3/WpqkO0FLFQ0fZ
	VI0vOyYYbkwUdjuyEpY6ByQstHJ6PuurgvtUIHJ/Jy0PlIcoTEJCjBn6R+ndpw==
X-Gm-Gg: ASbGncsLuoRvxZEwVruixtWiGHnK38zxiBOhn1OKrFINCpDkhH0tbDG51ZLl+ynGPVN
	tEAnSytY8B/tH/tANPnw3w/8CapKIq9xT6PCcsV4YJXrtTl/gqRysBeyN3+xCfsJA3wpRavbExY
	65/pmejwq8okkHdwty2WBgS9Da+6bRGaQOP7aG23PQszFldJXY1GL9DFKGhCGYRIueMNdvTaxBf
	GzQWcdtGSoXkXdNUrym78ifBRrdukmLD46ntgfxIU02fByQ/2Jpy9DwRZRCEqRlzmouloejWQiC
	gz1CnjQn1iXZQB1VNKNp5l9RJz+c0dHXXK+IIQSa54fAApVVzUSUhXlmIXJL8QTGZpGZDFMBtYZ
	xQfm0LuKn9UUAUpa1ekmZ
X-Google-Smtp-Source: AGHT+IEXtUwOpMheaVE9Sq7GXcN8VJWzjnTdOlaVIg5vQ0JFsjB5xtz8i1wc+Jbh90tNIBeai1CQkw==
X-Received: by 2002:a17:90b:2cd0:b0:32e:7277:9a81 with SMTP id 98e67ed59e1d1-3305c5d42f6mr4331097a91.4.1758203246588;
        Thu, 18 Sep 2025 06:47:26 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:d313:75f4:7791:1cf1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea0fb679asm4267178a91.2.2025.09.18.06.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:47:26 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org,
	yocto@lists.yoctoproject.org
Cc: Qi.Chen@windriver.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] systemd: backport fix for handle USE_NLS from master
Date: Thu, 18 Sep 2025 19:17:09 +0530
Message-ID: <20250918134710.1170816-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 13:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223640

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Do not build translations when NLS is disabled.
(From OE-Core rev: 83795ef6c3fa12a863cd20b7ec1a2607606987b6)

This change corresponds to upstream d848b454e64ffbd642590b4bbc378619e1547ad3
from master .
Since the systemd version are different between master & scarthgap
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-core/systemd/systemd_255.21.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index e866f9921b..87e186bbfa 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -247,6 +247,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dmode=release \
                   -Dsystem-alloc-uid-min=101 \
                   -Dsystem-uid-max=999 \
+                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
-- 
2.43.0


