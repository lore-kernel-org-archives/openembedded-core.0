Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB476F898
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 07:52:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s337qPAx029974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Apr 2014 00:52:25 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 3 Apr 2014 00:52:24 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Apr 2014 15:52:21 +0800
Message-ID: <cover.1396511450.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] python: fix build error with Readline 6.3
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
X-List-Received-Date: Thu, 03 Apr 2014 07:52:25 -0000
Content-Type: text/plain

The following changes since commit a5775abb1951ec6cdc7afacd1ae87189e398cff8:

  bitbake: user-manual-metadata.xml: Added new section on mapping functions. (2014-04-02 14:15:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/python

Chong Lu (1):
  python: fix build error with Readline 6.3

 .../recipes-devtools/python/python-native_2.7.3.bb |  1 +
 .../python-fix-build-error-with-Readline-6.3.patch | 62 ++++++++++++++++++++++
 .../python/python3-native_3.3.3.bb                 |  1 +
 ...python3-fix-build-error-with-Readline-6.3.patch | 62 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb      |  1 +
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 6 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
 create mode 100644 meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch

-- 
1.8.1.2


