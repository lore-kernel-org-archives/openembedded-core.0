Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6277B65FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 02:03:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R23xoW027315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 19:03:59 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 19:03:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 May 2014 21:39:47 -0400
Message-ID: <fdb4e0dec7f35e40790b15e11cb001ce94215a59.1401154373.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401154373.git.liezhi.yang@windriver.com>
References: <cover.1401154373.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cups: enable cups-str4402.patch
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
X-List-Received-Date: Tue, 27 May 2014 02:03:58 -0000
Content-Type: text/plain

This patch is used for fixing build errors without dnssd/avahi, we
already have this patch, but isn't added to SRC_URI:
meta/recipes-extended/cups/cups/cups-str4402.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fd88552..bbfd1ef 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -8,6 +8,7 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
+           file://cups-str4402.patch \
 	  "
 
 LEAD_SONAME = "libcupsdriver.so"
-- 
1.7.10.4


