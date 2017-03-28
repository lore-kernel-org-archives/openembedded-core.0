Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8736172F5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=709; q=dns/txt; s=iport;
	t=1490727108; x=1491936708;
	h=from:to:cc:subject:date:message-id;
	bh=4xaLvEhnq7Nz1s8k6hAN+jJ2Rxo0+J7duTSqeVxEN3g=;
	b=PYSqiKHDmGafjZVwY2NFOC44p2c0X1gLK1VH+tjCrYIjC6d0lNipSNn5
	v56s64BpbK+/pSIUz/O2+YHUUXFh9CRwhTMdzh9V3dYG3LHZ5Tr/9FCzQ
	nGjAdydBF64jknWMfRGhLDGxr7wybOnwmCgOxuqRMf3g6YN7b2IgLulwS 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DxAAA2sNpY/40NJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1SBbI1xpQ2CD4IOhiKDJT8YAQIBAQEBAQEBayiGFYFRiXoNr2m?=
	=?us-ascii?q?KTAEBCCgThjuKD4UZBZYQhlCST4F8hSqIU4E6k2ofOD5GOh8VhxlANYlSAQEB?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="404288276"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 18:51:46 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id v2SIpk7A010524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 18:51:46 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 18:51:40 +0000
Message-Id: <cover.1490726618.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH 0/2] distutils: correct path to python for nativesdk
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
X-List-Received-Date: Tue, 28 Mar 2017 18:51:48 -0000

Hi,

Here is another small set of similar changes.

While for target path to python interpreter is fixed
a while ago, for nativesdk it points to env(1) utility
with absolute path in SDK where it might not be present.

Also this absolute path might be too long.

Use ${USRBINPATH} instead of ${bindir} to correctly
configure path to env(1).

Please review.

Thanks.

Cc: XE-Linux <xe-linux-external@cisco.com>
Serhii Popovych (2):
  distutils.bbclass: Fix path to python for scripts
  distutils3.bbclass: Fix path to python for scripts

 meta/classes/distutils.bbclass  | 4 ++--
 meta/classes/distutils3.bbclass | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4


