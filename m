Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3FBC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:23:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.134783.1673760196545691430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aIFQQP9j;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760199; i=@fujitsu.com;
	bh=8PV2rONMDUjlb72GvYkySipGEJbeEGJNYChB8kw2hn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aIFQQP9jqsnxw68V444STRqd5mQmc5Tn9kCkzi5skd1K3nSAd+Zfzs/fSmDpTBVxJ
	 CcAhT+hKke4YzCeEjDvmZ+KZmh+AKMd6hNSs2Yzk5tKiGe5Z56aUqH5MWZz8vA7uP7
	 NszOdx9PvqhhRZEi3eFIzejgepQUwy3efc6zqg8uMKT//POwQ1HshIKroldQkqVbqe
	 ICbxaWbpdmvunMfcCpEhRusTpAIQ5Mu0KDgyhSVgiOforKVrkgIrFT/IoiZpIUZAcg
	 fV2qb53lOkvx/nbvkgLCVYX4/4y+h4oJIfTkaOPm/V2E6RcUQZHLXPNqz5ZI7QsUCW
	 GLGwOpJnt/YFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWfdo7+F
  kg30bFCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oy9p96yFMwwrdg7YwpjA+MK3S5GLg4hgQeM
  Es+WT2KGcC4zSUy938bYxcgJ5OxllFjQlwxiswlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgK3EzvsfWEBsFgFViQeLOplAbF4BR4nDb5rZQGwJAQWJKQ/fM4PYnAJOEt33d7JCrH
  KU2Haknx2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0L
  SvoCRaRWjWXFqUVlqka6lXlJRZnpGSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYOimFKfn7mC8tOyP3iFGSQ4mJVHeyG+HkoX4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8G5oPJwsJFiUmp5akZaZA4wjmLQEB4+SCK92B1Cat7ggMbc4Mx0idYrRmOPqlSt7mTk27e
  s6wCzEkpeflyolzvuiB6hUAKQ0ozQPbhAsvi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ
  9CjKFJzOvBG7fK6BTmIBOCak/CHJKSSJCSqqBacW6R5vXrbuewmd8bXd7cnGORnHG0yXvvj/T
  1JxuYD25geFX2KyaWSyJIXffv53RH2K3fab1Fkmhhbpx5XNfXlC+/dA975u63D+GL+4hhjUON
  i1LjvlF3JszIV69t7mqu9Lgbs9NDlctXpsrUsxuygJeultvPslfHvLRtb721nPuveY9DMuPSZ
  n0tT7Z4LPgomTYg7RVO5/FT1/4Tv3b6uAjfXuXp7cJLFz2Z1thz+kSDkWPil8nmFf8i9srNkO
  8r8QjiUt22fIet8Wn4ubd+/ZFY7qq3O3p7uemG939+Jnny4l9V7/8YLUT79X99bts5oFndr4P
  co4sOnO+pGnvvZC0smntu9csFyqc+t/9+z8lluKMREMt5qLiRABLxl9VagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1673760197!228984!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30439 invoked from network); 15 Jan 2023 05:23:17 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:23:17 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id F1C16150
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E5AC973
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:23:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] patchelf: upgrade 0.17.0 -> 0.17.2
Date: Sun, 15 Jan 2023 13:22:55 +0800
Message-ID: <1673760175-2523-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
References: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175871

From: Wang Mingyu <wangmy@fujitsu.com>

8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch
included in 0.17.2

