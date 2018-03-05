Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Mar 2018 17:00:10 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 593AF78A4C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=829; q=dns/txt; s=iport;
	t=1520269213; x=1521478813; h=from:to:subject:date:message-id;
	bh=EqyDNBjRIWL/eRIrK84DjkNT3WzebjDvWjDLnZ3k+RQ=;
	b=EurZILiAgehKGCUVkVxyMf9XXlksw5ZxT36SEEFHm8MCWD9RUa5ofZts
	RxRyjig58Hh+3sknaDoMB6r+v6UBrVblixs/+GY1PByw+UsJ4ZRuv824/
	bY/f/BbwTtTgEvgjCJ6PYqQdVNBLz4myvB5kkUKxR2DmoD+3trwujQs1K s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CMAgBedJ1a/4oNJK1cGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZnAom3GDGJZJChuICiE4FAECAQEBAQEBAmsnh3SFG6sdhHK?=
	=?us-ascii?q?DcYIrhS2CLoxXhSEEjm6LdAmGVIorAoIzjEORKAIRGQGBLjUhgVJNIxWCfQmEY?=
	=?us-ascii?q?B83jG8BAQE?=
X-IronPort-AV: E=Sophos;i="5.47,427,1515456000"; d="scan'208";a="363850438"
Received: from alln-core-5.cisco.com ([173.36.13.138])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 16:50:45 +0000
Received: from kamensky-w541.cisco.com ([10.24.116.159]) (authenticated bits=0)
	by alln-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id w25GoZKY000357
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Mar 2018 16:50:45 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 08:50:34 -0800
Message-Id: <1520268635-5466-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: kamensky@cisco.com
Subject: [PATCH 1/2] systemtap: supports mips starting with version 3.1
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
X-List-Received-Date: Mon, 05 Mar 2018 17:00:11 -0000

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c938760..d122359 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -15,8 +15,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            "
 
-# systemtap doesn't support mips
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


