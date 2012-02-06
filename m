Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RuIeB-0005WA-8i
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 08:05:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q166vp6Q023852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Feb 2012 22:57:52 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 5 Feb 2012 22:57:51 -0800
Message-ID: <cover.1328509284.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 6 Feb 2012 14:21:24 +0800
Date: Mon, 6 Feb 2012 14:41:09 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] glib-2.0: Don't check function "qsort_r" in configure.ac
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 07:05:55 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The function "g_qsort_with_data" has two kinds of realization. One calls qsort_r
from libglib, the other realize itself. the realization method is controlled by macro "HAVE_QSORT_R".
qsort_r from libglib cause sort error. Add no-check-qsort_r.patch for fixing this problem.
This patch is to fix bug 1959. After this patch is merged into OE-core I will open a new bug to
track the reason why qsort_r report normally. For finishing lsb test in YOCTO 1.2 M3 this patch
is applied temporarily.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1959
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1959

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  glib-2.0: Don't check function qsort_r
  glib-2.0: Add patch "no-check-qsort_r.patch"

 .../glib-2.0/glib-2.0/no-check-qsort_r.patch       |   61 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    3 +-
 2 files changed, 63 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-check-qsort_r.patch



