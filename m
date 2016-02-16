Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7D82606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 09:14:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1G9EwAR009301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Feb 2016 01:14:58 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Feb 2016 01:14:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Feb 2016 04:14:53 -0500
Message-ID: <cover.1455612645.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V4 0/2] use target path to replace build ones in debugging info
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
X-List-Received-Date: Tue, 16 Feb 2016 09:15:02 -0000
Content-Type: text/plain

Changed in V4:
*) Discuss with upstream maintainer, backport from GCC 6 to ignore
   '-fdebug-prefix-map' in producer string rather than add a new
   option. (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69821)
*) Also backport to gcc 4.9

Changed in V3:
*) Move entry from base.bbclass to bitbake.conf

//Hongxu

The following changes since commit da13f0bce5d1b3c52f5716ae8d104372a820e5f9:

  buildhistory.bbclass: remove out-dated information on request (2016-02-15 17:47:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (2):
  gcc-4.9/5.3: Ignore -fdebug-prefix-map in producer string
  bitbake.conf: use target path as compile dir in debugging info

 meta/conf/bitbake.conf                             |  8 +++++-
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...ug-prefix-map-in-producer-string-by-Danie.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 ...ug-prefix-map-in-producer-string-by-Danie.patch | 31 ++++++++++++++++++++++
 5 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch

-- 
1.9.1


