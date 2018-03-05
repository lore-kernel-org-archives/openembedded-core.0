Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	by mail.openembedded.org (Postfix) with ESMTP id 3936A78A5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=829; q=dns/txt; s=iport;
	t=1520286619; x=1521496219; h=from:to:subject:date:message-id;
	bh=EqyDNBjRIWL/eRIrK84DjkNT3WzebjDvWjDLnZ3k+RQ=;
	b=BxGm1BufbmHT/nEPO0i5gXudlqS5iasaiJcMTHsFl1Frhb+I0iFwOPjE
	C09lvlyoX1EdFEdNJ9zAo6pawyaXqA1P5/RiH1rXDXQyT/neQsvHKTAzN
	CIjD6MQsrCmEHUmPOb/ZAjWf2eBI+isWYnsY9jcsmOi3gInfeIMymaYMb c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CMAgCVup1a/5pdJa1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNQZnAom3GDGJZJChuICiE4FAECAQEBAQEBAmsnh2EBEoU?=
	=?us-ascii?q?bqzCEcoNxgiuFLYIukXgEjm6LdAmGVIorAoIzjEORKAIRGQGBLjUhgVJNIxW?=
	=?us-ascii?q?CfQmEYB83jG8BAQE?=
X-IronPort-AV: E=Sophos;i="5.47,428,1515456000"; d="scan'208";a="366871299"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 21:50:17 +0000
Received: from kamensky-w541.cisco.com ([10.154.177.165])
	(authenticated bits=0)
	by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w25LoB29007375
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 5 Mar 2018 21:50:17 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@intel.com>
Date: Mon,  5 Mar 2018 13:50:10 -0800
Message-Id: <1520286611-27418-1-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Authenticated-User: kamensky@cisco.com
Subject: [PATCH v2 1/2] systemtap: supports mips starting with version 3.1
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
X-List-Received-Date: Mon, 05 Mar 2018 21:50:17 -0000

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


