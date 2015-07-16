Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 29EF06013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 02:39:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G2dFWS004289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 19:39:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Wed, 15 Jul 2015 19:39:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 10:37:38 +0800
Message-ID: <cover.1437014008.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Fix fontconfig buildpaths QA check issue
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
X-List-Received-Date: Thu, 16 Jul 2015 02:39:18 -0000
Content-Type: text/plain

There is another buildpaths issue about
fontconfig/usr/lib64/libfontconfig.so.1.9.0. It should be fixed by patch of
insane.bbclass from Robert.

The following changes since commit a15b26de4b407726d3ba9bd1e888b2f1d2c586f5:

  dbus-ptest: set INSANE_SKIP for build-deps (2015-07-13 13:48:52 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/fontconfig
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/fontconfig

Kai Kang (1):
  fontconfig: fix buildpaths QA check

 meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1


