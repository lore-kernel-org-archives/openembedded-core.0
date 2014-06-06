Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2DDF6FA55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:21:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s568LUJ8024371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 01:21:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 01:21:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 16:22:25 +0800
Message-ID: <cover.1402042902.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] package upgrades: glib-2.0, file and autogen-native
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
X-List-Received-Date: Fri, 06 Jun 2014 08:21:35 -0000
Content-Type: text/plain

The following changes since commit f8125a1e9b6893a12355d55d4df584a8d97f0bff:

  image_types: Fix ubi filesystem return codes (2014-06-03 16:45:18 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrades-2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrades-2

Chen Qi (3):
  glib-2.0: upgrade from 2.40.0 to 2.41.0
  file: upgrade from 5.17 to 5.18
  autogen-native: upgrade from 2.18.2 to 2.18.3

 .../{glib-2.0_2.40.0.bb => glib-2.0_2.41.0.bb}     |    4 +--
 ...n-native_5.18.2.bb => autogen-native_5.18.3.bb} |    7 +++--
 ...ig.sh-force-exit-value-to-be-0-in-subproc.patch |   30 ++++++++++++++++++++
 .../file/{file_5.17.bb => file_5.18.bb}            |    4 +--
 4 files changed, 38 insertions(+), 7 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.40.0.bb => glib-2.0_2.41.0.bb} (81%)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.2.bb => autogen-native_5.18.3.bb} (80%)
 create mode 100644 meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch
 rename meta/recipes-devtools/file/{file_5.17.bb => file_5.18.bb} (86%)

-- 
1.7.9.5


