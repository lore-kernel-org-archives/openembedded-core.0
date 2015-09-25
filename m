Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26F33766E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 04:37:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8P4bFlc017234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:37:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 21:37:14 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Sep 2015 12:30:38 +0800
Message-ID: <cover.1443155360.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix ltp build failure with gcc 5
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
X-List-Received-Date: Fri, 25 Sep 2015 04:37:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Found and test with  configure:

SELECTED_OPTIMIZATION="-O0  -fno-omit-frame-pointer -g -pipe"

The following changes since commit 5a51fb28dbdfcae8ceb503a5290532dd38aeb09f:

  bitbake: prserv/serv: Start/Stop daemon using ip instead of host (2015-09-24 17:55:05 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/ltp
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/ltp

Kai Kang (1):
  ltp: replace 'inline' with 'static inline' for gcc 5.x

 ...ace-inline-with-static-inline-for-gcc-5.x.patch | 69 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20150420.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch

-- 
2.6.0.rc2.10.gf4d9753


