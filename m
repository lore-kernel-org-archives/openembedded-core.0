Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 986476A8EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:30:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q2UqeK005495
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 19:30:52 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 19:30:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 10:30:47 +0800
Message-ID: <cover.1372212772.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/2]libx11: fix LSB Library Check libX11.so.6 fail
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
X-List-Received-Date: Wed, 26 Jun 2013 02:30:50 -0000
Content-Type: text/plain

The following changes since commit edcbb79583e1577cb64d368e3902915dea50a96e:

  ref-manual: Added note about issues on supported distros (2013-06-21 14:26:31 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-adt

Hongxu Jia (2):
  libx11: move xcms enabling to PACKAGECONFIG for LSB Library Check
  lsbtest: sync test suite packages version

 meta/recipes-extended/lsb/lsbtest/packages_list | 38 ++++++++++++-------------
 meta/recipes-graphics/xorg-lib/libx11.inc       |  5 ++--
 2 files changed, 21 insertions(+), 22 deletions(-)

-- 
1.8.1.2


