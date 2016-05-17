Return-Path: <Daniel.Klauer@gin.de>
X-Greylist: delayed 3062 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 May 2016 13:45:40 UTC
Received: from good-out-15.clustermail.de (good-out-15.clustermail.de
	[212.223.36.19])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC1D731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 13:45:40 +0000 (UTC)
Received: from frontend-04 ([10.0.0.4] helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtps
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>) id 1b2eas-00048z-II
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2016 14:59:32 +0200
Received: from [217.6.33.234] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa (TLSv1.2:AES256-SHA:256)
	(Exim 4.84_2) (envelope-from <Daniel.Klauer@gin.de>)
	id 1b2eas-0006DK-95 for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2016 14:59:26 +0200
Received: from Win2012-02.gin-domain.local (192.168.1.12) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Tue, 17 May 2016 14:59:25 +0200
Received: from Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90]) by
	Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90%12]) with mapi
	id 15.00.1130.005; Tue, 17 May 2016 14:59:25 +0200
From: "Klauer, Daniel" <Daniel.Klauer@gin.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] smartpm: Remove unnecessary error reporting improvement
	patch
Thread-Index: AQHRsDvwM7S7Ibj4+kSn6csAjSg/Sw==
Date: Tue, 17 May 2016 12:59:25 +0000
Message-ID: <525010b9b4084c5f8a456c30bc84cc41@Win2012-02.gin-domain.local>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.1.219]
x-brightmail-tracker: H4sIAAAAAAAAC+NgFnrFqsTGxXJgBSOP7lpR63CDpm83DnFY/FzzlM2BMYAhijUzLym/IoE1Y8XLI0wFvzsYKxa/n8vWwListouRk0NIYA+jxNSN8hD2SUaJP6udQGxmAVOJK18bWSBsRYkL9xrAbDYBXYlz7e9ZQWwRgWiJpTNmsoPYwgJ+EkuP32TrYuQAiodKPHunCGHqSfRdjQGpkBDQkfi7qBGsk0VAVaLlxnJGEJtXwEtixs9TbCA2o4CsRGfDOyaIreISt57MZ4LoFZBYsuc8M4StJNF7+x1UPETi5Io5zBBzBCVOznzCAhE3k9j7YAlUjZ5Ez4GlbBB2oMTBb3cYQU6TAPrw6vtgiLCBxLu1n6FajSVWbvzPCGHbSuyZMZEJotxZYt6Neoiwk8SbjresELa2xPZX+1hhPtx0bRXUGHmJ//fuQ9mOElfe9UNdoCjx6XYT2wRGtVlIwTwLKZhnIXl+FpLHFjCyrGKUDs/MMzIwNNI1MNJLz8zTTcnPTczM08vJT07M2cQITQc7GB99dj3EKMnBpCTK+/KiVbgQX1J+SmVGYnFGfFFpTmrxIUYJDh4lEd4zwtbhQrzFBYm5xZnpMCkZDg4lCd5AkJRgUWp6akVaZk5JahFE+hSjpJQ4bxhIUgCkL6M0Dy53iVFUSpj3GR9QjqcgtSg3swQifotRmOMhkxBLXn5eqhTQiQxAoMH4ilGcg1FJmHcGyCyezLwSuBNeAV3HBHTdBDMLkOtKEhFSUg2M7cZvly1eMaWspLP1eo9C3fL3pxgYqg6t2+Z8ZcusjEkWay8VhOj+dIqdaiJj+T6o7Pa7qY2/f2+9vzcjrYjl6RrP6QX82jeKN6dzfuqteFj9ZFdH2d/Y7szOIvvO50LdRQU9e5pn/3m8QPq8+4ej2df0P5ayM045zHu+ieGsdvG3vNW+uo6dSizFGYmGWsxFxYkArsfyKn0DAAA=
MIME-Version: 1.0
Subject: [PATCH] smartpm: Remove unnecessary error reporting improvement patch
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
X-List-Received-Date: Tue, 17 May 2016 13:45:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The error reporting improvements were merged upstream (smartpm 406541f569)=
=0A=
and refactored later (smartpm 20af0aac33), yet a part of the patch was=0A=
kept here (oe-core 5fc580fc44).=0A=
=0A=
Due to the upstream refactoring the patch still applies cleanly, but it=0A=
isn't actually needed. The added changes are duplicate or dead code.=0A=
=0A=
Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>=0A=
---=0A=
 .../smart-improve-error-reporting.patch            | 91 ------------------=
