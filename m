Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F82065CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 21:42:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9NLgCuj002138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 14:42:13 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 23 Oct 2014 14:42:11 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Oct 2014 16:42:09 -0500
Message-ID: <cover.1414082526.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] multilib.conf: conditionalize MULTILIB_GLOBAL_VARIANTS
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
X-List-Received-Date: Thu, 23 Oct 2014 21:42:20 -0000
Content-Type: text/plain

The actual use case may have been a little unusual, but I ended
up with a machine's .conf file specifying arch-specific
MULTILIB_GLOBAL_VARIANTS, and having it not work. On study, I found
that multilib.conf was getting read after that.

And I think this ought to work more like DEFAULTTUNE, where the idiom
is:
	DEFAULTTUNE = "something"
	require some/tune.inc

and similarly, I think it would make sense to allow:
	MULTILIB_GLOBAL_VARIANTS = "list of variants"
	require multilib.conf

The following changes since commit 97756472d3a69eaca95d105494ffea78c6b077e0:

  build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:27 +0200)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/multilib_global_variants
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/multilib_global_variants

Peter Seebach (1):
  multilib.conf: set MULTILIB_GLOBAL_VARIANTS conditionally

 meta/conf/multilib.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


