Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1T4liE-0001gM-Ii
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 06:41:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7O4TUuA024888
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Aug 2012 21:29:30 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 23 Aug 2012 21:29:29 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 12:28:21 +0800
Message-ID: <cover.1345782105.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <5033ABD8.5070203@linux.intel.com>
References: <5033ABD8.5070203@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH v2 0/1] libxpm: inherit gettext
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 04:41:39 -0000
Content-Type: text/plain

Hi Saul,

Thanks for the advice. I've changed it to use "inherit gettext" instead.

The following changes since commit 054d95edad8d79ef1c6b30681395d50f3c6335b4:

  poky.conf: restore Ubuntu 12.04 LTS to tested distro list (2012-08-23 17:23:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib szhang/xpm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/xpm

Jesse Zhang (1):
  libxpm: inherit gettext

 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.11.4



