Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id E75E97F8D0
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:56 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id kx11so1663290pjb.4
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sMr7JLmUkgSgNr+DoauJEtLlBp4nZcZeJuVSbAy3nQ8=;
	b=F8wVJVE8w4F6Ogi4snVHE+GjDWFFzUYUsg92GkpvKKMIbxArvTSOx+fYkOq8qUHGjX
	auxCbGedIq3rZXa1BdRBjp18WTkziNY9nenfuZsuxzKr2KrxVdfxEbwNnny3UMZRfEnQ
	zT7XR9XszrksyusbeDTnAQ6nWdnrOvPV22x2SzU4dUCeY9iGbOu4iACxvkhgPmS9KpEs
	OApxk3RihLW3+9pFiUwO7WgCnbu/vrlEO/4T5YwUtgeXBWJbTay3K/uX5N9PqhO+XOjz
	8jVZHdEImzYdbOtsWzMmf/BWsvINKMI3/Ey4GLW9+e9HW3Zkqr5/UPR+9mYhA6mPoOuI
	i9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sMr7JLmUkgSgNr+DoauJEtLlBp4nZcZeJuVSbAy3nQ8=;
	b=SLaM5FSxFxrB5O1oZoR+j3T62FOxHJQZIzERNvqN9dTYhelcsNbFFXcB+j9WivXRGN
	DaU70ZrGO4Ehx87TTguDT9WeQ3gXmQ8Q4e3Yy9HC2cy+k+lmzPIsbKLv0liRzRaiXxru
	SNrLoToclKDXXJEJMYWBmnLMuD+rf4fRlMsEn0knKyW/q1X21iaCufqFx37ZsS2b1hvx
	iTeP47S2e6FoOrizp6rggxi1kQ/AeE/irmZrU1oJBl/KkczgZcbqlGYtGIn39WpXjfG6
	Xn91p3NV8okL6CIGCp0W0IgBQGUlQC3CkoZAjd6Q82qYJNkLw2E+wNKSqS1kO/GFAeA0
	CD5Q==
X-Gm-Message-State: APjAAAWFGxQWCOm1CpwmDTyGrU4DQwqHtV9Yt24epwHwN/0/BS1QxRVw
	ZMYT81SLDFyeZoYd2Nf1BKsvD9ur
X-Google-Smtp-Source: APXvYqyeUzg48SdQC317G7qbR7gsPIiVd+Sk27QCBLug0OYcA7Lfu9UKeY9uB1wYzxWIG1ZpatueCw==
X-Received: by 2002:a17:902:8d83:: with SMTP id
	v3mr33333002plo.282.1579188057902; 
	Thu, 16 Jan 2020 07:20:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.57
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:22 -0800
Message-Id: <583990fc583a96dbf0655bff1630b2ebe199021d.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 13/32] libsndfile1: whitelist CVE-2018-13419
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:57 -0000

From: Ross Burton <ross.burton@intel.com>

This is a memory leak that nobody else can replicate and has been rejected by
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 77393db847..6044bf09c7 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -38,3 +38,6 @@ do_configure_prepend_arm() {
 	export ac_cv_sys_file_offset_bits=64
 }
 
+# This can't be replicated and is just a memory leak.
+# https://github.com/erikd/libsndfile/issues/398
+CVE_CHECK_WHITELIST += "CVE-2018-13419"
-- 
2.17.1


