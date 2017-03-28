Return-Path: <spopovyc@cisco.com>
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAAA71C0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=709; q=dns/txt; s=iport;
	t=1490729532; x=1491939132;
	h=from:to:cc:subject:date:message-id:in-reply-to;
	bh=4xaLvEhnq7Nz1s8k6hAN+jJ2Rxo0+J7duTSqeVxEN3g=;
	b=ReHAH/IQhZbQhudaHKlQkot0HvRrgkQalSaKqNcYNgSxvszhJUcSdrdQ
	OLnmlhmzW8/JNKbCodDfFpvaVKXT9LtrN5jCnV27QfCR7sBl1bKgPKxkG
	nfIAHkqb2zRN+7s3uQU5jAvyzNm0CvGJyCRH2hhKI1heJpT+8mBvPk0IO o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DyAADDudpY/5FdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1SBbI1xpQ6CD4IOhiICgyU/GAECAQEBAQEBAWsohRx5gTgZiXo?=
	=?us-ascii?q?Nr3yKTgEBAQEGAiYThjuKD4UZBZYQhlCST4F8hSqIU4E6k2ofOD5GOh8VhxlAN?=
	=?us-ascii?q?YlSAQEB?=
X-IronPort-AV: E=Sophos;i="5.36,238,1486425600"; d="scan'208";a="224091985"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
	by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 19:32:11 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by rcdn-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id v2SJWANN011716
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 28 Mar 2017 19:32:11 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 19:31:58 +0000
Message-Id: <cover.1490729401.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20170328190227.6647.76065@do.openembedded.org>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH v2 0/2] distutils: correct path to python for nativesdk
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
X-List-Received-Date: Tue, 28 Mar 2017 19:32:10 -0000

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


