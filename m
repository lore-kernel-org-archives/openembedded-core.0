Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A83C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 17:03:59 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.658.1645808637553550821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 09:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=J9fQc3Be;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645808637;
  x=1677344637;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/ccJQBSWQZIwtKbpg2G7UkXTPCxlKE05eDjTXM17F+0=;
  b=J9fQc3Beg8RFmNOdS5/y+CAViV/eoKAz1OyYeHttX8KJNeif1tmNE/BR
   h9gss7fyN9RXaq/RFMqAomV0wqkf0ii0ZqbcPpwxyaFI1R6N8yhDLclDj
   qZyq+OW84VDExasw9iXeXRGXS2g9D52PpoXtDek/MRzhe4DaBFv/0iLJT
   WgxNQlpoH7qv3Uf/dH0AAsa6XE9HPXf9Im9oaCGB22d21kbXAKXrPAqmG
   jbbYbvs/RVhP22Mdjt/nu7QGUduePv/4UEcAxF/5GJ/TdaeWXcbGoy1HM
   tgpkWgObnjNDNDfoWm1kqVji7mzk6dez6LAvujzBr7olhJk/x6l8Ci0wD
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] license.py: Correct a comment
Date: Fri, 25 Feb 2022 18:03:49 +0100
Message-ID: <20220225170349.8486-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 17:03:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162407

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/license.py | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 79800c2b8f..8955cbdeb2 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -100,16 +100,13 @@ def flattened_licenses(licensestr, choose_licenses):
     return flatten.licenses
 
 def is_included(licensestr, include_licenses=None, exclude_licenses=None):
-    """Given a license a list of list to include and a list of
-        licenses to exclude, determine if the license string
-        matches the an include list and does not match the 
-        exclude list.
-
-        Returns a tuple holding the boolean state and a list of
-        the applicable licenses that were excluded if state is
-        False, or the licenses that were included if the state
-        is True.
-    """
+    """Given a license string, a list of licenses to include and a list of
+    licenses to exclude, determine if the license string matches the include
+    list and does not match the exclude list.
+
+    Returns a tuple holding the boolean state and a list of the applicable
+    licenses that were excluded if state is False, or the licenses that were
+    included if the state is True."""
 
     def include_license(license):
         return any(fnmatch(license, pattern) for pattern in include_licenses)

