Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 615FB77F79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:59:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id f127so10498443pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 21:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wdqxD1S/XD14c8R8t8yaOKB2/d+Mj0DUyc9nGZA6NSE=;
	b=ZCbdNPBdsaEQG837Eisb/AqhkmmZsOyFlZrh1yJyJTsnmzybNwxgcvzBYqdYgeqkLu
	XNRvP8Jhyrs8n+Ox2Ka5gyJAuQ3V5nxGBZUI3k/CyLz2RXuaKxVsYmFSXJR6fRScnEck
	b++e1/lNOMA+70W1xpZ+O34vjIcSve6iFmv/IkD+zE6Eyj9J3BgirIbdzg6aSCoCQzlB
	ojLEqNzzWaUsFXU/X43aWB2bN901PMyL6wGnsDXxFFc8Djkg8f3oedSEp+dVnPBXOv3J
	YDsPNIsf5TlvrQaHgdiqTvvfk0o8H2sAN0HFFT6kF2HnsTNANUVA6iUKMDVCcNC9kNF/
	YTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wdqxD1S/XD14c8R8t8yaOKB2/d+Mj0DUyc9nGZA6NSE=;
	b=Bfr8gHsb7Aqf8E7hu7/GjZDjMaMH+iq6VGn2typyxhvS5Oa0DIdUJ3b6SgOnL8Q5Gs
	ySyHp0BJjjbz2eVYQjxR+PBG7EevW7VYAk83MqlwP+1y/nrTAIbKreLZeJX9efDhla2c
	CaJgcy0+hS4Ye8dv9iv8mjeDhq7dF2ltBmA9O+ARuJ2daTwuokzGXRkNXE+GbE+0XUXq
	aQDpXGn9F4SW4LgIfauj/x+CI6AALQMelV2tzkgmhKb2G/SJ/i0/HO+bSRbAFzo1n9oi
	+f6V6HQ3Sfl+1cRhvUFOsAoDNx4jt8IYx3lLS0YkGm0KCa2+RiZX2YqKlZy6klQzkf5H
	a6Lw==
X-Gm-Message-State: AKS2vOwdwelEHglOop5y7aHI38I8Rhlj2tn+0PO2jK/lCBp0Iaz8Ej0f
	cApCa6blomZnfTDO
X-Received: by 10.99.170.76 with SMTP id x12mr13756362pgo.109.1498712342224;
	Wed, 28 Jun 2017 21:59:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	f70sm8020979pfk.27.2017.06.28.21.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 21:59:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 21:58:52 -0700
Message-Id: <cover.1498712182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 0/4] Recipe fixes needed for upcoming glibc 2.26
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
X-List-Received-Date: Thu, 29 Jun 2017 04:59:02 -0000

glibc has dropped certain exposed APIs and types which require changes
in packages to get them built, these changes should be backward compatible
since now it is using more standard types

The following changes since commit c594cacc88b4239f2be2ee97ea127ae27186dbcd:

  lz4: Add patch to fix re-builds (2017-06-28 20:54:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (4):
  valgrind: Fix build with glibc 2.26
  strace: upgrade to 4.17
  qemu: Replace use of struct ucontext with ucontext_t
  epiphany: Fix build errors when compiling with security flags

 ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  46 ++--
 ...8-replace-struct-ucontext-with-ucontext_t.patch |  31 +++
 .../strace/strace/Makefile-ptest.patch             |  19 +-
 .../strace/{strace_4.16.bb => strace_4.17.bb}      |   5 +-
 ...sts-Use-ucontext_t-instead-of-struct-ucon.patch |  30 +++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   1 +
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb     |   6 +-
 ...bookmarks-Check-for-return-value-of-fread.patch |  32 +++
 9 files changed, 400 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/strace/{strace_4.16.bb => strace_4.17.bb} (87%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch

-- 
2.13.2


