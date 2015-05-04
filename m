Return-Path: <bruno.bottazzini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EC95C65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 21:43:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2015 14:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,368,1427785200"; d="scan'208";a="566176050"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2015 14:43:32 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 4 May 2015 14:43:32 -0700
Received: from localhost.localdomain (10.218.98.31) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 4 May 2015 14:43:31 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 18:43:21 -0300
Message-ID: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.3.7
MIME-Version: 1.0
X-Originating-IP: [10.218.98.31]
Subject: [PATCH V2 0/3] systemd and dbus: split modules into packages
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
X-List-Received-Date: Mon, 04 May 2015 21:43:34 -0000
Content-Type: text/plain

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
 meta/recipes-core/systemd/systemd_219.bb | 1146 ++++++++++++++++++++++++++----
 2 files changed, 1025 insertions(+), 130 deletions(-)

--
2.3.7


