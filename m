Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 470996C1A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 01:56:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAF1u3v0010406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 17:56:13 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 17:55:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 10:02:28 +0800
Message-ID: <6104873a7d4aaa8b9ce75857dfdd6fd6875318ff.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542247292.git.Qi.Chen@windriver.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] busybox: skip known bugs in ptest
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
X-List-Received-Date: Thu, 15 Nov 2018 01:56:23 -0000
Content-Type: text/plain

Set SKIP_KNOWN_BUGS in run-ptest script to skip ptest cases which
are known to relate to some known bugs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/files/run-ptest | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/files/run-ptest b/meta/recipes-core/busybox/files/run-ptest
index 3608a8e..8b99bed 100644
--- a/meta/recipes-core/busybox/files/run-ptest
+++ b/meta/recipes-core/busybox/files/run-ptest
@@ -2,6 +2,7 @@
 
 current_dir=$(readlink -f $0)
 export bindir=$(dirname $current_dir)
+export SKIP_KNOWN_BUGS=1
 
 cd testsuite || exit 1
 ./runtest -v | sed -r 's/^(SKIPPED|UNTESTED):/SKIP:/'
-- 
1.9.1


