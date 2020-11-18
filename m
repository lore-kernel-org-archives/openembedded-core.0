Received: from pp2023.ppsmtp.net (pp2023.ppsmtp.net [132.145.231.115])
 by mx.groups.io with SMTP id smtpd.web09.27576.1605719630784188656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 09:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ifm.com header.s=pps header.b=aCXwUWsg;
 spf=pass (domain: ifm.com, ip: 132.145.231.115, mailfrom: prvs=1591cff76d=fedor.ross@ifm.com)
Received: from pps.filterd (pp2023.ppsmtp.internal [127.0.0.1])
	by pp2023.ppsmtp.internal (8.16.0.42/8.16.0.42) with SMTP id 0AIH4fLq024523
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 18:13:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ifm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pps;
 bh=HELhv0nOrsaiqKW1SlowyR/RSK8WK3FWLCk9YK0aU+k=;
 b=aCXwUWsgQ95cINHuy18+OD3ySt4pFNEqG+yS6u5OYi1LUCop9NgBmTaePiH4dFXx69hl
 SdJrsLnnikHWyBUUWT0E85vz9S8enDu2Z/ZepGDND9Nc73vSI1/+zZ0kgodnluRcUiZH
 pdJ3RISxlsVbMLeQYLpv6SDY4YTOf1sohcwxuYSrYGXiqZrm3h+UyZtK61rqd5j2tKaX
 Tme4kZmSBz6OA4Y3eYrI5ksq9ux4pCxfY6J5Cank5bDLi+wYd5fegrKZq1tiU5Nz+ZTK
 jnfxgBANeR8lj1RggPyYwMfAFNowomGNfp8UUsq+Tsf1agJICfXafTvgNJx3FjBWh2kD Gw== 
Received: from deesdmz226.dmz.es.de.ifm (mail26.ifm.com [194.156.152.226])
	by pp2023.ppsmtp.internal with ESMTP id 34w58xrehx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 18:13:49 +0100
Received: from deesdmz226.dmz.es.de.ifm (localhost.localdomain [127.0.0.1])
	by deesdmz226.dmz.es.de.ifm (Postfix) with ESMTP id AAA9B70383E
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 18:13:48 +0100 (CET)
From: fedor.ross@ifm.com
To: <openembedded-core@lists.openembedded.org>
CC: Fedor Ross <fedor.ross@ifm.com>
Subject: [PATCH 2/2] sysvinit: remove bashism to be compatible with dash
Date: Wed, 18 Nov 2020 18:13:14 +0100
Message-ID: <20201118171314.5543-2-fedor.ross@ifm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118171314.5543-1-fedor.ross@ifm.com>
References: <20201118171314.5543-1-fedor.ross@ifm.com>
MIME-Version: 1.0
X-Originating-IP: [172.18.85.69]
X-ClientProxiedBy: dettex01.intra.ifm (172.19.1.101) To dettex04.intra.ifm
 (172.19.1.163)
X-TM-AS-Product-Ver: SMEX-12.5.0.2055-8.6.1012-25798.001
X-TM-AS-Result: No-2.812300-5.000000-10
X-TMASE-MatchedRID: vIqJu39ZnH/r8Nu3QGZdEz8Ckw9b/GFeTJDl9FKHbrkvM0Gdq0fzqU0B
	XzNFL3+M4LDKPtPVt4yAMuqetGVetiVvu9chHp+mavP8b9lJtWr6C0ePs7A07Zbv1Srwoyj1lgI
	I4PpcKoUZco4VxSeF1HTy6MqN9Z9VumzuRtu40x0fVLWou0xu+cER7atz388DWhO/585UPzuwHk
	MkeXWV8qavK1RUwy68xsbRsxJFgNYWGegpbh/sx/VzxEkh5LVAWYqZ+nM0cw0=
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.812300-5.000000
X-TMASE-Version: SMEX-12.5.0.2055-8.6.1012-25798.001
X-TM-SNTS-SMTP: 
	FB241C297C94F4ECEA1EACF20272BF1F2611C5F58D188DAC7AD538C78DFB4C802002:9
X-C2ProcessedOrg: 02c94ccb-b9eb-40fe-af38-4bcaa8aaafa4
X-CompuMailGateway: Version: 7.00.0.20903.x86_64 COMPUMAIL Date: 20201118171348Z
X-Proofpoint-ID: SID=34w58xrehx QID=34w58xrehx-1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-18_06:2020-11-17,2020-11-18 signatures=0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Fedor Ross <fedor.ross@ifm.com>

Replace the equality operator '=3D=3D' with '=3D' inside of '[]' to be
compatible with bash and dash.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sys=
vinit/sysvinit/rc
index fd1fdd26ba..d0d3149821 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -63,7 +63,7 @@ startup() {
   stty onlcr 0>&1
=20
   # Limit stack size for startup scripts
-  [ "$STACK_SIZE" =3D=3D "" ] || ulimit -S -s $STACK_SIZE
+  [ "$STACK_SIZE" =3D "" ] || ulimit -S -s $STACK_SIZE
=20
   # Now find out what the current and what the previous runlevel are.
=20
--=20
2.20.1


