Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5D417EE3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:43:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6F1gxsT028429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 18:43:10 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 14 Jul 2019 18:42:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2019 09:55:31 +0800
Message-ID: <cover.1563155700.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libunwind: mark as incomatible with powerpc
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
X-List-Received-Date: Mon, 15 Jul 2019 01:43:19 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 80ab79168ede2786868cbd354f0950c949f73527:

  gnome-themes-standard: remove (2019-07-11 09:32:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/libunwind-ppc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/libunwind-ppc

Chen Qi (1):
  libunwind: mark as incomatible with powerpc

 meta/recipes-kernel/perf/perf.bb                  | 2 ++
 meta/recipes-support/libunwind/libunwind_1.3.1.bb | 3 +++
 2 files changed, 5 insertions(+)

-- 
1.9.1


