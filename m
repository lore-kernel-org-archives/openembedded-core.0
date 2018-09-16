Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB56679855
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 05:46:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8G5jhPT025315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 22:45:53 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 22:45:32 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Sep 2018 22:45:29 -0700
Message-ID: <20180916054532.1312-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/3 v5] udev-extraconf/mount.sh: add systemd-mount command for systemd
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
X-List-Received-Date: Sun, 16 Sep 2018 05:46:02 -0000
Content-Type: text/plain

v5:
    perfect a few codes based on v4
v4:
    fix the recursively dependency for the systemd-mount
v3:
    perfect syntax

Hongzhi.Song (3):
  udev-extraconf/mount.sh: add support to systemd
  udev-extraconf/mount.sh: Fix the recursively dependency for the
    systemd-mount
  udev-extraconf/mount.sh: Skip the entry in /etc/fstab when using the
    systemd-moun

 meta/recipes-core/udev/udev-extraconf/mount.sh | 92 +++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 18 deletions(-)

-- 
2.11.0


