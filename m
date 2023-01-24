Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EDBC25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 17:46:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.22192.1674582365098086069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 09:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jxBa+/KW;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id v23so15486347plo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 09:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXHgXDEuakhSv2YzsVZ4an4sqf53ZIEZ5SpImdG2izo=;
        b=jxBa+/KWrlvZKpSqo4vIoZ+c2RZMBk4pos9upSdvApQ18URLWbTptsNfO4ix6SsppJ
         E31qNZuWPylFmifw7qZh2NAwxR1msi0h3clMUk5thF4YKEkCjzLcyUb6e5CMCK2I1OgW
         3yAmIHiKzmmlDQxeLf6t4EoADC+7Q7AtWPAOBdnOGHD+VcM3MfwzMg4q95L3H0/deevk
         hfWeauhKy9AzDyS/WHUcsl5Sn+lkwU7q9Fh0a5AfGk3sZuiWI9KG3EQLeZvqx5qWfeLS
         YqxpEk18MRfWYlhgPjScQXg99Jz5yVj/CXnueF+mF46nyHcW5JoZITkkSJsXd7y0eSnc
         mWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXHgXDEuakhSv2YzsVZ4an4sqf53ZIEZ5SpImdG2izo=;
        b=EumrxJD6HZEuo+RWaKbJy/AOQ9iYDJMgQRnwKFfiru5VwHz+x47E2Gx6mhOrNJ0o2V
         ZpCjEvG3VrFbElqp8BxRCAQr3SPOp8h1IaPo+IAh2ZGVqykoDyRTRA+IN6Eg0RRY8vi6
         tf9tWrWX442LxgMPQPqELgMPadl7wyT9xtbvhM2RGUdKybgYVcC4bRFu47wLZ1mwO+Jk
         oUNtOt1uR3DzRAOGSJefE0Io66pNu2OLq7fEROxUW3EzYZyHpxQyflCIPPQ/KqwtwRYq
         +gvW3BverN+WDmfm8nHF48T6HTYLIVg/S/fA19FGcphHzLNZ7fcJTapbN0XhYQ285UW2
         qzDw==
X-Gm-Message-State: AFqh2kqbnkFYZxlOaWGCoSsSKFRmgikjIfHGzKXBbHgOWoB4PqAJU3Km
	o+NXM14CwlHIVg9dWsCg72zqYRggrQtL/Q==
X-Google-Smtp-Source: AMrXdXsmPSoIeYJNSz5H8vWzcMA72nzYmxbLeWEGqBTACkN0XFKz5Osccs8bLDESkXBdrPEBBjUbtQ==
X-Received: by 2002:a17:903:32cb:b0:194:dd83:613d with SMTP id i11-20020a17090332cb00b00194dd83613dmr24931815plr.21.1674582364212;
        Tue, 24 Jan 2023 09:46:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902e98300b0019494681c12sm1976537plb.86.2023.01.24.09.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 09:46:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ruby: Update the patch status
Date: Tue, 24 Jan 2023 09:46:01 -0800
Message-Id: <20230124174601.3450362-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 17:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176329

It has been submitted to github as requested by ruby ml

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
index 30caf2c2de..1dff9c0f8c 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
@@ -18,7 +18,7 @@ may support C11, exclude those compiler versions
 [1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
 [2] https://reviews.llvm.org/D133574
 
-Upstream-Status: Submitted [https://ml.ruby-lang.org/mailman3/hyperkitty/list/ruby-core@ml.ruby-lang.org/thread/DLES4EPPXSPCHQMWJPPWMWXXS42AVPFA/]
+Upstream-Status: Submitted [https://github.com/ruby/fiddle/pull/120]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  ext/fiddle/fiddle.h | 12 +++++++++++-
-- 
2.39.1


