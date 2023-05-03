Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C141FC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:06:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.14470.1683104775307107317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VugTZg5g;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-52c6f81193cso102989a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683104774; x=1685696774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz/0o9qNcBrRN+a9KaHiR+89vj3gZm4TmyXwJdojPgI=;
        b=VugTZg5gw3xVzRpgmACiAWhbwu/dRSlKgdEFbB54nBrYQpcLlEMFFplsQ79hrCY6jM
         LOpLAjP4KEHakcE+AXAWUwXMLNuSPjmRDctVazpS4btouDIngkLpUzzwzgrZ6tPEwRMv
         /GocTJWPJOGt6+Zou//beGkkuPGIycpd1pmGFbYuNgoQiz3FD17bWSwsOR8ry5jHaseo
         gjhfF+W0lr1f5Kf0tKu/ntmc1HuGub+d7Nn6+AsNzflDLVYkZ/YagI+UUiHadqoZnN3q
         KsUe7gIG2UGWKXizbPagEO9rPSFoZ06HauOriFH4lH6/LtTeyCDcnJZ9XT2XDdb6DnuK
         BizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104774; x=1685696774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mz/0o9qNcBrRN+a9KaHiR+89vj3gZm4TmyXwJdojPgI=;
        b=TySF4r0d/0XYQzgsw4CEck+fFfcgfmAQtln/qxSNhvgsF/oLYvMAyADHRUKLIuq+DT
         2iO/ft6acZ10Tg41NQCkLXLO7upCawKjzZfPp1wtzw6SGQN5b+Y2RqMy+1nNAi5ugTdU
         D2Dt3bcSydqc+0dXHa/nvY1D5m658GtFRpPcpCLIdQSxdM7UmhFxVfgwKuEGejMQes0B
         433PF/8mCru05wxKAq4L79uxRJuv8V6QgK0Vd2eCYtHZqTvtbuKGIfpnK/9vl7B1ayQd
         OANicX//GuxTeYEk6iT4TTkCoRl1xscZ6fQOhG7OQ7Bt9zZ9qaZfnj4ienJFsCGCi2EL
         xxog==
X-Gm-Message-State: AC+VfDyo1tvX1P/OB2tGUCIfD8JCkF7ZKYSxpJj5IT9HHlpEQtIHdbBC
	9khQuXkcc6wQtvmRaMUv+sF4zgQs3+o=
X-Google-Smtp-Source: ACHHUZ7whCAoapRlKUpVPqB3egdyRAqgAAcPYss8oJa4uhPY7Qt8BrRCpjlb4AWcb5r6zLKhJBgvuA==
X-Received: by 2002:a17:902:f693:b0:1ab:63e:67b0 with SMTP id l19-20020a170902f69300b001ab063e67b0mr1662045plg.54.1683104774163;
        Wed, 03 May 2023 02:06:14 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:101d:b472:32a1:2248:5bbe:aed0])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001a64c4023aesm21175041plj.36.2023.05.03.02.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:06:13 -0700 (PDT)
From: ranjitsinhrathod1991@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [OE-Core][dunfell][PATCH] libbsd: Add correct license for all packages
Date: Wed,  3 May 2023 14:36:07 +0530
Message-Id: <20230503090607.69420-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180793

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

BSD-4-Clause is only applicable to the {PN}-doc package as when I
check for the source code I find below files which only uses the
license BSD-4-Clause

~/sources/libbsd$ grep -rl "All advertising materials mentioning features or use of this software" *|grep -v \.1|grep -v \.5|grep -v \.8 | sort
COPYING
man/arc4random.3bsd
man/getprogname.3bsd
man/tree.3bsd

~/sources/libbsd$ grep -rnB6 "BSD-4"
COPYING-9-Files:
COPYING-10- man/arc4random.3bsd
COPYING-11- man/tree.3bsd
COPYING-12-Copyright:
COPYING-13- Copyright 1997 Niels Provos <provos@physnet.uni-hamburg.de>
COPYING-14- All rights reserved.
COPYING:15:License: BSD-4-clause-Niels-Provos
--
COPYING-40-
COPYING-41-Files:
COPYING-42- man/getprogname.3bsd
COPYING-43-Copyright:
COPYING-44- Copyright © 2001 Christopher G. Demetriou
COPYING-45- All rights reserved.
COPYING:46:License: BSD-4-clause-Christopher-G-Demetriou

So other all PACKAGES should not contain the BSD-4-Clause

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/libbsd/libbsd_0.10.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/libbsd/libbsd_0.10.0.bb b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
index 5b32b9af41..58925738cb 100644
--- a/meta/recipes-support/libbsd/libbsd_0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
@@ -29,6 +29,12 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE_${PN} = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dbg = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dev = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-doc = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
 SECTION = "libs"
 
-- 
2.25.1


