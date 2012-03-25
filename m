Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBbgD-0007Th-RY
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 01:51:33 +0100
Received: by wibhj13 with SMTP id hj13so3077888wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 17:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=uHntXpTK8Z8+tsxAilPwu3bSlb39KU99aWUtESyVO1I=;
	b=RjLOfWdvIcQ2J1eysOciR7IlPo8wGIpLk1SgqqZWkwS3JUAj2dcodlIjCr/pp4J8ZO
	IIyQPPY1oCjoNRriltR5f32sdbjzwZaasjQXnN93dpSHKtGGAKGs3eSJHzFM5G8/En6N
	na/HPckXdSwagUCQaA7ueX1AOBjVPIE3212P4R4GeivIJOvhNJhDRcyH2tpqQeP/LnQr
	v1qx15uElxGib6xri+kJog/ZeyFfB0yzlS3d9Jgegu9moKJnCTwwtybvl5Ccbo7bzfam
	IXNVSUDo4tSeMhcEwjk42YsYt2t8rafZTRLNOzPsgn2mVNPR2xoJ3kLNUTAs05sfpJe/
	3KKg==
Received: by 10.180.88.169 with SMTP id bh9mr7963898wib.5.1332636155742;
	Sat, 24 Mar 2012 17:42:35 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id 9sm44832217wid.2.2012.03.24.17.42.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 17:42:35 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 02:42:25 +0200
Message-Id: <cover.1332635505.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkFNB8QFQXqjeK+AVQLUvanjnbZfFr2xfh+JAbY2McmvAoo/IotqZnJHz71e+kORHOelBtD
Subject: [PATCH 0/3] #1937
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
X-List-Received-Date: Sun, 25 Mar 2012 00:51:33 -0000

1. Integrate tk for python module _tkinter.
2. Fix gdbm for python module dbm.
3. Fix python while checking if 64bit machine - modules dl and imageop
are now built on a 64bit host machine.

The following changes since commit 5a6ded1355156557635004fdde2c01feec436be2:

  yocto-kernel: new script (2012-03-22 19:21:15 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/master
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/master

Andrei Gherzan (3):
  gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in
    include/gdbm
  tk: Integrate tk v8.5.11
  python: Add tk and tcl to DEPENDS conditionally and add patch for
    64bit platform

 .../python/check-if-target-is-64b-not-host.patch   |   57 ++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    7 ++-
 meta/recipes-devtools/tcltk/tk_8.5.11.bb           |   68 ++++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.10.bb             |   13 ++++-
 4 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
 create mode 100644 meta/recipes-devtools/tcltk/tk_8.5.11.bb

-- 
1.7.5.4



