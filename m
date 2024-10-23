Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9A4CFA47E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 21:20:37 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.9348.1729718430324474968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 14:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dtl1lhXA;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5eb5be68c7dso119087eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718429; x=1730323229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbAcw99YZM6PhGJfvrg7Bl2b1ib9bMPPlLt9SnMpdKM=;
        b=Dtl1lhXAh34WOCf3fvr7YANSHoSp6pdRPkLjE58UtZFeEwdmQ06OcvHJL7bGyjX0Y1
         8kxHgpblB9N5KCUlbKgqOszsUSNjF0vLdv1+qAPJTb5JNIyWjVcOFTwF2k0VHr/xTKlG
         VzHxH13AMHBc+yPyITO2dXD3cWRExdgPK/Q9Hnx4pj4RoB0XOWxBHbdq+Dw1jgTxHkWH
         ajRqyyhrcdQT4mUPa0gFpBwfRPdSPK1aMdLL89hnenvpAiZwavHWIanJk2xordaNJCPh
         mgeMpHnQRmJ7ouCTDdBtj36IadnRAirpCIXDhsnictg7UXGxox0tEpjokh+8pktGJiJn
         GOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718429; x=1730323229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbAcw99YZM6PhGJfvrg7Bl2b1ib9bMPPlLt9SnMpdKM=;
        b=Cg0CFzaR37BIrVmqdddvrgCJkimi4uutXRcJiUmOhElXUuswzw382lsZ3TnD8lar/a
         DavvKio3uUX+IbRb+rRpANVjKYbxcbSVKtm5dd4ium/BdVYW5FZPF3S2o3uKR163UFOn
         TRKulQVqSmWvfPlsbpT4WnhwlGvTggq2q6Hp2OMHurmovaoGhoObupI5dQNtgjAttzxk
         Bx8pmPoLvttvWZfrnlAiCl73yV7CAZ5o136Bksq9rZ7zPBOwwX90ZGCTuv3kAvOx8BTA
         en4iaZi2d5rH5yo5pLOui53x/FrFEkMLktlQUxBGv0m76zD4sFh3tGCyNhgMLU6HZwAV
         QYmQ==
X-Gm-Message-State: AOJu0Yzfg3xc5gQZT4p+lJvJzcByk/b1Xq/OAkLACDLbHmLCG/L8IyEe
	fgm+Ew0MHB6qmWZ56jpfmFyhS1fhQ6fYjuXFMSl6I2RiUnYCp2Y4XhMCgQ==
X-Google-Smtp-Source: AGHT+IFJa/idCOTBRqD52858BPgofhqAr5Mm7bBVasSTejrclzDFvN8o1XqTRVYKzwK7ntrZ+DJiNA==
X-Received: by 2002:a05:6870:82a1:b0:287:7bb6:3c54 with SMTP id 586e51a60fabf-28ccb658d08mr4194474fac.38.1729718428973;
        Wed, 23 Oct 2024 14:20:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::fbb0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c79204699sm2681940fac.2.2024.10.23.14.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:20:28 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 4/4] lib: package: Copy locale license
Date: Wed, 23 Oct 2024 15:15:22 -0600
Message-ID: <20241023212013.995247-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241023212013.995247-1-JPEWhacker@gmail.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
 <20241023212013.995247-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 21:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206269

When creating split locales, copy the license from LICENSE:${PN}-locale
if set, otherwise leave it unspecified (which will result in falling
back to LICENSE)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/package.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 480408e41e3..236a0edbcb2 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -663,6 +663,8 @@ def split_locales(d):
     except ValueError:
         locale_index = len(packages)
 
+    lic = d.getVar("LICENSE:" + pn + "-locale")
+
     localepaths = []
     locales = set()
     for localepath in (d.getVar('LOCALE_PATHS') or "").split():
@@ -698,6 +700,8 @@ def split_locales(d):
         d.setVar('RPROVIDES:' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY:' + pkg, '%s - %s translations' % (summary, l))
         d.setVar('DESCRIPTION:' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
+        if lic:
+            d.setVar('LICENSE:' + pkg, lic)
         if locale_section:
             d.setVar('SECTION:' + pkg, locale_section)
 
-- 
2.46.2


