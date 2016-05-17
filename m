Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-09.clustermail.de (good-out-09.clustermail.de
	[212.223.36.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1DB606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 13:48:09 +0000 (UTC)
Received: from frontend-04 ([10.0.0.4] helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtps
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>) id 1b2eW8-0002Km-DA
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2016 14:54:37 +0200
Received: from [217.6.33.234] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa (TLSv1.2:AES256-SHA:256)
	(Exim 4.84_2) (envelope-from <Daniel.Klauer@gin.de>)
	id 1b2eW8-0003Ow-5G for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2016 14:54:32 +0200
Received: from Win2012-02.gin-domain.local (192.168.1.12) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Tue, 17 May 2016 14:54:31 +0200
Received: from Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90]) by
	Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90%12]) with mapi
	id 15.00.1130.005; Tue, 17 May 2016 14:54:31 +0200
From: "Klauer, Daniel" <Daniel.Klauer@gin.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: smartpm: Don't ignore error if RPM transaction fails without
	problems
Thread-Index: AQHRsDtANli+hgUYC0ONri+JdCfiKg==
Date: Tue, 17 May 2016 12:54:30 +0000
Message-ID: <6411d38c0db541d7b6acf7736b005a31@Win2012-02.gin-domain.local>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.1.219]
x-brightmail-tracker: H4sIAAAAAAAAC+NgFnrDqsTGxXJgBSOPbruIdbjB8d/HDnFY/FzzlM2BMYAhijUzLym/IoE1o+fcHNaC8x2MFW+6njA2MO6r62Lk5BAS2MMoceWAfxcjF5B9klFi7/G3bCAJZgFTiStfG1kgbEWJC/cawGw2AV2Jc+3vWUFsEYFoiaUzZrJ3MXJwCAv4SSw4aw0RDpV4s2giM4StJ7Fj1kR2EFtCQEfi76JGsFYWAVWJS1s3gq3iFfCSeHjmChOIzSggK9HZ8I4JYq24xK0n85kgegUkluw5zwxhK0n03n4HFQ+ReHr1HwvEHEGJkzOfsEDEzST2PlgCVaMnceffZ6h4oMThtg2MICdLAL149X0wRNhA4t1amBJjiZUb/zNC2LYSe2ZMZIIod5aYd6MeIuwk8abjLSuErS2x/dU+VpgPN11bBTVGXuL/vftQtqPElXf9bBC2osSn201sExjVZiGF8yykcJ6F5PlZSB5bwMiyilE6PDPPyMDQSNfASC89M083JT83MTNPLyc/OTFnEyM0JexgfPTZ9RCjJAeTkijvy4tW4UJ8SfkplRmJxRnxRaU5qcWHGCU4eJREeF8KWocL8RYXJOYWZ6bDpGQ4OJQkeD+BpASLUtNTK9Iyc0pSiyDSpxglpcR5f4MkBUD6Mkrz4HKXGEWlhHmf8QHleApSi3IzSyDitxiFOR4yCbHk5eelSgGdyAAEGoyvGMU5GJWEed+BzOLJzCuBO+EV0HVMQNdNMLMAua4kESEl1cAoskRu2pQIC91QoYVlms7KqVl/yh3unmjti5Bk36Qnp1st+9vx2WtLjltmG1ict0w381QQOBJ4r3ERo9Y5/+m8bJb35FV/y2jqLp57c6+bqfqRLaGNGhZhTHVNm9MvtP3/f3Pyzi1iBZ3C/a9nBDn4zF1VF+vA3C5hv7Hbdi5zfCzfHPevCkosxRmJhlrMRcWJAMkve6p/AwAA
MIME-Version: 1.0
Subject: smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Tue, 17 May 2016 13:48:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

SmartPM could misinterpret RPM transaction error as success,=0A=
if ts.run() (RPM Python API) returns an empty problems list.=0A=
=0A=
This could happen for example if the RPM database is partially corrupted=0A=
such that the transaction does not have any problems like conflicts or=0A=
missing dependencies, but still can't be committed.=0A=
=0A=
The added patch fixes the problem in the upstream sources;=0A=
one of the existing patches has to be adjusted to still apply.=0A=
=0A=
Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>=0A=
---=0A=
 .../python/python-smartpm/smart-attempt.patch      |  6 +--=0A=
 .../smart-rpm-transaction-failure-check.patch      | 57 ++++++++++++++++++=
++++=0A=
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +=0A=
 3 files changed, 61 insertions(+), 3 deletions(-)=0A=
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-t=
ransaction-failure-check.patch=0A=
=0A=
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patc=
h b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch=0A=
index ec98e03..5aedc88 100644=0A=
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch=0A=
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch=0A=
@@ -36,7 +36,7 @@ index 9bbd952..ba6405a 100644=0A=
          finally:=0A=
              del getTS.ts=0A=
              cb.grabOutput(False)=0A=
-+            if probs and sysconf.has("attempt-install", soft=3DTrue):=0A=
++            if (probs is not None) and sysconf.has("attempt-install", sof=
t=3DTrue):=0A=
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
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm-transact=
ion-failure-check.patch b/meta/recipes-devtools/python/python-smartpm/smart=
-rpm-transaction-failure-check.patch=0A=
new file mode 100644=0A=
index 0000000..a740ddd=0A=
--- /dev/null=0A=
+++ b/meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-fai=
lure-check.patch=0A=
@@ -0,0 +1,57 @@=0A=
+From 0c55d7e18f40465e95e8e4bf22af01f5d4477d3c Mon Sep 17 00:00:00 2001=0A=
+From: Daniel Klauer <daniel.klauer@gin.de>=0A=
+Date: Wed, 11 May 2016 17:22:49 +0200=0A=
+Subject: [PATCH] rpm: Don't ignore transaction error with empty problems l=
ist=0A=
+=0A=
+SmartPM could misinterpret RPM transaction error as success,=0A=
+if ts.run() (RPM Python API) returns an empty problems list,=0A=
+because of incorrect check for None which treated empty list=0A=
+to be the same as None when it has different meaning.=0A=
+=0A=
+ts.run() returns:=0A=
+* None in case of success=0A=
+* problems list in case of error, may be empty=0A=
+(look at rpmts_Run() in rpm-5.4.14/python/rpmts-py.c [1])=0A=
+=0A=
+"if mylist" is not good enough to check for error here, because it will=0A=
+treat an empty list as "false" because its len() =3D=3D 0 [2].=0A=
+=0A=
+ts.check() seems to be different (it's ok for it to return an empty list),=
=0A=
+but for consistency it should be made clear that it can return either None=
,=0A=
+an empty list or a non-empty list.=0A=
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
+diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py=0A=
+index 9bbd952..635f726 100644=0A=
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
+                     name1 =3D "%s-%s-%s" % prob[0]=0A=
+@@ -247,7 +247,7 @@ class RPMPackageManager(PackageManager):=0A=
+             del getTS.ts=0A=
+             cb.grabOutput(False)=0A=
+             prog.setDone()=0A=
+-            if probs:=0A=
++            if probs is not None:=0A=
+                 raise Error, "\n".join([x[0] for x in probs])=0A=
+             prog.stop()=0A=
+ =0A=
+-- =0A=
+1.9.1=0A=
+=0A=
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/reci=
pes-devtools/python/python-smartpm_git.bb=0A=
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
-- =0A=
1.9.1=0A=
=0A=

