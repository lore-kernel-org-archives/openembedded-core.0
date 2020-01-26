Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id DC49A9169E
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:11 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id gv17so2111541pjb.1
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tlCOGLn06jCMHCljZ8qSaiUEU0NbCDtIZiLthLQwYho=;
	b=gKL/jZBVZgufluO/FG3rnWKIzOLNveUHsZYENGaYin8lgsfWn5/Bt9/3XNqtKyv6+9
	J59be5yp3VSeo1HSIQGKlmJU6XgLpVsG77JKUUAkk8WNqwzi3+rDMin7A7u9Oe5RKh1d
	31O4VqrjoaSNxvZXVOBw/DNKkJuJlVCe8YnfE3AFUzh5ymsJEWRuveJ7AlcoTpOCncc2
	+28Z1bxxw4pBDFRQXl1Clj0SbRFsRpneJVLma33q47rwtCw/XiR7e5dWI5QO4Wrb1jx4
	uhFs3Y1kN9UeDV+i8aAG6RaEDjtcQ+jiyn3hHC/NpaeU0jKdvJVs4IEd+KoIDW4q7HaN
	JkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tlCOGLn06jCMHCljZ8qSaiUEU0NbCDtIZiLthLQwYho=;
	b=fbPdEh/V4aYLJlsCdXOYpcql4naVxCYUWup1obqQxkqXGgZcGuzRHVOTKnXazEXBc/
	c4k5pP9UmVZEzYyDUm3Nuvf9k6nWwZYCxSL8JrDfAJXBTtoUxoY+BHiMX9yKRprANUYQ
	ramNhhRtjK3uwMLSnbTsd83mx5aca5HGhsLPuiMMJ8wfdTyRR6WHIesxu/b4KVyHGCvA
	UiM0w8vmvd9qJ1/xcwFuV7I1OVHilua97s+G6o+AzBBoKBaTlSjfigAbJOlkM8tw/8M/
	q+cQK8YCe8phziPwKFqefNrw5xeP238KhoUKU/OdhpqSNqT434WduJ/hCJc+3PYtUhlJ
	HDdA==
X-Gm-Message-State: APjAAAXLEYk832KHypT0SwqW2b7jeNVf0Xn+ojMrvrHSMQ9qeEDftJF1
	O53Msc0pV6X3HOv/sMvj9NYX6kpq
X-Google-Smtp-Source: APXvYqwinEF07vvCtout54JSeZQx05DmOBEhBvqtGFMkMR4VDxKxYgwo2unXTJDe57X/m2xFv8UMRg==
X-Received: by 2002:a17:902:a616:: with SMTP id
	u22mr13598684plq.173.1580055912881; 
	Sun, 26 Jan 2020 08:25:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.12
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:45 -0800
Message-Id: <7c51ca8538f228d98a4b3411a15fde83516c0419.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 20/29] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:12 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/iputils/iputils_s20180629.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/iputils/iputils_s20180629.bb b/meta/recipes-extended/iputils/iputils_s20180629.bb
index eff44be1bd..5d11ced96d 100644
--- a/meta/recipes-extended/iputils/iputils_s20180629.bb
+++ b/meta/recipes-extended/iputils/iputils_s20180629.bb
@@ -21,6 +21,10 @@ S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
+# Fixed in 2000-10-10, but the versioning of iputils
+# breaks the version order.
+CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
+
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 PACKAGECONFIG ??= ""
-- 
2.17.1


