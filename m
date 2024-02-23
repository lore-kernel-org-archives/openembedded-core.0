Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568A3C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 20:56:58 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.5908.1708721813013186227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 12:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=H94v1mjW;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E9D49240028
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 21:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708721810; bh=X2rQ8hGsL1JfA+xSnvqrxPs2YmcmYi7wNXScXb+vEnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=H94v1mjW8HMF/UR75sJY3lfalSHc8etRutrhBRrOw5yu5X/0YscIwsQsnwxep/rAD
	 9x1NiCY0zIsY3FgsxH0Ib5bcA5PxHXO8xXwH6jVZuBYh3WSODpxEaMkyKaNMfEh0qX
	 lzi0/SFOLOjOwoG7YTar2pfjAlYEHzRTYfFVq+UhB9Xj4uQlE34tX0e/FHTYJPfyGO
	 i4IRcHYagTFm+d3jPwluzHc6D30DMr3E41o7IaiWe5dZyVT+jzhnAeeB+6aazRqqfh
	 yPcttVjE7FSjplR+QJC4Grhlg8MUJFE0j6s4kyNoqwgKN7LnmOMxAV0jVHq6AF9Sri
	 YGO4pK7xKvE1g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThMkp1jhYz6tvt;
	Fri, 23 Feb 2024 21:56:49 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v3] patchtest: provide further guidance for failed testcases
Date: Fri, 23 Feb 2024 20:56:39 +0000
Message-Id: <20240223205639.19766-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 20:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196111

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Cross-reference the wiki page on patchtest now that it is updated and con=
tains
more information how to address failed testcases. Adding it in patchtest =
only
is enough as patchtest-send-result already points to the wikipage for fai=
lures.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
v2: Instead of prodvidng the infos in the log point to the now updated wi=
ki to
avoid issues with autobuilder when adding more lines.

v3: fix typo
 scripts/patchtest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 3163420220..0be7062dc2 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -164,9 +164,9 @@ def run(patch, logfile=3DNone):
     if premerge_result =3D=3D 2 and postmerge_result =3D=3D 2:
         logger.error('patchtest: No test cases found - did you specify t=
he correct suite directory?')
     if premerge_result =3D=3D 1 or postmerge_result =3D=3D 1:
-        logger.error('WARNING: patchtest: At least one patchtest caused =
a failure or an error - please check')
+        logger.error('WARNING: patchtest: At least one patchtest caused =
a failure or an error - please check https://wiki.yoctoproject.org/wiki/P=
atchtest for further guidance')
     else:
-        logger.error('OK: patchtest: All patchtests passed')
+        logger.info('OK: patchtest: All patchtests passed')
     print('-------------------------------------------------------------=
---------\n')
     return premerge_result or postmerge_result
=20
--=20
2.39.2


