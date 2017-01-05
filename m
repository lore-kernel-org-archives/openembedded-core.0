Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD40B601A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 05:03:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0553SsH002141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2017 21:03:28 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 4 Jan 2017 21:03:27 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jan 2017 13:03:27 +0800
Message-ID: <cover.1483592527.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] selftest/eSDK.py: fix sstate dir not found error
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
X-List-Received-Date: Thu, 05 Jan 2017 05:03:29 -0000
Content-Type: text/plain

The following changes since commit dbb247cac5fbf7b037e4955f9793828451723924:

  bitbake: cookerdata: Convert multiconfig to use BB_CURRENT_MC (2016-12-22 12:36:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/eSDK-sstate_dir
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/eSDK-sstate_dir

Chen Qi (1):
  selftest/eSDK.py: fix sstate dir not found error

 meta/lib/oeqa/selftest/eSDK.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


