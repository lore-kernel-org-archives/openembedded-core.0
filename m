Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F0CB573DB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 16:41:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 07 May 2015 09:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,384,1427785200"; d="scan'208";a="725425080"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2015 09:41:04 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 7 May 2015 09:41:04 -0700
Received: from localhost.localdomain (10.218.98.31) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 7 May 2015 09:40:51 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 May 2015 13:40:37 -0300
Message-ID: <1431016840-26287-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.4.0
MIME-Version: 1.0
X-Originating-IP: [10.218.98.31]
Subject: [PATCH V3 0/3] systemd: split modules into packages
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
X-List-Received-Date: Thu, 07 May 2015 16:41:04 -0000
Content-Type: text/plain

Differences from V2:
- Installing default features with "PACKAGECONFIG" instead of using
  "DISTRO_FEATURES" as Anders, Leandro and Otavio suggested.
- Rebase with master

Differences from V1:
- Making sure that we don't change default configuration as Anders and
  Otavio suggested.
- Changing EXTRA_OECONF flags to use it with PAKAGECONFIG as Anders pointed
  in the review.
- New patch that verifies if journal-flush.service exists.
  It may not exists depending on package configuration that the users want to
  be installed or removed.

Bruno Bottazzini (2):
  systemd: Verify if journal-flush.service exists.
  systemd: split modules into packages

Gustavo Sverzut Barbieri (1):
  dbus: split tools package.

 meta/recipes-core/dbus/dbus.inc          |    9 +-
 meta/recipes-core/systemd/systemd_219.bb | 1070 ++++++++++++++++++++++++++----
 2 files changed, 951 insertions(+), 128 deletions(-)

--
2.4.0


