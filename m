Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C64D87850A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:15 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 31so31328275qtz.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EQg3PAv5ZM/aFAAO0QhfM/1dhhLFevbhSty/xmNsaIw=;
	b=nVKzWCbs/DJc75yHJNSd51xog/VhCKWZgNc9eBFckXzoySqZVmHOpPdy7UYbRT6CXa
	xAx+yklc6z5CpqiEgsmDZvtqMn5rzciEhxN4h9tzvyHHPPOLhfxV0bMf05R1ExsCAvcC
	0jcXXvInRJwPznsccFSzQ+diF66d0nG9NSJ8lwffPJqRU3rnuTpn69YcrYDQsDAaDAk4
	In0GnLHi36WbTvpgvQm1tcOGvnK7O3Id6eo+WBbyO/RYLe4uruJfl34D+m6fnSVQtnUt
	rgKuMAY3kL/c9/7wtCH26JMTYr1IgBLoIgZcuDoKn0QBVFmd6hveLq28vwBEjkApgqJy
	14HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EQg3PAv5ZM/aFAAO0QhfM/1dhhLFevbhSty/xmNsaIw=;
	b=Z+KIgGxbTzmEPLcCIJnaOJFC7Aq/Jb0QE2ahKt9Ibc0VhawHc8JuZKUCXskdv1qdnp
	6Zg9GRu+NtqoXiw93ECAwMygmTE5Eth+SN9WmA69V1VcM+fuKYczd3nl4j60y7NtRWrv
	MvuBQ+D98Rsj1F+ugYdZYX/l83aGaZwnrKiGhcQmAGIawyMgwzTt9UuoF3EtthzbGmLH
	KruAgqU1epkxjIdKYMfVOK0qnJh2eYcNeZTNU4eb+NJB6+NhUvUdBYaYEJeXg6sZuI51
	vyBB1pFR3dM1lJwk5QCL127cOx3VSc4yyVyhJvBOPWd6306YVtRR2HcLwTCRKRxLco4b
	5wew==
X-Gm-Message-State: AJaThX6DVgQtsepFJlZmL/erqq1rqXzYVqyZmRt0RrItbK448KQs+j6j
	tQ88qs7+02dYPPZrylcsCV9k4g==
X-Google-Smtp-Source: AGs4zMZI/n22jrfDd1RIV4HOVWwCmMfcl1MAZyvpTXwsN26jCV9fYGf9zoj+ujX+AN5Av7uQOlnV9Q==
X-Received: by 10.200.6.70 with SMTP id e6mr22988867qth.15.1510715356323;
	Tue, 14 Nov 2017 19:09:16 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	s9sm13875330qts.42.2017.11.14.19.09.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:06 -0800
Message-Id: <cover.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 0/8] Misc toolchain component updates
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:16 -0000

Binutils minor update to 2.29.1
musl update to address <= armv5 thumb issue and a regression in diffutils
glibc updated to latest on 2.26 branch addresses malloc leak issue
Rest of them are remaining from prior pulls

The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/toolchain-updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/toolchain-updates

Andre McCurdy (1):
  gcc6: enable FL_LPAE flag for armv7ve cores

Armin Kuster (1):
  binutils: update to 2.29.1

Khem Raj (6):
  go: Fix build with PIE on musl
  binutils: Convert SRC_URI and SRCREV to weak defines
  gdb: Upgrade to 8.0.1
  musl: Disable thumb1 ISA
  musl: Update to latest
  glibc: Upgrade to latest on 2.26 release

 meta/recipes-core/glibc/glibc_2.26.bb              |   2 +-
 meta/recipes-core/musl/musl.inc                    |   5 +
 meta/recipes-core/musl/musl_git.bb                 |   2 +-
 .../{binutils-2.29.inc => binutils-2.29.1.inc}     |   5 +-
 ...n_2.29.bb => binutils-cross-canadian_2.29.1.bb} |   0
 ...tils-cross_2.29.bb => binutils-cross_2.29.1.bb} |   0
 ...rosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} |   0
 .../{binutils_2.29.bb => binutils_2.29.1.bb}       |   0
 meta/recipes-devtools/gcc/gcc-6.4.inc              |   1 +
 ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch |  67 +++++++++++++
 .../gdb/{gdb-8.0.inc => gdb-8.0.1.inc}             |   4 +-
 ...canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb} |   0
 .../gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb}   |   0
 .../gdb/{gdb_8.0.bb => gdb_8.0.1.bb}               |   0
 meta/recipes-devtools/go/go-1.9.inc                |   3 +
 .../go/go-1.9/default-buildmode-pie.patch          |  18 ++++
 .../go/go-1.9/set-external-linker.patch            | 111 +++++++++++++++++++++
 17 files changed, 212 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.29.inc => binutils-2.29.1.inc} (90%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
 rename meta/recipes-devtools/gdb/{gdb-8.0.inc => gdb-8.0.1.inc} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_8.0.bb => gdb_8.0.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch

-- 
2.15.0


