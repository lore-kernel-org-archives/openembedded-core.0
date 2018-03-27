Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD8A60103
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 12:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 71B3B1844E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:28:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id yek9QKakjXtM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:28:15 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8540518450
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:28:15 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FC3C1A06F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:28:15 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 648A41A069
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:28:15 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:28:15 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 58F752135
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:28:15 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 27 Mar 2018 14:28:15 +0200
Received: from XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a]) by
	XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a%22]) with mapi id
	15.00.1263.000; Tue, 27 Mar 2018 14:28:15 +0200
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Ola x Nilsson <olani@axis.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] package.bbclass: Include dbgsrc for static libs
Thread-Index: AQHTrHpuc2rXV5ew8EOm6HHQDOrcnKPkNQuH
Date: Tue, 27 Mar 2018 12:28:15 +0000
Message-ID: <1522153694838.99691@axis.com>
References: <20180223074618.24928-1-olani@axis.com>
In-Reply-To: <20180223074618.24928-1-olani@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] package.bbclass: Include dbgsrc for static libs
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
X-List-Received-Date: Tue, 27 Mar 2018 12:28:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping?=0A=
=0A=
-- =0A=
Ola Nilsson=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Ola x Nilsson <olani@axis.com>=
=0A=
Sent: Friday, February 23, 2018 08:46=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] package.bbclass: Include dbgsrc for static libs=
=0A=
=0A=
The debugsource must be added from the package providing the static=0A=
lib, because any package using that lib does not have access to the=0A=
source code.=0A=
=0A=
Fixes [YOCTO #12558]=0A=
=0A=
Signed-off-by: Ola x Nilsson <olani@axis.com>=0A=
---=0A=
 meta/classes/package.bbclass | 42 ++++++++++++++++++++++++++++++----------=
--=0A=
 1 file changed, 30 insertions(+), 12 deletions(-)=0A=
=0A=
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass=0A=
index e7e93a067a..ec6fca87b5 100644=0A=
--- a/meta/classes/package.bbclass=0A=
+++ b/meta/classes/package.bbclass=0A=
@@ -344,6 +344,20 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarf=
srcfiles_output):=0A=
=0A=
     return debugfiles.keys()=0A=
=0A=
+def append_source_info(file, sourcefile, d):=0A=
+    cmd =3D "'dwarfsrcfiles' '%s'" % (file)=0A=
+    (retval, output) =3D oe.utils.getstatusoutput(cmd)=0A=
+    # 255 means a specific file wasn't fully parsed to get the debug file =
list, which is not a fatal failure=0A=
+    if retval !=3D 0 and retval !=3D 255:=0A=
+        bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%s" %=
 (retval, cmd, ":\n%s" % output if output else ""))=0A=
+=0A=
+    debugsources =3D parse_debugsources_from_dwarfsrcfiles_output(output)=
=0A=
+    # filenames are null-separated - this is an artefact of the previous u=
se=0A=
+    # of rpm's debugedit, which was writing them out that way, and the cod=
e elsewhere=0A=
+    # is still assuming that.=0A=
+    debuglistoutput =3D '\0'.join(debugsources) + '\0'=0A=
+    open(sourcefile, 'a').write(debuglistoutput)=0A=
+=0A=
=0A=
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):=0A=
     # Function to split a single file into two components, one is the stri=
pped=0A=
@@ -369,18 +383,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourc=
efile, d):=0A=
=0A=
     # We need to extract the debug src information here...=0A=
     if debugsrcdir:=0A=
-        cmd =3D "'dwarfsrcfiles' '%s'" % (file)=0A=
-        (retval, output) =3D oe.utils.getstatusoutput(cmd)=0A=
-        # 255 means a specific file wasn't fully parsed to get the debug f=
ile list, which is not a fatal failure=0A=
-        if retval !=3D 0 and retval !=3D 255:=0A=
-            bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%=
s" % (retval, cmd, ":\n%s" % output if output else ""))=0A=
-=0A=
-        debugsources =3D parse_debugsources_from_dwarfsrcfiles_output(outp=
ut)=0A=
-        # filenames are null-separated - this is an artefact of the previo=
us use=0A=
-        # of rpm's debugedit, which was writing them out that way, and the=
 code elsewhere=0A=
-        # is still assuming that.=0A=
-        debuglistoutput =3D '\0'.join(debugsources) + '\0'=0A=
-        open(sourcefile, 'a').write(debuglistoutput)=0A=
+        append_source_info(file, sourcefile, d)=0A=
=0A=
     bb.utils.mkdirhier(os.path.dirname(debugfile))=0A=
=0A=
@@ -936,6 +939,13 @@ python split_and_strip_files () {=0A=
                 type |=3D 8=0A=
         return type=0A=
=0A=
+    def isStaticLib(path):=0A=
+        if file.endswith('.a'):=0A=
+            with open(path, 'rb') as fh:=0A=
+                magic =3D b'!<arch>\n'=0A=
+                start =3D fh.read(len(magic))=0A=
+                return start =3D=3D magic=0A=
+        return False=0A=
=0A=
     #=0A=
     # First lets figure out all of the files we may have to process ... do=
 this only once!=0A=
@@ -943,6 +953,7 @@ python split_and_strip_files () {=0A=
     elffiles =3D {}=0A=
     symlinks =3D {}=0A=
     kernmods =3D []=0A=
+    staticlibs =3D []=0A=
     inodes =3D {}=0A=
     libdir =3D os.path.abspath(dvar + os.sep + d.getVar("libdir"))=0A=
     baselibdir =3D os.path.abspath(dvar + os.sep + d.getVar("base_libdir")=
)=0A=
@@ -955,6 +966,9 @@ python split_and_strip_files () {=0A=
                 if file.endswith(".ko") and file.find("/lib/modules/") !=
=3D -1:=0A=
                     kernmods.append(file)=0A=
                     continue=0A=
+                if isStaticLib(file):=0A=
+                    staticlibs.append(file)=0A=
+                    continue=0A=
=0A=
                 # Skip debug files=0A=
                 if debugappend and file.endswith(debugappend):=0A=
@@ -1033,6 +1047,10 @@ python split_and_strip_files () {=0A=
             # Only store off the hard link reference if we successfully sp=
lit!=0A=
             splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)=0A=
=0A=
+        if debugsrcdir:=0A=
+            for file in staticlibs:=0A=
+                append_source_info(file, sourcefile, d)=0A=
+=0A=
         # Hardlink our debug symbols to the other hardlink copies=0A=
         for ref in inodes:=0A=
             if len(inodes[ref]) =3D=3D 1:=0A=
--=0A=
2.11.0=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

