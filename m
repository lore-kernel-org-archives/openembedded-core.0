Return-Path: <yin.thong.choong@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A731977D9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491806680; x=1523342680;
	h=from:to:cc:subject:date:message-id;
	bh=qoJPZ4a4cvVq4YKZYzd+d1dMUKcSfgwYsmd/7oKkQoE=;
	b=GNAwlPqgMgxI+PzdlU0yInEsGwQETWItpx8zmocM68xs5i/07tFO9nes
	pBWnie4yU7pKQRWbZjMBUZN/TobYWQ==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2017 23:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,181,1488873600"; d="scan'208";a="1153719458"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2017 23:44:39 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Apr 2017 16:33:17 -0700
Message-Id: <1491780798-1591-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Mon, 10 Apr 2017 06:44:38 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Fedorahosted.org was retired on March 1st, 2017.
Replace all fedorahosted.org SRC_URI with source pagure.io and github.com.
Update the ${PN} to ${BPN} in order to pass the autobuilder mulitlib 
enable configuration.

Choong YinThong (1):
  logrotate: replace fedorahosted.org SRC_URI with github.com source

 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.7.4


