Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id C23BA7F41E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:30 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q21so2336926pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nUH7MkGfM3M2BiD7pDQVoBZUwXRw47CBguDNEuVxBTA=;
	b=IHlSZ6HwZVHioWb7c9adm/qA088N2ZL7beqeXoS8jxFm4N4c8DeiwcVclmcWtElWmr
	2uTsPge89CQMEERqTeP38dypMj6ejOambZgQ6y6Q3HH0WXsaKfzwHziJXjyW0XbJ3QDs
	BQtMKVmaTt4sYSPrDr+53xNkeiaErUIBn8ibrRviE+Zm0aNuBsYG9CMUfc2Dq58FPw+C
	OwdZg/deq2P+yUTOqxqrstJn6MdUZyi5VSTC3p/BSTwG7qYaQQUE8ASHzreS+Gk7uAS5
	jCS9xWPiK8I99rqrSD6WVruYNHFW1NhjKt9NK4UmVgJhRB90tTGsstCBYGdtpoMq9Zww
	o0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nUH7MkGfM3M2BiD7pDQVoBZUwXRw47CBguDNEuVxBTA=;
	b=HIDMcZWxNo401+BVCzRhg4wfrRayeq67y13g9yCm6M4M6tX1JRWAHmpm8XzB4i1wDx
	/X8TnHKWRCfbtK7BgUKhEtXoNOoRXhRXYHThpNmYSDjxhYezxMN1jCLDaFQ77uB0cFuX
	TfXQaGHdS/rP5QP0tfsFJjBxRIBD3FqtAg6GnlNSX+MjiYeFfjX6JN2tmmiMCiYL/jCx
	8c5MmWLJeW4eFcAwSnne9ys9GuEa4qht12Ux2UEJxl18GYCclHh3DXa0f8YBV6PumPR5
	4sI6VRQl6wwPqI1Jl54Jnjv7cph7HS2vPN3JGXY/l2OmYLzmESq1f6Qx1vA8qsSeIke7
	68mw==
X-Gm-Message-State: APjAAAXs8RECVLQODWUxcnY8mC0S1DvXPJI34f/VGBDHFkIQeZ+r+nwr
	5IgKvSFFiKi/9JJTKwVejmmh5Ree
X-Google-Smtp-Source: APXvYqz9YWJXbBnCaA7RqjdOht6/qLGooSInxdqle4e4Paa0f/0y6C0BbFf8ekDAOJNpFPNz2TDNFg==
X-Received: by 2002:aa7:8d42:: with SMTP id s2mr29626028pfe.185.1567348591777; 
	Sun, 01 Sep 2019 07:36:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:45 -0700
Message-Id: <05e4f56159ad4cff83bec10f1355be3ce5864201.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 07/43] libid3tag: CVE-2017-11551 is the same as CVE-2004-2779
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:30 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 0663e5f8f906803685f018061d51fd6277916e50)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
index 8d09ce7..10e0890 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
@@ -6,6 +6,7 @@ https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
 Upstream-Status: Pending
 
 CVE: CVE-2004-2779
+CVE: CVE-2017-11551
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
-- 
2.7.4


