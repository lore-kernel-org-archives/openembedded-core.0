Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A82BE762A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 21:46:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Sep 2015 14:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,492,1437462000"; d="scan'208";a="800974870"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 14:46:00 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 8 Sep 2015 14:46:00 -0700
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.154) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 8 Sep 2015 14:45:59 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 18:45:20 -0300
Message-ID: <1441748721-32485-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.154]
Subject: [PATCH V3] mkefidisk: Create interactive menu for the script
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
X-List-Received-Date: Tue, 08 Sep 2015 21:46:00 -0000
Content-Type: text/plain

Differences from v2:
- Removing unecessary \n as Saul Wold has suggested.

Differences from v1:
- Now it will show only unmounted devices as Saul Wold has suggested
- Commit message changed as Saul Wold has suggested

Bruno Bottazzini (1):
  mkefidisk: Create interactive menu for the script

 scripts/contrib/mkefidisk.sh | 63 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 5 deletions(-)

-- 
2.5.1


