Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 251B87DF1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 16:25:06 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u27so15078422lfg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZEPFwECHZkO+wJU5zlcPqKc5c8Zp77BGiATLfizrpp4=;
	b=V7D8bmsyZcYD943lfcVAfcoaGjJ/JfADZNJYLmZFB8dlIT5/Ap7PvrscguUPMMFqqb
	YnV4W0VS2vASyMv57pDnnFbbkFuuas7V4MCsgb3qezjYNS7HokPeUoSpE2CUkiZV2cDd
	LRttdQUzCV2kIed8VOD1e5BVUHlymWAHqk2xExK6AUpRtlZCuBPkUidzupSMD/sbZO4O
	epjGLV/wKE7DEUA8ARPpMR+bpXp7WGyudVRX5ju7dbF95fgn0yp0lNyogqTiCX1Rlzr9
	m65E1kK4IpqjQbQfHDnv6Fqr7HfO3qQiXiWsYgL5HruLAanQ4t9Ikc/CLqQ7xzTAG5Ii
	zkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZEPFwECHZkO+wJU5zlcPqKc5c8Zp77BGiATLfizrpp4=;
	b=fy6975wu8+dh5Kuu9bDR3jyLna0GjaZ3RcWpar6ZiQcJSPNgK8KJfKwKQCKxG/jZ9s
	NyBhsV2eZeKwt/eTYWHo7Ft31j2Ni0u9mHiosyGkWubghw4oi94WXtY1bbwZEyQKwUZt
	4Jj80t7EVTAw4hpQUdy8rW24mZZVMnzAFPJUbslZSpGWV4L7VAlxHsM7oVLSsxSguNvE
	2jGSLppA7fBZaFn9VREO48jpKbuWDuBKWClFc6xcpMI15UBrYX5A3kKESZQGq7d+9m7P
	6j/35C2J2vtNNuSQfTkYqp+90eht3853om083A5XNnKLBHlZlPhlfxK9itNEzErlzWRH
	PVjw==
X-Gm-Message-State: APjAAAUbqrAFhtyZtB5JE7hTwDiq+V/3jyncbOxevybMne+ADnANeOv7
	CfFEbO6U5lzBEZur8MMJGLdieQEqiTA=
X-Google-Smtp-Source: APXvYqxprRFOhn5TQyUHdQAc/04TavS5l5chcQLhjSH5oW5cGAwodq0r+W+Jwcl2PGF2AQJc3Bj2Ng==
X-Received: by 2002:ac2:419a:: with SMTP id z26mr26310779lfh.122.1559060707258;
	Tue, 28 May 2019 09:25:07 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	l13sm2435729lfh.49.2019.05.28.09.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 09:25:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 18:25:04 +0200
Message-Id: <20190528162504.32355-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] file: update to 5.37
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
X-List-Received-Date: Tue, 28 May 2019 16:25:07 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/file/{file_5.36.bb => file_5.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.36.bb => file_5.37.bb} (96%)

diff --git a/meta/recipes-devtools/file/file_5.36.bb b/meta/recipes-devtools/file/file_5.37.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.36.bb
rename to meta/recipes-devtools/file/file_5.37.bb
index 9a0e5bd220..803aa9a271 100644
--- a/meta/recipes-devtools/file/file_5.36.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
 SRC_URI = "git://github.com/file/file.git"
 
-SRCREV = "f3a4b9ada3ca99e62c62b9aa78eee4935a8094fe"
+SRCREV = "a0d5b0e4e9f97d74a9911e95cedd579852e25398"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.17.1


