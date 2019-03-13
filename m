Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0446B7C65C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 17:57:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2DHvFj0024824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Mar 2019 10:57:15 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 13 Mar 2019 10:57:15 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 13 Mar 2019 13:57:06 -0400
Message-ID: <1552499826-26884-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for cortexa7
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
X-List-Received-Date: Wed, 13 Mar 2019 17:57:15 -0000
Content-Type: text/plain

The cortexa7 tunings use 'cortexa7' in their tunings and do not
include 'arm7' so we need to look for both when setting TARGET_GOARM.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/classes/goarch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 39fea5e..077c967 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -74,7 +74,7 @@ def go_map_arch(a, d):
 def go_map_arm(a, f, d):
     import re
     if re.match('arm.*', a):
-        if 'armv7' in f:
+        if 'armv7' or 'cortexa7' in f:
             return '7'
         elif 'armv6' in f:
             return '6'
-- 
2.7.4


