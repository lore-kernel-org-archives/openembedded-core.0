Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1BEE7BDCF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 02:01:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0421eQS012049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jan 2019 18:01:50 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 3 Jan 2019 18:01:30 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jan 2019 10:09:35 +0800
Message-ID: <167a90a9cfa32286cac0d949da9a9d703c450706.1546567647.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1546567647.git.Qi.Chen@windriver.com>
References: <cover.1546567647.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildoptions.py: use different STAMPS_DIR and SSTATE_DIR
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
X-List-Received-Date: Fri, 04 Jan 2019 02:02:01 -0000
Content-Type: text/plain

Use a different STAMPS_DIR and SSTATE_DIR in test_yocto_source_mirror.
Otherwise, when executing `oe-selftest -a', we will get a lot of failures
due to do_unpack failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index f234bac..7bbbf76 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -187,6 +187,8 @@ class SourceMirroring(OESelftestTestCase):
 BB_ALLOWED_NETWORKS = "downloads.yoctoproject.org"
 MIRRORS = ""
 DL_DIR = "${TMPDIR}/test_downloads"
+STAMPS_DIR = "${TMPDIR}/test_stamps"
+SSTATE_DIR = "${TMPDIR}/test_sstate-cache"
 PREMIRRORS = "\\
     bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
     cvs://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \\n \\
-- 
1.9.1


