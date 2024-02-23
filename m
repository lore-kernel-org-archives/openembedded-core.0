Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02123C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 20:17:58 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.5042.1708719474819504686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 12:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=Rl9RM8RL;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CDF39240027
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 21:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708719472; bh=rRC2R/bmfCrNxrmlB6ag1K/hNaOy39wWP9U4Nf2uFek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Rl9RM8RLsqvWRSfliVomigp3aJI8NtYebO+e8R74Llh2UTX0+MOHPWSBBtFDZBRRX
	 FHJabZaF4K7f6UH/43uZvmJoFtKtDtSHLBiAONLkzbCK6keZywJLhhJCtO+VNA9c+2
	 +qkQRPV1eOHl5EJzOtJxYp2UWo37SlGYJuZLSJDAOLM84jAtk2rHOab4S8CbDmSWpc
	 4TY76nShfy1VXtTdj2pk2IyKpPaUKk+s7LOaLFGQGCJRpl+ZWFovu+F75cWFfHtT/2
	 OEXJncJQBO+CEb+B6tf6ucW0dNn+YVQoUr3eh5u2W/RWsu44m59NmJz8priIClq6MT
	 2k7wH0cesLh0Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThLsr1SYMz9rxL;
	Fri, 23 Feb 2024 21:17:51 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] patchtest: provide further guidance for failed testcases
Date: Fri, 23 Feb 2024 20:17:45 +0000
Message-Id: <20240223201745.16234-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 20:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196107

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
 scripts/patchtest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 3163420220..42e70fd4b7 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -164,9 +164,9 @@ def run(patch, logfile=3DNone):
     if premerge_result =3D=3D 2 and postmerge_result =3D=3D 2:
         logger.error('patchtest: No test cases found - did you specify t=
he correct suite directory?')
     if premerge_result =3D=3D 1 or postmerge_result =3D=3D 1:
-        logger.error('WARNING: patchtest: At least one patchtest caused =
a failure or an error - please check')
+		logger.error('WARNING: patchtest: At least one patchtest caused a fail=
ure or an error - please check https://wiki.yoctoproject.org/wiki/Patchte=
st for further guidance for further guidance')
     else:
-        logger.error('OK: patchtest: All patchtests passed')
+        logger.info('OK: patchtest: All patchtests passed')
     print('-------------------------------------------------------------=
---------\n')
     return premerge_result or postmerge_result
=20
--=20
2.39.2


