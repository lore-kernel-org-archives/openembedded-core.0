Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 81F9778950
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 20:29:14 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id i6-v6so5835905plt.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 12:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wIdSerEtesjpcYU+vN62pbwKk18ikIKY7RdT/iE9/K4=;
	b=XNHwC0CtHhK3Fe2dZ2ql8B+1OgwMSfscYCLGyoBoNWUyausSjksan2sLNdFzI83Vzn
	ZH2+0LP/P+UpbO0BMoRb51SEBVxZcn5QEf2/OnwTVUSmqMn0AYUnnNCe8ZZE4nzsEv2g
	XEhXzHxpp66T4GyABDRxe+UXZpa6WyqQByxYwZwEUQiF8+9XAtfBfnhT29E4b8Jk2DgH
	m8hwU4wktdOusD8XBCr5KyKDYeouDCY1ljagChF5IMim4Z0/1AcRqgcv3LGnytemIWJT
	z3NdDrM2qBGWbTsHz/9tpeUnncXlGMu0/8U7MA/udinMdQKistAtPS9UW56UraNgqNjH
	EzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wIdSerEtesjpcYU+vN62pbwKk18ikIKY7RdT/iE9/K4=;
	b=dvrRKDLvYoaRQi48dSpbpfyjzjX++T2INq92qHEcQfwjiRStYB59atRtHlKGqiYWO6
	C/fjjGOCMc1IjD+Y/abk44TGPDX4u6r3KoYSbfgW56IvcQotCocjRWoUAdM2i1SsgpdW
	wNs7iUpAWj/XNwVmytbvlb70TtsU4OTBRbxbtCKCr15kwuOdpXD6niy+1jAIJWH/GWAd
	gQSgPyEoNm/HSrQQFri6FFk1hZhur7I1fNSv1AqM8xK6ZKv47PrzE7A5qzUju5ZUbJQ7
	wU96Mp4+CAItYj0oglSHtvUKwjNrAvc+8R7GsXF/vLdA05RvTqAXLYLjHF9U+0s98qOc
	4TDA==
X-Gm-Message-State: APf1xPBpPLVxnoeMPN2a5M+s0fY7bWJt1lO2ka5tYgt0hHU9Kt8Nvok9
	TeYymgWHGn/OTnkTmFqGgWZJhg==
X-Google-Smtp-Source: AG47ELvnv1KyzrqSLu2nZhHJRvKZuqWaBoOtT828U/Db5bzU5JZ8INzAOjo6WNxbw40frFMMX2mYvw==
X-Received: by 2002:a17:902:6f17:: with SMTP id
	w23-v6mr29181400plk.336.1520627355710; 
	Fri, 09 Mar 2018 12:29:15 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	v12sm3628643pgs.21.2018.03.09.12.29.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 12:29:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 12:29:05 -0800
Message-Id: <12917579ec721a207cd6d5d3b5b32a89fb6fa868.1520627244.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520627244.git.raj.khem@gmail.com>
References: <cover.1520627244.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] packagegroup-core-sdk: Disable SANITIZERS for riscv64
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
X-List-Received-Date: Fri, 09 Mar 2018 20:29:14 -0000

Dont build yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 393f0d3d13..a137e7748f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -33,6 +33,7 @@ SANITIZERS_mipsarch = ""
 SANITIZERS_nios2 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
+SANITIZERS_riscv64 = ""
 SANITIZERS_libc-musl = ""
 
 RRECOMMENDS_packagegroup-core-sdk = "\
-- 
2.16.2


