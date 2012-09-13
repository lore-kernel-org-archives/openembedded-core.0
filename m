Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TCHeI-0007pn-F5
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 00:12:38 +0200
Received: by obblz20 with SMTP id lz20so5470962obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 15:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ncY3+gjfpmFK8ijZApEouPcfNFS6ZlJDHIpRH7YNe04=;
	b=IkE61FsuULu4lXj/T0GG7q4V1wLsAeAINM9YRzEUC+l0133RBemu1KhuODVnRzyXGW
	MbrxgD+2rpnnJBa0xgwTmtoqLvuSi66iCTubDYpCIsRb/0b3qb+6Mueo3/Erydk1mR+E
	qzvauYReJG7CJzFvbrUgNyoi1Jsi3XJlHH8flHOParHKZEQDQVykrLSJHuX2jvq7tkL4
	MQKG0ZUiM39H10Getc/6TAFWRcpWZUXwgoPElLgGY8AUqi7IJjp+tqEWuDDLNWaogUQT
	xnrpfTrdx+jAEdcuqGbIEEDVZHy2ZsvF8IArBuiV6JCY+I+GMzI4aZfqwKWkPfL3ZZbg
	6FuA==
Received: by 10.60.20.69 with SMTP id l5mr638479oee.114.1347573604112;
	Thu, 13 Sep 2012 15:00:04 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id d4sm25280842obx.3.2012.09.13.15.00.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 15:00:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 14:58:57 -0700
Message-Id: <cover.1347573352.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Binutils fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 22:12:38 -0000

This patch is backporting strictly the patches that has gone into
2.22 release branch since 2.22 was released last year. I have dropped
the patches for AVR,CRIS and HPPA which does not concern OE-Core's primary
architecture. Majority fixes are for ld and mips and ppc architecture
Binutils testruns are better after these bugfixes and also all architectures
booted console-image successfully

The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:

  rt: Add hwlatdetect to rt images (2012-09-12 15:11:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/binutils-backports
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/binutils-backports

Khem Raj (1):
  binutils-2.22: Backport PR fixes from 2.22 branch

 meta/recipes-devtools/binutils/binutils-2.22.inc   |   16 +-
 ...print_insn_micromips-Rename-local-variabl.patch |  634 +++++++
 .../binutils/binutils/0019-PR-ld-13468.patch       |   46 +
 .../binutils/0028-Backport-from-mainline.patch     |  139 ++
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |   47 +
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |  214 +++
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch | 1068 +++++++++++
 ...opy-from-mainline-to-binutils-2.22-branch.patch | 1944 ++++++++++++++++++++
 ...elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch |   49 +
 .../binutils/binutils/0052-gas.patch               |   83 +
 ...55-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch |  176 ++
 .../binutils/binutils/0078-PR-binutils-13622.patch |   48 +
 .../binutils/0144-timer.cc-include-unistd.h.patch  |   32 +
 ...-2012-04-27-Doug-Kwan-dougkwan-google.com.patch |  169 ++
 .../binutils/binutils/0182-PR-ld-13991.patch       | 1617 ++++++++++++++++
 15 files changed, 6281 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0006-mips-dis.c-print_insn_micromips-Rename-local-variabl.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-PR-ld-13468.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0036-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0037-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0038-Copy-from-mainline-to-binutils-2.22-branch.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0039-emulparams-elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0052-gas.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0055-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0078-PR-binutils-13622.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0144-timer.cc-include-unistd.h.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0166-2012-04-27-Doug-Kwan-dougkwan-google.com.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0182-PR-ld-13991.patch

-- 
1.7.9.5



