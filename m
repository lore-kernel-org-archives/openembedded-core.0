Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0350560C6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:11:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f129so2473487wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fQhfk/989PFsHHgdBKjirQFWHS2/9lh86606Ls6usEQ=;
	b=TuA+BQLVStnU/hcoDajGWyzBhTi+gUyZJITp8UVbqzoZNUt9RYKpDC7jah8LMO1xte
	Wx/wxVT78CmzuLRDK4afsEoxMk8jchw0mKoy7vpdLRuoH1BausZFelZWN7uurgSUC0k3
	a2q1Dqb4cseer4gglP+6coeEn3gir8cClIRNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fQhfk/989PFsHHgdBKjirQFWHS2/9lh86606Ls6usEQ=;
	b=c9Vt5sunVS0EbnyekzapWlU48cnRZOWipeWc7Obwk9ehCyrlYDAcb+cYVOpAc42qK3
	F7XcPmFlNoozeBM3cciTKpPWANIrrIcn6hKMMUcOJcYINYFh2s3pwxxtHvlvZ59v1aax
	+/xbbZUQLO0tVc1zQmYC7llDc3ig4Bqg4CX9tjR0W2F9tZgTarS+uZ5O6ZVjAH98OfOl
	yFCNo+kQHWjbzim8QLG7GRux52j3qp3YQ+5Lgt33OxZNtq9drXSf3OORSU7PYYG7HSRi
	j2rgo7SQQTIdSocvJNE6v35l0QWGGVmd7jxGeSEkhLO4FK3skFb1rn+5D4V6WFIeC1vG
	lOPA==
X-Gm-Message-State: APjAAAUsASdq6qFZAFHjgwscUljVBKNoRD+4K+gqMNEy51IrsMWqCQb/
	qM6N8e9b9Ta6rkXkgawOYQVg0c1cyq4=
X-Google-Smtp-Source: APXvYqxSZvhpHGeibqECSdEIlbsEcrYxcGNxFDzAfuxtM9m3ZOmK7rfctNBTtybnHIKky8EeLNMhkA==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr5717898wmj.140.1580904715467; 
	Wed, 05 Feb 2020 04:11:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w19sm7557529wmc.22.2020.02.05.04.11.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 04:11:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 12:11:48 +0000
Message-Id: <20200205121151.27880-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
References: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/6] mc: Set zipinfo presence determinstically
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
X-List-Received-Date: Wed, 05 Feb 2020 12:11:55 -0000
Content-Transfer-Encoding: 8bit

This value was floating causing differences in generated files.
Set it determinstically.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mc/mc_4.8.23.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index 95fa1dae78d..d8c8f8643e1 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -29,6 +29,7 @@ EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
 CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
+CACHED_CONFIGUREVARS += "mc_cv_have_zipinfo=yes"
 
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
-- 
2.20.1


