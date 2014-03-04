Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1256E7E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 01:50:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s241p06K026560
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 17:51:00 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 17:50:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Mar 2014 09:51:32 +0800
Message-ID: <cover.1393897799.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/1] python-numpy: fix build for qemumips and qemuppc
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
X-List-Received-Date: Tue, 04 Mar 2014 01:51:00 -0000
Content-Type: text/plain

The following changes since commit 5a4b5c6b8ebd5f8d29888aafcd9608e03717bcd5:

  runqemu: Use readlink instead of realpath (2014-02-25 21:29:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/python-numpy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/python-numpy

Chen Qi (1):
  python-numpy: fix build for qemumips and qemuppc

 .../python/python-numpy/mips/_numpyconfig.h        |   30 +++++
 .../python/python-numpy/mips/config.h              |  139 ++++++++++++++++++++
 .../python/python-numpy/powerpc/_numpyconfig.h     |   30 +++++
 .../python/python-numpy/powerpc/config.h           |  139 ++++++++++++++++++++
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |    8 ++
 5 files changed, 346 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-numpy/mips/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mips/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/powerpc/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/powerpc/config.h

-- 
1.7.9.5


