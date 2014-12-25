Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEBE7727C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 09:48:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBP9mbP2016956
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 01:48:37 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 25 Dec 2014 01:48:36 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Dec 2014 17:45:52 +0800
Message-ID: <cover.1419500687.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] check-layers.py: some checks for distro and bsp layer
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
X-List-Received-Date: Thu, 25 Dec 2014 09:48:40 -0000
Content-Type: text/plain

The following changes since commit e3a623bfe39fda16420d2042647af75877bb6f70:

  runqemu-internal: increase memory for qemuarm64 (2014-12-25 08:27:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/checklayer
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/checklayer

Chong Lu (1):
  check-layers.py: some checks for distro and bsp layer

 scripts/contrib/check-layers.py | 248 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 248 insertions(+)
 create mode 100755 scripts/contrib/check-layers.py

-- 
1.9.1


