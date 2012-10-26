Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRkHq-0006p7-AB
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 15:49:22 +0200
Received: from localhost ([127.0.0.1]:36804 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRk4l-0005DK-6N; Fri, 26 Oct 2012 13:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=d6U8JlygTP8AjSF4tznG1Xgx
	bNk=; b=Fe2pVtgABsrdcn4FZIjYwaHpyU5gFVgaRJu5zCQUyweAHAdNuW9cic6h
	bnOBqFrFaVZH1nEXmt94LxXXrSILR5Oj2ocGITyOnh8cPilQPN71MmYMM9LNnIzy
	AnMFI1COShsX21gKbYqWvkfh6Zpza0klfKhf0ZWT8Uw6PhYtsYw=
Received: from [195.171.99.130] (port=44483 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRk4l-0005DH-0r; Fri, 26 Oct 2012 13:35:51 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 14:37:22 +0100
Message-Id: <1351258645-14649-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 0/3] Improve x11 distro_feature checks
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
X-List-Received-Date: Fri, 26 Oct 2012 13:49:22 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Improvement to the detection of the x11 distro_feature in a few recipes
with the final achievement being that GTK+ is no longer required in 
core-image-minimal if dbg-pkgs, tools-profile and tools-debug are enabled 
when x11 is not in distro_features.


Jack Mitchell (3):
  latencytop: disable GTK and remove gtk+ dependacy
  packagegroup-core-tools-profile: include sysprof only if x11 is
    distro feature
  babeltrace: fix depends

 .../packagegroups/packagegroup-core-tools-profile.bb        |  4 +++-
 .../latencytop/latencytop-0.5/latencytop-makefile.patch     | 13 +++++++------
 meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  6 ++++--
 meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb            |  2 +-
 4 files changed, 15 insertions(+), 10 deletions(-)

-- 
1.8.0



