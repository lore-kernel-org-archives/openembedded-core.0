Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5ED66A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:59:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r575x4xM029886
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 22:59:04 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 22:59:03 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 13:58:56 +0800
Message-ID: <cover.1370584480.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] cracklib: fix QA warning about unsafe references in binaries
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
X-List-Received-Date: Fri, 07 Jun 2013 05:59:03 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If enable test 'unsafe-references-in-binaries', build libpam will get
following warnings:
    
WARNING: QA Issue: libpam: /lib/security/pam_cracklib.so, installed in \
the base_prefix, requires a shared library under exec_prefix (/usr): \
libcrack.so.2 => /usr/lib/libcrack.so.2

The following changes since commit a62aed41f2d8f874f7ae24d0e5be5dbc66ea2199:

  lrzsz: check locale.h in configure (2013-06-04 15:55:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/cracklib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/cracklib

Wenzong Fan (1):
  cracklib: fix QA warning about unsafe references in binaries

 meta/recipes-extended/cracklib/cracklib_2.8.22.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4


