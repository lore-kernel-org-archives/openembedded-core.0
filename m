Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id DBA157F885
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:36 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k25so16990355pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T0SyvsKexEQzjv7ANIzPnuJL/nIcevzUrrqeVg4KRVM=;
	b=TM3yb9gg56xy3gqGieixP3WbX1duYzEUUyYD123OGUGakM6W+qUNt/D+CRN+fCZNfg
	Rujlooz23rDDaGfymCBYRWdiVlUt3gePO7BSI0YwsY/EGvZTdLy9qgd/VUugmmDkLnyx
	lF+EysSuJzcEEHZj8HznJQEoxTiuooQtm4T7cPc95q3jLLlukDxbEUNzu2rJV1bforUZ
	x0SXKFML1Bqml0C7Gjg+A38E86wlD41WahO+fHDT6lie/3rcQQCnyxE5Satj5xgLvgYU
	KKJIHcx9FdbTf9embDiIfFMlBJu75GMblzas8Fe3ZY/D1/CIou8Y9rzC3CyVSSJLn1FF
	eJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T0SyvsKexEQzjv7ANIzPnuJL/nIcevzUrrqeVg4KRVM=;
	b=qzXIokY+2ofrcEOux0eEO8OyFCm/IjQtDVEflVxZpcMavc3ZvZjHxOn9F/t+P5r1Re
	WOi6h0pr5TK7uK5FtTR4TRs2VKNsRJtqOnHfrlbm0uYtVSwtda3xQOV0buQFPuvyOpsT
	68Vzsm5Y79uo7/5dy+snWTLYH3JHA9f40lnnj8TwCEQYmC1ZP5hF9OIs9m2iyV5jx/bW
	xRHb+3BZDxR6HToiWCL2B4uwKyuCloZ+480JBlHZ0uKH2oDKtjhLdslYt94eD3rDTlak
	myDG2fDMdziTQ5PEV5zIC9hedkNdzRBkD6YdY9SO7Gskd3J8Lzg/O+EGlipgIstm7EUe
	N2gQ==
X-Gm-Message-State: APjAAAWfw4jbvBSTdSoYLKOSA2dVJ7jR6rAEjgOF3TjLlyawwn4ysN5M
	VpG1uk+gJLYLPi0q/fQD0CiJPfHal64=
X-Google-Smtp-Source: APXvYqzEHiOcxk83vq4nZgI3K7utd7vBzq8W8IKcuBre4RcIS5+r3k+btMAxT3V/P5A20kWJdfG5OQ==
X-Received: by 2002:a63:cb48:: with SMTP id m8mr69656593pgi.128.1577645077635; 
	Sun, 29 Dec 2019 10:44:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:07 -0800
Message-Id: <20191229184415.19514-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/19] gcc-sanitizers: Add missing dep on libcrypt
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 8b1d1c94bf..668e14a59f 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -43,7 +43,7 @@ do_install () {
 
 INHIBIT_DEFAULT_DEPS = "1"
 ALLOW_EMPTY_${PN} = "1"
-DEPENDS = "gcc-runtime virtual/${TARGET_PREFIX}gcc"
+DEPENDS = "virtual/crypt gcc-runtime virtual/${TARGET_PREFIX}gcc"
 
 # used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 DEBUG_OPTIMIZATION_append = " -Wno-error"
-- 
2.24.1


