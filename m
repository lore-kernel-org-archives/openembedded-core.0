Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0DB56A5AC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 15:17:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r56FHcPw019764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 08:17:38 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 6 Jun 2013 08:17:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 10:25:06 -0500
Message-ID: <1370532307-14473-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH RFC] Add multilib values to displayed build configuration
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
X-List-Received-Date: Thu, 06 Jun 2013 15:17:36 -0000
Content-Type: text/plain

While attempting to help some users diagnose problems with multilib 
configurations, I was tired of asking for copies of local.conf files and
dumps of the bitbake -e so I could understand how they had their multilib
environment setup.  This is an attempt to add additional diagnostics to
the build configuration placed at the top of the logs.

I'm sending this as an RFC because it was a first quick and dirty attempt
at changing things.  There may be a better way to do this.

Mark Hatle (1):
  base.bbclass: Add buildcfg multilib values

 meta/classes/base.bbclass | 16 +++++++++++++++-
 meta/conf/bitbake.conf    |  2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
1.8.3.rc1.25.g423ecb0


