Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 073CF7830E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:30:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 07:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="867499764"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2017 07:30:14 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 85F9058038E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:30:13 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 17:29:46 +0300
Message-Id: <1497364193-519-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/7] Moving from ftp to http/https
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
X-List-Received-Date: Tue, 13 Jun 2017 14:30:29 -0000

Reduce the usage of ftp protocol in SRC_URIs:

https://www.debian.org/News/2017/20170425

As part of [YOCTO #11413]


Maxin B. John (7):
  libpcre: switch from ftp to https
  dhcp: switch from ftp to http
  mesa-demos: switch from ftp to https
  mesa: switch from ftp to https
  libglu: switch from ftp to https
  libid3tag: switch from ftp to http
  grub: switch from ftp to https

 meta/recipes-bsp/grub/grub2.inc                        | 2 +-
 meta/recipes-connectivity/dhcp/dhcp.inc                | 2 +-
 meta/recipes-graphics/mesa/libglu_9.0.0.bb             | 2 +-
 meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb         | 2 +-
 meta/recipes-graphics/mesa/mesa_17.1.1.bb              | 2 +-
 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb | 2 +-
 meta/recipes-support/libpcre/libpcre_8.40.bb           | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.4.0


