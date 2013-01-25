Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQ3-00083A-Lo
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:58:35 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so393318pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=8Na0tPpIt3picy2G5T9UaumS7rRR5NxK7/dOzo0W8/U=;
	b=FT97PqArLSRKCDxAceKhgb8F72Dhb84WVywB6S4rDv48b2B5nZsUMkE1CbQk4a3HjC
	vEkJmwvDf9TeME5Kt5END9tDnIn4smJbEwf/gkchLIT7xQ4fJJzG5/Dda5Njca5HhEP7
	NPmMTFbJe/oB8071XUDSP6VVTBHN9TxPgUenDe2B/5vv6CYCT0DVQdQ8I/W30wKx2t5d
	gLn5d9zHlgCp+Zw3eLl9JgcQMGyOFsXFlSDpgtA0t702n3cGO9fTeLX25lszhmVcqFb6
	dEU3iqY+xgsHVtDlszb2ZlJ3Nd5BfNQRGH8qHJbYQgf3W5zc3kktn5+LrLXW0fYDl64O
	0LQg==
X-Received: by 10.68.203.198 with SMTP id ks6mr16900279pbc.35.1359142980395;
	Fri, 25 Jan 2013 11:43:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i6sm1393458paw.19.2013.01.25.11.42.57
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:42:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:47 +0100
Message-Id: <cover.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH 0/7] world-image fixes
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
X-List-Received-Date: Fri, 25 Jan 2013 19:58:35 -0000

This depends on
http://lists.linuxtogo.org/pipermail/bitbake-devel/2013-January/004091.html

And world-image is far from building correctly, see
"File conflicts between PN-doc packages" thread.

Later I'll post error log from world-image build including 
complete oe-core and ~20 more layers.

The following changes since commit 9a43a67993c21cedf6cf71138e3da9c691ebf4a7:

  gawk: Add missing dependency on readline (2013-01-25 14:37:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/world
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/world

Martin Jansa (7):
  console-tools, kbd: add RREPLACES/RPROVIDES/RCONFLICTS combo between
    PN-dbg
  initrdscripts: exclude conflicting packages from world-image
  automake: use autotools_do_install
  gcc-configure-runtime: always remove info/dir
  eglibc-scripts: don't package mtrace, RDEPEND on eglibc-mtrace
    instead, fix RDEPENDS
  eglibc-package: remove infodir/dir if it exists
  oe-core: add world-image

 meta/recipes-core/console-tools/console-tools_0.3.2.bb     |  7 +++++++
 meta/recipes-core/eglibc/eglibc-package.inc                |  4 ++++
 meta/recipes-core/eglibc/eglibc-scripts.inc                |  5 ++---
 meta/recipes-core/images/world-image.bb                    | 10 ++++++++++
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb |  2 ++
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb |  2 ++
 meta/recipes-core/kbd/kbd_1.15.2.bb                        |  3 +++
 meta/recipes-devtools/automake/automake_1.12.6.bb          |  3 +--
 meta/recipes-devtools/gcc/gcc-configure-runtime.inc        |  8 +++-----
 9 files changed, 34 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/images/world-image.bb

-- 
1.8.1.1



