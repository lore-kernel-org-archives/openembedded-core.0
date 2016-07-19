Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13E2A6080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:41:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6J7fkgh001868
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:41:46 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 00:41:45 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 15:39:19 +0800
Message-ID: <cover.1468913890.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Make quota compile pass when disable rpc
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
X-List-Received-Date: Tue, 19 Jul 2016 07:41:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 627d01997fcf6a0581d88047735769ffb2592b82:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:12:00 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/quota
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/quota

Kai Kang (1):
  quota: make compile pass when disable rpc

 .../0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch  |  83 +++++++++++
 ...ing-on-systems-that-do-not-have-rpc-heade.patch | 153 +++++++++++++++++++++
 ...-rpc.rquotad-when-disable-rpc-was-request.patch |  62 +++++++++
 ...0004-Fix-warnings-due-to-missing-stdlib.h.patch |  46 +++++++
 meta/recipes-extended/quota/quota/fcntl.patch      |  28 ----
 meta/recipes-extended/quota/quota_4.03.bb          |   8 +-
 6 files changed, 350 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-extended/quota/quota/0001-Use-NGROUPS_MAX-instead-of-NGROUPS.patch
 create mode 100644 meta/recipes-extended/quota/quota/0002-Allow-building-on-systems-that-do-not-have-rpc-heade.patch
 create mode 100644 meta/recipes-extended/quota/quota/0003-Don-t-build-rpc.rquotad-when-disable-rpc-was-request.patch
 create mode 100644 meta/recipes-extended/quota/quota/0004-Fix-warnings-due-to-missing-stdlib.h.patch

-- 
2.6.1


