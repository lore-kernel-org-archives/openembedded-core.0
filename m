Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44772728EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 09:17:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ9HgZ7028029
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 01:17:42 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Dec 2014 01:17:42 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 17:17:41 +0800
Message-ID: <cover.1418979966.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Misc fixes about hardcoding of paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Dec 2014 09:17:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This patchset mainly fixes several hardcoding problems.

There's a bug in Yocto's bugzilla:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7040
Bug 7040 - Support for /usr merge (à la systemd and Fedora)

I did some investigation and made it work for core-image-sato-sdk.

The solution is divided into two parts. One part is a custom layer which
has a custom distro file and a few bbappend files for base-files, busybox, etc.
I think the bbappend files are a little hacky and not suitable for OE.
The other part is this patchset. It fixes several hardcoding problems in OE.
I think this part is suitable for OE. That's why I sent it out.

//Chen Qi

The following changes since commit 8d0e56a850579f9a6d501266deeef9b257ce4780:

  serf: readded md5sum (2014-12-11 11:34:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/hardcoding
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/hardcoding

Chen Qi (5):
  busybox: fix hardcoding of paths
  systemd: fix hardcoding of paths
  sed: test bindir and base_bindir before moving and removing things
  alsa-utils: fix FILES of alsa-utils-alsactl
  glibc-package.inc: fix order in PACKAGES

 meta/recipes-core/busybox/busybox.inc             | 66 +++++++++++++----------
 meta/recipes-core/glibc/glibc-package.inc         |  2 +-
 meta/recipes-core/systemd/systemd_216.bb          | 12 ++---
 meta/recipes-extended/sed/sed_4.1.2.bb            |  6 ++-
 meta/recipes-extended/sed/sed_4.2.2.bb            |  6 ++-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb |  2 +-
 6 files changed, 55 insertions(+), 39 deletions(-)

-- 
1.9.1


