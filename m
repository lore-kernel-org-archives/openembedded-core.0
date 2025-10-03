Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FA5CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 04:58:07 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.858.1759467478493073546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 21:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eNVEeBkz;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so2480822b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 21:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759467478; x=1760072278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sotd2I2CvOdZxRRYJjTsspen2bGqcLbWopO+xvvz7Hs=;
        b=eNVEeBkzan+xRHA3s4yA5P9yYFvGvu0H2vprI9hvrOs2XhznJ4Aro0Hiwm5SG7JITw
         dT6f82VHG6aGf1vhjpqkUsHIU03YJeZfhb8qE4kC+KxbA85YrWRXOVwtXNezeax2y0qw
         LFQDDMk2dkd8Csraot4FdgtpHy5SdBGARyi2VlUDPesE4tH/JEcxBImQnJT/f5jY3bt/
         vJ6PIwPMLwz78LlFPGV8rwlS3lCj+or0VfRcnsat/f34qr1m+Uc0eMsEkjJg5Hxgjsxy
         nVWltVQ5V8M9KIRrDJ2SauQyEkRRnAN1z+VHIzdI6Ko3GiQBU4s6T+7TKj9TxKT96tx9
         Pk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759467478; x=1760072278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sotd2I2CvOdZxRRYJjTsspen2bGqcLbWopO+xvvz7Hs=;
        b=Jyo10TrSCQd8B8ZJ1eSXue6KSumV1tbfe8LaSDFKib0ioVPeCHyOlf6Sa8J7e0nI2k
         8RNVb5REUYmcluSxUk91VuTs6sbi9FZTQw4rMWI09SHH+ZnPWWNV+y6dBDhsgKGsh/Rx
         gEwgviApxlUfX6x98tHAHa39qS5pcmtwbBGj0m3rvN+gJHdQw5e/tmUgGa34cZ5vyVC2
         r7sk9b4tuS2rkoBookkG5wXwybik2/TXCsjnhPID3cQ4kun6m6ln2BhUb1YN48uxGxJW
         EqE4F5+SFFjih5ORCL6LdwjvDyT0m9080rZo758N46aAE2aSQeZnQMqfiaBS+bk4QyT4
         D81w==
X-Gm-Message-State: AOJu0Yy9DWZMm3GVem84xK0AGrV43nMg4k/ApxkF92ntQGuSWSwOhGn/
	QVuaK5b3lPn31CbINi8oYBYxFpyVrrVEy80iYyZ9tOgfBy/gdgmYi7fy43SnyQ==
X-Gm-Gg: ASbGncsEwRl3Vo+7QYZSMMzCvNkZGYTiVZaWJImNLDEFhkogiFxW2/J+WPmwWR/ZTAO
	K1fI8LAj3boLy50/OnQVEkrAzO1DCv6Q2lbt88CTH0nTcL8+zJOgYXEcG3T/3jUCFeyEZrPaMwD
	aM5ijKvLnruwNlg4LmWKxGwk43SP4h9z1BKRUOR65SNrlIF0xmVf2d9X5GSrpx8p03iA5ioCbpr
	fVZWABV5zQ6Ymd6jJkEZnQM0cEYcJ0kZaJk0piH7bLmwAbr1ZjxhzKJh6zCqzUANKNLv5GizAVx
	l5UkvEpcueLT4SsTZVczCoNyHFlleTFASR2Xd/+ynRN5cupfD8Fga0VR/HN99wiQJ0p3lu4sfTt
	UntTe9NeQLjmqQptFpv/6JyeY0mvZENdYBq0qPg==
X-Google-Smtp-Source: AGHT+IH47RBCwpDBI0BDLoah6R8sFDnth74xc/3j3cIdZD9yCZIC9zoYnZyz6xboQlF1Fhws/CL4dg==
X-Received: by 2002:a05:6300:218f:b0:2fc:d558:78a6 with SMTP id adf61e73a8af0-32b62118673mr2359631637.60.1759467477504;
        Thu, 02 Oct 2025 21:57:57 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:a6d9:4cd4:d55f:a1b9:36d2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f3bc40sm3340592a12.25.2025.10.02.21.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:57:56 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org
Cc: skandigraun@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] 1/2] systemd: backport fix for handle USE_NLS from master
Date: Fri,  3 Oct 2025 10:27:39 +0530
Message-ID: <20251003045740.7695-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 04:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224385

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Do not build translations when NLS is disabled.
(From OE-Core rev: 83795ef6c3fa12a863cd20b7ec1a2607606987b6)

This change corresponds to upstream d848b454e64ffbd642590b4bbc378619e1547ad3
from master .
Since the systemd version are different between master & kirkstone
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-core/systemd/systemd_250.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index 66d20a46fd..087c0035eb 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -235,6 +235,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dmode=release \
                   -Dsystem-alloc-uid-min=101 \
                   -Dsystem-uid-max=999 \
+                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
                   "
-- 
2.43.0


