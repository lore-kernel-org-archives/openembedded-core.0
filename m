Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19CDE745A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 02:50:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w722okkq011475
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 19:50:47 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 1 Aug 2018 19:50:39 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 19:50:36 -0700
Message-ID: <20180802025039.15748-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH v4 0/3] udev-extraconf/mount.sh: add support to systemd
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
X-List-Received-Date: Thu, 02 Aug 2018 02:50:47 -0000
Content-Type: text/plain

v4:
    Fix the recursively dependency for the systemd-mount
v3:
    perfect syntax

Hongzhi.Song (3):
  udev-extraconf/mount.sh: add support to systemd
  udev-extraconf/mount.sh: Fix the recursively dependency for the
    systemd-mount
  udev-extraconf/mount.sh: Skip the entry in /etc/fstab when using the
    systemd-mount

 meta/recipes-core/udev/udev-extraconf/mount.sh | 84 ++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 13 deletions(-)

-- 
2.11.0


