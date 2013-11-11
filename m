Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8E53610DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 10:10:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rABAAZeO019963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 02:10:35 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 02:10:35 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2013 05:10:33 -0500
Message-ID: <cover.1384164392.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] udev: remove libudev-dbg and libgudev-dbg
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
X-List-Received-Date: Mon, 11 Nov 2013 10:10:34 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

We don't support multiple -dbg packages, so just remove the libudev-dbg,
libgudev-dbg and put all debug stuffs to 'udev-dbg'.

The following changes since commit 4fdc3d77d4a875b7236536bf78849a4d1f6a7449:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:36 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/udev-remove-dbg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/udev-remove-dbg

Wenzong Fan (1):
  udev: remove libudev-dbg and libgudev-dbg

 meta/recipes-core/udev/udev.inc |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
1.7.9.5


