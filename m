Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBFD7C427
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 04:03:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6143Gai000289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:03:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 30 Jun 2019 21:03:09 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jul 2019 12:15:32 +0800
Message-ID: <cover.1561954425.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Mon, 01 Jul 2019 04:03:15 -0000
Content-Type: text/plain

Changes in V2:
* Check /lib/systemd/systemd under ${IMAGE_ROOTFS} instead of checking
  the existence of systemctl tool in native staging directory.

The following changes since commit bc5f6725af04417dcf5c65981d8b85abee9c61d8:

  Revert "pigz: Add debug for autobuilder errors" (2019-06-30 23:33:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/image-systemd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/image-systemd

Chen Qi (1):
  image.bbclass: fix systemd_preset_all

 meta/classes/image.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
1.9.1


