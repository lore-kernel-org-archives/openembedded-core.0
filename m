Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CB5CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:47:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17872.1759841218883753172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 05:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gqH/sX2r;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so59053075e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759841217; x=1760446017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4gIp8fQkHcJ0/la6u6WRI0pTOofOXskktVxMee/J4w=;
        b=gqH/sX2rIx+X+Zs4y9NnXaaenew7bspARHFEHo4bh3fOITE3DcC6cZts1p3F36fW2S
         lBFLbjPoOyQGrHtjT39xUbVJwKaBP5SUvQbxQHgyWOO3N6WJhlmwcHlbnL8UHi000GsQ
         QnP1g10cYQ/2DNr6upU67zh/f78gL1xiA5QiV4D5vBhfgFkOgo/W0Plp+EIdjvcsBl/s
         uriqBlaFR7iPVb8uFUcc8ne4+297tCLDiVCKvT92EMzNLSdrfc1G6NCbVdebo2GUidV7
         QhEdhp2MMnQhJlgtJ9WBZjLx0AxqMpLd9uC0bTN9NL/YMSiGLrR0/O8MnDwuGLGWieMh
         R96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759841217; x=1760446017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4gIp8fQkHcJ0/la6u6WRI0pTOofOXskktVxMee/J4w=;
        b=liyWT+lkbvlygJC+sJM/Uv/AVgxGIUXHIskx2sA+jhIwN3v9OwLjKNHbj7nqs1AdDs
         FKE06IQv+x8N2CJC7FKN0vCgjtSWNoSOd0vnpYxiAf5Lzf5K1vR9rha/4SSAIrPD8EPz
         hQjrrCw/+mDJN+/mBQpOcI46nifGXv7q5c0e6a3rQ3dFQT9CLrsS6Hu3tUQ+NNLre4/o
         NA0ztPypSEyztJzoywU4je5ubdCGa4PXNZ5M033Unw3g9cYxC/1IEY9npG9FXQH3s7GC
         CWdfjXEBEKU2jNL2seJld+KwXTUbWK8ZPoysWHj5QUgbynY8KdhtPgSBWVszfgvVnoAn
         DwyQ==
X-Gm-Message-State: AOJu0Yy5MSAuXh3RexzuiSfKQnhLUz6mMidyMI5xBFmV93LbLYGI05RE
	xUUP8Ghx+ozXX9fykM2NdMXODa6cqop397VAZOWFY4fTRHLL1+CUe1LTPQFe9w==
X-Gm-Gg: ASbGncs+fpwI6Fx5/LMDrWjL1KBQYVAbCmLJZRjXuonVwxTqadx/nEOHqWaECRJrJSz
	R6fieUCWonLv0RrJezEfm7713luy777rW9LNAZIhZkAVH2nm4Ld8lofF4x1ca6/U27bp4TEdMCM
	x+A++l81G+AyxRS9WK2AM2MIM3AIc9vpCnHJE2EywJmyZ57eCOPigPUzu7GNC1gZ65XkkHAduox
	5IuAArJveH9F40gbYbOVi1SOiAYqknmrWvYQX/sOPg1ZuYAYEftGWCBeC63rqSpNU+KNITXV/e9
	qF94Gsdys8pvyAN1Sz0vaWmDRk2g9TQslwGm/2w7nb+57BftRlHlG80D47R6hru7RA1j2auHNmO
	rg69k3mSe5zoSr8F95+nLdSRzQ7ibfa7Fc6ZtKxRI2+8tYC5Ir2ClV609nQnwokkEG1LR8Pol7v
	j5FefgPzA4NaFKn61PHUz/zzZNjCc4cH21Bq7op6FYO7qNpIo/C+5L9RHCwfOifsZ2ov0eRgiJ2
	1vVlzcHYg==
X-Google-Smtp-Source: AGHT+IFgqeVv7wJFe9opjVS8WpQ8CaYnDbq3dK6Y8QCJILex917EDHqXwauSQ+3APSqyQflSSqRgxQ==
X-Received: by 2002:a05:600c:c4a8:b0:46e:4c7c:515c with SMTP id 5b1f17b1804b1-46e711549a1mr98725005e9.34.1759841216964;
        Tue, 07 Oct 2025 05:46:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e7234f547sm222707325e9.9.2025.10.07.05.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:46:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] scripts/runqemu: remove the code block that works around the missing bitbake environment
Date: Tue,  7 Oct 2025 14:46:52 +0200
Message-Id: <20251007124652.259629-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251007124652.259629-1-alex.kanavin@gmail.com>
References: <20251007124652.259629-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224533

From: Alexander Kanavin <alex@linutronix.de>

As confirmed by the previous patch this code path is never taken
and can be removed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1e8406e1194..2be7a0f2869 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1007,34 +1007,12 @@ to your build configuration.
             if not self.bitbake_e:
                 self.load_bitbake_env()
 
-            if self.bitbake_e:
-                native_vars = ['STAGING_DIR_NATIVE']
-                for nv in native_vars:
-                    s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
-                    if s and s.group(1) != self.get(nv):
-                        logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
-                        self.set(nv, s.group(1))
-            else:
-                # when we're invoked from a running bitbake instance we won't
-                # be able to call `bitbake -e`, then try:
-                # - get OE_TMPDIR from environment and guess paths based on it
-                # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
-                tmpdir = self.get('OE_TMPDIR')
-                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
-                if tmpdir:
-                    logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
-                    hostos, _, _, _, machine = os.uname()
-                    buildsys = '%s-%s' % (machine, hostos.lower())
-                    staging_dir_native = '%s/sysroots/%s' % (tmpdir, buildsys)
-                    self.set('STAGING_DIR_NATIVE', staging_dir_native)
-                elif oecore_native_sysroot:
-                    logger.info('Setting STAGING_DIR_NATIVE to OECORE_NATIVE_SYSROOT (%s)' % oecore_native_sysroot)
-                    self.set('STAGING_DIR_NATIVE', oecore_native_sysroot)
-                if self.get('STAGING_DIR_NATIVE'):
-                    # we have to assume that STAGING_BINDIR_NATIVE is at usr/bin
-                    staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
-                    logger.info('Setting STAGING_BINDIR_NATIVE to %s' % staging_bindir_native)
-                    self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % self.get('STAGING_DIR_NATIVE'))
+            native_vars = ['STAGING_DIR_NATIVE']
+            for nv in native_vars:
+                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
+                if s and s.group(1) != self.get(nv):
+                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
+                    self.set(nv, s.group(1))
 
     def print_config(self):
         logoutput = ['Continuing with the following parameters:']
-- 
2.39.5


