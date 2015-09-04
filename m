Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFF8360053
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 22:19:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 04 Sep 2015 15:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,470,1437462000"; d="scan'208";a="798606967"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2015 15:19:35 -0700
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 4 Sep 2015 15:19:35 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX115.amr.corp.intel.com (10.22.240.11) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 4 Sep 2015 15:19:35 -0700
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.154) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 4 Sep 2015 15:19:34 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Sep 2015 19:19:01 -0300
Message-ID: <1441405142-7497-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.154]
Subject: [PATCH] mkefidisk: Create interactive menu for the script
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
X-List-Received-Date: Fri, 04 Sep 2015 22:19:36 -0000
Content-Type: text/plain

Differences from v1:
- Now it will show only unmounted devices as Saul Wold has suggested
- Commit message changed as Saul Wold has suggested

Bruno Bottazzini (1):
  mkefidisk: Create interactive menu for the script

 scripts/contrib/mkefidisk.sh | 63 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 5 deletions(-)

-- 
2.5.0


