Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B08660125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 08:02:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7582evB022267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Aug 2015 01:02:40 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 5 Aug 2015 01:02:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Aug 2015 16:02:47 +0800
Message-ID: <cover.1438761716.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Package Upgrade -- 20150805
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
X-List-Received-Date: Wed, 05 Aug 2015 08:02:44 -0000
Content-Type: text/plain

The following changes since commit 288c76a41aebaf54c7fca3782160830df462b9e4:

  builder: Fix multilib compile failure (2015-08-03 07:15:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20150805
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20150805

Chen Qi (2):
  resolvconf: upgrade to 1.77
  cups: upgrade to 2.0.4

 .../resolvconf/{resolvconf_1.76.bb => resolvconf_1.77.bb}           | 6 +++---
 meta/recipes-extended/cups/{cups_2.0.3.bb => cups_2.0.4.bb}         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.76.bb => resolvconf_1.77.bb} (89%)
 rename meta/recipes-extended/cups/{cups_2.0.3.bb => cups_2.0.4.bb} (40%)

-- 
1.9.1


