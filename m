Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB937FC06
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:08 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v3so5716482wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jEPP5mgaXg7UxwtXwDO7d5bDjzHJQ+OJ5hlBOxgvD4Y=;
	b=sbqpzse7Hgnr9Cnvj+I6A4ZIFO4CKZiRtlIjYWqPyzDIzQyEDCLrF0PdTOONL0VQSy
	k4CQEETWPqEQveo5LygQf+nzKYv2QXbInLvQRce4ICCQ9XmrzJexEbgF8H/mi56bvqzn
	3pVPZ/1s18fdAQhrb4kcv7SFmGB6Ov23diiXM3htpt7XWzUi0/TFjHJGDj3K6cJybd6I
	cLuQtCGFKPT+mf3gUTBFzhDUbg3/8h/qfvEYJ9P+2vljxE7xasPhImxfjp+9ZqmutU++
	nY8Ys6FS9SeB+OU5+i9j7DZTgxNLsp5KBMXBcpKdnqfG4mu/yOewdV0lQK71PvgCqmTc
	kj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jEPP5mgaXg7UxwtXwDO7d5bDjzHJQ+OJ5hlBOxgvD4Y=;
	b=cxya/AvtP+mdja8BZVb63iaYk5tPUvD+1p/5sLywKFHFjZjab9m8AjrpwiK+5MWmWI
	QNAdeaPgMsrUZgJyab3C9BrvRmONwXiOA9mip5DOhDyTsDaU8alutmhIUTnMWAomw0cc
	9KzMM6YcED4Yhmpm55G2dwovEWC6ZpBUzTAWyOVo2n3XA1drKu6DDgyis6x2+F6ve6op
	de72wt59vRa/v7criBNJOiHXJaDuvPpg4Oj48SB0xBzepDwuTz3TXpPe09eqft48h/7u
	C3MJN9sAhwQLu0/bcU0+eZCpkkNUkfTEw0z+M0vWiX33diFJOS5q2NV/Wn7SykFajHsl
	gw3A==
X-Gm-Message-State: APjAAAWEwYPheK+GLxbWogltlvIUSekS5dDbLGD4ZuJ1XTmBF079plKo
	XNSDpODsyQJh863EtYId7pbaiSpDm4Y=
X-Google-Smtp-Source: APXvYqyWCDdl/tSTEAc1Sgenora1vdbg89WyeOygxiSHkYSNYWuH/pOwramTLdZJzEArhh/v2hrr/g==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr6450835wmc.68.1572072608970; 
	Fri, 25 Oct 2019 23:50:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:37 -0700
Message-Id: <5f51c9303940423b05ba8cfeaa1c9c2b24e36a53.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 05/28] runqemu: unset another environment variable for 'egl-headless'
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:10 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Some host distributions (opensuse for example) are using 'pkgconf',
which, unlike the original pkg-config, appends PKG_CONFIG_SYSROOT_DIR
to every directory from the .pc file.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/runqemu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1a5aca9..46087b8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -457,6 +457,7 @@ class BaseConfig(object):
                     del os.environ['PKG_CONFIG_PATH']
                     del os.environ['PKG_CONFIG_DIR']
                     del os.environ['PKG_CONFIG_LIBDIR']
+                    del os.environ['PKG_CONFIG_SYSROOT_DIR']
                 except KeyError:
                     pass
                 try:
-- 
2.7.4


