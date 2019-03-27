Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE327D0D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 09:15:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2R9FmfW004713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 02:15:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 27 Mar 2019 02:15:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 17:25:56 +0800
Message-ID: <825b45acf7e2881469e4f26d8a8ac6aa4338ac38.1553678741.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1553678741.git.Qi.Chen@windriver.com>
References: <cover.1553678741.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssl: follow OE's rule for specifying CVE ID
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
X-List-Received-Date: Wed, 27 Mar 2019 09:15:47 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
index 59a92f0..900ef97 100644
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
@@ -32,7 +32,7 @@ because no such use sets such a long nonce value. However user
 applications that use this cipher directly and set a non-default nonce
 length to be longer than 12 bytes may be vulnerable.
 
-CVE-2019-1543
+CVE: CVE-2019-1543
 
 Fixes #8345
 
-- 
1.9.1


