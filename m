Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycore.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7D37687B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:16:12 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 8B394A00431
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:16:20 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016082612161144-108750 ;
	Fri, 26 Aug 2016 12:16:11 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 12:16:11 +0200
Message-Id: <1472206573-29621-8-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1472206573-29621-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1472206573-29621-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 26.08.2016 12:16:11,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 26.08.2016 12:16:11
X-TNEFEvaluated: 1
Subject: [PATCH 7/9] linux-libc-headers: remove EXTRA_OEMAKE workaround
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
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 92acf8a..c701b39 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -50,9 +50,6 @@ SRC=5FURI =3D "${KERNELORG=5FMIRROR}/linux/kernel/v${HEAD=
ER=5FFETCH=5FVER}/linux-${PV}.tar
=20
 S =3D "${WORKDIR}/linux-${PV}"
=20
-# For the kernel, we don't want the '-e MAKEFLAGS=3D' in EXTRA=5FOEMAKE.
-EXTRA=5FOEMAKE =3D ""
-
 do=5Fconfigure() {
 	oe=5Frunmake allnoconfig
 }
--=20
1.9.1


