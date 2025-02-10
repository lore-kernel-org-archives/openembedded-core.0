Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930B9C0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 11:14:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.48185.1739186045726615452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 03:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AoPgebZf;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so6763795e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739186044; x=1739790844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=AoPgebZfgjCh2izMW3XtZgvJox8P0mNQ+khRHmrvPB89rYZODfD9iQPuMvL+3fHMhx
         4H/Vz7N7WYkDltI8ING6BhBdl9wgnDowV5WduuvKynlig27J10q8bpF7Uun/DJhsyJYp
         M2z2KGk9E6IY3adXBAqmRpbeKWvKPWjxScpazO1dMqgyDbeMiSl0B+od871iEWI2LuL0
         B3b+YCBDpfyOQur9/Qw4VTW+NAUiSQ9fYcoiykBCwWcYzX03DpkwKeFKmbnxbIU+XGpZ
         NtsYRxNgUiZUwYrDLSwxvOmDlpBZqR5Px7gluTJO2jnSRCbO8yyhZvOYkLsAUP/1RRJV
         iW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186044; x=1739790844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=TRrnWegfstijgh7euhPpSl2dWr1oq26Mb+F9ImJz+bOWixyRx90+Q+IUJx2XG0tMvt
         QUqb9WTzcBTjMwhAPq6yIXRtIjX0g+LFLIN9+6A885xqYmjDpJzTxqjBTlQsLbaoGJ3m
         srH/YFC1TtDpN3Hmgx92lyVI71H3wu2bMQdtKj4SEV8TMiIRycX27IKdgVqrO0/BiHd8
         mQNY3Q5TYmoT/0O3kjmmyaOFWBLpDeu/ifDtw8R+YtolPgIUlD38lGWewdRueNenPhC8
         BRmcf1QB/UuNCxn+BoJK8YaUS4926iVhCtw+yhLgi7pQszh7jSGVUGVfIIkZJ1E/0r0M
         6xlg==
X-Gm-Message-State: AOJu0Ywbhki56GDrDzX9dTpUao2cuBDfhheXFePHlCmT49fNBZXCu23K
	YuYqqynGQw/MwpyP0Vz7JhEfIj7rJMatTkT1SxDAKh5jjkdxG3vMxKN0Mg==
X-Gm-Gg: ASbGnct3b5bxlJSHoI4/mPM5KtPExUNvAd7W7FZSU8YnltUI5cRPc7oNpX26Ag4CPPg
	uOCKdE5ExxigAWnfuaWj7aq8giw2ikXPWCyZmWaHSxWxgsNU3VHf2i7fU20TvxQVEtiKWWB0lmn
	OfbkuAv1yKGxGZakpbNlt5OjnG1ekW4YP+UYoeJ1Z/XlWQA0OPlRiVDxUfwANpsdMzVMcC0Q9ZQ
	y1eLPQupNjPcHHeHNQ67ptRdpXLNQR4j1bf2OF1bEEKHtTn+f3dOXDUYFBv7MM1tvA28I71otN6
	VTPDz9n7cAFa5gqZ/Bi/9P7j0sxgBSTCjCEwxjqjrxgiYg==
X-Google-Smtp-Source: AGHT+IGnTpOXLmooc0zvqsY6XKrRVFfs1DLrrdU5hvVGhL0VIYXRtRHgZaiVD4zwxwU+z7F4h8MQbA==
X-Received: by 2002:a05:600c:4f90:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-439249b2aecmr97995655e9.24.1739186043807;
        Mon, 10 Feb 2025 03:14:03 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm174789785e9.35.2025.02.10.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:14:03 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v11 4/5] dnf: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Mon, 10 Feb 2025 12:13:57 +0100
Message-ID: <20250210111358.1120877-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210111358.1120877-1-zboszor@gmail.com>
References: <20250210111358.1120877-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211089

Point to the crypto policy file	so dnf can work with signed packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index f9d6ea1fa6..e5ac3c9824 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -69,6 +69,7 @@ do_install:append() {
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
 do_install:append:class-native() {
         create_wrapper ${D}/${bindir}/dnf \
+                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
-- 
2.48.1


