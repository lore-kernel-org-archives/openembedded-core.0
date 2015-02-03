Return-Path: <bruno.bottazzini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 06FE66E627
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 18:24:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2015 10:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,514,1418112000"; d="scan'208";a="660972656"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2015 10:21:26 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 3 Feb 2015 10:21:25 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.44) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 3 Feb 2015 10:21:24 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Feb 2015 16:21:03 -0200
Message-ID: <1422987664-26903-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.44]
Subject: [PATCH] systemd: update version from 216 to 218
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
X-List-Received-Date: Tue, 03 Feb 2015 18:24:52 -0000
Content-Type: text/plain

Also, in this patch we split systemd into packages.

Since, systemd has a lot of features, now the user can exclude them from the
final build.

Instead of carrying all systemd modules. We will be able to customize it
as our needs.

In the end we will be able to get a smaller and optimized system

Bruno Bottazzini (1):
  systemd: update version from 216 to 218

 ...r-executing-scripts-under-etc-systemd-218.patch |  131 ++
 .../systemd/systemd_218-pam-fix-fallocate.patch    |   91 ++
 meta/recipes-core/systemd/systemd_218.bb           | 1251 ++++++++++++++++++++
 3 files changed, 1473 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-systemd-218.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd_218-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd_218.bb

-- 
1.9.1


