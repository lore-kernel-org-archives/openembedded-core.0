Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 826DF7FC9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA1IbPVD023045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2019 11:37:25 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 1 Nov 2019 11:37:24 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Nov 2019 14:37:23 -0400
Message-ID: <20191101183724.32131-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [RFC 0/1] ptest additions for coreutils
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
X-List-Received-Date: Fri, 01 Nov 2019 18:37:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

coreutils has a large number of tests, and potential RDEPENDS 
to be added to support them, along with the flags 
RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that will add 
time and coverage. The RUN_VERY_EXPENSIVE_TESTS=yes flag has 
been omitted from the run-ptest script to reduce run time and 
issues with timeouts on qemuarm64, even though this increases 
an already high SKIP count in the results. Similarly, adding 
valgrind to RDEPENDS will allow additional tests to pass, but 
this hasn't been included. 
Of the tests marked SKIP, there are 30 tests that are currently 
counted as SKIP because they require sudo permissions, and 
another 21 that require membership in multiple groups. 
Additionally, there is an issue with the "make check-TESTS" 
call finishing clearly during the ptest. 
Despite these issues, upstream input was desired before doing 
further development on the ptest additions. 

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

Trevor Gamblin (1):
  coreutils: add ptest

 .../coreutils/coreutils/run-ptest             | 22 +++++++++++
 meta/recipes-core/coreutils/coreutils_8.31.bb | 39 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest

-- 
2.21.0


