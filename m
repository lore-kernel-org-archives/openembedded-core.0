Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74CA070FAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:02:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I924AB008897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 02:02:04 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 02:02:03 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Sep 2014 05:02:01 -0400
Message-ID: <cover.1411030646.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] gstreamer1.0-plugins-bad: disable libssh2
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
X-List-Received-Date: Thu, 18 Sep 2014 09:02:07 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

libssh2 is automatically linked to if present, this undetermined
dependency may cause build errors like:

  .../x86_64-poky-linux/4.9.0/ld: cannot find -lssh2

libssh2 isn't an oe-core recipe, disable it for now.

The following changes since commit 280b6d0011f101e7a8edabd34c265b37a2f791ed:

  sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586 (2014-09-17 22:00:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/gst-plugins-bad
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/gst-plugins-bad

Wenzong Fan (1):
  gstreamer1.0-plugins-bad: disable libssh2

 .../gstreamer/gstreamer1.0-plugins-bad.inc         |    4 ++
 .../configure-allow-to-disable-libssh2.patch       |   64 ++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch

-- 
1.7.9.5


