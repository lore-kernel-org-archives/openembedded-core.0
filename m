Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBjPo-0003uB-6O
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:02:36 +0200
Received: by fxm19 with SMTP id 19so3288161fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=g4+887GEjOk9sbwJfDBqQOc+b/fboy6LmIR9yJr5m18=;
	b=c1RiFxjbMBS3I1bSNh8fT9GGRZc3WK4Yjt3YEoAzDlWxNNjs+/z8HI9qnVii07Eq3T
	i1I6U8Zp+l1uPyh3CZIBjPH0bCT+bZwWtJOfYWbn0y7/Le3d7K/TBoyjL3+Y99ZCO+6u
	SJsWPY4G/BRkkYIWDiv971GP08vUyUC078fSs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pOxVawMwAIE14AoSmDD3e47pOme+PVUztS6Wdg+dN+IaFIVW0jSF5kaGQgeMsJxxct
	Kgfho4aFJyE7/vX7fBHRBwkxeVjdEQr6w9Nd0CFyBfJNZwulq5jCzp3NQvH+O8UKtJsA
	ND9R93En3q7nnkNrCvv1Xyc7bm+CsKtlfM45M=
Received: by 10.223.59.146 with SMTP id l18mr4657512fah.58.1303113615943;
	Mon, 18 Apr 2011 01:00:15 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l3sm1571842fap.36.2011.04.18.01.00.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:00:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 10:00:13 +0200
Message-Id: <cover.1303113405.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
Subject: [PATCH 0/4] Pull request
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
X-List-Received-Date: Mon, 18 Apr 2011 08:02:36 -0000

First two patches are taken from previous pull request 
(without rejected distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.)
Other two allows distro layer to be a bit smaller.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: jansa/pull
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (4):
  gconf-dbus: add SRCREV to recipe
  xf86-video-omapfb: add SRCREV to recipe
  task-base: allow distribution to define apm provider
  python-dir.bbclass: define default PYTHON_BASEVERSION

 meta/classes/python-dir.bbclass                    |    1 +
 meta/recipes-core/tasks/task-base.bb               |    5 ++++-
 meta/recipes-gnome/gnome/gconf-dbus_svn.bb         |    1 +
 .../xorg-driver/xf86-video-omapfb_git.bb           |    1 +
 4 files changed, 7 insertions(+), 1 deletions(-)

-- 
1.7.5.rc1



