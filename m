Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDtaS-0005Jl-6N
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 09:50:48 +0200
Received: by bke11 with SMTP id 11so617268bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fg8eylNHbbETB6d9Eg8lgqlcBJdcBUuWeIcRY/T+OW0=;
	b=bCxiyJLnZLT7oXTFFBiXGqyif0QSRHkdpMwynMyJgxxbDCJaleiJDf+X0jVpMV3qOu
	piqylJg1vGR5VdclNJn8YwsMDs5xx54rM1QcOiywk/k94eTJcDwuVoy9K5/Cnax/Qa9q
	yJP/mEW7qaqtdqAdbMGeoNz383vNgEoss9kVQ=
Received: by 10.204.8.24 with SMTP id f24mr12394101bkf.64.1318405502680;
	Wed, 12 Oct 2011 00:45:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm1070977bkw.5.2011.10.12.00.45.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 00:45:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 09:44:53 +0200
Message-Id: <cover.1318405370.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [oe-core 0/4] Qt4, armv6, xserver-xorg changes
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
X-List-Received-Date: Wed, 12 Oct 2011 07:50:48 -0000

The following changes since commit 486b17af3e4cced76e9852e7634f75ea87433db2:

  shared-mime-info: Fix a parallel make race (2011-10-11 18:06:56 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

GNUtoo (1):
  conf: machine: includes: add armv6-novfp support

Martin Jansa (1):
  xserver-xorg: drop xorg-minimal-fonts from RDEPENDS

Simon Busch (2):
  qt4-embedded: remove dependency on tslib and use std. linux input
  qt4-x11-free: bring back pkg-config fixups

 meta/conf/machine/include/arm/arch-armv6.inc       |   45 +++++++++++++-------
 meta/conf/machine/include/tune-arm1136j-s.inc      |   10 ++++
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 meta/recipes-qt/qt4/files/qte.sh                   |    2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc               |    6 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |   16 +++++++-
 7 files changed, 60 insertions(+), 22 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-arm1136j-s.inc

-- 
1.7.7



