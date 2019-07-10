Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7E017EE09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:55:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6A2tVE8010365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jul 2019 19:55:41 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 9 Jul 2019 19:55:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2019 11:07:55 +0800
Message-ID: <cover.1562727995.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Wed, 10 Jul 2019 02:55:50 -0000
Content-Type: text/plain

Changes in V2:
* Let xmlcatalog.bbclass hold 'libxml2-native' dependency.

The following changes since commit 2a6094ca8c4aa5c00636df77669e5bca6ad52bcf:

  oeqa/bbtests: Tweak test bitbake output pattern matching (2019-07-09 23:30:44 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/buildtools-xmlcatalog
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/buildtools-xmlcatalog

Chen Qi (2):
  buildtools-tarball: add nativesdk-libxml2-utils
  xmlcatalog: hold libxml2-native dependency

 meta/classes/xmlcatalog.bbclass                                     | 2 ++
 meta/conf/bitbake.conf                                              | 3 +++
 meta/recipes-core/meta/buildtools-tarball.bb                        | 1 +
 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb           | 2 --
 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb | 2 --
 5 files changed, 6 insertions(+), 4 deletions(-)

-- 
1.9.1


