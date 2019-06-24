Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 084E57E539
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:27 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id t7so6079201plr.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hCtZJm9WtWbRLSuhSHHq9qbOo2xstyfLYczBe+5GCbY=;
	b=AHWBIJWuQCaP94ihoHCGWhHN8GkiFUcSe2s/9OdRhbaAdfvyORS2GZ3q9OQzGSboOZ
	h2hNJNL5OkngHY0eS7AaxuAyAvUDs1NR7tdvf1i8ojS/0yIhWpcpFVLkQIsQmSURUbbe
	oD/TZe8q43wTeV0eu3cE6JEtipFmOxA9+FRB9Ru4vt9QV1JXzfP6hwHQuuBIRp5QsmB/
	SQKOwKoY1qjaENyn3X+ECKXorS03hywJobh0jh/Wv1Q7qCQ57qv+qAu1gAsKxR5ibelq
	cJegkAGgozDLhJIIQ1KeTAx/DWVNIqvTA81JjjrE7PUxr0BqFfev8eARKaNHqh0DfN7Z
	aumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hCtZJm9WtWbRLSuhSHHq9qbOo2xstyfLYczBe+5GCbY=;
	b=DAMYv2RJknxbrkSE83BBBwVhXZ6lAqe65V6n8pPl2BPL8zdCJp7BjVIgK9Lrb2rElQ
	RQYO9dMiP6QKjeA25kP1+Qyo8yypG+kvcXLdFJfc2nKYI6MFO8N0MwIcf/TZwO3G+jx9
	gU+tArE+CvYFp6tePVSc4nwS1PoPVulwIGATcUwu6EzW2dG8pIEDkR7l4rTMbMmAFxmn
	p2t1SN3+vlsMNV/meomZXDBpa2kZfBqonruPo9hSGi4A1b2yXwVuzxatPzj4HmdVELTy
	U2qrlePZFvWI5m1Ik3mQMoMQVQ0BHCEmU05weD7rjUCMAWC+1u2p23m1ArKEMM2IeMjB
	yAyA==
X-Gm-Message-State: APjAAAV0C2SMgx3Jb/VYKnpy6YTeQXrQpZrg2t4LXE3OO1rhrB95PuIk
	nL7T9bs3hjnebeliDcdFu2GTSWvVcX8=
X-Google-Smtp-Source: APXvYqyjYKrPUg3dIaWfa5NPgdTWiZyhUlz3hTBGf2eodQy0CwPw0LcETOocGuvV/aSvUqn/+DhsoA==
X-Received: by 2002:a17:902:6b44:: with SMTP id
	g4mr52163741plt.152.1561348469067; 
	Sun, 23 Jun 2019 20:54:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:06 -0700
Message-Id: <6f2727ea9aad3ecb45b7bbe9db3424eb56aea3ea.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 07/19] ptest-runner: update SRCREV to latest HEAD on ptest-runner2 repo
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:28 -0000

From: Sakib Sajal <sakib.sajal@windriver.com>

   63d097c Add SPDX-License-Identifier: GPL-2.0-or-later in source files (HEAD)
   fb93c99 utils.c: close all file descriptors after completing a ptest

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index e2eb258..0450e18 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
+SRCREV = "63d097cc46142157931682fed076b5407757a0bd"
 PV = "2.3.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
-- 
2.7.4


