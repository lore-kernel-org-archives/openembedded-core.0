Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5127B607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:47:39 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jun 2016 01:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="129085731"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2016 01:47:40 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B74186A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 01:47:36 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 06:54:15 +0300
Message-Id: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/6] upgrade gstreamer git recipes to version 1.8.2
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
X-List-Received-Date: Mon, 27 Jun 2016 08:47:41 -0000

Keep the gstreamer git recipes updated.

[YOCTO #9811]

Maxin B. John (6):
  gstreamer1.0_git: bump to 1.8.2
  gstreamer1.0-plugins-good_git: bump version to 1.8.2
  gstreamer1.0-plugins-bad_git: bump version to 1.8.2
  gstreamer1.0-plugins-base_git: bump version to 1.8.2
  gstreamer1.0-plugins-ugly_git: bump version to 1.8.2
  gstreamer1.0-libav_git: bump version to 1.8.2

 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb  | 10 +++++-----
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb                |  8 ++++----
 .../gstreamer/gstreamer1.0-plugins-base_git.bb               | 12 ++++++++----
 .../gstreamer/gstreamer1.0-plugins-good_git.bb               |  9 +++++----
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb               |  8 ++++----
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb        |  8 ++++----
 6 files changed, 30 insertions(+), 25 deletions(-)

-- 
2.4.0


