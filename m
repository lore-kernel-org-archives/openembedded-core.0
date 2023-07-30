Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA17C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 19:04:12 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.79532.1690743849686326452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 12:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rhQ8pH8d;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-563e860df0fso2838902a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690743849; x=1691348649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQFJJnBNIF1kVOTf9nox7QSakSFjUlg5Uzqw4yKUu1k=;
        b=rhQ8pH8danl9YSXHukIuUPDWQI1CKFpmFlOmnSIoFE7/wMf/Nk5lUORxX9Pr8RReqT
         +pVVcNL3h2d0tGrNjCcUV1TC2pMv5UEhZOkwrlc6vLl0ET8tUZcZrNn5YlSQU/TOuleM
         ntF7jFTo10BJgJ/UkfdPEMz3INIyRIq0G6+t3yTpHjyOcmcgcPNuaD5qwNY8R025xvF7
         Cf80Fr5+uiSRJHj745i0ZKyaPuTv+h/tdqXj7/SWc+vRDYEAS4CIzfKM4AgLnOqsJq2I
         1dvrFSDgifwByS3+F0EWKwuhpMs3NiS706y/2BpMtBQa+0vKfATdyAkII4zRMgrpj42B
         Sfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690743849; x=1691348649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQFJJnBNIF1kVOTf9nox7QSakSFjUlg5Uzqw4yKUu1k=;
        b=PstTxUA7gZF83KcAIkzaEdQCmLJhCRmbCRCESCN6DY9PpIg7U9QkiOwbuiV0wm0Wen
         aGn56/SQgbLRJ+C9IhjqCffB+7xBd3Ph7ixAcksTAUMvMmjwV+x/76r1jhovu7+cSHvJ
         X32nj5xy6CQo8+BhNCejR7fmTSgRTjTpIu9CqgV49Vm+pRXPh4/g3bR03LVebKDl3LX5
         kq8VrWe+8lwJjEtNovdTEaI0aak0f/X5HhMr3EIczhEGErAVkenJ/MUERlNcOCS+XtUp
         DSA2h56FDrAVAkWOluJgPJThHqBD7lNgea7mOrorFVfBCXOLEAQknvbF9FbH+XgCLNTe
         4uQg==
X-Gm-Message-State: ABy/qLZkx+1WmYZ9lax7O+GfTEv/nzZKFRnMhYZuFoyu1LaTefEmnzEd
	3sCLeDj3QQ4lRhGKutcF+OHW8G3ctAA=
X-Google-Smtp-Source: APBJJlHWbZuvB9LyqjRDXK3C6poNZRNx/i54LHWRlvIEYc8SBq+FxRYh6cS24V6INFhbAvU7Y5TEtQ==
X-Received: by 2002:a17:90a:5a82:b0:262:ec13:d3a with SMTP id n2-20020a17090a5a8200b00262ec130d3amr8292347pji.28.1690743848712;
        Sun, 30 Jul 2023 12:04:08 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:6031:b260:43bc:b5ef])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b00198d7b52eefsm6933904plf.257.2023.07.30.12.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 12:04:08 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-more-itertools: upgrade 9.1.0 -> 10.0.0
Date: Sun, 30 Jul 2023 12:03:27 -0700
Message-Id: <20230730190326.2335908-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 19:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185111

https://more-itertools.readthedocs.io/en/stable/versions.html

10.0.0
* Potentially breaking changes
  - Python 3.7 support was dropped, since it went EOL on 2023-06-27
  - batched() no longer issues a DeprecationWarning; it is now an alias
    for itertools.batched for Python 3.12+
  - batched() and matmul() now yield tuples instead of lists
* New functions
  - combination_with_replacement_index() (thanks to Schoyen)
  - nth_combination_with_replacement() (thanks to Schoyen)
  - polynomial_eval() (from the Python itertools docs)
  - polynomial_derivative() (from the Python itertools docs)
  - sum_of_squares() (from the Python itertools docs)
* Changes to existing functions
  - seekable() now has relative_seek method (thanks to karlb)
  - chunked_even() was optimized (thanks to elliotwutingfeng)
  - numeric_range() was optimized (thanks to eltoder)
  - duplicates_justseen(), pairwise(), partial_product(), and partition()
    were updated and optimized (thanks to pochmann)
  - unique_in_window() had its implementation updated (thanks to
    elliotwutingfeng)
  - iterate() now breaks when its func argument raises StopIteration (thanks
    to jrebiffe)
* Other changes
  - Some documentation and testing issues were fixed (thanks to lonnen and
    XuehaiPan)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on core-image-ptest-python3-more-itertools for qemux86-64

 ...more-itertools_9.1.0.bb => python3-more-itertools_10.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_9.1.0.bb => python3-more-itertools_10.0.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb
index 8c33b7161bc..e07d4b78606 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "cabaa341ad0389ea83c17a94566a53ae4c9d07349861ecb14dc6d0345cf9ac5d"
+SRC_URI[sha256sum] = "cd65437d7c4b615ab81c0640c0480bc29a550ea032891977681efd28344d51e1"
 
 inherit pypi python_flit_core ptest
 
-- 
2.34.1


