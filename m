Received: from MTA-09-3.privateemail.com (MTA-09-3.privateemail.com [68.65.122.19])
 by mx.groups.io with SMTP id smtpd.web10.37059.1613419758123085769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 12:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: whitetree.xyz, ip: 68.65.122.19, mailfrom: charles.davies@whitetree.xyz)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
	by MTA-09.privateemail.com (Postfix) with ESMTP id 17C336004C;
	Mon, 15 Feb 2021 15:09:17 -0500 (EST)
Received: from localhost.localdomain (unknown [10.20.151.213])
	by MTA-09.privateemail.com (Postfix) with ESMTPA id 821C56003F;
	Mon, 15 Feb 2021 20:09:15 +0000 (UTC)
From: "Charlie Davies" <charles.davies@whitetree.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Davies <charles.davies@whitetree.xyz>
Subject: [master][dunfell][gatesgarth][PATCH 1/2] bitbake-bblayers/create: Fix incorrect priority help message
Date: Mon, 15 Feb 2021 20:07:43 +0000
Message-Id: <20210215200744.20802-1-charles.davies@whitetree.xyz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable

The help message for the optional argument of setting
the priority of the new layer was incorrect.

Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
---
 meta/lib/bblayers/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 542f31fc81..f49b48d1b4 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -71,7 +71,7 @@ class CreatePlugin(LayerPlugin):
     def register_commands(self, sp):
         parser_create_layer =3D self.add_command(sp, 'create-layer', sel=
f.do_create_layer, parserecipes=3DFalse)
         parser_create_layer.add_argument('layerdir', help=3D'Layer direc=
tory to create')
-        parser_create_layer.add_argument('--priority', '-p', default=3D6=
, help=3D'Layer directory to create')
+        parser_create_layer.add_argument('--priority', '-p', default=3D6=
, help=3D'Priority of recipes in layer')
         parser_create_layer.add_argument('--example-recipe-name', '-e', =
dest=3D'examplerecipe', default=3D'example', help=3D'Filename of the exam=
ple recipe')
         parser_create_layer.add_argument('--example-recipe-version', '-v=
', dest=3D'version', default=3D'0.1', help=3D'Version number for the exam=
ple recipe')
=20
--=20
2.30.0

