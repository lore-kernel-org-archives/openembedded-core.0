Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id DD5E9738AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:16:10 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 05ED1A00424
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:16:20 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016082612161069-108747 ;
	Fri, 26 Aug 2016 12:16:10 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 12:16:08 +0200
Message-Id: <1472206573-29621-5-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1472206573-29621-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1472206573-29621-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 26.08.2016 12:16:10,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 26.08.2016 12:16:10
X-TNEFEvaluated: 1
Subject: [PATCH 4/9] ifupdown: remove EXTRA_OEMAKE workaround
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
X-List-Received-Date: Fri, 26 Aug 2016 10:16:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The default of EXTRA=5FOEMAKE is already empty since commit:

OE-Core rev: aeb653861a0ec39ea7a014c0622980edcbf653fa
bitbake.conf: Remove unhelpful default value for EXTRA=5FOEMAKE

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-core/ifupdown/ifupdown=5F0.8.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown=5F0.8.2.bb b/meta/recipes-=
core/ifupdown/ifupdown=5F0.8.2.bb
index 732b295..9de01f9 100644
--- a/meta/recipes-core/ifupdown/ifupdown=5F0.8.2.bb
+++ b/meta/recipes-core/ifupdown/ifupdown=5F0.8.2.bb
@@ -13,8 +13,6 @@ SRC=5FURI =3D "git://anonscm.debian.org/git/collab-maint/=
ifupdown.git;protocol=3Dhttps
 	  "
 SRCREV =3D "05ea2fd4f49bb1201aeef2a42efbcff8f336112f"
=20
-EXTRA=5FOEMAKE =3D ""
-
 S =3D "${WORKDIR}/git"
=20
=20
--=20
1.9.1


