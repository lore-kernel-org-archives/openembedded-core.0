Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9CD65E00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 08:56:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s398utgf017503
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Apr 2014 01:56:55 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 9 Apr 2014 01:56:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Apr 2014 16:56:43 +0800
Message-ID: <cover.1397025331.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] libpam: fix 64-bit pam plugins not installed when add to 32-bit image
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
X-List-Received-Date: Wed, 09 Apr 2014 08:56:58 -0000
Content-Type: text/plain

The following changes since commit 8f683bf782d065b81bb7cdb2074839790981d4b7:

  bitbake: bitbake: knotty: Clear footer before outputting to stderr (2014-04-08 18:05:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-libpam
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-libpam

Hongxu Jia (1):
  libpam: fix 64-bit pam plugins not installed when added to 32-bit
    image

 meta/recipes-extended/pam/libpam_1.1.6.bb | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

-- 
1.8.1.2


