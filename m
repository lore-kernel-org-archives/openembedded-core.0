Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD41C71C07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 08:43:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8R8hcgK010710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 01:43:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 27 Sep 2018 01:43:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2018 16:48:52 +0800
Message-ID: <cover.1538038062.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] nativesdk.bbclass: set consistent staging dirs regardless of multilib
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
X-List-Received-Date: Thu, 27 Sep 2018 08:43:37 -0000
Content-Type: text/plain

Changes in V2:
* use 'recipe-sysroot' instead of 'nativesdk-recipe-sysroot'

The following changes since commit 5cd00e3e53819f3c10d1733480077ce9f3cc2ca8:

  bitbake: fetch2/gitsm.py: Rework the git submodule fetcher (2018-09-26 15:14:33 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/nativesdk-recipe-sysroot
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/nativesdk-recipe-sysroot

Chen Qi (1):
  nativesdk.bbclass: set consistent staging dirs regardless of multilib

 meta/classes/nativesdk.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

-- 
1.9.1


