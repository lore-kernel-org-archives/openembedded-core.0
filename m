Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 756C37FC02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 10:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A210A9C01BB;
	Mon, 20 Jan 2020 05:27:28 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id wHzz1nwdfTwG; Mon, 20 Jan 2020 05:27:24 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5EC529C01B6;
	Mon, 20 Jan 2020 05:27:24 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id i6Xvj9gHUEDc; Mon, 20 Jan 2020 05:27:24 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B326B9C01B8;
	Mon, 20 Jan 2020 05:27:22 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 11:26:58 +0100
Message-Id: <20200120102705.20916-7-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v5 06/13] devtool: npm: rename npm command line options
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
X-List-Received-Date: Mon, 20 Jan 2020 10:27:27 -0000
Content-Transfer-Encoding: quoted-printable

This commit renames the '--fetch-dev' option into '--npm-dev' as it is a
npm only option.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/devtool/standard.py  | 6 +++---
 scripts/lib/recipetool/create.py | 8 +++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 1c0cd8ab51..f33018de3f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -145,8 +145,8 @@ def add(args, config, basepath, workspace):
         extracmdopts +=3D ' --src-subdir "%s"' % args.src_subdir
     if args.autorev:
         extracmdopts +=3D ' -a'
-    if args.fetch_dev:
-        extracmdopts +=3D ' --fetch-dev'
+    if args.npm_dev:
+        extracmdopts +=3D ' --npm-dev'
     if args.mirrors:
         extracmdopts +=3D ' --mirrors'
     if args.srcrev:
@@ -2197,7 +2197,7 @@ def register_commands(subparsers, context):
     group.add_argument('--same-dir', '-s', help=3D'Build in same directo=
ry as source', action=3D"store_true")
     group.add_argument('--no-same-dir', help=3D'Force build in a separat=
e build directory', action=3D"store_true")
     parser_add.add_argument('--fetch', '-f', help=3D'Fetch the specified=
 URI and extract it to create the source tree (deprecated - pass as posit=
ional argument instead)', metavar=3D'URI')
-    parser_add.add_argument('--fetch-dev', help=3D'For npm, also fetch d=
evDependencies', action=3D"store_true")
+    parser_add.add_argument('--npm-dev', help=3D'For npm, also fetch dev=
Dependencies', action=3D"store_true")
     parser_add.add_argument('--version', '-V', help=3D'Version to use wi=
thin recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help=3D'If fetching source=
, do not set up source tree as a git repository', action=3D"store_true")
     group =3D parser_add.add_mutually_exclusive_group()
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index 4c4bbadb4c..7659862f58 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -714,10 +714,8 @@ def create_recipe(args):
         lines_after.append('INSANE_SKIP_${PN} +=3D "already-stripped"')
         lines_after.append('')
=20
-    if args.fetch_dev:
-        extravalues['fetchdev'] =3D True
-    else:
-        extravalues['fetchdev'] =3D None
+    if args.npm_dev:
+        extravalues['NPM_INSTALL_DEV'] =3D 1
=20
     # Find all plugins that want to register handlers
     logger.debug('Loading recipe handlers')
@@ -1313,7 +1311,7 @@ def register_commands(subparsers):
     group.add_argument('-S', '--srcrev', help=3D'Source revision to fetc=
h if fetching from an SCM such as git (default latest)')
     parser_create.add_argument('-B', '--srcbranch', help=3D'Branch in so=
urce repository if fetching from an SCM such as git (default master)')
     parser_create.add_argument('--keep-temp', action=3D"store_true", hel=
p=3D'Keep temporary directory (for debugging)')
-    parser_create.add_argument('--fetch-dev', action=3D"store_true", hel=
p=3D'For npm, also fetch devDependencies')
+    parser_create.add_argument('--npm-dev', action=3D"store_true", help=3D=
'For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action=3D"store_true", help=3D=
argparse.SUPPRESS)
     parser_create.add_argument('--mirrors', action=3D"store_true", help=3D=
'Enable PREMIRRORS and MIRRORS for source tree fetching (disabled by defa=
ult).')
     parser_create.set_defaults(func=3Dcreate_recipe)
--=20
2.20.1


