Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84A3770907
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 11:08:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7FB8Arl026924
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 04:08:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 04:08:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 04:08:09 -0700
Message-ID: <cover.1408100754.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1 V3] insane.bbclass: add QA check: file-rdeps
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
X-List-Received-Date: Fri, 15 Aug 2014 11:08:10 -0000
Content-Type: text/plain

* V3: 
  - Check all the rdeps on the chain (A -> B -> C ...) as RP suggested.
  - Skip checking '/bin/bash' and '/usr/bin/perl' for nativesdk.
  - More commit messages:
    + Benefits:
      -> Help to fix file rdepends issues for ipk and deb 
      -> Help to fix abnormal rdepends.
      -> Help to check whether the rdepends is OK or not after build each
         recipe (don't have to install to the image), for example, a recipe may 
         generate 10 binary packages, only a part of them will be installed to
         the image by default, we can know whether the rdepends are OK or
         not for the ones which are installed, but can't know the ones which
         are not installed, this patch can help check all the 10 binary
         packages' rdepends.

* V2: 
  Refer build-deps to check all the files' rdepends rather than only
  check bash, perl and python as RP suggested.

* V1: 
  Initial version

// Robert

The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/file-rdeps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/file-rdeps

Robert Yang (1):
  insane.bbclass: add QA check: file-rdeps

 meta/classes/insane.bbclass |   72 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

-- 
1.7.9.5


