Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1A4617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:20:24 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s31GKJYA013075
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 18:20:24 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Tue, 1 Apr 2014 18:20:19 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] eglibc_2.19: Make ppc e300c3 benefit from 603e
	sqrt optimizations
Thread-Index: Ac9NxkXK38dpqOuOTzSNR/kbJcdOyQ==
Date: Tue, 1 Apr 2014 16:20:18 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3AAA2B@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: [PATCH 1/2] eglibc_2.19: Make ppc e300c3 benefit from 603e sqrt optimizations
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
X-List-Received-Date: Tue, 01 Apr 2014 16:20:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tested on PowerPC MPC5125.=0A=
=0A=
Signed-off-by: Mats Karrman <mats.karrman@tritech.se>=0A=
---=0A=
 meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch |    7 +++++++=
=0A=
 1 file changed, 7 insertions(+)=0A=
=0A=
diff --git a/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch b/m=
eta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch=0A=
index 037feeb..689b79c 100644=0A=
--- a/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch=0A=
+++ b/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch=0A=
@@ -1477,6 +1477,13 @@ Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc3=
2/603e/fpu/Implies=0A=
 +++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies=0A=
 @@ -0,0 +1 @@=0A=
 +powerpc/powerpc32/603e/fpu=0A=
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies=
=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+--- /dev/null=0A=
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies=0A=
+@@ -0,0 +1,2 @@=0A=
++# e300c3 is a variant of 603e so use the same optimizations for sqrt=0A=
++powerpc/powerpc32/603e/fpu=0A=
 Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies=
=0A=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
 --- /dev/null=0A=
-- =0A=
1.7.10.4=0A=

