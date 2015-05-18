Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA9DB60962
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 23:28:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 16:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,455,1427785200"; d="scan'208";a="712140366"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2015 16:28:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 18 May 2015 16:28:35 -0700
Message-Id: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] Package Updates
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
X-List-Received-Date: Mon, 18 May 2015 23:28:41 -0000

Ross, Richard:

Here is a set of updates to core support libraries and lsbinitscripts, 
I tested these packages by building and running webkit and midori which
are dependant on those libraries on hardware targets

Thanks
   Sau!


Saul Wold (5):
  libidn: Upgrade to 1.30
  libksba: Upgrade to 1.3.3
  libinitscripts: Upgrade to 9.63
  msmtp: Upgrade to 1.6.2
  liburcu: Upgrade to 0.8.7

 .../recipes-extended/libidn/{libidn_1.29.bb => libidn_1.30.bb} | 10 +++++-----
 .../lsb/{lsbinitscripts_9.61.bb => lsbinitscripts_9.63.bb}     |  6 +++---
 meta/recipes-extended/msmtp/{msmtp_1.6.1.bb => msmtp_1.6.2.bb} |  4 ++--
 .../libksba/{libksba_1.3.2.bb => libksba_1.3.3.bb}             |  4 ++--
 .../liburcu/{liburcu_0.8.6.bb => liburcu_0.8.7.bb}             |  4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.29.bb => libidn_1.30.bb} (75%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.61.bb => lsbinitscripts_9.63.bb} (80%)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.1.bb => msmtp_1.6.2.bb} (86%)
 rename meta/recipes-support/libksba/{libksba_1.3.2.bb => libksba_1.3.3.bb} (86%)
 rename meta/recipes-support/liburcu/{liburcu_0.8.6.bb => liburcu_0.8.7.bb} (83%)

-- 
2.1.0


