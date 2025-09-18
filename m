Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70BDCA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 15:48:54 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.18121.1758210534016602989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hm4uGjrY;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b522fd4d855so813867a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758210533; x=1758815333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16nM0t+oDYXVXblvFndiQ8aHpKHqCPl6eKfXDofg+lE=;
        b=hm4uGjrYnGZoOCh8+/+pAp0GJJTckkxltHWRBFUjan5BcCKlwDh9+hrulVghM49MCq
         TudPUasvA0vhv+ha8jB2oMEmQG1xcY1HeEpJzRWKhsJ5LffFYstx57vJOqtgBntaO2Lc
         ZwsNv7257opLAAzgTm6ayIryBShRvEpiYH/tu5EuNF23Ycdr8XdR+c7DCoLWqj0KnceH
         52C6FTJSwVCwj2gRl3FFe1tmxTfUFv4dcwBbnBjzba5WBQni9WrNALJRUl5775UHtpwJ
         5yCHcUvjOuky1ycjgmoqnGKxQIInHf1Psv0kkllfwA21CB95R2AsaXtkWPqW4XJTWolr
         0EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210533; x=1758815333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16nM0t+oDYXVXblvFndiQ8aHpKHqCPl6eKfXDofg+lE=;
        b=T4U1OxvSr0bAEr6xdXYfp/G3V+rcYCV6ygwrcZUJkmtKiHIbs1Sp4pZIu/OtqODB1i
         Xf3l3pLRoI44+w0W4en3/VOn4kGuV+1JpFRt2M4Utvx5hN+a7JNgZTGRhTizLSgUOtrX
         dlb+HG5Lx5Skn7fR1KkDQs8ehDbbFIeqTdyqRHC2XXguplDiCN4cQkHm+5gW/kXWxoAe
         dRfEZBiJneN74VSvlLfPm/oaeQThuXJKj5HlEFgls3+gz4YRUw/cRp89HaqnZ0uZjXV4
         48SceHknxzp+UjNxKUQvaQ3IafU9U/wHU+B3XeI40hjPtvJ62n8FrysWrrS4nVlDGs5/
         QXMg==
X-Gm-Message-State: AOJu0YxjxPPX6XZXIuXtjOSFqychQAzFs/qSuHvmZhOsMlSNi0zb4XZw
	uh7CamoXMBbBekGF2vLdT+UZZJpH8Xb5BOdYjST2SWlBocmV54pGgV1lNzCnYg==
X-Gm-Gg: ASbGncsdtQKaZz5lLioBELw0gMW74jUDwfk5tT9cRZjdYHVWa0rnfzZzP9dFdN8dE/C
	gP/HO5r2uQtQglv84XTp+fNbv6v6lpWq+zP7E6k5/K2kklZco/KUArr4aETHTVkxZmxU7S1Y9d0
	XzmjzQwHhTvt7mvVIG9yXKyAwTh4sX7DgsmHahTxcEOkRgcqlMhnvMpDrqnPu0QemPpSzXSvM3K
	AlgLJQdyKQfbVCQk0nyGOZ4QeVYL2R9zxf3RVqzWGRe2ZeMWqpLY45TfcfxDLmK0G2o2o3JmYCV
	C3hhbYp5Avez9jQUuEYCkDSbphn4FI3c4gSOaCAtYU4FPmgRLsE1ufuf8TLs4Zm6ZpjyO2sqEXP
	nn53nmyUO42Lmp8AJydPc
X-Google-Smtp-Source: AGHT+IHzOZmUSekRNY11AI8vFQH2SqUdjuEwaF9k7wmU1+xYQYh1hUFJpTCDqq16TSuqvXLbw9QMPg==
X-Received: by 2002:a17:903:2acb:b0:25c:76f1:b024 with SMTP id d9443c01a7336-269ba466c69mr462675ad.25.1758210533233;
        Thu, 18 Sep 2025 08:48:53 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:d313:75f4:7791:1cf1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330606509desm2919052a91.10.2025.09.18.08.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:48:52 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] systemd: backport fix for handle USE_NLS from master
Date: Thu, 18 Sep 2025 21:18:37 +0530
Message-ID: <20250918154837.2592327-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 15:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223646

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


