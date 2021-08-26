Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.34710.1630000660824620603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 10:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QE6MR+D+;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630000662;
  x=1661536662;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vL6QqdTjL4Iyh9+tNyIJwox3BH7qDVuHy1qgzVfiMoU=;
  b=QE6MR+D+oF0yOu50/cNmO6ClVcnIqfE7JGCn6jTX1e+PAMUpaBLSDpqY
   zWW81lR1Ps40LQ836i1/g/7vJIRLaVg0G3LOP1hVHnzQNx6tTYdM6xqqh
   Vj6dx5aEDZEGrGgst9NqPVAzsjiQtHj2FyXHRo7BYPe2LVrLE3vAKzbK0
   5ci7BFcBG1POiqG2OrmyCOnROoTVmGl43SfTxn+ssZ/ZEirYjfLpuU/TB
   +9NZYVMGRc081sbfx/PoCEbA93PJ/s+m6CEx46SBXL/WgsHcBdRRrVxno
   pT6sVAuFr644fhWAPpH1U9ZK+WUNAkWbgRp6npYtVZt99QmXFbdSu8Rsj
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] buildhistory-collect-srcrevs: Adapt to the new variable override syntax
Date: Thu, 26 Aug 2021 19:57:37 +0200
Message-ID: <20210826175737.9388-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210826175737.9388-1-pkj@axis.com>
References: <20210826175737.9388-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/buildhistory-collect-srcrevs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index bca01a922b..c937e49c2a 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -53,7 +53,7 @@ def main():
         sys.exit(1)
 
     if options.forcevariable:
-        forcevariable = '_forcevariable'
+        forcevariable = ':forcevariable'
     else:
         forcevariable = ''
 
@@ -99,7 +99,7 @@ def main():
             print('# %s' % curdir)
             for pn, name, srcrev in srcrevs:
                 if name:
-                    print('SRCREV_%s_pn-%s%s = "%s"' % (name, pn, forcevariable, srcrev))
+                    print('SRCREV_%s:pn-%s%s = "%s"' % (name, pn, forcevariable, srcrev))
                 else:
                     print('SRCREV:pn-%s%s = "%s"' % (pn, forcevariable, srcrev))
 
