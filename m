Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6136A441
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 17:48:34 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id r7so32284411pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4MzgthbKsfambikA/ftcFE6TJPBjaK2RRFI7/ANsbmk=;
	b=ctFFNEZvtAyeTl3oraYwI1axnYDgO25oE506Ogs19eCgvf7AJxEzG4RizSa9sWL6t4
	SDczV4GrYRlh1doAsC937ufRKvGQe93Wr7FtaOFyCxr3KO2pfy5gaV4HIKcj8oBIlO5F
	yjJelQNoDNTPP9VsUaKzPwsoTKKxgUPNT/LwVWq+U+iPxX1Jkr5V3cFF6Xwrg6i9lcga
	wk7qUNNwr0VQkyHd+1RCZYbdf03dm6LMj3vmxnjOWiAMl3NP3B5ij39lPkPk6oshTTGu
	XcxDC3DZUDxLWtaazduBIdlyD2exskuGu0Isjl5V9ypjEeV9glesS5LnEPAaB1DaQ++7
	kGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4MzgthbKsfambikA/ftcFE6TJPBjaK2RRFI7/ANsbmk=;
	b=I1kshDg+ibIyS+3qGgTLLTmQ8ZtxEW0tZbwAgJJ6QDa1J8gYsRDAw8YMWgpDqim9/1
	dH0th/mHQd98beAuXjLTNG3Bzw97WMS2vf2J0pwVM40uQpvLvbQyseyT3ymk8jaqRsnc
	BqKgu6CdVElAS6V0ILkm2V6Fe9WZzsHsoq0bDV+pgM8N/Bkl10+LYbCGqNCEyb9Ri8UF
	teQSVDjsprnXFCFfY+APi7oe/Td7jlBCdRVEyQx9IIn52BEGjtqR4qD1AROV4vbRXvFa
	lGSCi7KXt3ifsEcp1wSrwatlyYPSlREtAWNkx9HoGXnv0SiH+2mXM6efm7VDUpv7LQ/2
	CNtQ==
X-Gm-Message-State: APjAAAWfri1lbWgid4uBSnU5AwING1aY2ULxdwZWW0UXg2EiifO9Be5R
	4FkAthNG4tk9ZzAcVB8SKfpTCZIg5ps=
X-Google-Smtp-Source: APXvYqxTUsuNWg1htCKG8vXwFfBIJALQ0gl7MsvnT0LL1J8/0BZHjh3RCNfcd5gkfj6f1X2NCxnGNw==
X-Received: by 2002:a17:90a:24ac:: with SMTP id
	i41mr4084166pje.124.1564595314925; 
	Wed, 31 Jul 2019 10:48:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	m4sm114750440pff.108.2019.07.31.10.48.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 10:48:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 10:48:20 -0700
Message-Id: <20190731174820.16459-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731174820.16459-1-raj.khem@gmail.com>
References: <20190731174820.16459-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] llvm: Update to 8.0.1
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
X-List-Received-Date: Wed, 31 Jul 2019 17:48:34 -0000
Content-Transfer-Encoding: 8bit

Add missing dependency on libedit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 0067635c2b..6d3d69b9fb 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -8,7 +8,7 @@ SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
 
-DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
+DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
 
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
@@ -19,12 +19,12 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "d2298e74235598f15594fe2c99bbac870a507c59"
+SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
 MAJOR_VERSION = "8"
 MINOR_VERSION = "0"
-PATCH_VERSION = "0"
+PATCH_VERSION = "1"
 SOLIBVER = "1"
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
-- 
2.22.0


