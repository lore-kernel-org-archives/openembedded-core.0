Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A66E77028
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 08:46:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0P8k096013895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 00:46:00 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jan 2016 00:45:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 00:45:58 -0800
Message-ID: <cover.1453711529.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] image.bbclass: check INITRAMFS_MAXSIZE
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
X-List-Received-Date: Mon, 25 Jan 2016 08:46:02 -0000
Content-Type: text/plain

The following changes since commit bf6372fc361e7588e95f682103332d7a7159c851:

  weston: Add missing DEPENDS on wayland-native (2016-01-24 10:55:35 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/initramfs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/initramfs

Robert Yang (1):
  image.bbclass: check INITRAMFS_MAXSIZE

 meta/classes/image.bbclass |   14 +++++++++++++-
 meta/conf/bitbake.conf     |    6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 
1.7.9.5


