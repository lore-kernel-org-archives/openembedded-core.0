Return-Path: <Daniel.Klauer@gin.de>
X-Greylist: delayed 4202 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Jun 2016 12:46:34 UTC
Received: from good-out-02.clustermail.de (good-out-02.clustermail.de
	[212.223.35.18])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB886FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 12:46:34 +0000 (UTC)
Received: from frontend-05 ([10.0.0.5] helo=frontend.clustermail.de)
	by smtpout-01.clustermail.de with esmtps
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>) id 1bAblS-000096-Up
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2016 13:36:32 +0200
Received: from [217.6.33.234] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpa (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>) id 1bAblS-0007Jl-Fr
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2016 13:35:14 +0200
Received: from Win2012-02.gin-domain.local (192.168.1.12) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Wed, 8 Jun 2016 13:35:11 +0200
Received: from Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90]) by
	Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90%12]) with mapi
	id 15.00.1130.005; Wed, 8 Jun 2016 13:35:11 +0200
From: "Klauer, Daniel" <Daniel.Klauer@gin.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] smartpm: Don't ignore error if RPM transaction
	fails without problems
Thread-Index: AQHRsDtANli+hgUYC0ONri+JdCfiKp+89YIAgCEGQ4CAAZcpqg==
Date: Wed, 8 Jun 2016 11:35:10 +0000
Message-ID: <1465385710165.57577@gin.de>
References: <6411d38c0db541d7b6acf7736b005a31@Win2012-02.gin-domain.local>,
	<025101d1c0be$e4ffbea0$aeff3be0$@neuf.fr>
