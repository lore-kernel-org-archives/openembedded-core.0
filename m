Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2E6274E29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:56:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U8u3ib024187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:56:03 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 01:56:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 17:03:55 +0800
Message-ID: <127da199ab3f6e8c536e92ad9ea63a83b102050f.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/16] site/powerpc64-linux: add cvs_cv_func_printf_ptr
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
X-List-Received-Date: Wed, 30 May 2018 08:56:02 -0000
Content-Type: text/plain

Fixed when powerpc64:
$ bitbake <image> -ctestsdk
[snip]
checking whether printf supports %p... configure: error: cannot run test program while cross compiling
See `config.log' for more details.
test_cvs (oeqa.sdk.buildcvs.BuildCvsTest) ... FAIL
[snip]

The cvs_cv_func_printf_ptr is already in powerpc32-linux.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/site/powerpc64-linux | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
index d64e230..820a4b8 100644
--- a/meta/site/powerpc64-linux
+++ b/meta/site/powerpc64-linux
@@ -37,3 +37,5 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # apr
 apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
+# cvs
+cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
-- 
2.7.4


