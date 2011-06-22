Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCYa-00034g-RV
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:49:42 +0200
Received: by pzk2 with SMTP id 2so236560pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Ox1cVfJCxBDCU/e6O+5uEjqrBbFfing2pg/Shyou2JY=;
	b=XZbfeXe6k4BhesTiVvgfmCeXDiwbHsfN1D3B48CGi4YypBDco5RL3pRuuSe9CR/TBS
	x8UqDxmNiwIIHqtgqhZf/5c8mud0bk5x4N9uSWUExgyuVe4Js43ipbU+4Rt61qxiIPZs
	EKWTCVglcE6/pvYqZ3EPAxrQIIrXkRkoXt8IA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WUpvyOov8MbtyoQQA/jVy/GC1/HBMNSGvvQ+sthkucAEEWDuOVvsBgBRw6duhW8XsW
	m4wpZhs7kt/8TtAcTzupG7GjoncKb4LZ2eAiuAGqA6i85y0dsnzsoEAGOW7KflpxtDx5
	8fbLjbYCJBsYiTJNNtmmgFYJMbQTZARBQ6Wbk=
Received: by 10.142.211.17 with SMTP id j17mr11526wfg.333.1308707028309;
	Tue, 21 Jun 2011 18:43:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g2sm54827pbh.95.2011.06.21.18.43.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:43:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:43:38 -0700
Message-Id: <cover.1308706423.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] eglibc 2.14 upgrade
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 01:49:42 -0000

This patchset upgrades eglibc 2.13 -> 2.14                                             
Needed a binutils fix for x86_64                                                       
Package sotruss which is new in eglibc 2.14                

The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:

  binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.14
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.14

Khem Raj (4):
  eglibc: Upgrade recipes from 2.13 -> 2.14
  eglibc-package.inc: Package newly added sotruss and supporting
    libraries
  binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64
  tcmode-default.inc: Bump EGLIBCVERSION to 2.14

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...tive_2.13.bb => cross-localedef-native_2.14.bb} |    0
 .../IO-acquire-lock-fix.patch                      |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../{eglibc-2.13 => eglibc-2.14}/etc/ld.so.conf    |    0
 .../generate-supported.mk                          |    0
 .../ld-search-order.patch                          |    0
 .../mips-rld-map-check.patch                       |    0
 .../shorten-build-commands.patch                   |    0
 .../stack-protector-test.patch                     |    0
 ...libc-initial_2.13.bb => eglibc-initial_2.14.bb} |    0
 meta/recipes-core/eglibc/eglibc-package.inc        |    7 +-
 .../eglibc/{eglibc_2.13.bb => eglibc_2.14.bb}      |    7 +-
 .../binutils/binutils-2.21/binutils-pr12366.patch  |  428 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.21.bb    |    3 +-
 15 files changed, 439 insertions(+), 8 deletions(-)
 rename meta/recipes-core/eglibc/{cross-localedef-native_2.13.bb => cross-localedef-native_2.14.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/IO-acquire-lock-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/etc/ld.so.conf (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/generate-supported.mk (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/ld-search-order.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/mips-rld-map-check.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/shorten-build-commands.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.13 => eglibc-2.14}/stack-protector-test.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-initial_2.13.bb => eglibc-initial_2.14.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc_2.13.bb => eglibc_2.14.bb} (97%)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.21/binutils-pr12366.patch

-- 
1.7.5.1



