Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0324771BFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:41:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8M6fEdJ027790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 23:41:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Sep 2017 23:41:13 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Sep 2017 14:27:50 +0800
Message-ID: <cover.1506061623.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 0/1] lame: backport patch to fix CVE-2017-13712
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
X-List-Received-Date: Fri, 22 Sep 2017 06:41:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit eac8a5cf4212feaf8baf230e9ae991939732141d:

  oe-build-perf-report-email.py: add cc and bcc options (2017-09-21 23:16:55 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/lame
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lame

Kai Kang (1):
  lame: fix CVE-2017-13712

 .../lame/lame/CVE-2017-13712.patch                 | 309 +++++++++++++++++++++
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |   4 +-
 2 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch

-- 
2.14.1


