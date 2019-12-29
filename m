Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 99BE67F887
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:33 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c13so13816880pls.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6NNHeqLa3slz23Ly9y3mCzqLipV4Ksf7xe0I0ZH7+FE=;
	b=aSmxQMecSGNvtMnH7V2GpZw8zyqZQg9LQgLhImHeAm/GMGEeaf4UGCqT8L/C+XsM4l
	tiysvfn4UCKZmPmaqhFKuCuw4S4oGhRQZ0gdHqcuPjwDzlr9eNxCapWUMUK4/0Dfpxhj
	ZSTjnigOE33XSP7cLy/4tVdcYMNpJxC+eqFIVkU+447wlo+AIPnaDhQFZZuCGkCx5fYC
	JlSeNw8yl7vhsPNcTIX68kyYJNlMj3aHNlhU2826ej777L2P+NHNq8egOQw3BCqHbleb
	14ui3zmeTdKAI1N8h/fhr55O5kUiAAvRF/ZuHeAr613d9Z9fSD7oLRf9o7K3f+qbO00A
	1Bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6NNHeqLa3slz23Ly9y3mCzqLipV4Ksf7xe0I0ZH7+FE=;
	b=ggeFATGHM5Q2egUZQgwYll3JSpRSuAbqlNJg2s7tTHpi4TNBrKFOfwglpG2Kklj+7w
	ElY/5ms/yDkX9xTMhCZqJYvCEuu05VJR3eTuxP9OPpn5iKDkRqU25DHOefadGTltITks
	CT4uFjWLBWZTPauBjcgsGv4Y1jNJl3Ss6fB+PLSb0XW1ERsDUzMP/yJ/VVrMHnxPSP1Z
	q3USwm8m35akbbRZI37mRpD1CkzFu4ZgjHRYTcW6dKsNpaWscN9EiZWAYkitnU/NHVYE
	LYcyAOMFhp0HjyL+qXokT2p3ztzMJm5IDe4KIcdYWTU0koNyeFkC/+DQ9rIRG+u6GmPH
	L37Q==
X-Gm-Message-State: APjAAAWzTGYKHQwoyrJzofi8THk9IK8S02opazaFLXZSOkGbbt+V3WaG
	j45Phh8zpe9PdvtDVTnmgOMcbwhk9bg=
X-Google-Smtp-Source: APXvYqy8mIorewfClloO5NxQo+B0Itj1kE8nwQ0apcJdqEXXnQpGMaxPOUqsmeMSGN6LmqqvzEP9Ow==
X-Received: by 2002:a17:90b:46cf:: with SMTP id
	jx15mr42333043pjb.2.1577645074621; 
	Sun, 29 Dec 2019 10:44:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:03 -0800
Message-Id: <20191229184415.19514-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/19] powerpc, powerpc64: Append little-endianness to tune arch
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:34 -0000
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


