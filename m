Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8542CD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 08:12:03 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14647.1781770312581897262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 01:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A2ryV2E5;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8894560c89so225215a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781770312; x=1782375112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhQ4rtvSp3wgiQQMwLmXmjymfuzTAXRQRLZ7n8difbs=;
        b=A2ryV2E5yDu7Fxm/zNfSThkUj1gDtoC+Ga5Ct7wiP+db4/fdHu4Dkv9VzuA4wxHrUy
         TViQypK2FnwXw5fBBERavclKftpsD0pCzi1nhKLqoHTlRKvn8yAX1ZDjlIDCjtg2lxYU
         M50AWioA2y0dfjZdbk0jTCtatfw/d/DrW9fH/Knyi9joI55iTKskRh31/shh/d53P4YC
         lWlrMybk5pMQ3EdBQDSCJzY13iQ/m90c6Ep9hbZcrfHVCXmUjq5/bO2zRWGN2KtqWWBZ
         D76TssKBemLuHs7ynuMZ2pIEZ2LArfz4IZjwjltjYS78BXwRkp9EMP3QEoDDFK5T8Ng1
         3ShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770312; x=1782375112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhQ4rtvSp3wgiQQMwLmXmjymfuzTAXRQRLZ7n8difbs=;
        b=mv1YKGKzGOWOTaWPXGkoKk71QkYC89qYoJtTfuI/6r7q+2WJva1s4rCnVeQICQgJWl
         zWj+KMuTlQQ4qUTB/ccPSLT2FzaosSB5FrciTtOR2HcUjENwaq98QrZr2igaxj+ha7IL
         NIbVxdQ9OGzCgSagb/fxUVmlvn23xnO4KPK9xvy3QHh2EGGnblWwJnX1ozm3T9tqm/6S
         EDUEHQ5S71nkGHWReZuY5bOJu98UFd/IWLVYwTHNfzZhNUaOYXH34XG9sbXWZgE3LzPx
         hL6NxFuRKCwqzcIU14ap0gDecNdttZfNWrpm/LoOBAfToEzq14MHnGyFstDtL4M1vCF0
         +v7g==
X-Gm-Message-State: AOJu0YxfijaV6L9zl+kgKLEddo4sQFl3aQQHSlIaSR4scTJJsqhGUUC7
	Z7AY+PNXKVLbi5smBp1DlFwHgxZGtF5Fe/absuQLdHfpaF/zLdFgaA7Aj6IUAg==
X-Gm-Gg: Acq92OG1kkFoN91EJMrMpSqs/24cOxHTPGJvjr0o4L9zrSQa5ZI0U9xUvA9CyTRNDn0
	uLSwS/ZEtWp4Epr7YqDfSPgfQL2MmAz+sF3Z0Va7EBZyGdXmWx1+1DuHFTWpKwtgTfssTmtvuFV
	gfCfKmidVmUq77jSlLzKvKAZtAK27RxsV95YzUM5Fbd/DjOSUUjdy5uE8bdgPXHR1AoBYKmyx3b
	ky2oQqb4pPl3AQz7Ziudncufmv+eTXyj+o9vy1JJAdwxCnRicQpkD2Hj3iR85ib15njtvXslnyL
	RxYQyrF9LOIMtm3tPK+bE+g/YUWuMVUo88UfB7dn6dsGgQRDpTPXMbvbariPcJG2ZU4xzue939O
	N1KWCDOLubVVHy172bflP7F8GjvYUsBXITMUuSaHRn7Iv/tUo/PLiBiQmi23BE4bs6A==
X-Received: by 2002:a05:6a21:6813:b0:3b4:85db:1bdc with SMTP id adf61e73a8af0-3b8b7bd9232mr8140698637.34.1781770311505;
        Thu, 18 Jun 2026 01:11:51 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:94:3c8a:a779:c12f:dc98:ea85])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186828sm15316375a12.21.2026.06.18.01.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:11:50 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [OE-core][master][PATCH] package.bbclass: add PACKAGE_POSTPROCESS_FUNCS hook
Date: Thu, 18 Jun 2026 13:40:19 +0530
Message-ID: <20260618081020.86040-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 08:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239065

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

This patch adds a new hook point PACKAGE_POSTPROCESS_FUNCS to
package.bbclass, inserted into PACKAGEFUNCS immediately before
emit_pkgdata.

PACKAGE_PREPROCESS_FUNCS comes in picture before the per-package file split,
so at that point the final file lists are not yet available.
There is no existing hook that fires after the split with the ability to still
modify package scripts postinst

The primary use case driving this patch is SELinux context labeling
SELinux labels must be applied on the target via a postinst script
That script must know exactly which files are in the package but this is
only available after the split.
This hook enables a bbclass to auto-generate per-package postinst
scripts containing targeted chcon/restorecon calls
This helps while getting proper selinux context to files if package
is updated on target while incremental update scenarios

There can be other user defined usage if the hook is available
The change is small 2 lines and entirely non-breaking as the variable
defaults to "" so all existing builds are unaffected

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/classes-global/package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 30accaeaa9..37e4469bc8 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -460,6 +460,7 @@ def gen_packagevar(d, pkgvars="PACKAGEVARS"):
 
 # Functions for setting up PKGD
 PACKAGE_PREPROCESS_FUNCS ?= ""
+PACKAGE_POSTPROCESS_FUNCS ?= ""
 # Functions which split PKGD up into separate packages
 PACKAGESPLITFUNCS ?= " \
                 package_do_split_locales \
@@ -473,6 +474,7 @@ PACKAGEFUNCS += " \
                 package_do_pkgconfig \
                 read_shlibdeps \
                 package_depchains \
+                ${PACKAGE_POSTPROCESS_FUNCS} \
                 emit_pkgdata"
 
 python do_package () {
-- 
2.43.0


