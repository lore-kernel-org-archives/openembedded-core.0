Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id AD0807FBBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:22:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i12so19192099wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 09:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V1PNnYrrH43H22Rqz9VcTqPenMn5HWtKcF31dijZE7A=;
	b=plG6q08WLg+wU8FW1JUCTx/iFhH8u8T34YHSMWHWHV+QBcGzlVO/HyntckZoWaULmr
	L4FEaAvLGyxKkCKevuYyqigjlXTaNfH1/apu2ylRvyOF6Mk+qsct+kRwdUtOkoKSVlci
	vwoHasjb031jnSJLRkxnDAM9TStzGZV98X08DRbnB4Sperqri6aFkyupouB1G/DkdY8j
	tLivro3yglomb0Rk+Yf/DYTLSu1Wf7Dv7mMNp5J6qlshLef0dKPxWN9pVv8ZLO9H/b3N
	Ak9N/8fjqQUkOuYUcRMxBZRw+U5Fh0MU6dlySWLakNHzuuI2oXJGrAHatYzlN8rU9hoU
	NaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V1PNnYrrH43H22Rqz9VcTqPenMn5HWtKcF31dijZE7A=;
	b=uRJWQxmiJjydylsZO8s8Q2cFLj+U0BBHvSW6luo17CuXq2DjnQqNb/CQQAPLSwN5Ql
	5rmSQud23Ha+Ea6m0797fzh2RjqqcpqaGsF3K//zWin6Fj8ICRzg9rWNVXd6Thp0/jW+
	5X+jR9Hb9M6ybCM1GAvfr9ARI/piycUjqghitmRq9TOTww4RUHBnH2Rdb83mjNf2F3oH
	GgkblamVcf4eawZfWyhr0HTJWH/bzwpM+dN1RaLkH+TJYtWfGk1aDI7dln3BStK5r14/
	VCkiS8Nn4cRbNB/dEM/0y4AE/ikl4Hvd9Zd+sp3Ariby3QfH+lLgy+80+C3xqVuSCh05
	7pxA==
X-Gm-Message-State: APjAAAXfp+pWgCSGweVxmjc8rGd+zSKGGFvb0xRv3qqgY5ztRr9eTGHX
	b9/ZgwAGlWTXnAv4MvYfmWxt/1UA
X-Google-Smtp-Source: APXvYqy8cdF5rf4O8+fAnbtkrGSa2qMkgHSeDWYEa6bWTDJc2NwbDeq1Ect7+F9Vymvb6pSgPgDmdw==
X-Received: by 2002:a5d:5089:: with SMTP id a9mr32680782wrt.57.1574702553055; 
	Mon, 25 Nov 2019 09:22:33 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f140sm9693357wme.21.2019.11.25.09.22.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 09:22:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 18:22:24 +0100
Message-Id: <20191125172224.82269-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125172224.82269-1-alex.kanavin@gmail.com>
References: <20191125172224.82269-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/5] packagegroup-self-hosted: remove python 2.x
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
X-List-Received-Date: Mon, 25 Nov 2019 17:22:33 -0000

With this change, python 2.x recipes are ready to be moved to an external layer.
Once that happens, they will be removed from oe-core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 0aab23e3e0d..83306caea7c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -153,8 +153,6 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     perl-misc \
     perl-modules \
     perl-pod \
-    python \
-    python-modules \
     python3 \
     python3-modules \
     python3-git \
-- 
2.17.1


