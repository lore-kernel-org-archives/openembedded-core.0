Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShSpb-0007z4-4S
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 23:52:55 +0200
Received: by dalh21 with SMTP id h21so10016081dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 14:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=z7ek9K11bFkoKUrzwMpP+YsplFZ0lW+rEghVCEjNBYA=;
	b=GpjxCNlc3MgDP7znWNjE/HplLxVethrGsvHLagrB/fwMj5BhTi4+wFI85bJStBUM3K
	ureBNHi5QJT/So3wFuMW4528nJ6D3GJnZeLoqWxWYRUQtsjE4CYmqVItNemt7Av96lX2
	ePmLkRbnu3oyXn7z75ZsjzsP6ksN0rpkM9y4qO2lEG09Y4kcJQHNSuvByVh6JX0pSAbD
	CCz/UUxeJ9XAH5hpxKMhwQUNK5biQdpZ/AKyPNsQwwQ9I7wjgzdoa0mvUvhMdWZj5eMx
	tTStX1Dj9hUXQygMJO8RGRJPOz96/HPDU05Uz7GE5/ZyPmpGxZAIR2DaYYY8HIBGEHGL
	VUMA==
Received: by 10.68.219.162 with SMTP id pp2mr80313639pbc.85.1340228529131;
	Wed, 20 Jun 2012 14:42:09 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv9sm33270381pbc.43.2012.06.20.14.42.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 14:42:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 14:40:52 -0700
Message-Id: <cover.1340228144.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Add standalone kconfig infrastructure
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
X-List-Received-Date: Wed, 20 Jun 2012 21:52:55 -0000

Right now we have few packages which uses kconfig infra
besides the Linux kernel e.g. busybox, uclibc
at present they all include their own version of kconfig
infrastructure. This package called kconfig-frontends
has been created to help manage projects using kconfig
or wanting to use kconfig which are not kernel.

The package will keep lock step releases with upstream
kernel release.

This will tremendesouly help in deploying kconfig into
glibc/eglibc which is going to convert the eglibc options
into kconfig and eventually into glibc.

I do not have the eglibc patches quite ready yet. but
this is independent of that change.

The following changes since commit 6d761ae17ddbd3d936e7fe985b40825ad62b2418:

  debian.bbclass: invoke target objdump (2012-06-18 13:20:29 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/kconfig-frontends
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/kconfig-frontends

Khem Raj (1):
  kconfig-frontends: New recipe

 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb

-- 
1.7.5.4