In-Reply-To: <025101d1c0be$e4ffbea0$aeff3be0$@neuf.fr>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.1.219]
x-brightmail-tracker: H4sIAAAAAAAAC+NgFnrNqsTGxXJgBSOP7gemiHCD38/3neK3+LnmKZsDYwBDFGtmXlJ+RQJrxt2z5xgL/h9mrDh/cxZrA+PJrYxdjJwcQgK7GSXeHhDpYuQCsk8wSqy9eZQZJMEsYCpx5WsjC4StKHHhXgOYzSagK3Gu/T0riC0iEC2xdMZMdhBbWCBN4vOeJywQ8XSJC3/Xs0HYThKbnr8Cq5cQ0JH4u6gRyObgYBFQkXi+2AokzCugIbGrq48N4p4SiVO7z4HZnAJmEqt/94HdySggK9HZ8I4J4hxxiVtP5jNBjBSQWLLnPDOErSTRe/sdVNxIYtrf5ewQ8wUlTs6EOE0CaObeB0uYQE6QENCTmDlPHsIMlDjRbwRhmkpcfR8MUWwg8W7tZ6hGY4mVG/8zQti2EntmTIQa4iwx70Y9RNhJ4k3HW6hXtSW2v9oH9/ama6ugxshL/L93n2UCo8YspFCehRTKs5C8OAvJ+QsYWVYxSodn5hkZGBrpGhjppWfm6abk5yZm5unl5Ccn5mxihCaEHYyPPrseYpTkYFIS5VV0Dw8X4kvKT6nMSCzOiC8qzUktPsQowcGjJML7gCEiXIi3uCAxtzgzHSYlw8GhJMF7CCQlWJSanlqRlplTkloEkT7FKCklzqsPkhQA6csozYPLXWIUlRLmvfsXaB9PQWpRbmYJRPwWozDHQyYhlrz8vFQpoBMZgECD8RWjOAejkjDvNpBZPJl5JXAnvAK6jgnouuVHwkGuK0lESEk1MKom7Vfy5mrYMHXaxEe/27QPB59maQx8mhJg3dCx4VpO5efINd15esFdp7aeW/zq7LrYebLXctNjeJ4sXluUvp6dg/Hm4ZWZJxuTNn9zfKT2WU/2wNYGP/nHnrf23nO7v+2jVN/9aM75a1O/LOwzeWT+mFPzy7T3/Ud3TbJgYgxd1XnobWP1LFUlluKMREMt5qLiRABDwtj3fgMAAA==
MIME-Version: 1.0
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A0C0201.575802F2.00F2, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Wed, 08 Jun 2016 12:46:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,=0A=
=0A=
I don't know the details of the attempt-install feature, but it looks like =
my patch did change the retry behaviour, due to this change in smart/backen=
ds/rpm/pm.py (in smart-attempt.patch):=0A=
-            if probs and sysconf.has("attempt-install", soft=3DTrue):=0A=
+            if (probs is not None) and sysconf.has("attempt-install", soft=
=3DTrue):=0A=
=0A=
Unlike before, this if block now sets retry =3D 1 if len(probs) =3D=3D 0. I=
t looks to me like the attempt-install feature only wants to retry in case =
it found file conflicts, and there aren't any other problems - but unfortun=
ately retry is only set back to 0 if it finds something other than file con=
flicts, the case of len(probs) =3D=3D 0 is not handled inside the if block.=
=0A=
=0A=
Is this the problem you're seeing? I think it could be fixed by reverting t=
hat one change, maybe like this:=0A=
-            if (probs is not None) and sysconf.has("attempt-install", soft=
=3DTrue):=0A=
+            # If there are file conflicts, remove conflicting packages fro=
m transaction and retry,=0A=
+            # unless there are other problems too.=0A=
+            if (probs is not None) and (len(probs) !=3D 0) and sysconf.has=
("attempt-install", soft=3DTrue):=0A=
=0A=
Daniel=0A=
________________________________________=0A=
From: Herve Jourdain <herve.jourdain@neuf.fr>=0A=
Sent: Tuesday, June 7, 2016 15:17=0A=
To: Klauer, Daniel; openembedded-core@lists.openembedded.org=0A=
Subject: RE: [OE-core] [PATCH] smartpm: Don't ignore error if RPM transacti=
on fails without problems=0A=
=0A=
Hi Daniel,=0A=
=0A=
I've just met a problem linked to that patch...=0A=
Indeed, it appears that your modifications make the original patch work as=
=0A=
intended: check if there are problems like RPMPROB_NEW_FILE_CONFLICT or=0A=
RPMPROB_FILE_CONFLICT, then remove the packages from the list of packages t=
o=0A=
apply (because it's attempt-install), then try the same transaction again..=
.=0A=
=0A=
The problem is: if not all the packages have problems, then the packages=0A=
that didn't have problems installing in the first place will now get an=0A=
error: "package already installed"!!!=0A=
And since it's not one of the problems that are handled in pm.py, it will=
=0A=
just fail...=0A=
=0A=
What do you think would be the best way to solve this: add a check for all=
=0A=
the codes linked to package already installed in the "attempt-only" check i=
n=0A=
pm.py?=0A=
Or try to cancel the whole previous transaction - and then keep on=0A=
committing the new one?=0A=
=0A=
I can generate a new patch if you want, after your guidance, or let you fix=
=0A=
it, like you prefer.=0A=
I do have an environment where I can reproduce this problem easily enough.=
=0A=
=0A=
Herve=0A=
=0A=
-----Original Message-----=0A=
From: openembedded-core-bounces@lists.openembedded.org=0A=
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=0A=
Klauer, Daniel=0A=
Sent: mardi 17 mai 2016 14:58=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] smartpm: Don't ignore error if RPM transaction=
=0A=
fails without problems=0A=
=0A=
SmartPM could misinterpret RPM transaction error as success, if ts.run()=0A=
(RPM Python API) returns an empty problems list.=0A=
=0A=
This could happen for example if the RPM database is partially corrupted=0A=
such that the transaction does not have any problems like conflicts or=0A=
missing dependencies, but still can't be committed.=0A=
=0A=
The added patch fixes the problem in the upstream sources; one of the=0A=
existing patches has to be adjusted to still apply.=0A=
=0A=
Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>=0A=
---=0A=
 .../python/python-smartpm/smart-attempt.patch      |  6 +--=0A=
 .../smart-rpm-transaction-failure-check.patch      | 57=0A=
++++++++++++++++++++++=0A=
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +=0A=
 3 files changed, 61 insertions(+), 3 deletions(-)  create mode 100644=0A=
meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-failure-c=
h=0A=
eck.patch=0A=
=0A=
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patc=
h=0A=
b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch=0A=
index ec98e03..5aedc88 100644=0A=
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch=0A=
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch=0A=
@@ -36,7 +36,7 @@ index 9bbd952..ba6405a 100644=0A=
          finally:=0A=
              del getTS.ts=0A=
              cb.grabOutput(False)=0A=
-+            if probs and sysconf.has("attempt-install", soft=3DTrue):=0A=
++            if (probs is not None) and sysconf.has("attempt-install",=0A=
soft=3DTrue):=0A=
 +                def remove_conflict(pkgNEVR):=0A=
 +                    for key in changeset.keys():=0A=
 +                        if pkgNEVR =3D=3D str(key):=0A=
