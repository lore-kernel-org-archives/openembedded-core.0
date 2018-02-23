Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A969F78825
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 17:41:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1NHfQqn025169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 09:41:26 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 23 Feb 2018 09:41:04 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Feb 2018 12:41:22 -0500
Message-ID: <20180223174124.24238-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [master][rocko][PATCH 0/2] Could misc gcc test case fixes
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
X-List-Received-Date: Fri, 23 Feb 2018 17:41:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Could test case fixes that are needed in both master and rocko.

Mark Hatle (2):
  gcc: Fix test case issue when SSE is not enabled
  gcc: Fix internal compiler error for PPC test case
    "gcc.dg/vmx/7d-02.c"

 meta/recipes-devtools/gcc/gcc-7.3.inc              |   2 +
 ...1-Fix-internal-compiler-error-in-testcase.patch | 212 +++++++++++++++++
 .../gcc-7.3/no-sse-fix-test-case-failures.patch    | 259 +++++++++++++++++++++
 3 files changed, 473 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-testcase.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/no-sse-fix-test-case-failures.patch

-- 
1.8.3.1


