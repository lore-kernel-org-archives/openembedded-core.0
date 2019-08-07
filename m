Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 78ED77F454
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:29:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g67so75340866wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bBf6e4r9dLK8l4DdyyQl9cKikQ7IcNxnXQrzWKj0TfE=;
	b=Kbqh1T4vsu1s3jh6fNJwqqxf3Dyv+ehLWkBmenztfYBvKoUWE1p7r/LCaNVdhTi6ow
	4RXtkKUEjINjHCFU9ZTn/2GC98D4noVVIeyo/VMrqd2GcjOQQHKsZPBk1lPhrtLwyLYM
	Zs4KGrbUxiEf+xR1gPbPINkLHWQ4XUwz+/VEuISngaNzk+gqQDbo0VF2uVPQWv52zsDe
	W7/QWMdJ7MXUSNohnlDdXmlJ4FOxpiRptGFOjz2k06CpyLTKAUP3LfdxoyBycXHjwDvo
	8ajPcmmATz2XV58Ew4LyUKUFOsswcxs2mHqS0+wEavn08xUNpT4iKUlLr9JdMT1X+Z4W
	hF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bBf6e4r9dLK8l4DdyyQl9cKikQ7IcNxnXQrzWKj0TfE=;
	b=GVA6rcJFdshTpgSLNM3ebdbhOvVtGr4PqZ6DJzZ+I404FUvT4HqB/iZ1vr/Nw6GkJf
	3qXdsVS+yqQnM2Zo7NscVtifBxrhFu9lyiU5DGuzLwhkPRsdqNIv4u+7l8EkXUveqQm6
	NO0Umggkiu71Aw3yIZ/aP5An+rrI0luBcLG29b5swe2p1/Akr9qQ5f06Zkj3uRmYZorh
	DO0afVG+iLorAkJ30BP2WTBT5fYZ6ZkvgI91FVedUIuKl7d1kbdL39NA4d6mjWZHH3HM
	jXR8rfTGhZssxRLbDf0XyOdLhVGBgWXuiHbU3xlZ9gL9dWEJlzZxQWo5mwcnL/X5uOGS
	7uug==
X-Gm-Message-State: APjAAAW6HTdTkIsL56T0TJVqhfU+m0+kGVb8TWmp7+7FMc0ugOJRbODs
	uPLGdTfNjIQiz690VA9bCos0/qPF94uIyg==
X-Google-Smtp-Source: APXvYqyof8SRciTOsb4FRarBgtmicqeI6pqb4tXywyOcGcqey9kwjWdmLNFEQDB6kncZ8btMjQXGfQ==
X-Received: by 2002:a05:600c:2146:: with SMTP id
	v6mr9651602wml.59.1565173788071; 
	Wed, 07 Aug 2019 03:29:48 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm79705336wrs.59.2019.08.07.03.29.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 03:29:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:29:37 +0200
Message-Id: <20190807102939.12760-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807102939.12760-1-alex.kanavin@gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/7] attr: add a missing perl runtime dependency
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
X-List-Received-Date: Wed, 07 Aug 2019 10:29:48 -0000

/usr/lib/attr/ptest/test/sort-getfattr-output is a perl script.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/attr/attr.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 1a29eb339e7..3503d66b9e1 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -41,6 +41,6 @@ do_install_ptest() {
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
 }
 
-RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix make"
+RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix make perl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


