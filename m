Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNZ1k-00017C-Uz
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:22:41 +0200
Received: by pwj9 with SMTP id 9so1983105pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 16:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=4kilqDqKTp5kHszJ3gLDUfYR0VOnf3gPgy3cAaBzwqk=;
	b=kk3AHRl9lKhoW5/qxXmR6jW/X5D1aKQ2ZKobju3PYU86Yuts4yqBVsCmnC6C7yi6hA
	c+jWWlYhXZuCiLMIr1/ZGCVOL6mVe29xiC6hmUQ7dCK3lE52qW7BHOPgqgy022GymlKp
	H0Bquh/5M87bJU7yh591wU2Qet0/Xji35ic6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=iS7qbPj3l9lpZK0+mmx9jG5ZaDhO4iqm2S5bH0mwqFU762Nv4iIZRrUWDd6V40Clly
	DQlp52Xdk2sFoaf+2LAWhun5s+CaQSqwvI2EP4XeCwfQOZPf4CjmqKNRJADjbGrD591n
	FPnPo0BcQ7jRPKp3hLbF7CemIGWPNXDNdzzgI=
Received: by 10.142.150.10 with SMTP id x10mr22315wfd.321.1305933581604;
	Fri, 20 May 2011 16:19:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm3618067wfh.20.2011.05.20.16.19.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 16:19:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 May 2011 16:19:25 -0700
Message-Id: <cover.1305933509.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Opkg and distcc fix
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
X-List-Received-Date: Fri, 20 May 2011 23:22:41 -0000

These are remaining patches which needed rework.

The following changes since commit c26dadc799cd9c7df66c3bccfc9f21146c35625a:

  opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS} (2011-05-20 16:15:29 -0700)

are available in the git repository at:
  git@git.openembedded.org:openembedded-core-contrib.git kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/misc-fixes

Khem Raj (2):
  opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
  distcc_2.18.3.bb: Fix compilation on uclibc

 meta/recipes-devtools/distcc/distcc_2.18.3.bb   |   17 ++++++++++++-----
 meta/recipes-devtools/opkg/opkg/headerfix.patch |   19 -------------------
 meta/recipes-devtools/opkg/opkg_svn.bb          |    3 +--
 3 files changed, 13 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch

-- 
1.7.4.1



