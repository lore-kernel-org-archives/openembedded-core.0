Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROcPV-0002ix-1u
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 22:43:49 +0100
Received: by ggnq4 with SMTP id q4so153572ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 13:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=XkesfYCLGgpYCKa7oYKXkI0W3PyFomnV1y8tW33GD7k=;
	b=D3oRY5qiMGY9A6kJ7ZX/rE6Saj0rdaxPdyAkltY8vHXjVx6AdgNBTrRzOfjhx3GKz/
	LtndqWPuz67QyDHWehR+p4FMoCQkEbWqw30bwm2UXhu+X5Twi0iEdvGSrR1VLtjV3rlh
	0uK0KJXmx81N9g/R3pVLFKFdYIGqXYLTyA7As=
Received: by 10.100.81.3 with SMTP id e3mr3974465anb.146.1320961046681;
	Thu, 10 Nov 2011 13:37:26 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d5sm13778798yhl.19.2011.11.10.13.37.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 13:37:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 21:37:15 +0000
Message-Id: <cover.1320961001.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] DHCP and reduction of amount of packages installer by xinit
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
X-List-Received-Date: Thu, 10 Nov 2011 21:43:49 -0000

The following changes since commit 379c77d1516fe8fdbd1cd7063f709b5266872b03:

  populate_*.bbclass: Correct INSTALL variable name after recent multilib changes (2011-11-10 18:05:06 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  dhcp: generate initial leases files for server
  util-linux: split mcookie onto a package
  xinit: rdepends on util-linux-mcookie to avoid brining whole
    util-linux

 meta/recipes-connectivity/dhcp/dhcp.inc           |    9 ++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb      |    2 +-
 meta/recipes-core/util-linux/util-linux.inc       |    3 ++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 meta/recipes-graphics/xorg-app/xinit_1.3.0.bb     |    4 ++--
 5 files changed, 14 insertions(+), 6 deletions(-)

-- 
1.7.2.5



