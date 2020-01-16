Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 66B357F8B5
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:51 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id l35so1735909pje.3
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TeSd9MG3lXjqBiroTUuzIsGLpnt66kOHFEtKmGv91x8=;
	b=leIW3dssut5McSMb9js7phARerNm0NRJb452igQc5ezTsXJECHgvQIrYg+XbW/dKaZ
	W+4WI8DGp91YtJYGUTKov3R3XyOpmNCZ9DxAnMD5wVXyNUfkfwTEJO/gEUDs9ot5iztA
	8dfXO/DyMJ5TQMUddNDlaZXxSQh89wymMHoo/Q1rJ/citSiEnvf3U9If+OyY3LDhw6rM
	vklNdtYw4EvNID0uMAlLWB7I+ycYjRgqPEL0Q0q0WEY1CuDYqOE9iJUXo8yqBD8JS08h
	lvYxGaiBSfNoXobUmqYaChQR4cXiuBwb/F9pL87Kc6F6dbSe28gtBkS9nQoczuYSl7r2
	BB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TeSd9MG3lXjqBiroTUuzIsGLpnt66kOHFEtKmGv91x8=;
	b=hUeBn0Ka3eVerSMUJ4hHMN0N9pJ7txdDGof+8EEBjfYQ7eMfw1RNWnqUSdOqa68Ykx
	ikJEhqFCen035R0WW1wEI24lpUy3fB+Gqv+GJ0SGNuK/VUkqVDcgB9izCom0uParo40i
	2WKvfKqQfuijUB+Xim2qljK6kCP3SPiSfxjwiMabSiCl6UxKc7GtfDnFR4zfsNBz4fO5
	47CEuAQSNDtX5+hFmavg8YEzeVNhX7Ua8No6AmQcd5wLH/uVT7nQ98qi2c4SEOHIaejv
	aXtB2PsSMXE4TIyQgC13QxfYw7FCiiEHucDzQ03wVX9epvA/fmFdLJf1VvnFAB2N0peO
	zEhg==
X-Gm-Message-State: APjAAAU7iOmnhnKntuKLJiBf2jbAznOJyiXXf1Y0Gsuo8KilipKDvxpR
	eezBPtLco4JT/v0zZgt2zPwdxMbI
X-Google-Smtp-Source: APXvYqyPpvHnQ6u6fUI1T1a9sfjm5TpxQnjBLuMXzSjVXQFVvrOmvULKsXhNM9T7I2Rto1XN8REbtA==
X-Received: by 2002:a17:902:8bc9:: with SMTP id
	r9mr37933076plo.48.1579188052362; 
	Thu, 16 Jan 2020 07:20:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.51
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:16 -0800
Message-Id: <44d4dda6db56107d7ce900730b370a2ec81d9c30.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 07/32] git: set CVE vendor to git-scm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2020 15:20:51 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Jenkins plugin for Git.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/git/git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 26a22ac1e8..6e137432f0 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
+CVE_PRODUCT = "git-scm:git"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.17.1


