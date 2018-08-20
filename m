Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 508A179005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:53:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7K8rPVK003991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 01:53:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 20 Aug 2018 01:53:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2018 16:57:53 +0800
Message-ID: <cover.1534755428.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cmake-native: fix to function correctly in case of eSDK
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
X-List-Received-Date: Mon, 20 Aug 2018 08:53:25 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 9af0f1a46bbb6ad9ee8b35957251f4aa826b023f:

  kernel-devsrc: restructure for out of tree (and on target) module builds (2018-08-19 16:35:22 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/cmake-esdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cmake-esdk

Chen Qi (1):
  cmake-native: fix to function correctly in case of eSDK

 meta/recipes-devtools/cmake/cmake-native_3.11.4.bb | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
1.9.1


