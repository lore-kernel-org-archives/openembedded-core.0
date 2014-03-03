Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3E56F584
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 08:27:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s238RhNx010318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 00:27:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 00:27:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 16:27:29 +0800
Message-ID: <cover.1393835059.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/3] ppp: upgrade to 2.4.6
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
X-List-Received-Date: Mon, 03 Mar 2014 08:27:48 -0000
Content-Type: text/plain

The following changes since commit 54c2e993ec129563c7ae9f3fdee74ab60da28698:

  bsps: update H/W reference boards to v3.10.32 (2014-03-02 17:25:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/ppp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/ppp

Hongxu Jia (3):
  ppp: upgrade to 2.4.6
  ppp: drop enable-ipv6.patch
  ppp: drop if_pppol2tp.h patches

 ...1-ppp-Add-two-structures-in-if_pppol2tp.h.patch | 60 ----------------------
 .../ppp/ppp-2.4.5/enable-ipv6.patch                | 15 ------
 .../ppp/ppp-2.4.5/update_if_pppol2tp.patch         | 54 -------------------
 ...01-ppp-Fix-compilation-errors-in-Makefile.patch |  0
 .../ppp/{ppp-2.4.5 => ppp}/08setupdns              |  0
 .../ppp/{ppp-2.4.5 => ppp}/92removedns             |  0
 .../ppp/{ppp-2.4.5 => ppp}/cifdefroute.patch       |  0
 .../ppp/{ppp-2.4.5 => ppp}/copts.patch             |  0
 .../ppp/{ppp-2.4.5 => ppp}/init                    |  0
 .../ppp/{ppp-2.4.5 => ppp}/ip-down                 |  0
 .../ppp/{ppp-2.4.5 => ppp}/ip-up                   |  0
 .../makefile-remove-hard-usr-reference.patch       |  0
 .../ppp/{ppp-2.4.5 => ppp}/makefile.patch          |  0
 .../ppp/{ppp-2.4.5 => ppp}/pap                     |  0
 .../ppp/{ppp-2.4.5 => ppp}/poff                    |  0
 .../ppp/{ppp-2.4.5 => ppp}/pon                     |  0
 .../ppp/{ppp-2.4.5 => ppp}/ppp_on_boot             |  0
 .../{ppp-2.4.5 => ppp}/pppd-resolv-varrun.patch    |  0
 .../ppp/{ppp-2.4.5 => ppp}/provider                |  0
 .../ppp/{ppp_2.4.5.bb => ppp_2.4.6.bb}             |  8 +--
 20 files changed, 2 insertions(+), 135 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/0001-ppp-Fix-compilation-errors-in-Makefile.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/08setupdns (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/92removedns (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/cifdefroute.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/copts.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/init (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ip-down (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ip-up (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/makefile-remove-hard-usr-reference.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/makefile.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pap (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/poff (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pon (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ppp_on_boot (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pppd-resolv-varrun.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/provider (100%)
 rename meta/recipes-connectivity/ppp/{ppp_2.4.5.bb => ppp_2.4.6.bb} (93%)

-- 
1.8.1.2


