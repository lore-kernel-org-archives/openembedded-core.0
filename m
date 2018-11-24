Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4890274583
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2018 12:54:10 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id c16so10383183lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2018 04:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=67K3zs88kkIy6U40q1As1JJc81+xoe1Xur2Ci6YgvH0=;
	b=gSujzwMCvBupR8xeMyfGDCLYKCAMc9sr0zYe+ETB/KOfMHJbuJRXrNkPqmyQx9RPNK
	efPt4WH1ut7yNnkDdRzfzUVz5CZFuMPmbHMCjYQvBWKZDoKAFCUzgEL0oxyLfC7+0ji3
	/pGGJxolvaBlAMYVVV+XAEL9IfYFOBZHjgWnTgAoLqNF0/eVZVXNHWUaciSwtJ/g4lmP
	++9u1m8XpqEoT2aOgF8xzlJWl5/Zvd69bnnhXzCIPuakJp3v7vkOa6L9ceYEets7S2PJ
	e8gMRfvLRd/Vv8lnZs9+Nmu3TitGpLvMu8kHKnny8lj39d9V2tB98gUkvuX1qJ+elhUP
	+kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=67K3zs88kkIy6U40q1As1JJc81+xoe1Xur2Ci6YgvH0=;
	b=dLvQh/c7UCa+eM2NNhR6vq1kQsOh0WS6OK/kVzZZszmz1+x4W+5f2VKDryluE5m4Cd
	CBrfP6j7+l10tsC9XIR9dmghNSPXLfs86xxgEHmBJrdJt3NqHN3uWftMLtPXCFHiTmt0
	3s1UfMAGv0OXelFyIqBAAc95mxa0T06FjhBOBh5s0QkBJj5h6o8EZHJPVtx38GNrZF++
	fKx8EpBIrMSfRV4QKpL685yplpzPecfnyu/FRxFdQ35UX1Za4DPZ1RbcyyuDJbXt3+BF
	+X86AHJ+D6a/ExdnESsN3ONZDnQY6Q+HWys1cKOok29z83lxQJoSLGGrFM2pSsVGUID7
	3tNQ==
X-Gm-Message-State: AGRZ1gIFHx6Ss8WJQP6Icpo9yyLazBEn8gFA/ls9ld2YO06VONO8VGkj
	w1ajd2nnb2fv/8u/twXCAA0vyWajBz0=
X-Google-Smtp-Source: AJdET5eBvYxWlrN8IAHSjcvMR1opgiNNTcVj+RFrdJE5ORpjJ+J4vIGfSfrejXR3kCFQ0S/WbHxf6Q==
X-Received: by 2002:a19:ec16:: with SMTP id b22mr12348829lfa.65.1543064050390; 
	Sat, 24 Nov 2018 04:54:10 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	q8-v6sm7007280lji.69.2018.11.24.04.54.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Nov 2018 04:54:09 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Nov 2018 13:54:05 +0100
Message-Id: <1543064045-27876-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] image.bbclass: fix a wrong position blank
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
X-List-Received-Date: Sat, 24 Nov 2018 12:54:10 -0000

From: Ming Liu <liu.ming50@gmail.com>

A flaw was introduced by commit c5fa6034:
[ image.bbclass: use prependVarFlag for postfuncs ]

it changed to use prependVarFlag instead of appendVarFlag, then the
blank also needs change to adapt it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 5a07491..276d0d3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -497,7 +497,7 @@ python () {
         d.setVarFlag(task, 'fakeroot', '1')
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
-        d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
+        d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
-- 
2.7.4


