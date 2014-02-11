Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 917BC6E7F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 01:18:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1B1IgY8005949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 17:18:42 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 17:18:42 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2014 09:18:39 +0800
Message-ID: <cover.1392081479.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] diffstat: enable ptest support
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
X-List-Received-Date: Tue, 11 Feb 2014 01:18:42 -0000
Content-Type: text/plain

The following changes since commit 095bb006c3dbbfbdfa05f13d8d7b50e2a5ab2af0:

  bitbake: bitbake: build.py: create separate function for shell trap creation code (2014-02-09 10:01:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/diffstat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/diffstat

Chong Lu (1):
  diffstat: enable ptest support

 meta/recipes-devtools/diffstat/diffstat/run-ptest |  5 +++++
 meta/recipes-devtools/diffstat/diffstat_1.58.bb   | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/run-ptest

-- 
1.8.1.2


