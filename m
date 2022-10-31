Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EDDFA374D
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8160.1667216862429033594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V1enIKsc;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id l14so15612572wrw.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nH5UlAOwGTofsSrXiyl68M/iDgLw7K7Ll7b5UoqcDE=;
        b=V1enIKscVnueXjD5Qh4GD7o2vwCiqYXE6fmDnabuaIUdOp57ubGQGjbGXYLZULJx7D
         +QCAfEIn9DuDtJcoBXOpoZ1MUmYUiT2JXGBEvySXFZ6XIEM34HXAfj7+LyiFKyZhx4jY
         5zad0aQOqt0zZykCrAwkxy7eZPFdsYUCKngNG1pHYy6LeO8FmT+IpPAcGUq0bZVSQtWy
         MXTROgOv6LMZuweB3HRbB9NofnkLZVWiU1iftza3etNk8iaDojwDr6I6vJ05oPCMKkRg
         910DOTEd40filr4LX8GHQ9N9+8Yd1hlVR1n1bviZhSMDx55PRcQ4ML3kVM1u0917S6cp
         Q1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nH5UlAOwGTofsSrXiyl68M/iDgLw7K7Ll7b5UoqcDE=;
        b=y92gFn+B8ftRJPxVSwf09bINd/rI973tSUJ7YUF5oAnjhU0tlABlPKBSng6w6KWTsC
         93oBe2ySMi04optTjtt1F5EXh62QPgLsx4LwEi0eYK5t56knHlIcYvzlvHoURAuEz/4D
         t9Vt3a1aPLJuAU+PiDvkKw4Vogff4SSCvTaLsi5Qwt0O+yth0nFUnLGI2g154ZONuekE
         N1CcLWMtT4zYpcthSJET3QflgqVqXflXWBtZ1vcszloCz5ZNglyi6NKNUrzqTs0IC+JI
         dKqf9mBAOpdEfgEFd3CC86bQNFKz+s4ZASMSwZg/+pAOurYsJqiKTg0KBxzFUJ0qDHMI
         L4mA==
X-Gm-Message-State: ACrzQf1977NrkJ50Ewv9ogJq77k/tsWp3VhbvQ8OcvkG27ziz95vldDd
	0ZZ07oXCfuyJYIUFcz827yG/sFUgdVA=
X-Google-Smtp-Source: AMsMyM6pQR2to9iLH7Kr/lyokoyjJn4yD9BCaimL234h/WvENgqJ1K58z48cfaNf1HXc5c8IpS2SJw==
X-Received: by 2002:adf:f58e:0:b0:236:a8b2:373 with SMTP id f14-20020adff58e000000b00236a8b20373mr7903251wro.575.1667216860907;
        Mon, 31 Oct 2022 04:47:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/13] tcl: correct patch status
Date: Mon, 31 Oct 2022 12:47:11 +0100
Message-Id: <20221031114719.2725967-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172307

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 44b2ce0a30..5a10c93a31 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [upstream does not support installed tests]
 
 Index: unix/Makefile.in
 ===================================================================
-- 
2.30.2


