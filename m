Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 88E5B79309
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:35 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id a4-v6so3224887plm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lOSLkQrLqvN43CSQZkOn9GT92mJ8/LdKeQ0diHywTpU=;
	b=a9pDXPPoZOpwJ7u4yrtSETPY2w1AXkiqGGw2+QyBRZQ84GDAYC8Ws6zHvxm+7ducd6
	SS1M7Rmsi6oyDIw+OA34f8sOlBmbenurcvMScUXkcjVB4w2KR5ImdT1Yt+feMmZhr002
	1fC6zF+/unIPG7zF+grFJ81rdbVYVTh+t/nkJpHRr5dgUU7E3QIKF/Fiq5wBaWI4KfL5
	kwSuA/IU6cRiJ1gNjhR7GifpDNgcnIdlHXPyq3HFhwNSDtZAzbJ+DXWm0Kygu/PEu8ac
	5ihNcbPK2th1xYYURP3ivRpM20d9zEob13kgk57mDC7stsTp86Vp4kbJ6lRklDbnkZtk
	AqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lOSLkQrLqvN43CSQZkOn9GT92mJ8/LdKeQ0diHywTpU=;
	b=E0AeVE4lmyrzE9OpG1Anx2ztCoEa7oUCFAVad0N8cSFd6RAcO5LURzsAhWKlVRLQiK
	zGx1muzXS/nerSxLsOwxHVUwidZemANzUxrheiRkWpEs7H27128HM1bBbFJ+MAb2lJMH
	3ThMncwqxjbBTBrv+HBmCVJk+Zx6jcHpRhvgUuPNpVieheaw+bxKLNPA8r0SRqj4tmjo
	UMsbUuMsZqRWlPEM4sWjD8PmU0ADSNk2fCzg4MAfH4rlU/y6D+dZM1lBV09z3VHElFvO
	ANLXXpemjcvd5ajY9CdJAqmNxxsrhV//1GLa8cs+R09YAL5Q3YhLm0M8OTQYpdGxL9Ab
	zMkQ==
X-Gm-Message-State: APzg51DBppKhbZTX9NhYRGuoSHBJlfvGPGrxsHgTsYsmpG7O37yAgQ2X
	NrnTdalPt/1PTKOLrXvDQRllb//9
X-Google-Smtp-Source: ANB0Vdbr33DaxOHDKEU+wORrtKNJQjbSOn8uYXYkxKahBLc5hUq++V2Mo3g0vuxub2BmOsJgUv4QEA==
X-Received: by 2002:a17:902:2e83:: with SMTP id
	r3-v6mr8526329plb.80.1535601336211; 
	Wed, 29 Aug 2018 20:55:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	g7-v6sm7133120pfi.175.2018.08.29.20.55.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:17 -0700
Message-Id: <cover.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2 0/7] postinst and clang fixes
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:35 -0000

This pull fixes boost with clang
other fixes are needed for risc-v to enable offline
locale and postint generation, especially after
https://patchwork.openembedded.org/patch/154363/

Now we can boot qemuriscv64 quite fast

v2:
Fix core-image-lsb-sdk build for risc-v

The following changes since commit 0d69f86e50e57afe893dade095c1dbd3d05c3b0f:

  libsdl2: Fix left rotated display for RaspPi/VC4/GLES2 (2018-08-29 15:43:18 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu-1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu-1

Khem Raj (7):
  boost: Fix invalid const in atomic builtins
  libc-package: Add risc-v specific options to cross-localedef
    invocation
  sysklogd: Use update-alternatives
  glibc-locale: Enable riscv64 and riscv32 in BINARY_LOCALE_ARCHES
    supported architectures
  packagegroup-core-tools-testapps: Exclude gst-examples on riscv64
  tcf-agent: Disable non-building features on riscv64
  gdb: Seprate out gold and dwp into a variable

 meta/classes/libc-package.bbclass             |  2 +
 meta/recipes-core/glibc/glibc-locale.inc      |  4 +-
 .../packagegroup-core-tools-testapps.bb       |  5 +-
 meta/recipes-devtools/binutils/binutils.inc   |  5 +-
 .../tcf-agent/tcf-agent_git.bb                |  1 +
 meta/recipes-extended/sysklogd/sysklogd.inc   |  8 +-
 ...ecific-branch-for-x86-DCAS-based-loa.patch | 76 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.67.0.bb    | 15 ++--
 8 files changed, 104 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch

-- 
2.18.0


