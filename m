Return-Path: <bruno.bottazzini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A317A73F56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 18:03:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2015 11:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,409,1427785200"; d="scan'208";a="492185724"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by FMSMGA003.fm.intel.com with ESMTP; 11 May 2015 11:03:08 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 11 May 2015 11:03:08 -0700
Received: from localhost.localdomain (10.218.98.23) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 11 May 2015 11:03:07 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 15:02:48 -0300
Message-ID: <1431367371-7716-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.4.0
MIME-Version: 1.0
X-Originating-IP: [10.218.98.23]
Subject: [PATCH V4 0/3] systemd: split modules into packages
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
X-List-Received-Date: Mon, 11 May 2015 18:03:10 -0000
Content-Type: text/plain

Differences from V3:
- Ordering alphabetically PACKAGECONFIG as Andreas has suggested.
- DEPENDS not being statically since it may change depending 
  on the PACKAGECONFIG as Anders and Andreas have suggested.
- Removing patch that systemd: Verify if journal-flush.service exists and
  removing the workaround since it is already upstremead on systemd as
  Andreas has suggested.

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
  systemd: removing workaround odering journal after remote-fs.target
  systemd: split modules into packages

Gustavo Sverzut Barbieri (1):
  dbus: split tools package.

 meta/recipes-core/dbus/dbus.inc          |    9 +-
 meta/recipes-core/systemd/systemd_219.bb | 1087 ++++++++++++++++++++++++++----
 2 files changed, 965 insertions(+), 131 deletions(-)

--
2.4.0


