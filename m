Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKAjz-0002aH-HW
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:54:51 +0200
Received: by obceq6 with SMTP id eq6so2643545obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=fuxwubFI8UUaAmJ5i70v4UHK6pfC2esl4vi4fEaFaaY=;
	b=QcXt0bxK/V4ClpF16P43pWsXx427tuzpQETNVrSNJeugUjm2pyqhBLKWMTgDMdKLnB
	7eIMcknfuu52QaU5qMPib9HpuFYau2Y/wBgWyowdAFQCn95JDADzm3842G5yrUrbRgZ2
	1dEqV4JLvaGPOPrp4gT4LZ+96M3YwJO/HiQN15Ii9za1zjtr4weto8FbcLxeA5hn6V5T
	uFN5C+zcGefUEzMii8EHM8kC4280/7AXz221jXNYRdSiWYJQKLb2MIHX2R0T5Ts8UoLj
	YWhQc/cvgvEWRO/IzNsAiOv5CEGeDBQji2pHeaesco47f4uV3lvqrQzIqDD3rXbFCIBr
	m3Sg==
Received: by 10.182.159.41 with SMTP id wz9mr22071025obb.69.1334677524833;
	Tue, 17 Apr 2012 08:45:24 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id w4sm18810371oeg.12.2012.04.17.08.45.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:24 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 10:45:10 -0500
Message-Id: <cover.1334677440.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/6] external csl toolchain improvements (v2)
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
X-List-Received-Date: Tue, 17 Apr 2012 15:54:51 -0000

This cleans up the recipe and simplifies it, fixes up locale handling,
silences QA packaging warnings, and includes toolchain version in the metadata
checksums for target recipes. Obviously this is intended for after the final
release.

The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:

  bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)

are available in the git repository at:
  git://github.com/kergoth/oe-core external-csl-improvements

Christopher Larson (6):
  external-csl-toolchain: split out a libstdc++-staticdev package
  libc-package: fix handling for 'precompiled' locales
  csl-versions.inc: capture version in signatures
  tcmode-external-csl: use the existing precompiled locale files
  external-csl-toolchain: silence .a/.debug QA warnings
  external-csl-toolchain: cleanup, simplify, use base_libdir

 meta/classes/libc-package.bbclass                |   12 ++--
 meta/conf/distro/include/csl-versions.inc        |    4 +
 meta/conf/distro/include/tcmode-external-csl.inc |    4 +
 meta/recipes-core/meta/external-csl-toolchain.bb |   68 +++++++++++-----------
 4 files changed, 48 insertions(+), 40 deletions(-)

-- 
1.7.7



