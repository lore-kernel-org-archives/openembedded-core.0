Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 258FF6E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 17:01:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 22 Apr 2015 10:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,624,1422950400"; d="scan'208";a="713702111"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2015 10:01:36 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 22 Apr 2015 10:01:35 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX155.amr.corp.intel.com (10.22.240.21) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 22 Apr 2015 10:01:35 -0700
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.98.147) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 22 Apr 2015 10:01:34 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Apr 2015 14:01:09 -0300
Message-ID: <1429722072-13369-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
X-Originating-IP: [10.218.98.147]
Subject: [PATCH V2 0/3] systemd: split modules into packages
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
X-List-Received-Date: Wed, 22 Apr 2015 17:01:55 -0000
Content-Type: text/plain

Differences from V1:
- Rebasing with master since patchset wasn't fully reviewed last time

Bruno Bottazzini (2):
  systemd 219 -> system 219-stable
  systemd: split modules into packages

Gustavo Sverzut Barbieri (1):
  dbus: split tools package.

 meta/recipes-core/dbus/dbus.inc          |    9 +-
 meta/recipes-core/systemd/systemd_219.bb | 1085 ++++++++++++++++++++++++++----
 2 files changed, 954 insertions(+), 140 deletions(-)

-- 
2.3.5


