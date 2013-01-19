Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwhJu-0006sJ-VU
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 23:55:27 +0100
Received: by mail-ob0-f176.google.com with SMTP id un3so4822802obb.35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=J2WJzpX59L44P8EoPil/m3RX+WC7Otk5dKbz7lyw5L4=;
	b=x3w7nJT+L3kt1Ss6oTAcYF03AgVGwhHS42jyCV/6/tr/Daz/sRmnjsNg/biZBJBPAU
	zsf+WitTOkZzHPG4hMvnYoCd81g9jkUDI/Lq05JZfdCJSpdJRrbcNWdk76p8XDKxeVhU
	69C8EyjDGJMTiovLoHI7VnY2kGeZ4pgpgQFiSfchf9pFWZicf05YKqFvK9LD3JNL0+qr
	ciI11FGm5BCVp+oknaXxyjlA1ZXnU5S3V2SJz9+0jHUpvpvwhUt2co/enrzxqyVwbe7K
	P7R+ksad/J4K9YSFD3uz7rHnuM0trZQ6Gziu0fvVwpjIJg2KxrfAnvX7w477+rwewc6K
	+ggQ==
X-Received: by 10.182.149.106 with SMTP id tz10mr10614103obb.13.1358635199876; 
	Sat, 19 Jan 2013 14:39:59 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id go17sm6925361obc.15.2013.01.19.14.39.58
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:39:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 14:39:40 -0800
Message-Id: <cover.1358634922.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
Cc: Khem Raj <kraj@juniper.net>
Subject: [PATCH 0/4] boost, nfs-utils upgrade, drop KERNEL_CC
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
X-List-Received-Date: Sat, 19 Jan 2013 22:55:28 -0000

This patchset is about upgrading boost and nfs-utils to latest
KERNEL_CC is now formed using CC, this patch has been tested fair bit now

The following changes since commit 18bc7b44ef58cbcbe32d45504d71eed54ef695a4:

  guilt: add git 1.8.x support (2013-01-18 13:20:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (4):
  kernel.bbclass,module-base.bbclass: Use CC to form KERNEL_CC
  nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc2
  consolekit_0.4.5.bb: Package unpackaged systemd files
  boost: Upgrade 1.51 -> 1.52

 meta/classes/kernel-arch.bbclass                   |   13 +
 meta/classes/kernel.bbclass                        |   16 +-
 meta/classes/module-base.bbclass                   |   16 -
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   37 +-
 .../nfs-utils-1.2.1-exp-subtree-warn-off.patch     |   12 +
 .../nfs-utils/nfs-utils-1.2.1-statdpath-man.patch  |   58 +++
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   21 +
 .../nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch   |   12 +
 .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 --
 .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch  |  535 ++++++++++++++++++++
 .../nfs-utils/nfs-utils.1.2.8.rc2.patch.1          |  535 ++++++++++++++++++++
 .../{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb}     |   28 +-
 meta/recipes-support/boost/boost.inc               |    2 -
 .../boost/{boost_1.51.0.bb => boost_1.52.0.bb}     |    8 +-
 meta/recipes-support/boost/files/hash_enums.patch  |   45 --
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
 16 files changed, 1228 insertions(+), 142 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb} (63%)
 rename meta/recipes-support/boost/{boost_1.51.0.bb => boost_1.52.0.bb} (44%)
 delete mode 100644 meta/recipes-support/boost/files/hash_enums.patch

-- 
1.7.9.5



