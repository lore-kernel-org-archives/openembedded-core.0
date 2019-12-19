Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id B5CD47FE2C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c9so5956662wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pZ8vAlrk7CuidjJgQF944lwWUXyCoOhwbgKsBtdHM6A=;
	b=m42Z68dAbRUFiHpV069WO8AGdI6FeyeJ1GI2M5orFDRJaK+clcCmdBQlC+XNx+vf+D
	wn7waxEl3MoWVMe/4BUV0M9JjQQ9QEP7t0jngKH8z2fNkPAhXr/5HZO5/E7X9PfW0eyF
	3KDuA8YRPj92SzQJBmvUJAQ3rAK9NkbylDOP8P9bFRcC+nRdSc4qCI1Ctd5e0XDJLXRZ
	jtgE9XmY4+apx6bCR2XrUnm9ORs8SR+j98i8v21SMr6ax7lACQnigjJMokhnrr4WlkHp
	QP1IQQK/Y0aN+FTFXOJJsHJTf5PDsIoA/SbyKnbwghfOOh1Jd21zAEZeedgO89TubY8h
	sDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pZ8vAlrk7CuidjJgQF944lwWUXyCoOhwbgKsBtdHM6A=;
	b=nTfdjPRp1A31o1HjA8Z+zqrDiFYnJPw7vMkYaFrxdccBncA3L0i0ErJbJjfuytMZwA
	F9ABvQejFG4sa+lCMuEY8RgG0g69C7V1/OQLh3e75ttOL8ChA7aGjeUyZ8HfbBLVAjR4
	qY7gqrTkdFyZIddDXwOHRghRN54H9RZxFnOMqCR9K+Tl3AqKBHiFl8USrByporDikdQs
	DpsQIXCJQuLZIhhdnnuxsA/vQraybkfj4USoYb+EY5hZz6jaOVPm0PKp3nH36QEiV9xv
	D2FPjSFaYg3CHD2+2unvn1tSDFfrH9AjrbLWj/hkNEqhs6BmXrkp4TdxQZgk5e7XD60j
	sGYw==
X-Gm-Message-State: APjAAAWUTgIFcrz60MvddAde5qHsHDFtejDVz240UMrXZnwe66ktidKx
	3DsbCtVIqU4MZFpL989Cklvl3fnSEZ4=
X-Google-Smtp-Source: APXvYqxbnNhbCZuzbuiOlgaVTcYzjSk3pCUhOyIWxMwjDkTSQBwvaHootozTo8V3yTGwd4R5yTbbLQ==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr9085292wrn.251.1576761801871; 
	Thu, 19 Dec 2019 05:23:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:53 +0100
Message-Id: <20191219132301.80034-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/16] createrepo-c: upgrade 0.15.1 -> 0.15.4
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:22 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.15.1.bb => createrepo-c_0.15.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.15.1.bb => createrepo-c_0.15.4.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.4.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.15.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.15.4.bb
index 797db738f47..75762b7fa52 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "bc67f19ed09593e3886ebeee2391e9d51cc3439f"
+SRCREV = "8ac472e1267b2ca11d11418099ab923d319fa2dc"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


