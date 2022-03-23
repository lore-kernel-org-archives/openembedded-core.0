Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E7FC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:15:06 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4305.1648077303003847235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=iv4VT94q;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648077304;
  x=1679613304;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=v5hM6MVW4rQSDuVJH3fPU9VR3zoaLs09Tq8MNKJVFms=;
  b=iv4VT94qCinD6+SL4GS2r6rgNkH/vpp19Ody1L4vb+Sc+o+FCFSGdPdp
   myYr6YmfkDrQ1AN0PQjvALkLdN1c1aYzzhakNge7bQgg8vumClExEKzl1
   GO+IqMYuD3i4pnZTmZoniXlCnNpnJYYCrsnZWUQJ7q3RlhDJsY8LZVe3/
   640FBauepRtvYCSMS8IB+9IawNjSfYqJxwgAluIbZnwb2pJMUldAZMFsb
   rlDwjGRe73jXlIGDvKY12hThmNv9MioLV0rAEf9j/3tfTNeSYw6Z6vj2O
   TLMN/wmgcrrVQGxR6s7MzRfuDl7IYPrnM11GDtyiiZJeLj/BnYJ1u6PId
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] license.bbclass: Remove the available_licenses() function
Date: Thu, 24 Mar 2022 00:14:58 +0100
Message-ID: <20220323231458.22671-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220323231458.22671-1-pkj@axis.com>
References: <20220323231458.22671-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 23:15:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163599

It is no longer used in OE-Core.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/license.bbclass | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 813e1ea4f5..0c637e966e 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -256,21 +256,6 @@ def canonical_license(d, license):
     """
     return d.getVarFlag('SPDXLICENSEMAP', license) or license
 
-def available_licenses(d):
-    """
-    Return the available licenses by searching the directories specified by
-    COMMON_LICENSE_DIR and LICENSE_PATH.
-    """
-    lic_dirs = ((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' +
-                (d.getVar('LICENSE_PATH') or '')).split()
-
-    licenses = []
-    for lic_dir in lic_dirs:
-        licenses += os.listdir(lic_dir)
-
-    licenses = sorted(licenses)
-    return licenses
-
 def expand_wildcard_licenses(d, wildcard_licenses):
     """
     There are some common wildcard values users may want to use. Support them

