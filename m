Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8B97377D67
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:19:31 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p13so6278234pfd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PU1yQj4ykojqXawDq8zQ7S/5vCfxZsy9Rt3r9HBMk+0=;
	b=NRE3TBDcXsFDjYSnLieHAT+oJkHhlCjk6VFQf9LE/igJ7X+EAq9b5xSjTKhoZQh8Cx
	VPqDecaH0nEteRfw+zuP7ZrZM0zlix7iWtUiBQ+ZllBNKaKQEhPfoVYDOiG+kXPwlfR9
	k3lRwREslgIr4shNgMQeeNhF+GU8guvfRb6Ymbw9Zzn8TqorRwKomzfQ28yAa+QRRFlF
	uQbjRqSrwRfPOD+P1hBDBNjEv0MeOx3uHk2Oc5tRxqjtM3dWSSpDICAO+kz5dD6VrUyX
	yTZj58jmuZk9smuoNasiGr/HAwN+WCsBKmM4L5+j+XJ63VVJQ6z6BCjOl0AlzI+jR4lu
	xlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PU1yQj4ykojqXawDq8zQ7S/5vCfxZsy9Rt3r9HBMk+0=;
	b=gKd3mRj4Ev1AwkopXFMsdqgjeu4bw+RoBLFVcCfOXpLxKuEuU0xwKrz77QlXEPzFwL
	Hpw62p74plR5+wQaNcDrQxXLiqop4ipKsWXcdLlLhouqrAzQZDscNCzP2lXWXBlRdpgO
	WrRlke1wWZ2kArgoxd0Vf+d2SS3l9bMi+Kli8O7pZXyLNpV9BrLZFIZzeu9paLnJXBA3
	Kc+SxZYEhSScHpIZBmJvlGfu2pPBVUcWUl0hGMnld2I3vdiOsj41htyWRBsk2GBOVAtj
	PNG3xz584PjkD3gKmfs4u/BQ8PsS/pkKA1mDc9jogxuW/f8qKfx2Y+nkl1JZ67Aa1T2X
	/PNQ==
X-Gm-Message-State: AHYfb5gNqCyr4X3iANmX5YPLiiaJHl29pPd/LPXCnHOZplaydOplOvVb
	9MS9vBDTc6Zk/eID
X-Received: by 10.98.22.71 with SMTP id 68mr8359197pfw.248.1502288372489;
	Wed, 09 Aug 2017 07:19:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id
	s89sm9342832pfe.155.2017.08.09.07.19.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:19:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 07:19:20 -0700
Message-Id: <20170809141922.2603-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170809141922.2603-1-raj.khem@gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
Subject: [PATCH 2/4] llvm: Keep llvm-native dependency with clang toolchain
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
X-List-Received-Date: Wed, 09 Aug 2017 14:19:31 -0000

This was needed when we were conflicting with clang-native
but this is solved via append PN to binaries of llvm-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index f36e6978ed..eb2049248e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e017edc35cfd58e26116e5251771"
 
 DEPENDS = "libffi libxml2-native zlib ninja-native llvm-native"
 
-DEPENDS_remove_toolchain-clang = "llvm-native"
-
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
 inherit perlnative pythonnative cmake pkgconfig
-- 
2.14.0


