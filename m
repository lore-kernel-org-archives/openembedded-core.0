Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57E877067B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:39:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA6Fdas1019063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:39:36 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:39:35 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:27 +0800
Message-ID: <9cb87f8895d8e69e3e2353ba0951286faac6dcce.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 24/25] local.conf.sample: Add qemuarm64
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
X-List-Received-Date: Thu, 06 Nov 2014 15:39:36 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

Add an example machine configuration for qemuarm64.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-yocto/conf/local.conf.sample | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index 93c85c2..a1d99f9 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -18,6 +18,7 @@
 # of emulated machines available which can boot and run in the QEMU emulator:
 #
 #MACHINE ?= "qemuarm"
+#MACHINE ?= "qemuarm64"
 #MACHINE ?= "qemumips"
 #MACHINE ?= "qemuppc"
 #MACHINE ?= "qemux86"
-- 
1.9.1


