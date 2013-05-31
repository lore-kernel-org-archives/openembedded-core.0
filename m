Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1531608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:48:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4VFmGYI019910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2013 08:48:16 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 31 May 2013 08:48:15 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 May 2013 10:54:51 -0500
Message-ID: <1370015692-22428-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] gcc 4.7/gcc 4.8 fails when libunwind is built first
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
X-List-Received-Date: Fri, 31 May 2013 15:48:19 -0000
Content-Type: text/plain

Recently Marcin Juszkiewicz reported an issues w/ gcc 4.8 when libunwind
was built first.  This sounded familar when I encountered the same problem.

Back in February Roy Li found the same problem w/ gcc_4.7 and submitted a
fix for the issue.  I've updated this fix for both gcc 4.7 and gcc 4.8.

I tested this and it does resolve the issue for me.

Roy.Li (1):
  gcc: add build directory to include directories

 meta/recipes-devtools/gcc/gcc_4.7.bb | 2 +-
 meta/recipes-devtools/gcc/gcc_4.8.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.3.rc1.25.g423ecb0


