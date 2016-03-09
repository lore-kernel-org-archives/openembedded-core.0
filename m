Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1C1F6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:58:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u29JwiR2014098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2016 11:58:44 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 11:58:43 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Mar 2016 13:58:40 -0600
Message-ID: <cover.1457553473.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/2] RPM5: Fix musl and a minor tweak
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
X-List-Received-Date: Wed, 09 Mar 2016 19:58:48 -0000
Content-Type: text/plain

Patch 1/2 fixes musl building w/ RPM5, including internal or external beecrypt

Patch 2/2 just resyncs a chunk into the CVS version.

The following changes since commit 277377f13b2b771915eb853e336ca24b84523ed1:

  recipetool: create: shrinkwrap and lockdown npm modules (2016-03-09 16:59:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib mhatle/rpm-5.4.16
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/rpm-5.4.16

Mark Hatle (2):
  rpm: Fix musl integration with RPM5
  rpm: Sync CVS to regular version

 .../rpm/rpm/0001-rpm-Fix-build-on-musl.patch       | 242 ++++++++++++++++-----
 .../rpm/rpm/rpm-autogen-force.patch                |  78 +++++++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |   9 +
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   1 +
 4 files changed, 275 insertions(+), 55 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autogen-force.patch

-- 
2.5.0