@@ -67,8 +67,8 @@ index 9bbd952..ba6405a 100644=0A=
 +                        retry =3D 0=0A=
 +=0A=
              prog.setDone()=0A=
--            if probs:=0A=
-+            if probs and (not retry):=0A=
+-            if probs is not None:=0A=
++            if (probs is not None) and (not retry):=0A=
                  raise Error, "\n".join([x[0] for x in probs])=0A=
              prog.stop()=0A=
 +            if retry and len(changeset):=0A=
diff --git=0A=
a/meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-failure=
-=0A=
check.patch=0A=
b/meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-failure=
-=0A=
check.patch=0A=
new file mode 100644=0A=
index 0000000..a740ddd=0A=
--- /dev/null=0A=
+++ b/meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-=0A=
+++ failure-check.patch=0A=
@@ -0,0 +1,57 @@=0A=
+From 0c55d7e18f40465e95e8e4bf22af01f5d4477d3c Mon Sep 17 00:00:00 2001=0A=
+From: Daniel Klauer <daniel.klauer@gin.de>=0A=
+Date: Wed, 11 May 2016 17:22:49 +0200=0A=
+Subject: [PATCH] rpm: Don't ignore transaction error with empty=0A=
+problems list=0A=
+=0A=
+SmartPM could misinterpret RPM transaction error as success, if=0A=
+ts.run() (RPM Python API) returns an empty problems list, because of=0A=
+incorrect check for None which treated empty list to be the same as=0A=
+None when it has different meaning.=0A=
+=0A=
+ts.run() returns:=0A=
+* None in case of success=0A=
+* problems list in case of error, may be empty (look at rpmts_Run() in=0A=
+rpm-5.4.14/python/rpmts-py.c [1])=0A=
+=0A=
+"if mylist" is not good enough to check for error here, because it will=0A=
+treat an empty list as "false" because its len() =3D=3D 0 [2].=0A=
+=0A=
+ts.check() seems to be different (it's ok for it to return an empty=0A=
+list), but for consistency it should be made clear that it can return=0A=
+either None, an empty list or a non-empty list.=0A=
+=0A=
+[1] http://rpm5.org/cvs/fileview?f=3Drpm/python/rpmts-py.c&v=3D1.111.2.3=
=0A=
+[2] https://docs.python.org/2/library/stdtypes.html#truth-value-testing=0A=
+=0A=
+Upstream-Status: Pending=0A=
+=0A=
+Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>=0A=
+---=0A=
+ smart/backends/rpm/pm.py | 4 ++--=0A=
+ 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
+=0A=
+diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py index=0A=
+9bbd952..635f726 100644=0A=
+--- a/smart/backends/rpm/pm.py=0A=
++++ b/smart/backends/rpm/pm.py=0A=
+@@ -208,7 +208,7 @@ class RPMPackageManager(PackageManager):=0A=
+         force =3D sysconf.get("rpm-force", False)=0A=
+         if not force:=0A=
+             probs =3D ts.check()=0A=
+-            if probs:=0A=
++            if (probs is not None) and (len(probs) !=3D 0):=0A=
+                 problines =3D []=0A=
+                 for prob in probs:=0A=
+                     name1 =3D "%s-%s-%s" % prob[0] @@ -247,7 +247,7 @@=0A=
+class RPMPackageManager(PackageManager):=0A=
+             del getTS.ts=0A=
+             cb.grabOutput(False)=0A=
+             prog.setDone()=0A=
+-            if probs:=0A=
++            if probs is not None:=0A=
+                 raise Error, "\n".join([x[0] for x in probs])=0A=
+             prog.stop()=0A=
+=0A=
+--=0A=
+1.9.1=0A=
+=0A=
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
b/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
index d9a908d..0d7f88c 100644=0A=
--- a/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
@@ -17,6 +17,7 @@ SRC_URI =3D "\=0A=
           file://smart-recommends.patch \=0A=
           file://smart-improve-error-reporting.patch \=0A=
           file://smart-channelsdir.patch \=0A=
+          file://smart-rpm-transaction-failure-check.patch \=0A=
           file://smart-attempt.patch \=0A=
           file://smart-attempt-fix.patch \=0A=
           file://smart-add-for-rpm-ignoresize-check.patch \=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
=0A=
=0A=
=0A=
=0A=

