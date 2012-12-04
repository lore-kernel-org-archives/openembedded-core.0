Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfhZw-0000ij-QH
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:45:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1918643eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=dJj044hE3mR8ZQPPxffMtm1MB6mwgoFBWqD13dPZBOQ=;
	b=w1SP2u8EfX/BFN9MK3IVKXAJozllNYl9C4u8yXldiZmXGTiVoSPtn0U/uEAtjGnmAk
	342myx0M4QMcrZHbLy9S8PtxGdCkpa4rUuF6X7Upu+r4KwuksArkZKPpyCJkEwt/or+4
	nHKv2e4wxcJNmMydgwyepCyW/RPJUKT5EDuFqHueV8euUKMYI5rgBWYwKS5+l2LV5gUX
	8BtuTQfQsUpa86y8ireGMFr5yBmh3oaORm57NE5VGqDTod06MHxOu3IrBFJB5AXXt5g4
	9wX2kZY84YVznAFUFYzueyQed8GnkglMODt9jEC6e6h/6FwDIVwZGXGydfa8YprC7Uny
	T+Rw==
Received: by 10.14.3.195 with SMTP id 43mr42436587eeh.36.1354584682937;
	Mon, 03 Dec 2012 17:31:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm34681120eep.12.2012.12.03.17.31.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:31:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:31:09 +0100
Message-Id: <cover.1354584580.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/6] Small fixes from bitbake world
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
X-List-Received-Date: Tue, 04 Dec 2012 01:45:44 -0000

The following changes since commit 24b954253dd1aa626835352c4dc8d085a19aae35:

  xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions (2012-12-03 16:38:28 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Enrico Scholz (1):
  sstate.bbclass: fixed file-conflict check

Martin Jansa (5):
  at: drop initscript dependency
  packagegroup-core-basic: use VIRTUAL-RUNTIME_initscripts and
    VIRTUAL-RUNTIME_init_manager
  distutils: remove empty datadir/share after it's content is moved to
    datadir
  util-linux: use u-a for eject
  sstate.bbclass: fix detection of owners matching sstate files

 meta/classes/distutils.bbclass                                 | 1 +
 meta/classes/sstate.bbclass                                    | 5 ++---
 meta/recipes-core/util-linux/util-linux.inc                    | 3 ++-
 meta/recipes-core/util-linux/util-linux_2.22.1.bb              | 2 +-
 meta/recipes-extended/at/at_3.1.13.bb                          | 2 +-
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 8 +++++---
 6 files changed, 12 insertions(+), 9 deletions(-)

-- 
1.8.0



