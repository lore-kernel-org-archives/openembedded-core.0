Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCFF7FC5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i12so27413957wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wy/URAHkm8uIhfHVeNHwJgqxfExpdDhI0KPuv0r0KtA=;
	b=qCKJvPbzdD9Uhp3RmR+/AcT7g8pvPwt8uyHzHye/sM8huVMiPOC+NqLfYMwAATPY6w
	AcS6Q8FI3ravotO/Xo1XPTm2dsxUm1xFeMVPwrRc524hxIaQ1IJ+sDnfwCKkvk2JxgeX
	5ZtaskPMUPdv1Cu+IDB6Rk0ajFzkbofD4XxuXNJIHYBmFDp2hB9VQidmUscDEjWiN7WA
	A74kfonhkX9H1M3FaYGYjv/NUnZpg8btEgJVLQZ3GEO9OH1lzayG7mYFChCKh4Mvnxn/
	Kxz6E+fmEVJtJI28yyH/fiXce3JRCXCwfjnjwHpf1j+chnDVoguyeVjlHmnyGBYrwFjS
	7Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wy/URAHkm8uIhfHVeNHwJgqxfExpdDhI0KPuv0r0KtA=;
	b=D37r3JDxewlpF/01nQhl7Bnk54V0MBqASkviyKMFd7WW2bmnr0vFsTQSeCIhFvGuhB
	3WLF2anYaUK0B2FVChQ7KiY03EFs9ARkUOshxa7voEArwRHcTUDgXSkaywFz/pXZs1VM
	qLo6K4EBy4A/A+pMOZEggAhfUApGncJm1boxcHT4x8k4wXWPOkiwscoz1FYPFou/T7z2
	AuZscAy/PtnTLvAHTCbn6uGc/33DO8ukI0tzW4bRXv35xSu+GvTrNy5d+1F/EB/Ih1Qg
	bshU8YQtgU1f5rBsYhgoPri9WS15Dxf+DU+twhbWmr/P7hTTgbj6rUDIOh7DU5ec+22R
	Tp+g==
X-Gm-Message-State: APjAAAVNcnJPHGKYaE+XBz71+CAU5futcjiMohZN5n6HOvCHFBNfoNXd
	GwfSxL4rA4ySVKm8reoVqTlDX/4n
X-Google-Smtp-Source: APXvYqx9V80U+zTrpvVt7Cve6sfMHlXSQ1leq6TDfUYewLFwDVkXww+5D0Lofk0OQrGpw3XxIiJ1Iw==
X-Received: by 2002:adf:c50a:: with SMTP id q10mr3429717wrf.374.1574872812642; 
	Wed, 27 Nov 2019 08:40:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:39:54 +0100
Message-Id: <20191127164003.115980-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/14] rpm: fix spelling in one of the patches' Upstream-Status
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-rpmfc.c-do-not-run-file-classification-in-parallel.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
index 9a5cd7c80dc..d8d338792d3 100644
--- a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
+++ b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] rpmfc.c: do not run file classification in parallel
 This is causing freezes with libmagic when the file in question is compressed:
 https://github.com/rpm-software-management/rpm/issues/756
 
-Upstream-Status: Inapppropriate [upstream wants a proper fix]
+Upstream-Status: Inappropriate [upstream wants a proper fix]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  build/rpmfc.c | 8 --------
-- 
2.17.1


