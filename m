Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED68573166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:51:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R5pl1m024229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:51:48 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jul 2016 22:51:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 13:52:05 +0800
Message-ID: <cover.1469598081.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix disutils and extend python-setuptools to nativesdk
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
X-List-Received-Date: Wed, 27 Jul 2016 05:51:48 -0000
Content-Type: text/plain

The following changes since commit b32d430c3c7dccf3a8d06ab492d648893a05950f:

  dpkg: use snapshot.debian.org for SRC_URI (2016-07-26 08:56:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/python-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/python-fixes

Chen Qi (2):
  distutils: fix to avoid file-rdeps QA issue
  python3-setuptools: extend to nativesdk

 meta/classes/distutils.bbclass                            | 4 ++--
 meta/classes/distutils3.bbclass                           | 4 ++--
 meta/recipes-devtools/python/python3-setuptools_22.0.5.bb | 7 ++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
1.9.1


