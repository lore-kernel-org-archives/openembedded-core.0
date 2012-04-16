Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsvG-00053Z-Fn
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:18 +0200
Received: by ghbz2 with SMTP id z2so2767925ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YFEc0FKJi3Ycqkqb7CavQ8iEEfj6hyk6f8uar8pIjKQ=;
	b=ie9Ur7cN/Rumv3Hnl/ispkynV+v5YZU8fpupmjL/uhwjcePa7ptNuqA5lGTwpMrCVz
	OpWSFpGvdRX89u1a+4dWs2RB2KPRG+ZnnOW+qSOtiANa7mAWN42txBhtccgTwsRIvDKI
	CKucyq0iwOIu59Q/1YhXFBLFjL4nVlhxXZVcP9BqnbUm7uzKlwXEv8PIboLEPQsmIWt7
	dmHBkl+AnyehZzIoesPpFsMsp/I6razjoQ2IlDVL/vO3aBXhEKudiQlpyVFr6D1a4VXm
	sxXCMzLmSoUPu7G58NG2K59MIrlDveE4001eg1kR6LtNz+xoLUT0vV5+HYCAESOng4dl
	kPhw==
Received: by 10.60.28.33 with SMTP id y1mr17792574oeg.62.1334609032586;
	Mon, 16 Apr 2012 13:43:52 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id r8sm16557555oer.6.2012.04.16.13.43.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:43:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:43:38 -0500
Message-Id: <cover.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/7] External csl toolchain improvements
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
X-List-Received-Date: Mon, 16 Apr 2012 20:53:18 -0000

This cleans up the recipe and simplifies it, fixes up locale handling,
silences QA packaging warnings, and includes toolchain version in the metadata
checksums for target recipes. Obviously this is intended for after the final
release.

The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:

  bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)

are available in the git repository at:
  git://github.com/kergoth/oe-core external-csl-improvements

Christopher Larson (7):
  external-csl-toolchain: split out a libstdc++-staticdev package
  libc-package: fix handling for 'precompiled' locales
  csl-versions.inc: capture version in signatures
  tcmode-external-csl: use the existing precompiled locale files
  external-csl-toolchain: silence .a/.debug QA warnings
  external-csl-toolchain: cleanup, simplify, use base_libdir
  external-csl-toolchain: update for locale bits

 meta/classes/libc-package.bbclass                |   12 ++--
 meta/conf/distro/include/csl-versions.inc        |    4 +
 meta/conf/distro/include/tcmode-external-csl.inc |    4 +
 meta/recipes-core/meta/external-csl-toolchain.bb |   70 ++++++++++-----------
 4 files changed, 48 insertions(+), 42 deletions(-)

-- 
1.7.7



