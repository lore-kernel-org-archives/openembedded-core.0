Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C15347E512
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:33 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id a93so6105944pla.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/F3KzzywhGSI9y36kCD7rkPWptfk+3RnKs/O/ljbonY=;
	b=h8PA2ihaSDcoOWswHXccWbrJoJFWHcvGQNBU5CUPqythLo47lUJWZe+1xtGGx6uBk9
	UEGfscf2J+K6QG/HC27PNa5NW/n1Wce9OOfbWJB+Q+/lwdkX3Mmn4efmisk2ouwOLXR9
	n+ggB9Z/fsKZT3L5tqgaFgs3MbgzmuFoOCbPfEOj1YoO/uqv+mzTADkv1g0lxHLmZoJU
	bZZCGhE/lELkvnoiwhmBVtC2Ftj4s+mAGsVO0TbkHn8obIGVEGB1oUpe88iYGjNPAFAT
	q/evXOoWTEBxc2P2xZ0LuNNWcMKvSiP5CuEdn88Y6vvxgNK0fT+kaC3Ulci1CTQAMhq3
	bEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/F3KzzywhGSI9y36kCD7rkPWptfk+3RnKs/O/ljbonY=;
	b=JZl3qyqI8qALTJcdfxmBIm9kook/v1bDW90ajAT+aiTdZctF1OXA+3kVYIUFEEooab
	E94NpgsnD4c/ODRIshxx3Ndojt4xPLqd7Yal06w2gI2TKzh171FIBMEOklVp0h2KloC1
	LpIWnJd2sXzpRefIyfBNlWXawHUwYxcqaejOrMAgNgHZ7rPNYb0DxbTDVEzr+/c9uw5N
	ObLfNVIIWxbLeYzIGZfbXCI+OIgUgGoW1ZPSq+Z7cBOD3TcrupNn7gkTb0yxlgfi3rPr
	FqzxPmTB8QtOSSOyIlVXYBcnBvrgGF+tORySbimU+tgiQ3dPmQrKw30/j7sKJmp9qppA
	0aNA==
X-Gm-Message-State: APjAAAUqQcb2ZdWiQbLqGKZRFmhvw06PpemGkI3T0OUAtHvrPNAZiLJr
	/83kwa33QU+f8KZz5qs9Qdd//OLTyC8=
X-Google-Smtp-Source: APXvYqxJVcN79wwV3Mv8SW8EPopllx4PVxgP6hN3/9qvcj6z65iEhbs58bBeHCKB2a95wkcPfTAmPg==
X-Received: by 2002:a17:902:2865:: with SMTP id
	e92mr143561402plb.264.1561348474830; 
	Sun, 23 Jun 2019 20:54:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:12 -0700
Message-Id: <9cf94bdec905c820bf700fe8bbeb5f58ffa67e6d.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 13/19] uninative: Update to 2.6 release
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:34 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The 2.6 release contains both libcrypt.so.1 and libcrypt.so.2 which fixes
compatibility with recent fedora/suse releases.

The difference is one is built with obsolete APIs enabled and one disabled.
We now ship both in uninative for compatibility regardless of which distro
a binary is built on.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 0bb8f7a..df24346 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.5/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ca977ff95c77f983570141908d451ff7d78add2864471605af404302bb36a1fa"
-UNINATIVE_CHECKSUM[i686] ?= "7b5822891c293795faf8a4a80586b36f8cde405387524916a24f9055ea82f7ca"
-UNINATIVE_CHECKSUM[x86_64] ?= "ed0ac07c710b711925cb976685dd855fb1d442dd840d00194751c18bf480c4ed"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
+UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
+UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
+UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
-- 
2.7.4


