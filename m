Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8D137207C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 07:54:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA67sMGh011419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 23:54:23 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 5 Nov 2014 23:54:22 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Nov 2014 15:50:37 +0800
Message-ID: <cover.1415260194.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nss: CVE-2014-1568
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
X-List-Received-Date: Thu, 06 Nov 2014 07:54:30 -0000
Content-Type: text/plain

The following changes since commit 0add8abc12b850e38a6ec7dcf2856fab2c0107b6:

  buildtools-tarball: package all of Python (2014-11-05 23:30:49 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/nss

Chong Lu (1):
  nss: CVE-2014-1568

 .../nss/files/nss-CVE-2014-1568.patch              | 670 +++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |   1 +
 2 files changed, 671 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1568.patch

-- 
1.9.1


