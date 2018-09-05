Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BEEB74C97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:30:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w85GUfG6021655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 09:30:42 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 09:30:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2018 12:30:39 -0400
Message-ID: <20180905163040.171177-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] Update prelink, merge existing fix
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
X-List-Received-Date: Wed, 05 Sep 2018 16:30:41 -0000
Content-Type: text/plain

Existing fix for the e_shstrndx usage has been merged into the upstream
prelink.

Additional, existing patches that have been pending (for too long) are
finally out of the staging and into the core set.

All of the incorporated items have been tested using the built-in test suite.

Some of the existing tests do fail, however the before and after test
results are consistent and all test case errors are believed to be a result
of unrelated binutils, gcc or glibc changes.


Mark Hatle (1):
  prelink: Update to the latest version of prelink

 ...01-src-dso.c-use-ehdr.e_shstrndx-as-index.patch | 39 ----------------------
 meta/recipes-devtools/prelink/prelink_git.bb       |  5 ++-
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch

-- 
2.16.0.rc2


