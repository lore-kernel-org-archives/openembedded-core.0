Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17920F8809D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:54 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7588.1776322123536965369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q2Mz5gii;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso91627765e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322122; x=1776926922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whCwqBJh3d3qNfBeye3GzVfXJB2JnvzIkn5icCEhv/g=;
        b=q2Mz5giinF8k4bgezkgNcf738Xg3y3FxMY5D0yvGEn38tSBrFr2NaY+gAChjVwi4ag
         8bi0xM4nIVRe8G/EIe+uqHLLx689hw9jDRmzxZE9tqXbIT0xPzwTNTbdReBlmpuwBRSV
         Ew+39qW83sfK8Y3cAHLkrK9jlBE3l+gQQi5O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322122; x=1776926922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=whCwqBJh3d3qNfBeye3GzVfXJB2JnvzIkn5icCEhv/g=;
        b=WWNRsPFTJ+Mgt0p7ky43ZmTn+TdoFWTpVaVKMKrxDb+ppS4mkug8QJgm2FgkRvAlXO
         x/rJep40fZWbf4Iopuj/wgtsGRl6xtANXirkMc1ZOdlfEwVXBdPRl+hNyKK5TMJw1lMi
         9L9cDtHqQxnGEeLwSNYTn1OnVimXZtQ5siqDoEG0Sh0ClCISMmxJKVpU1rxrikJPWfXk
         IJ9iPP5XiHbEfv0laliO97XpzNNpsN12ISWx/qw8KTgwzmNMZQcyeV6C7hFLl0KTLKLj
         QlhHS9RvRJhsiXqYZ4Nj2pdqQVNApudPbF2hm9XYVfdbWobMSGGhfBhIIm5cOHiv6S5+
         ga7A==
X-Gm-Message-State: AOJu0Yx39tVWJLyYcY6abw/vXI3sJijI6CzdusgCp39FzPkj8Yo5vUsI
	z7hPMuTa0qAovGtZgeut13SiSubZkXoq1ArMKUbLME/oT8ix4fN6wKxzFowZUbixGJnKQcOoVOi
	7rec0E5bOkd7V
X-Gm-Gg: AeBDievlxvcvVrZmJY8zgS3v+Zj3HZQT7uj9hDvBsHarLP00qdCq7ZCWRc9m4d7rI5y
	aXTPFAZo+bLzfwp74vTLVx2Iw/ONXiPJ2WynPdkc1i54FmOV9TgHfFsStzWmwGxtxcovcw9631T
	nSzBvhbZekemBFAf+ffApvQjqtMtG360CoefPdeBjtM3JKtfw6+Vdfo1P1Og88p1yfj+xgbDSBI
	3Xc8yAJLNHn7WTzKnxBO6sdoLeoAWFd/1UdoHIb/GX2jxcTDsCXmOcr4UhG1/A3TG+T6ar4M4Ua
	4gmt7Za4oWywTX/JlC8A+fKl8XUaRAnOJf6i8QZ47AlGdP+s9UgPzq+qDgAKp+HQL+X6ONYo5+d
	01z5ZzccLBctjk937UYcTJugeVbkwgrx7f7Bv+lomp860LDWdONWwgpVdASSbV2NoVY5kKDyiK1
	Lk6ZQ1+FBFDqadt5JIv3WUGzCPwLmpDNixXDD9x2GPeML+u5+/0h08qcelBegYGufaasddLpbOB
	+jHQT+3zN3mrhlBiYkvmTYBBS+r7pHRdTvX1w==
X-Received: by 2002:a05:600c:474c:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488d67e7212mr297733585e9.12.1776322121524;
        Wed, 15 Apr 2026 23:48:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 35/47] archiver: Don't try to preserve all attributes when copying files
Date: Thu, 16 Apr 2026 08:47:36 +0200
Message-ID: <b437e124689520579f4859401a1b0a5a4930d5c1.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235377

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similar to https://git.openembedded.org/bitbake/commit/?id=2f35dac0c821ab231459922ed98e1b2cc599ca9a
there is a problem in this code when copying from an NFS mount.

We currently use cp -p, which is a shortcut for --preserve=mode,ownership,timestamps.
We shouldn't need to preserve mode/ownership, only timestamps. Update the code
in the same way the bitbake fetcher was fixed for consistency.

This fixes build failures on OpenSUSE 16.0.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e8313688fa994c82e4c846993ed8da0d1f4db0e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a95c899a0f8..a48dd259fa6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -398,7 +398,7 @@ python do_ar_mirror() {
 
         # We now have an appropriate localpath
         bb.note('Copying source mirror')
-        cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
+        cmd = 'cp --force --preserve=timestamps --no-dereference --recursive -H %s %s' % (localpath, destdir)
         subprocess.check_call(cmd, shell=True)
 }
 

