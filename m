Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 853C465E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 06:35:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s896ZVOv005083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 23:35:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 23:35:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 14:35:46 +0800
Message-ID: <cover.1410244514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Fixes about unsafe references
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
X-List-Received-Date: Tue, 09 Sep 2014 06:35:33 -0000
Content-Type: text/plain

The following changes since commit e72aac2ae9e5fce1715fa04b7e94034fd06892d9:

  alsa-lib: libasound should runtime depends on alsa-conf (2014-09-03 11:30:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/unsafe-reference
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/unsafe-reference

Chen Qi (6):
  zlib: install into base_libdir
  udev: fix unsafe reference by installing libgudev in libdir
  insane.bbclass: make the checking stricter for unsafe references in
    scripts
  iputils: fix program location and QA warning
  kmod: install libkmod into base_libdir
  busybox: install ping6 into bindir by default

 meta/classes/insane.bbclass                        |  2 +-
 .../busybox-install-ping6-to-usr-bin.patch         | 25 +++++++++++++++++++
 meta/recipes-core/udev/udev.inc                    |  8 +++++-
 meta/recipes-core/zlib/zlib_1.2.8.bb               |  2 +-
 meta/recipes-extended/iputils/iputils_s20121221.bb | 29 ++++++++++++++--------
 meta/recipes-kernel/kmod/kmod_git.bb               |  9 ++++---
 6 files changed, 58 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch

-- 
1.9.1


