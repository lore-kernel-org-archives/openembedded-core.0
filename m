Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B7DC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:47:53 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.8463.1647020868234460906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=iaCJdg84;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647020869;
  x=1678556869;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VWD2fUu8dWMrkMjCGnFEJv+J1E5u/XPm6kuJaO9BDjI=;
  b=iaCJdg84tuqwADk1lJrhFrgh9GIOUw+S/enCgVOEcUorK+Qv3mC2VYCO
   besHMGYEwc/9mC+Y2vM5gFJ5mrPC0Alt5HN4dflrVUxCRz8ZZ1fNL5mnl
   FlXxKGLeqPAL/0VSD9XhxOPQznC7MYSzAYhcDpGvZ21fGzUXDe19KyRzm
   zOB92Ax9IazCONAZGDSK05OLfRp+C91Vl7upsw9CYj/bWGAwQjMlcr5Mr
   LeBFEszITvp4uqrUrPCslciZ6XTNc8ctNKmqDYOuM3vrKo9EUmud1cten
   l9/iZkIiY/Gdvb2f6lBKiIsSu5NX3oiIsxsKF/YmQjUKCpb3E5GhXEo1t
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister] oe-pkgdata-util: Adapt to the new variable override syntax
Date: Fri, 11 Mar 2022 18:47:42 +0100
Message-ID: <20220311174742.9108-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163073

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-pkgdata-util | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 71656dadce..7412cc1f47 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -296,7 +296,7 @@ def package_info(args):
             extra = ''
             for line in f:
                 for var in vars:
-                    m = re.match(var + '(?:_\S+)?:\s*(.+?)\s*$', line)
+                    m = re.match(var + '(?::\S+)?:\s*(.+?)\s*$', line)
                     if m:
                         vals[var] = m.group(1)
             pkg_version = vals['PKGV'] or ''

