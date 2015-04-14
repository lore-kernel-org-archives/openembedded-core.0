Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA1B73D1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:04:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E94jYW009971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:04:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:04:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:04:40 -0700
Message-ID: <cover.1429002178.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: remove extra dev and dbg from PACKAGES
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
X-List-Received-Date: Tue, 14 Apr 2015 09:04:46 -0000
Content-Type: text/plain

Hello,

I had sent xz and curl in the previous thread, but not got merged, any
comments on them, please ?

// Robert

The following changes since commit 8d207e55031c0b93387e728f4312b8cb34ad5b12:

  libgpg-error 1.18: simplify tupple handling and add armv8b support (2015-04-13 22:32:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/dev
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/dev

Robert Yang (4):
  xz: remove liblzma-dev and liblzma-dbg from PACKAGES
  curl: remove extra dev and staticdev from PACKAGES
  libgcc: remove libgcov-dev from PACKAGES
  gcc-target: remove gcc-plugin-dev from PACKAGES

 .../packagegroup-core-standalone-sdk-target.bb     |    1 -
 meta/recipes-devtools/gcc/gcc-target.inc           |    3 ---
 meta/recipes-devtools/gcc/libgcc.inc               |    5 +----
 meta/recipes-extended/xz/xz_5.2.1.bb               |    8 +-------
 meta/recipes-support/curl/curl_7.41.0.bb           |   11 +----------
 5 files changed, 3 insertions(+), 25 deletions(-)

-- 
1.7.9.5


