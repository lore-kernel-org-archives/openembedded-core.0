Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.6738.1602744445178177233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 23:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QDzsB0Fc;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: arabishi900@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id d23so1075501pll.7
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bK2pTDwXwWuZk4ug6jo7mtrfbR0vh6FQWsqIW8QHy1w=;
        b=QDzsB0FcRTsKpwS2pLJrDenclKpIT4qcil7OW7vm+Sg1/olN9oFJiBelu+HO8PrYWq
         lxverCRrOzXfra4HFi1C02ijIBaX3AdAjSpoC+V/jgderQO9Qd2gWof5lCzeH8XSy5+x
         d4PcJq4P4rmsy9RfH8skpzbbZjl0ZiTSUp8h4ouvpcXuDo/fG7F4PoVmJ0Fu21LopC8Q
         KifpIbMFzjkYqRakDB4/6gCCjZ+cmIlRLYikO5Iuf9mEI+IE6PK4hDcw6xBqhd02cMjt
         AU6Jg3yxkdQwLtpl9d3G1QGm3HHoFgbRtnRP5siEJc2+PY+Yiqmmg1V6GdCFlk/cN8QU
         qRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bK2pTDwXwWuZk4ug6jo7mtrfbR0vh6FQWsqIW8QHy1w=;
        b=FeKSA0UpKC38Kb8u+1lqSLbxu4z/IKV/2aX1QSeSxqqHgpJjFpWsrgBKLYNQ/r1o7+
         bzG1mruVyELLPfVUFZAPMVoBcTrAtRYhci7wGgSqXu7QA0Mq4+BcTt1sJihCBqe1xxON
         GC9DRsjz94Bvxjm15cM0HKlKkhhsqWuEiVmRk2eZTzmpZMCB4FrbaKI/tKvqZ9AlsHP4
         qIrODAHJl6EZ3R1UtgGhV+SGpDGF1F3CZQo+jh2YhaUMEbv59DwnzvfNl11KT7EqQX4l
         0d/JVAMmline8bw3s+wPfxYXwyKAOZyv5swW+PCWAYgvazzYw7Zgo0tj+r1DZD0dTraj
         m0Ew==
X-Gm-Message-State: AOAM533e/uE80vd5+CVd7Nv0Jgkj9faPMdQYTB1RJdWGZWzaH1Ei4orL
	k9ko555HWxPIMQgwL0sXTj3Z2zdfK9DvQA==
X-Google-Smtp-Source: ABdhPJzFOUQqQfPbCaBdKW+UxKSa8vu/aeFLdbnSHqmQmA1p4ON5fq1zz4TDOHy6LDFYthQWK0PyVA==
X-Received: by 2002:a17:90a:430a:: with SMTP id q10mr2769409pjg.45.1602744444614;
        Wed, 14 Oct 2020 23:47:24 -0700 (PDT)
Return-Path: <arabishi900@gmail.com>
Received: from localhost.localdomain (116-220-34-67.rev.home.ne.jp. [116.220.34.67])
        by smtp.gmail.com with ESMTPSA id r3sm1919886pfl.67.2020.10.14.23.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 23:47:24 -0700 (PDT)
From: "Akira Shibakawa" <arabishi900@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Akira Shibakawa <arabishi900@gmail.com>
Subject: [PATCH 2/3] License-Update: kmod: Add a lucking file to LIC_FILES_CHKSUM.
Date: Wed, 14 Oct 2020 23:47:12 -0700
Message-Id: <20201015064713.4863-2-arabishi900@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015064713.4863-1-arabishi900@gmail.com>
References: <20201015064713.4863-1-arabishi900@gmail.com>

Although components under tools/ are licensed under GPLv2+ and
a binary from them are packaged by default, LIC_FILES_CHKSUM
does not include GPLv2 license file, tools/COPYING.

Signed-off-by: Akira Shibakawa <arabishi900@gmail.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index edff191700..646dff9a97 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -11,6 +11,7 @@ SECTION = "base"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://tools/COPYING;md5=751419260aa954499f7abaabaa882bbe \
                    "
 inherit autotools gtk-doc pkgconfig manpages
 
-- 
2.17.1

