Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95F5660116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:00:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O703kS010055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 23:00:04 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 23:00:02 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 22:59:59 -0800
Message-ID: <cover.1548313066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: Add --cache-file for 3 core recipes
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
X-List-Received-Date: Thu, 24 Jan 2019 07:00:03 -0000
Content-Type: text/plain

The following changes since commit a4edfa4cf451bf412525887b5b24b9db6486ae97:

  remove unused distutils-tools.bbclass (2019-01-23 07:57:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/cf
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/cf

Robert Yang (3):
  gettext: Add --cache-file to EXTRA_OECONF
  ncurses: Add --cache-file to EXTRA_OECONF
  gcc-runtime: Add --cache-file to EXTRA_OECONF

 meta/recipes-core/gettext/gettext_0.19.8.1.bb     | 1 +
 meta/recipes-core/ncurses/ncurses_6.1+20181013.bb | 2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc         | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.10.2


