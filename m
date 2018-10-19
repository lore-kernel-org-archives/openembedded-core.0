Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87297748EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 02:37:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9J2bEIh013417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 19:37:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 18 Oct 2018 19:37:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2018 10:43:13 +0800
Message-ID: <cover.1539853014.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] python: fix two CVEs
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
X-List-Received-Date: Fri, 19 Oct 2018 02:37:13 -0000
Content-Type: text/plain

The following changes since commit 7e8056d96ebe85d72bc4cb961e5766968db2ece2:

  systemtap: Fix typo in chown command (2018-10-17 13:41:12 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/python-cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/python-cve

Chen Qi (2):
  python: backport patch to fix CVE-2018-1000802
  python: backport patch to fix CVE-2018-14647

 ...23-Use-XML_SetHashSalt-in-_elementtree-GH.patch | 98 ++++++++++++++++++++++
 ...34540-Convert-shutil._call_external_zip-t.patch | 69 +++++++++++++++
 meta/recipes-devtools/python/python_2.7.15.bb      |  2 +
 3 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
 create mode 100644 meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch

-- 
1.9.1


