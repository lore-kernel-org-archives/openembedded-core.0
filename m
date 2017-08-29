Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 546 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Aug 2017 13:40:12 UTC
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id E5A9878262
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 13:40:12 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 801BBA0032E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 15:32:38 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.26.141])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017082915310659-83759 ;
	Tue, 29 Aug 2017 15:31:06 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 15:30:59 +0200
Message-Id: <1504013459-12062-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 29.08.2017 15:31:06,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 29.08.2017 15:31:06
X-TNEFEvaluated: 1
Subject: [PATCH] gtk+3: remove superfluous vardepsexclude
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
X-List-Received-Date: Tue, 29 Aug 2017 13:40:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This seems to be a leftover from the recipe sysroot transition. Remove
it, as it might mask configuration errors.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
index 34845ae04ecd..0a357db04913 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -38,7 +38,6 @@ EXTRA=5FOECONF +=3D " \
                  WAYLAND=5FPROTOCOLS=5FSYSROOT=5FDIR=3D${RECIPE=5FSYSROOT}=
 \
                  ${@bb.utils.contains("DISTRO=5FFEATURES", "x11", "", "--d=
isable-gtk-doc", d)} \
                  "
-EXTRA=5FOECONF[vardepsexclude] =3D "MACHINE"
=20
 do=5Fcompile=5Fprepend() {
         export GIR=5FEXTRA=5FLIBS=5FPATH=3D"${B}/gdk/.libs"
--=20
1.9.1


