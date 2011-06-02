Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QSDaZ-0000Uj-UV
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 21:30:28 +0200
Received: by yia28 with SMTP id 28so252146yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=5IHyCikCh0rlD2gkVOehB36Dcuiqu1NaLZKOTwypmeQ=;
	b=LI4+KZqD3rwfu4xzTqvOX0RqwvnX2ztAeUbrHz2L0R/JMCR1MMnHHsUT3Q2z8DYYh+
	M83ortdJC00vss0nvtoeV5GLDmCj6IwIMqYem3tHEFOfYwDmTi8mmgJzQeWUK6hDeJ0/
	KroIHES2TQzuAAZ0cb4c3acMPpogSeLZ7w7I8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=dpIHQFzhuHyViw0mNNb5IKBBgoEEpHK5ZZJadtVvzV40fMGLiDXWiCPUqUuLuolbCK
	MOltTiF0cOgyXnxuCQ7b/GkVqD/i5mxDFHV+u6/XVcHmrIPt/RpesUmQcpcksjjwUcZc
	boEPNs31laLphEgSLc8IdiLf2SuIhKrt//fYs=
Received: by 10.150.189.17 with SMTP id m17mr1051052ybf.34.1307042730330;
	Thu, 02 Jun 2011 12:25:30 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o45sm689081yhk.63.2011.06.02.12.25.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 12:25:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 19:25:13 +0000
Message-Id: <cover.1307042670.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/4] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Thu, 02 Jun 2011 19:30:28 -0000

The following changes since commit 2a52f806f3789f717219651b97dc64fec3881f7f:

  qmake_base.bbclass: fix lrelease/lupdate binary names (2011-06-02 18:26:19 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Otavio Salvador (4):
  xf86-driver-common.inc: remove .la files to avoid unpackaged warning
  gnutls: use INC_PR on 2.12.5 version recipe
  gnutls: add p11tool into gnutls-bin
  package.bbclass: add support to split Qt translation files

 meta/classes/package.bbclass                       |   41 ++++++++++++++++++--
 .../xorg-driver/xf86-driver-common.inc             |    6 ++-
 meta/recipes-support/gnutls/gnutls.inc             |    3 +-
 meta/recipes-support/gnutls/gnutls_2.12.5.bb       |    2 +-
 4 files changed, 45 insertions(+), 7 deletions(-)

-- 
1.7.2.5



