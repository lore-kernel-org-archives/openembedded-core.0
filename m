Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwd-000262-K2
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:03 +0100
Received: by yia13 with SMTP id 13so1172629yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=dc6b4yvqAITH591vxUXgzXF0VfEyyZ0Anl81juedE0s=;
	b=K/pTRjSO8Rzw2D9+7rjJpEGIKveXmZ4h6QDFWm3+2N5IWSO7BhOh1hyan+E3yp5phI
	zOmiHVMxgZ0eAEfM9DEU35el2OU7OA9XZ06V0l9ibCdLx8r3hrQ94tEnb24FpuCqmhoI
	4R01wmlBybSANAcAF2w1HSVHbqdD2ESo3K2Cg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sRqyaUbawFR61R5P45ZiwbL/qkIabcEgxMEd6nE1TK8oi1AcfxKJjD3NQq/PhngDYn
	N0am7aN40qH6pPGiWBsS5ipdnNeXw1vAEAJb7AsDGE9v6nBPI/gXAdpi20rjJpp1ZJyV
	ojBW7K+IBf04Emftz5Bjg+PK9hVyiJLt+nYjg=
Received: by 10.91.49.14 with SMTP id b14mr2652agk.205.1300378758572;
	Thu, 17 Mar 2011 09:19:18 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:18 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:00 -0700
Message-Id: <9f3352ad8a7a700c1a1f54a753f9b52d38191151.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 02/12] oe.patch: add missing imports
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2011 16:21:03 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/patch.py |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index c8eeb8b..5fb687d 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -1,4 +1,6 @@
 import oe.path
+import os
+import bb.utils, bb.msg, bb.data, bb.fetch2
 
 class NotFoundError(Exception):
     def __init__(self, path):
-- 
1.7.2.3



