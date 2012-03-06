Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4yFv-0004hI-Di
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:32:59 +0100
Received: by yhjj56 with SMTP id j56so2304758yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:24:23 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.125.130 as permitted sender) client-ip=10.236.125.130; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.125.130 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.125.130])
	by 10.236.125.130 with SMTP id z2mr34642857yhh.94.1331054663128
	(num_hops = 1); Tue, 06 Mar 2012 09:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=wAbcfuIlIOqq//fF10MS7oO3PXGqmO1/dDGoJac6+wg=;
	b=F+16kSdyfWq/xSYoLrBozujm4RpVWkn6anR1ZQpoA0QmQ63Ize1KnhjOA8seuJiLvm
	OL2tijSDUyLWzbaqT9ztBpEyz3NH5keEUMcO1muuQETA37fAn2eCuZmMNDK570+mUh99
	tWqVKtY7NBsNaGCOk8FNbkcgSrFH6NjTx+kJKXM+7q9Q2V8Do47vo89G5ExMpul/NPP7
	MGYprHoCXnQwNSUiTqMahweeAQpsVMZp4Ku/SabVNO/mIGLm/3ODl/vyZFW4XZamelCi
	tWsy23vyV6jAp655QMtv2HWw8i3K8NFJgQ4zsZ/WXyudrw00X9jSXChkM5MqkqCD8EaN
	wm/Q==
Received: by 10.236.125.130 with SMTP id z2mr27455978yhh.94.1331054663070;
	Tue, 06 Mar 2012 09:24:23 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm50620004yhj.7.2012.03.06.09.24.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:24:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 17:24:10 +0000
Message-Id: <cover.1331054558.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v2 0/5] Postinst trigger improvements for images
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
X-List-Received-Date: Tue, 06 Mar 2012 17:32:59 -0000

This patchset make consistent and more meanful the name used as
postinst trigger in rootfs.

The following changes since commit d7b8c247227f3cc82f92292407f548927e9fde78:

  base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:03:41 -0800)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (5):
  run-postinsts: fix opkg data path
  image.bbclass: fix rootfs generation without package management tools
  rootfs_rpm.bbclass: rename postinst trigger script
  opkg: rename postinst trigger script
  dpkg: rename postinst trigger script

 meta/classes/core-image.bbclass                    |    2 --
 meta/classes/image.bbclass                         |    7 +++++--
 meta/classes/rootfs_rpm.bbclass                    |    6 +++---
 meta/recipes-devtools/dpkg/dpkg.inc                |    8 ++++----
 .../dpkg/run-postinsts/run-postinsts               |    4 ++--
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 meta/recipes-devtools/opkg/opkg.inc                |    8 ++++----
 8 files changed, 20 insertions(+), 19 deletions(-)

-- 
1.7.2.5



