Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 668AD71637
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:02:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jan 2015 12:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,443,1418112000"; d="scan'208";a="515596369"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by orsmga003.jf.intel.com with ESMTP; 21 Jan 2015 11:55:04 -0800
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:45 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX156.amr.corp.intel.com (10.22.240.22) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:45 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.144) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:44 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2015 18:00:56 -0200
Message-ID: <1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.144]
Subject: [PATCH 0/2] kmod new packageconfig and dbus split package
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
X-List-Received-Date: Wed, 21 Jan 2015 20:02:32 -0000
Content-Type: text/plain

In this patchset we include two changes:

1- kmod: new PACKAGECONFIG debug and logging to help reduce binary size.
2- dbus: split it into two package. We will be able to choose if we want the
         full version or a smaller one.

Gustavo Sverzut Barbieri (2):
  kmod: new PACKAGECONFIG debug and logging to help reduce binary size.
  dbus: split tools package.

 meta/recipes-core/dbus/dbus.inc   | 13 +++++++------
 meta/recipes-kernel/kmod/kmod.inc |  5 ++++-
 2 files changed, 11 insertions(+), 7 deletions(-)

--
1.9.1


