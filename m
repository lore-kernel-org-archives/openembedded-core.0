Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOkb-0007MH-JG
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 15:28:49 +0200
Received: by wgbdr1 with SMTP id dr1so998143wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 06:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=FYVS8Zw/oM+h1ngtsM+kuBOV9+7xp9drbLlmMyyKyGo=;
	b=Q8uq0qZqBhc3LstuSNAxshb3ehOYf/9Ud1b8YGSARlisW/j+8Fn0bNs4tItuiWR4Yx
	PtYcH9DekRiP0W2lAg8ag6+R26KuYYxH80z78DzdExkMA5x03VcfcbrLbJecnvOud5te
	CkPiyKs3Ze/q4HQqVbK4gGG2vx4/B2fSMhRhC3YxaJyEpL//zDYSLtsnMbWl+yJs8GCo
	UNXm/CFaCnoQ8FO7n1QM/0WRvrSYqw/mB2PH11elXiZ4jBBpU3TPZ1O/eQ4YlOPgc7kK
	IxgsA07vHrCii8S4QaNl61mDqRjnFJqNYPeKeOVK+xe/qD/oRxnJ7lv4mgVTZZ4CTHhp
	h/Vg==
Received: by 10.180.98.8 with SMTP id ee8mr16671145wib.14.1335446352781;
	Thu, 26 Apr 2012 06:19:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm44719919wiz.1.2012.04.26.06.19.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 06:19:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2012 15:19:06 +0200
Message-Id: <cover.1335439784.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH 0/2] kernel.bbclass sync, new efl release, systemd machine support
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
X-List-Received-Date: Thu, 26 Apr 2012 13:28:49 -0000

The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:

  bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME (2012-04-26 10:59:20 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (2):
  xorg: add more native BBCLASSEXTENDs from meta-oe
  opkg-utils: bump SRCREV for Packages cache fix and other fixes

 .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -----------
 .../opkg-utils/arfile_header_split.patch           |   27 -------
 .../opkg-utils/index-ignore-filenotfound.patch     |   73 --------------------
 .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
 .../opkg-utils/opkg-utils/shebang.patch            |   46 ------------
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +--
 .../xorg-lib/libxcomposite_0.4.3.bb                |    1 +
 .../recipes-graphics/xorg-lib/libxcursor_1.1.13.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb    |    2 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb  |    2 +-
 .../xorg-proto/compositeproto_0.4.2.bb             |    1 +
 .../xorg-proto/damageproto_1.2.1.bb                |    1 +
 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |    2 +-
 .../xorg-proto/randrproto_1.3.2.bb                 |    2 +-
 15 files changed, 10 insertions(+), 225 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch

-- 
1.7.8.5



