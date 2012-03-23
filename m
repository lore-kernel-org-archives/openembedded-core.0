Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4BG-0002FE-Hg
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:05:22 +0100
Received: by wibhj13 with SMTP id hj13so1769043wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LT4IXddRqYlOOcv+4SstS8l2Da0UBrFt14yu9rdZ5fE=;
	b=wojvpYDz/kxkMKbOqXRkjN0LdBCkLYtWkXlWYzUQDb5SJEWh/PRcuFSXVGMWFuCo8m
	zBTAD1LpI3KjafFb7Lz+cGdkScCBcMmzr3f2Z+TyFXIBk72psWJ0VXuR0As4qMvgxyHu
	9RN1+wIjpgXALyxb+11gsKTAAkGWQS1n5qqI7K09or5CqjZUT5O9aV3yaQWYRtoGtGJv
	aAPZ5y+jMmFDrljsk+VdOXhWF5U4GMZYY47R7R/7bzoXPMFKj8HFMFGySTFkDMv59CO/
	HrquvEq6H1pTM8W9/ZkrubtU6qqmppX1QAU1OPTsqPeVtiEpFfzBycMwuHsmV9S30RRU
	HoDQ==
Received: by 10.180.100.196 with SMTP id fa4mr7427397wib.0.1332507385166;
	Fri, 23 Mar 2012 05:56:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm13632905wie.9.2012.03.23.05.56.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:56:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:56:20 +0100
Message-Id: <cover.1332507302.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH 0/6] kernel.bbclass updates
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
X-List-Received-Date: Fri, 23 Mar 2012 13:05:22 -0000

The following changes since commit 5de06b564a949d0d9ec254817feacf9ad18d098c:

  Revert "bitbake.conf/sstate.bbclass: Change PATH when installing sstate files to avoid issues" (2012-03-23 12:29:21 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/kernel
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/kernel

Martin Jansa (6):
  kernel.bbclass: populate /etc/modules-load.d/ with module_autoload
    entries too
  kernel.bbclass: use symlinks for modutils files
  kernel.bbclass: use better number for KERNEL_PRIORITY
  kernel.bbclass: fix extra + in kernelrelease
  update-modules: update script to read /etc/modules-load.d/ directory
  kernel.bbclass: don't create /etc/modutils/*

 meta/classes/kernel.bbclass                        |   22 +++++++++++++------
 .../update-modules-1.0/update-modules              |   14 ++++++++++-
 .../update-modules/update-modules_1.0.bb           |    2 +-
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
1.7.8.5



