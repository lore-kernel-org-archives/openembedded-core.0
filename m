Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF38360125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 06:40:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U6e0t5027257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jul 2015 23:40:00 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Wed, 29 Jul 2015 23:39:42 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 14:37:22 +0800
Message-ID: <cover.1438237957.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Fix dead lock issue when use smart with pygtk
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
X-List-Received-Date: Thu, 30 Jul 2015 06:40:03 -0000
Content-Type: text/plain

Hi Ross,

I sent this patch before, but no comment and has not been merged yet.
So I re-send it for review.

Thanks.

The following changes since commit 2a1573841e2b5dbfce93aaaf27ad7177c71f45ab:

  sshcontrol: Use os.environ.copy() instead of copy.copy() (2015-07-29 22:54:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/smartpm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/smartpm

Kai Kang (1):
  smartpm: set noprogress for pycurl

 .../smart-set-noprogress-for-pycurl.patch            | 20 ++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb   |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-set-noprogress-for-pycurl.patch

-- 
1.9.1


