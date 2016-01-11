Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 68749731AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:58:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B5wZ8A026227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:58:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:58:35 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:58:37 +0800
Message-ID: <cover.1452491844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Package Upgrades
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
X-List-Received-Date: Mon, 11 Jan 2016 05:58:37 -0000
Content-Type: text/plain

The following changes since commit 5661d8cb7849df62358368743134c0aaf523965e:

  image: Really remove lockfiles flag (2016-01-07 13:41:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20160111
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20160111

Chen Qi (7):
  pciutils: upgrade to 3.4.1
  resolvconf: upgrade to 1.78
  kmod: upgrade to 22
  at: upgrade to 3.18
  sysstat: upgrade to 11.2.0
  curl: upgrade to 7.46
  xz: upgrade to 5.2.2

 .../{pciutils_3.3.1.bb => pciutils_3.4.1.bb}        |  4 ++--
 .../{resolvconf_1.77.bb => resolvconf_1.78.bb}      |  6 +++---
 .../at/at/fix_parallel_build_error.patch            | 21 ++++++++++++++-------
 .../at/{at_3.1.16.bb => at_3.1.18.bb}               |  6 +++---
 .../{sysstat_11.1.5.bb => sysstat_11.2.0.bb}        |  5 ++---
 .../xz/{xz_5.2.1.bb => xz_5.2.2.bb}                 |  4 ++--
 meta/recipes-kernel/kmod/kmod.inc                   |  4 ++--
 .../curl/{curl_7.45.0.bb => curl_7.46.0.bb}         |  6 ++++--
 8 files changed, 32 insertions(+), 24 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.3.1.bb => pciutils_3.4.1.bb} (92%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.77.bb => resolvconf_1.78.bb} (90%)
 rename meta/recipes-extended/at/{at_3.1.16.bb => at_3.1.18.bb} (91%)
 rename meta/recipes-extended/sysstat/{sysstat_11.1.5.bb => sysstat_11.2.0.bb} (53%)
 rename meta/recipes-extended/xz/{xz_5.2.1.bb => xz_5.2.2.bb} (90%)
 rename meta/recipes-support/curl/{curl_7.45.0.bb => curl_7.46.0.bb} (92%)

-- 
1.9.1


