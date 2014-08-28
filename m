Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1B4B710C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 05:40:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7S5e7Nb005131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 22:40:07 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 22:40:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 22:40:04 -0700
Message-ID: <cover.1409204283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] perl-native: fixed bad interpreter error
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
X-List-Received-Date: Thu, 28 Aug 2014 05:40:10 -0000
Content-Type: text/plain

The following changes since commit d0be4b37743492fc9c178fd6f9ef73a5eb2fd9c3:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/perl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/perl

Robert Yang (2):
  perl-native: fixed bad interpreter error
  cpan.bbclass: matches more lines

 meta/classes/cpan.bbclass                        |    4 ++--
 meta/recipes-devtools/perl/perl-native_5.20.0.bb |    5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.9.5


