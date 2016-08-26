Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id BBDE060110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:16:11 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 93A4FA00432
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:16:20 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016082612161121-108749 ;
	Fri, 26 Aug 2016 12:16:11 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 12:16:10 +0200
Message-Id: <1472206573-29621-7-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1472206573-29621-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1472206573-29621-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 26.08.2016 12:16:11,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 26.08.2016 12:16:11
X-TNEFEvaluated: 1
Subject: [PATCH 6/9] lsof: remove EXTRA_OEMAKE workaround
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
X-List-Received-Date: Fri, 26 Aug 2016 10:16:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The default of EXTRA=5FOEMAKE is already empty since commit:

OE-Core rev: aeb653861a0ec39ea7a014c0622980edcbf653fa
bitbake.conf: Remove unhelpful default value for EXTRA=5FOEMAKE

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-extended/lsof/lsof=5F4.89.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof=5F4.89.bb b/meta/recipes-exten=
ded/lsof/lsof=5F4.89.bb
index c10337b..b732cf0 100644
--- a/meta/recipes-extended/lsof/lsof=5F4.89.bb
+++ b/meta/recipes-extended/lsof/lsof=5F4.89.bb
@@ -47,8 +47,6 @@ do=5Fconfigure () {
 export I =3D "${STAGING=5FINCDIR}"
 export L =3D "${STAGING=5FINCDIR}"
=20
-EXTRA=5FOEMAKE =3D ""
-
 do=5Fcompile () {
 	oe=5Frunmake 'CC=3D${CC}' 'CFGL=3D${LDFLAGS} -L./lib -llsof' 'DEBUG=3D' '=
INCL=3D${CFLAGS}'
 }
--=20
1.9.1


