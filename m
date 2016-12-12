Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA13870022
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 06:02:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBC62s8i020189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 22:02:54 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 11 Dec 2016 22:02:53 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2016 13:59:45 +0800
Message-ID: <cover.1481522082.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 0/2] ltp/posix: backport two patches to fix some tests
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
X-List-Received-Date: Mon, 12 Dec 2016 06:02:54 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit dae00fbb913c24b6bab00d5b99bd61f3455b4728:

  sdk-manual: Added note about nullpointer error for launch eclipse (2016-12-08 16:36:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_ltp_161212-0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_ltp_161212-0

Jackie Huang (2):
  ltp: avoid segmentation fault in netns tests
  ltp/posix: replace CWD with PWD

 ...twork-nfsv4-acl-acl1.c-Security-fix-on-s.patch} |  0
 ...rs-netns_netlink-Avoid-segmentation-fault.patch | 50 ++++++++++++++++++++++
 ...ix-option-group-test-replace-CWD-qith-PWD.patch | 44 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  4 +-
 4 files changed, 97 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/ltp/ltp/{0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch => 0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch} (100%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-containers-netns_netlink-Avoid-segmentation-fault.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch

-- 
2.8.3


