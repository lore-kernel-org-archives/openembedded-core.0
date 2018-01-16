Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2672578674
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 06:53:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0G6rbpS017908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 22:53:37 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 15 Jan 2018 22:53:36 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jan 2018 14:51:14 +0800
Message-ID: <cover.1516084922.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/1 v3] glibc: re-package for libnss-db
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
X-List-Received-Date: Tue, 16 Jan 2018 06:53:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v3 comments:
Change the dependency on make to RSUGGESTS.

--
The following changes since commit b9dcab772fd37ed8376a87d3194195e13ff52d10:

  qemu: CVE-2017-17381 (2018-01-14 09:11:58 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_nscd_v3_180116_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_nscd_v3_180116_0

Jackie Huang (1):
  glibc: re-package for libnss-db

 meta/recipes-core/glibc/glibc-package.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.11.0


