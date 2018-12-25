Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4370E6BBEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2018 09:40:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBP9duic004099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2018 01:40:06 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 25 Dec 2018 01:39:45 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Dec 2018 04:39:42 -0500
Message-ID: <cover.1545730744.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] testimage.bbclass: remove boot parameter systemd.log_target
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
X-List-Received-Date: Tue, 25 Dec 2018 09:40:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 801745d918e83f976c706f29669779f5b292ade3:

  populate_sdk_ext.bbclass: Include site.conf in parsing for contents for local.conf (2018-12-20 14:53:55 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/testimage
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/testimage

Kai Kang (1):
  testimage.bbclass: remove boot parameter systemd.log_target

 meta/classes/testimage.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

-- 
2.19.0.rc2


