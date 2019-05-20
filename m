Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0023B7D735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:52 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b18so14744046wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Wpz5yItpWG8G1ChGFCjOdWQEOgjrEYPjWhvr1drR6Qk=;
	b=DC0VB9RXQLlg06pGaAIJxOq3bjqrjaeqC64AKrQhfF6KMHUqoh784Zx3L0iAaKDaTt
	c+fa9nCpzNZry/Pq79+lMtSL2IaUlG191D6voAq/VbSW2pqtolOXBpbvwhmfomiEP59M
	dyGsj6QwiFMTWXSjUtfJ39hoyR3IeKba66j370a60w7pl76/Rcw7oO10DkzQHTFUoYqs
	0TswnJO/bCIEZDn0lIy1JywU1dbbNwbZNpgMWLEpAdBgdmcbqICcIZRc7dSUEpVDuVib
	Uu19gleraDXGg8b9iEyD+LyHPNy2sfQ+UwXIr4YHppXouKEljAuqfi/R4KU4KYehe8LG
	HLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Wpz5yItpWG8G1ChGFCjOdWQEOgjrEYPjWhvr1drR6Qk=;
	b=hQvE+fhMAofY0qEpFqzLJ+soelsFaKvsdv8lhlgxpuRughj6qIHqbbwbTMWHUT+syB
	DIA+b5uQ/Kv5XQJFaPx+yyXRaq1C16bjiCItsQQlldSY+AQ/hB/G387iMs48mwFpmwhW
	ph4FANGZJhRNj5L9ebOFEb/jYKlHx2jXCKmjNj7ARR/XT3ZzQbC2LzfuMuWdKjSWyQrG
	9clH0hIgOGOua0DFRl4//7zlVxYzaeSqAdm3N7Z6Dyw2oTYQHHS6RMzLtSzsr6RdUCdy
	Xbp7XVaXvaB0+T6no63SFR3pAIIocmlaVpLayR2Y9sRKFCjXnalyUjxJEXjZhnShBzBp
	xWVg==
X-Gm-Message-State: APjAAAXI1r8xivnNUk4KQRYUlPT9jQy1nQIrVpTQbVPqFUfaNBUA0sKA
	Wq8eavToH9LU9LNFRU7v/H/u6S21
X-Google-Smtp-Source: APXvYqy895xAfz2z3FWsa4z5N7aJVeUWUkX4tRJmJECYiQwgVN82TVXNVRdD/KfuY/7Llzb17pkCqA==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr17709804wrn.198.1558361513543;
	Mon, 20 May 2019 07:11:53 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:04 +0200
Message-Id: <20190520141125.10805-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 21/42] python3-pip: upgrade 19.0.3 -> 19.1.1
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
X-List-Received-Date: Mon, 20 May 2019 14:11:53 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pip_19.0.3.bb => python3-pip_19.1.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.0.3.bb => python3-pip_19.1.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.0.3.bb b/meta/recipes-devtools/python/python3-pip_19.1.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_19.1.1.bb
index 4fdc7ee244f..baf32f4724e 100644
--- a/meta/recipes-devtools/python/python3-pip_19.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.1.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "1c5edb0924a0d7d79f3a2e3df05009b4"
-SRC_URI[sha256sum] = "6e6f197a1abfb45118dbb878b5c859a0edbdd33fd250100bc015b67fded4b9f2"
+SRC_URI[md5sum] = "4fb98a060f21c731d6743b90a714fc73"
+SRC_URI[sha256sum] = "44d3d7d3d30a1eb65c7e5ff1173cdf8f7467850605ac7cc3707b6064bddd0958"
 
 inherit pypi distutils3
 
-- 
2.17.1


