Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9535179C4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9MC7Djq031617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 05:07:24 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 22 Oct 2018 05:07:03 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 19:58:37 +0800
Message-ID: <20181022115840.38029-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH 0/3] udev-extraconf: Fix the automount malfunction when the systemd is used
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
X-List-Received-Date: Mon, 22 Oct 2018 12:07:34 -0000
Content-Type: text/plain

When we use the systemd as the init manager, the automount function
doesn't work at all. This patch series fixes this issue. The patch 2&3
have been posted by Hongzhi one month ago [1], but they aren't merged
yet. I have rebased them on the latest oe-core and also fix the author
info since it is me to scratch these patches originally. :-)

Kevin Hao (3):
  udev-extraconf: Use the canonical file name of systemd
  udev-extraconf: Fix the recursively dependency for the systemd-mount
  udev-extraconf: Skip the entry in /etc/fstab when using the
    systemd-mount

 meta/recipes-core/udev/udev-extraconf/mount.sh | 36 +++++++++++++++++---------
 1 file changed, 24 insertions(+), 12 deletions(-)


[1] http://lists.openembedded.org/pipermail/openembedded-core/2018-September/155724.html

Thanks,
Kevin
-- 
2.14.4


