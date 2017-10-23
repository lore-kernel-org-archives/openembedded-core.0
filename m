Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B61BF600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 02:57:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9N2vDeV007452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 19:57:16 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Sun, 22 Oct 2017 19:57:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Oct 2017 10:56:35 +0800
Message-ID: <60ffbe2c916746caa8e35fb29444699886349eb1.1508727336.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1508727336.git.liezhi.yang@windriver.com>
References: <cover.1508727336.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] useradd.bbclass: print a warn when useradd not found
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
X-List-Received-Date: Mon, 23 Oct 2017 02:57:15 -0000
Content-Type: text/plain

Exit quietly makes it very hard for debugging when user is not added as
expected, print a warning helps a lot.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/useradd.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index c9103cb..124becd 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -118,6 +118,7 @@ useradd_sysroot () {
 	# useradd/groupadd tools are unavailable. If there is no dependency, we assume we don't want to
 	# create users in the sysroot
 	if ! command -v useradd; then
+		bbwarn "command useradd not found!"
 		exit 0
 	fi
 
-- 
2.7.4


