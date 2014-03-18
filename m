Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F006B6F8A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:49:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2I7nLSk002482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 00:49:21 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 18 Mar 2014 00:49:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 15:54:33 +0800
Message-ID: <cover.1395126712.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sgml-common-native: fix the generation of sgml-docbook.cat
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
X-List-Received-Date: Tue, 18 Mar 2014 07:49:21 -0000
Content-Type: text/plain

Testing:
$ recipes="openjade-native docbook-sgml-dtd-3.1-native docbook-sgml-dtd-4.1-native \
	docbook-sgml-dtd-4.5-native sgml-common-native docbook-dsssl-stylesheets-native"
$ bitbake $recipes -ccleansstate && bitbake $recipes

The builds are OK, check sysroot/etc/sgml/sgml-docbook.cat and
sysroot/etc/sgml/sgml-docbook.bak, they are OK.

// Robert

The following changes since commit b681d264ab2f721c537bfa87cc2ddbbbf3f8c1a2:

  gettext: upgrade from 0.18.3.1 to 0.18.3.2 (2014-03-17 14:01:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sgml
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sgml

Robert Yang (1):
  sgml-common-native: fix the generation of sgml-docbook.cat

 .../docbook-dsssl-stylesheets-native_1.79.bb            |  9 +++++++++
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc        | 10 ++++------
 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb |  9 +++++++++
 .../sgml-common/sgml-common-native_0.6.3.bb             | 17 ++++++++++++-----
 4 files changed, 34 insertions(+), 11 deletions(-)

-- 
1.8.3.1