----=0A=
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 -=0A=
 2 files changed, 92 deletions(-)=0A=
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-impro=
ve-error-reporting.patch=0A=
=0A=
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-improve-erro=
r-reporting.patch b/meta/recipes-devtools/python/python-smartpm/smart-impro=
ve-error-reporting.patch=0A=
deleted file mode 100644=0A=
index b82265b..0000000=0A=
--- a/meta/recipes-devtools/python/python-smartpm/smart-improve-error-repor=
ting.patch=0A=
+++ /dev/null=0A=
@@ -1,91 +0,0 @@=0A=
-Improve error reporting in smart=0A=
-=0A=
-Add code to check proper command line arguments for various=0A=
-smart commands. Exit with error if erroneous/additional arguments=0A=
-are given in the command line.=0A=
-=0A=
-Upstream-Status: Pending=0A=
-=0A=
-Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>=0A=
-=0A=
-diff --git a/smart/util/optparse.py b/smart/util/optparse.py=0A=
-index 6fff1bc..f445a3b 100644=0A=
---- a/smart/util/optparse.py=0A=
-+++ b/smart/util/optparse.py=0A=
-@@ -70,6 +70,8 @@ import sys, os=0A=
- import types=0A=
- import textwrap=0A=
- from gettext import gettext as _=0A=
-+from smart import Error=0A=
-+import re=0A=
- =0A=
- def _repr(self):=0A=
-     return "<%s at 0x%x: %s>" % (self.__class__.__name__, id(self), self)=
=0A=
-@@ -710,6 +712,12 @@ class Option:=0A=
-             self.action, self.dest, opt, value, values, parser)=0A=
- =0A=
-     def take_action(self, action, dest, opt, value, values, parser):=0A=
-+        # Keep all the options in the command line in the '_given_opts' a=
rray=0A=
-+        # This will be used later to validate the command line=0A=
-+        given_opts =3D getattr(parser.values, "_given_opts", [])=0A=
-+        user_opt =3D re.sub(r"^\-*", "", opt).replace("-", "_")=0A=
-+        given_opts.append(user_opt)=0A=
-+        setattr(parser.values, "_given_opts", given_opts)=0A=
-         if action =3D=3D "store":=0A=
-             setattr(values, dest, value)=0A=
-         elif action =3D=3D "store_const":=0A=
-@@ -821,6 +829,54 @@ class Values:=0A=
-             setattr(self, attr, value)=0A=
-         return getattr(self, attr)=0A=
- =0A=
-+    # Check if the given option has the specified number of arguments=0A=
-+    # Raise an error if the option has an invalid number of arguments=0A=
-+    # A negative number for 'nargs' means "at least |nargs| arguments are=
 needed"=0A=
-+    def check_args_of_option(self, opt, nargs, err=3DNone):=0A=
-+        given_opts =3D getattr(self, "_given_opts", [])=0A=
-+        if not opt in given_opts:=0A=
-+            return=0A=
-+        values =3D getattr(self, opt, [])=0A=
-+        if type(values) !=3D type([]):=0A=
-+            return=0A=
-+        if nargs < 0:=0A=
-+            nargs =3D -nargs=0A=
-+            if len(values) >=3D nargs:=0A=
-+                return=0A=
-+            if not err:=0A=
-+                if nargs =3D=3D 1:=0A=
-+                    err =3D _("Option '%s' requires at least one argument=
") % opt=0A=
-+                else:=0A=
-+                    err =3D _("Option '%s' requires at least %d arguments=
") % (opt, nargs)=0A=
-+            raise Error, err=0A=
-+        elif nargs =3D=3D 0:=0A=
-+            if len( values ) =3D=3D 0:=0A=
-+                return=0A=
-+            raise Error, err=0A=
-+        else:=0A=
-+            if len(values) =3D=3D nargs:=0A=
-+                return=0A=
-+            if not err:=0A=
-+                if nargs =3D=3D 1:=0A=
-+                    err =3D _("Option '%s' requires one argument") % opt=
=0A=
-+                else:=0A=
-+                    err =3D _("Option '%s' requires %d arguments") % (opt=
, nargs)=0A=
-+            raise Error, err=0A=
-+=0A=
-+    # Check that at least one of the options in 'actlist' was given as an=
 argument=0A=
-+    # to the command 'cmdname'=0A=
-+    def ensure_action(self, cmdname, actlist):=0A=
-+        given_opts =3D getattr(self, "_given_opts", [])=0A=
-+        for action in actlist:=0A=
-+            if action in given_opts:=0A=
-+                return=0A=
-+        raise Error, _("No action specified for command '%s'") % cmdname=
=0A=
-+=0A=
-+    # Check if there are any other arguments left after parsing the comma=
nd line and=0A=
-+    # raise an error if such arguments are found=0A=
-+    def check_remaining_args(self):=0A=
-+        if self.args:=0A=
-+            raise Error, _("Invalid argument(s) '%s'" % str(self.args))=
=0A=
- =0A=
- class OptionContainer:=0A=
- =0A=
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/reci=
pes-devtools/python/python-smartpm_git.bb=0A=
index 0d37dae..5acfb0a 100644=0A=
--- a/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
@@ -15,7 +15,6 @@ SRC_URI =3D "\=0A=
           git://github.com/smartpm/smart.git \=0A=
           file://smartpm-rpm5-nodig.patch \=0A=
           file://smart-recommends.patch \=0A=
-          file://smart-improve-error-reporting.patch \=0A=
           file://smart-channelsdir.patch \=0A=
           file://smart-rpm-transaction-failure-check.patch \=0A=
           file://smart-attempt.patch \=0A=
-- =0A=
1.9.1=0A=
=0A=