Changelog:
===========
 Also pass STRIP to the tests
 Fix Out-of-bounds read in the function modifySoname
 Split segment size fix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...b4f9ab8d564904c292099a022ffb3cccd52d.patch | 104 ------------------
 ...{patchelf_0.17.0.bb => patchelf_0.17.2.bb} |   6 +-
 2 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.17.0.bb => patchelf_0.17.2.bb} (76%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch b/meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch
deleted file mode 100644
index 6296f0e44b..0000000000
--- a/meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 8d2cb4f9ab8d564904c292099a022ffb3cccd52d Mon Sep 17 00:00:00 2001
-From: Jason <otherjason@nodomain.com>
-Date: Fri, 2 Dec 2022 10:01:41 -0500
-Subject: [PATCH] Fix bug in file shifting that could cause conflicting PT_LOAD
- segments
-
-When a section in the file needs to be enlarged (e.g. to accommodate
-setting a larger RPATH), shiftFile() is used to shift all content
-following the growing section to a later position in the file.
-
-Commit 109b771f53ee3d37ede8c0f165665605183c0975 introduced logic to
-ensure that, after the segment split, no sections span multiple
-segments. This is done by sliding the portion of the segment after the
-split point later in the file, then adding a new PT_LOAD segment that
-contains the preceding data plus the extra room that is being added. The
-existing implementation does this by simply adding
-`extraPages*getPageSize()` bytes to the number of bytes ahead of the
-split point in the segment.
-
-However, this approach can result in two PT_LOAD segments that overlap
-when page boundaries are taken into account. As an example, this PT_LOAD
-section (taken from a Python 3.10 binary):
-
-LOAD           0x0000000000000000 0x0000000000400000 0x0000000000400000
-               0x0000000000000948 0x0000000000000948  R E    0x200000
-
-is split into the following two sections:
-
-LOAD           0x0000000000000000 0x00000000003ff000 0x00000000003ff000
-               0x0000000000001594 0x0000000000001594  R E    0x1000
-LOAD           0x0000000000001594 0x0000000000400594 0x0000000000400594
-               0x00000000000003b4 0x00000000000003b4  R E    0x1000
-
-Note that the two PT_LOAD sections both contain the memory page at
-address 0x400000. The Linux kernel's ELF loader (at least as of v4.18)
-does not accept this as a valid ELF executable, triggering a segfault
-with si_code=SI_KERNEL immediately when the binary is executed.
-
-The fix here is to set the length of the segment that comes before the
-split point more carefully; instead of adding `extraPages*getPageSize()`
-bytes to the portion of the segment that came before the split, the
-actual number of padding bytes that were needed (before rounding up to
-the next multiple of the page size) are used. This avoids the overlap
-in the PT_LOAD segments and makes the output files executable again.
----
- src/patchelf.cc | 10 ++++++----
- src/patchelf.h  |  2 +-
- 2 files changed, 7 insertions(+), 5 deletions(-)
-
-Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/447]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: git/src/patchelf.cc
-===================================================================
---- git.orig/src/patchelf.cc
-+++ git/src/patchelf.cc
-@@ -432,7 +432,7 @@ static uint64_t roundUp(uint64_t n, uint
- 
- 
- template<ElfFileParams>
--void ElfFile<ElfFileParamNames>::shiftFile(unsigned int extraPages, size_t startOffset)
-+void ElfFile<ElfFileParamNames>::shiftFile(unsigned int extraPages, size_t startOffset, size_t extraBytes)
- {
-     assert(startOffset >= sizeof(Elf_Ehdr));
- 
-@@ -508,7 +508,7 @@ void ElfFile<ElfFileParamNames>::shiftFi
-     wri(phdr.p_offset, phdrs.at(splitIndex).p_offset - splitShift - shift);
-     wri(phdr.p_paddr, phdrs.at(splitIndex).p_paddr - splitShift - shift);
-     wri(phdr.p_vaddr, phdrs.at(splitIndex).p_vaddr - splitShift - shift);
--    wri(phdr.p_filesz, wri(phdr.p_memsz, splitShift + shift));
-+    wri(phdr.p_filesz, wri(phdr.p_memsz, splitShift + extraBytes));
-     wri(phdr.p_flags, PF_R | PF_W);
-     wri(phdr.p_align, getPageSize());
- }
-@@ -898,12 +898,14 @@ void ElfFile<ElfFileParamNames>::rewrite
-         neededSpace += sizeof(Elf_Phdr);
-         debug("needed space is %d\n", neededSpace);
- 
--        unsigned int neededPages = roundUp(neededSpace - startOffset, getPageSize()) / getPageSize();
-+        /* Calculate how many bytes are needed out of the additional pages. */
-+        size_t extraSpace = neededSpace - startOffset; 
-+        unsigned int neededPages = roundUp(extraSpace, getPageSize()) / getPageSize();
-         debug("needed pages is %d\n", neededPages);
-         if (neededPages * getPageSize() > firstPage)
-             error("virtual address space underrun!");
- 
--        shiftFile(neededPages, startOffset);
-+        shiftFile(neededPages, startOffset, extraSpace);
- 
-         firstPage -= neededPages * getPageSize();
-         startOffset += neededPages * getPageSize();
-Index: git/src/patchelf.h
-===================================================================
---- git.orig/src/patchelf.h
-+++ git/src/patchelf.h
-@@ -77,7 +77,7 @@ private:
- 
-     void sortShdrs();
- 
--    void shiftFile(unsigned int extraPages, size_t sizeOffset);
-+    void shiftFile(unsigned int extraPages, size_t sizeOffset, size_t extraBytes);
- 
-     std::string getSectionName(const Elf_Shdr & shdr) const;
- 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.17.2.bb
similarity index 76%
rename from meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.17.2.bb
index b32abc7b87..a9583419e8 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.17.2.bb
@@ -4,10 +4,8 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPL-3.0-only"
 
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
-           file://8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch \
-           "
-SRCREV = "ad0265668f12eff59027259345fed4b0f315336a"
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master"
+SRCREV = "5908e16cd562bcb1909be4de0409c4912a8afc52"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


