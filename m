Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 562877C0E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:05:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBK8568X023486
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 00:05:17 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Dec 2018 00:04:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Dec 2018 00:04:54 -0800
Message-ID: <3d6fbb3825ef92b93f0e99d4ff06af2156ecac71.1545293075.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545293075.git.liezhi.yang@windriver.com>
References: <cover.1545293075.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] create-pull-request: fix sed command for SUBJECT
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
X-List-Received-Date: Thu, 20 Dec 2018 08:05:26 -0000
Content-Type: text/plain

Fixed when SUBJECT contains slash(/):
sed: -e expression #1, char 35: unknown option to `s'

Use '#' as separator to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 280880b..ff0f7e6 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -278,7 +278,7 @@ fi
 
 # Replace the SUBJECT token with it.
 if [ -n "$SUBJECT" ]; then
-	sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
+	sed -i -e "s#\*\*\* SUBJECT HERE \*\*\*#$SUBJECT#" "$CL"
 fi
 
 
-- 
2.10.2


