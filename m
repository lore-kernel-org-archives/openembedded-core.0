Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id B3DAD7E031
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id x64so7758302wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RiH6/Jv/h7bhP6pwGRETYnS4CJrQwrl+0ArlwSWrMZ0=;
	b=jXlfIyqzHMlyQUoVM0R4vQ8jTZMvjUMFNkaQm9+a9MxisiBurwrDsXv/JPdlfeoC5j
	0NQWF3EmC6lItJrGuVPTOyLn62NV0H6SWNuIfpdhXiWuFIg4nfSsi0DjREdiiMPxjq1l
	I/2xBfG/VVRxkul+wGdOxDqkh1BYTux4mzuO0vJdj69Cf0XZrMbE3aejKK8rxjKrS526
	XjQfV8Zj/iey+Qzr0EVzuF3+mQpqlHLFfIuhj5YfUV/JWKrdclS8W7hk0oX54YQDJ0lR
	rha+KYFzTiRjp26j7cfByIECAuemGeBHINQ5H6aVHJeK2Yzym+NgnHBxMWfI+GjrT6gN
	imOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RiH6/Jv/h7bhP6pwGRETYnS4CJrQwrl+0ArlwSWrMZ0=;
	b=NNNtI4/gJsLFPAwuRZ+SAIBfyYFKkVq4YKnf9LXg68Qu0bGhqodl+aplHyww4PO8A1
	z3uU0o4u/eKefCmkNu7U4BDXfwbhV8/fqhwjiAFpSmFQgLdK/9ci7+WKU934eV6/Bimw
	rk18PPaSEHV2WHebwcTLhPx0HG+1uWSOwQEAyQn6BF5Y3w/Dp35fsCPKGaHvnq0VdPE6
	CGj5Kkky8UOZSQVAKyNw4w3uM+GKYlIx/QW9L4OBhH7X2RTVXUSyzttOAk9lfXn4Za18
	PdsklOVMpf5bLq+jdYA2w5bqhuFOgT9WGyO0Bhh+16qvXpCsxYskH9ZL4qM6LEnE3qbD
	l6Hg==
X-Gm-Message-State: APjAAAUHU83+lynGInSNTF5NyLLX0i8QM0E1366TOEtHFh2+Y+cNE859
	h+IVGYcpmA190Z0JbOKRhmWxR5Zj
X-Google-Smtp-Source: APXvYqz7C7/rWewEAwl/0/LNA1r7v4LriyPBQUaXkXyzqMoK7lbaneUfkgjHmCYFW/xwTfnAbyCZmw==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr125942wmh.0.1558116745194;
	Fri, 17 May 2019 11:12:25 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:45 +0200
Message-Id: <20190517181151.44001-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 31/37] bash-completion: upgrade 2.8 -> 2.9
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
X-List-Received-Date: Fri, 17 May 2019 18:12:25 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{bash-completion_2.8.bb => bash-completion_2.9.bb}     | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.8.bb => bash-completion_2.9.bb} (82%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.8.bb b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
similarity index 82%
rename from meta/recipes-support/bash-completion/bash-completion_2.8.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.9.bb
index 85064343e30..ce66ba5a2a8 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.8.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "201b6ae62f7d5fb5b1b25e34427db919"
-SRC_URI[sha256sum] = "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d"
+SRC_URI[md5sum] = "60139333b25c4d54ad40323b701be130"
+SRC_URI[sha256sum] = "d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6f6cc4b90fa12b2f5"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
@@ -25,9 +25,6 @@ do_install_append() {
 
 	# Delete files already provided by util-linux
 	local i
-	for i in mount umount; do
-		rm ${D}${datadir}/${BPN}/completions/$i
-	done
 }
 
 RDEPENDS_${PN} = "bash"
-- 
2.17.1


