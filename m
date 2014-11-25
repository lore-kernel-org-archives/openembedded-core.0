Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D423D721BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 05:58:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAP5wktD013175
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 24 Nov 2014 21:58:46 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 24 Nov 2014 21:58:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <saul.wold@intel.com>,
	<liezhi.yang@windriver.com>
Date: Tue, 25 Nov 2014 13:58:42 +0800
Message-ID: <cover.1416894918.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [dora][PATCH 0/1] systemtap: fix do_compile failed on fedora21
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
X-List-Received-Date: Tue, 25 Nov 2014 05:58:48 -0000
Content-Type: text/plain

The following changes since commit 12dd4279c59c9c8dd08e42ebfaa1e6b611341aa1:

  ltp: Added zip-native as a DEPENDS (2014-11-21 16:49:41 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-systemtap
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-systemtap

Hongxu Jia (1):
  systemtap: fix do_compile failed on fedora21

 ...pt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch | 27 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch

-- 
1.9.1


