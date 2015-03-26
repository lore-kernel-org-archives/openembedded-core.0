Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 326196013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 09:18:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2Q9IAAh016934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 02:18:10 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Mar 2015 02:18:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Mar 2015 02:18:08 -0700
Message-ID: <cover.1427361444.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] cpio: fix CVE-2015-1197
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
X-List-Received-Date: Thu, 26 Mar 2015 09:18:12 -0000
Content-Type: text/plain

The following changes since commit 2d923d6dfe9431dbc005f8ba39838eb4519c471c:

  python-pygobject: Disable parallel make install in native case (2015-03-25 12:38:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/cpio
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/cpio

Robert Yang (1):
  cpio: fix CVE-2015-1197

 .../cpio/cpio-2.11/cpio-CVE-2015-1197.patch        |  154 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |    3 +-
 2 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch

-- 
1.7.9.5


