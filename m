Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60DF27261A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:05:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2015 09:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="647311731"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2015 09:05:20 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 4 Feb 2015 09:05:19 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.44) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 4 Feb 2015 09:05:18 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Feb 2015 15:04:54 -0200
Message-ID: <1423069496-25819-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.44]
Subject: [PATCH v2 0/2] systemd: update version from 216 to 218
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
X-List-Received-Date: Wed, 04 Feb 2015 17:05:21 -0000
Content-Type: text/plain

Differences from v1:

1- Commit split into 2 commits.
   First one is updating systemd from version 216 to 218.
   Second one is splitting it into packages.

-------------------------------------------------------
In this patchset we split systemd into packages.

Since, systemd has a lot of features, now the user can exclude them from the
final build.

Instead of carrying all systemd modules. We will be able to customize it
as our needs.

In the end we will be able to get a smaller and optimized system


Bruno Bottazzini (2):
  systemd: update from 216 to 218
  systemd: split modules into packages

 ...r-executing-scripts-under-etc-systemd-218.patch |  131 ++
 .../systemd/systemd_218-pam-fix-fallocate.patch    |   91 ++
 meta/recipes-core/systemd/systemd_218.bb           | 1251 ++++++++++++++++++++
 3 files changed, 1473 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd_218.bb

-- 
1.9.1


