Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94BAE65CA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 01:59:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9V1xoiO013602
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 18:59:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 18:59:49 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Oct 2014 09:56:31 +0800
Message-ID: <cover.1414720498.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Fri, 31 Oct 2014 01:59:55 -0000
Content-Type: text/plain

Change since v1:
add python to PACKAGECONFIG.

The following changes since commit 4faca22b8fe63a86d820990207aaf84b3fa83e01:

  ref-manual: Updates to the migrating to YP 1.7 section. (2014-10-28 22:31:18 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/libxml2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libxml2

Robert Yang (1):
  libxml2: fix python path and add libxml2-python

 meta/recipes-core/libxml/libxml2.inc | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
1.9.1


