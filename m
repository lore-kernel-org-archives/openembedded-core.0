Return-Path: <kergoth@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id EC31E610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:50:19 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so935308eaj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=FPQvPUXlkoJ0PPndLWBJkpV47RQHPAqKWczmgmCbeFE=;
	b=Z0o9edHwixzqFgDojrbwUh9SdaJpLEA1ft9IyFuW7qIZNGcGQXKCKHvm+oOcDkX6gx
	NZvtyU2ro2ajcXS9NoYsgMrbkvj6kEH9oiKRPJRlbuE5xdMTLfYIOXBcxd7qn8QlN1yb
	iHOuC5y1fulYcJIXhLU1QfBUQ1+CW2+p5qWcQ8KW6PGl53csIQ7iRQxf9BNvb2V9W8Xw
	gUMOymH3KLyso4yAIwKszGdy8VZF4bAO9RoKF/19QYCu4AklX5aNWLVf8sD+urgbjXcG
	UHAkjVN5yCSJIf7VewLNwHolj2qwh6BuAiZ7KqffCNp7DHHEvGOIimXMLwWp9T65cL/Q
	3w+w==
X-Received: by 10.14.88.5 with SMTP id z5mr3227537eee.101.1386946218930;
	Fri, 13 Dec 2013 06:50:18 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id o47sm7527284eem.21.2013.12.13.06.50.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:50:18 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:50:08 -0700
Message-Id: <cover.1386946076.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH 0/3] A few random improvements from the Mentor patch queue
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
X-List-Received-Date: Fri, 13 Dec 2013 14:50:20 -0000

The following changes since commit 62849843a4a83b10316bc6cb1e4b3f0622391dea:

  gdb-7.6.1: fix cygwin check in configure script (2013-12-12 22:41:13 +0000)

are available in the git repository at:

  git@github.com:kergoth/oe-core.git random-improvements

for you to fetch changes up to 9950f35b110f1c3032e199c9d0b32a2e43a326b2:

  git: leverage upstream relocation support (2013-12-13 07:47:37 -0700)

----------------------------------------------------------------

Christopher Larson (3):
  xz: make the LICENSE info more accurate
  libdrm: use RRECOMMENDS for libdrm-drivers
  git: leverage upstream relocation support

 meta/recipes-devtools/git/git.inc         | 14 +-------------
 meta/recipes-extended/xz/xz_5.1.3alpha.bb | 17 ++++++++++++++++-
 meta/recipes-graphics/drm/libdrm.inc      |  4 ++--
 3 files changed, 19 insertions(+), 16 deletions(-)

-- 
1.8.3.4


