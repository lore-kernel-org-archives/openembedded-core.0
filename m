Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa3TL-0001Zz-5O
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 13:23:19 +0200
Received: by bkcjm2 with SMTP id jm2so722154bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=yqrGEcnS7QZqrWPtqsoEVCiPwl8XNOXZHCGFnN2upvg=;
	b=MkZ1B4D+QYoMifDE7bdmO+JBZ2sDrUnedJ8UocBZxeh7+rAqSWbQu+onI9OZRVzJZm
	yLyni1rfUunOGz8OKPbUEj3MNkb+HyCNpohbdnWdnHkLr9hOvYDUmIyULTvyVxGGn8hy
	vmikPxjSiLIlQOc10tbUjNhE5BRrb4xBn/hV5lzj3K2x3pebN9g9tS/vRaN2dDka+uVO
	7isJ+Hy+IrXSB/ZG5JIlT31a0qGee/JtzUfPqy/n/pvnNb+H6bdzq1R6oYbUNndu5QE3
	Ki19zBnx3bSsLDMavtTy9eUgYa66LhPjyVWjJnfWDMVvp0c72sc94rxB9Ojn1R+w+eKL
	L8rA==
Received: by 10.204.152.22 with SMTP id e22mr11558047bkw.8.1338462779364;
	Thu, 31 May 2012 04:12:59 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id gm18sm2835908bkc.7.2012.05.31.04.12.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 04:12:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2012 13:12:44 +0200
Message-Id: <1338462765-18412-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [V2 1/2] buildhistory_analysis.py: ignore lines without '='
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
X-List-Received-Date: Thu, 31 May 2012 11:23:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/lib/oe/buildhistory_analysis.py |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 29dc4a9..2b4582e 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -167,9 +167,10 @@ def blob_to_dict(blob):
     alines = blob.data_stream.read().splitlines()
     adict = {}
     for line in alines:
-        splitv = [i.strip() for i in line.split('=',1)]
-        if splitv.count > 1:
-            adict[splitv[0]] = splitv[1]
+        if line.find("=") != -1:
+            splitv = [i.strip() for i in line.split('=',1)]
+            if splitv.count > 1:
+                adict[splitv[0]] = splitv[1]
     return adict
 
 
-- 
1.7.6.5



