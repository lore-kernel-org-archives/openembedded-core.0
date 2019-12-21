Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C6E897FD3A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:15:23 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x17so4795485pln.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6NNHeqLa3slz23Ly9y3mCzqLipV4Ksf7xe0I0ZH7+FE=;
	b=XYzBBq6inlQ33nf/9w8HJwtwiO+4koCo6ida/5iu55yfLMLKqiuM5E07Fb8HenDo0V
	5s/U+EB8NARUmoBFE2VkHrWGhTNc3tSyJMZWpzxh7SKV61s8zaYP/d0tTHXTq+h8CPc7
	vDkNHDH805xSHmLAjTyL5vuzwGAVhYcYMNIU/iXmdnUjkO6nNiVo5nGHLirtLNLjJtg2
	hMXAKbEqV30qvcczS+dRaeatWMTjCkhvtOuiBDZXdwdrpkWBUvtc0mYaRZVeR1zMiY1W
	Nk/MGDYL3KlgV4m9zdtKKiiI53+O4tx6XfJ7toS48inlVNcZV4tQCr4QcDQWFBWBhkfJ
	EQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6NNHeqLa3slz23Ly9y3mCzqLipV4Ksf7xe0I0ZH7+FE=;
	b=hRXljrsKloq1g/sikYzB1baWcoNL0bKf86mSgmNNg92krhdCBalIglhixwpodAiNmq
	a/QzaTIqAQWg8TBfNuFdUxcTSiahuOApFapQ6yDRX92el35lz9fEWb/+XEnn2Qz/eRHh
	cSKNH9KNauTBSWTxfiLjGix5JkDANldILEa83w99LcQITj3A/c1hHaya33KbXtOltFwT
	pPzzOAEZhyYN9cQusQ8wRuW1zDleswyLNu8i9AJCgmnQeJJEs0e7WBu+yi0n58JQFO73
	zIvfNjJIjvWoEQ9Ufl/vWy3lHLOXq0yqxFRn/FGmZqOack2gnsnbb1JN9/u2nf/iWFgB
	zFhA==
X-Gm-Message-State: APjAAAU5emGN4gp+z7SK0LzztSwOGrJeQ2Y4EvHFohQWyM3BgqHrq/p8
	QWEGNw/obZNCaeuxxEpv+Qt0PT9jbDg=
X-Google-Smtp-Source: APXvYqyYn0TmuIWxMyNmxpt0Dp+8xLoSZ65XPHo9L4SbxQPn4O6f72DqdZ8sVWUED38oxsP0rsn1Vg==
X-Received: by 2002:a17:902:8f96:: with SMTP id
	z22mr17602674plo.11.1576887324332; 
	Fri, 20 Dec 2019 16:15:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	65sm15001784pfu.140.2019.12.20.16.15.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:15:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:14:58 -0800
Message-Id: <20191221001459.1630195-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221001459.1630195-1-raj.khem@gmail.com>
References: <20191221001459.1630195-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] powerpc, powerpc64: Append little-endianness to tune arch
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
X-List-Received-Date: Sat, 21 Dec 2019 00:15:23 -0000
Content-Transfer-Encoding: 8bit

This helps in constructing right arch for target tuple name for
Little-endian ppc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc   | 3 ++-
 meta/conf/machine/include/powerpc/arch-powerpc64.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 8c0c943044..ef18e9ac8b 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -15,7 +15,8 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mbig-endia
 
 TUNEVALID[m32] = "Power ELF32 standard ABI"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', ' -m32', '', d)}"
-TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'powerpc', '', d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'powerpc${ENDIAN_SFX}', '', d)}"
+ENDIAN_SFX = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'le', d)}"
 
 TUNEVALID[fpu-hard] = "Use hardware FPU."
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' -mhard-float', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 4bc5983087..cf5c3ef8e6 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -5,7 +5,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNECONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
-TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64${ENDIAN_SFX}', '', d)}"
 
 # musl only supports elfv2 ABI for ppc64
 TUNE_CCARGS .= "${@['', ' -mabi=elfv2']['libc-musl' in d.getVar('OVERRIDES').split(':')]}"
-- 
2.24.1


