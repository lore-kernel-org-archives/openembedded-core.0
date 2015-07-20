Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10EF065CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 08:00:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6K80pQC018927
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jul 2015 01:00:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 20 Jul 2015 01:00:51 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 20 Jul 2015 15:59:03 +0800
Message-ID: <cover.1437379057.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V2: Fix can not stop systemd service var-volatile-lib
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
X-List-Received-Date: Mon, 20 Jul 2015 08:00:53 -0000
Content-Type: text/plain

V2:
* modify volatile-binds.service.in directly

The following changes since commit a15b26de4b407726d3ba9bd1e888b2f1d2c586f5:

  dbus-ptest: set INSANE_SKIP for build-deps (2015-07-13 13:48:52 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/volatile-bind
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/volatile-bind

Kai Kang (1):
  volatile-binds: correct path of command umount

 meta/recipes-core/volatile-binds/files/volatile-binds.service.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


