Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rs3Iq-000076-AH
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 03:18:36 +0100
Received: by yenr5 with SMTP id r5so1975710yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 18:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=DnlTV9jGW0Pztr6b1DiPJX0KCLbH7+0MrRYV6oR4igU=;
	b=vzAP2elMF8beRAg7YNnN7ueP6LVwhnR89IMCrNAd+SLkCs+FgVVi+BZLvQkIvDIqmm
	phYjHftT7G6RiccCNmY37kvTOEmrT1tuzPl+HtwWVsKk4X2YiFsz211oaG0jsTJ/lwxf
	eSj6Zd2uYBj2pu/OyHXTaofAy3eMvBqCdDt68=
Received: by 10.236.191.5 with SMTP id f5mr30443516yhn.122.1327975841715;
	Mon, 30 Jan 2012 18:10:41 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id m18sm51408634ann.0.2012.01.30.18.10.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 18:10:40 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 02:10:29 +0000
Message-Id: <cover.1327975625.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/2] Ready to merge patches from O.S. Systems tree
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
X-List-Received-Date: Tue, 31 Jan 2012 02:18:36 -0000

This patchset provides two patches. The first does the changes
suggested some time ago by Richard to avoid too much forking in new
udev cache support; the later imports gitpkgv from Meta-OE as some
layers will start using it (Meta-TI is one) and this avoids the
dependency on Meta-OE for its support.

The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:

  useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (2):
  udev: improve udev-cache robustness
  classes/gitpkgv.bbclass: import from Meta-OE

 meta/classes/gitpkgv.bbclass                   |   95 ++++++++++++++++++++++++
 meta/recipes-core/udev/udev.inc                |    8 ++-
 meta/recipes-core/udev/udev/init               |   15 +++-
 meta/recipes-core/udev/udev/udev-cache         |   14 +++-
 meta/recipes-core/udev/udev/udev-cache.default |    4 +
 5 files changed, 129 insertions(+), 7 deletions(-)
 create mode 100644 meta/classes/gitpkgv.bbclass
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default

-- 
1.7.2.5



