Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 833066072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 09:57:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBT9v3OT020513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 29 Dec 2015 01:57:04 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 29 Dec 2015 01:57:02 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 29 Dec 2015 17:43:40 +0800
Message-ID: <cover.1451382094.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Add dependency back for glib-2.0
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
X-List-Received-Date: Tue, 29 Dec 2015 09:57:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

If no command glib-genmarshal on host, build glib-2.0 will fail.

The following changes since commit 2cd061a29a94fdcdfec86732e6bcbb71c12c4afc:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/glib-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/glib-2

Kai Kang (1):
  Revert "glib-2.0: build dependency cleanup"

 meta/recipes-core/glib-2.0/glib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.6.1


