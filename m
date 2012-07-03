Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mikhailboiko85@gmail.com>) id 1SmAV3-00071w-0Q
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 23:19:09 +0200
Received: by yhjj56 with SMTP id j56so7622918yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 14:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9TBHDWjhP8Xie7x96Y+edRq4MeR1hzcCZ9qVAZhdPdk=;
	b=F8fyFgEnXqctowMhXECgoYXNTcmpZvx7VkhBVVjH9VZlktgb4K7HqPLEqkXTwDR4Z5
	3t8oq+BHrGwcr/4yK/f/ez7YwtYlsDuu1H28Iz/dYXQOSTcCo7KY1Ogzmtn0e+64OskE
	0DEAGbsIVO2KaCum4Wqckq3CKzvI9jqPt7Anqi8kifLflh0Fp0TpRkzfn7GOEFbQshgV
	ItpQVfkKJPFPy7ErmTjyi2YS7Rux1kXLAFVcRRFm1FL3ZDDIJJrb0ryxiGE6wp85icky
	h/uz2o+XQhvWtarNNd1+wLMNNsphurebmxshq91c/+yyAr2NSVCbPryQFtZ+9oJLVnw6
	TzJA==
MIME-Version: 1.0
Received: by 10.42.29.202 with SMTP id s10mr9748899icc.1.1341349685870; Tue,
	03 Jul 2012 14:08:05 -0700 (PDT)
Received: by 10.64.13.45 with HTTP; Tue, 3 Jul 2012 14:08:05 -0700 (PDT)
Date: Wed, 4 Jul 2012 00:08:05 +0300
Message-ID: <CAOWBBJyFCwj0j9T9jiGrjQncxC+9MNR3-OWjPKuD00H_EzPSKA@mail.gmail.com>
From: Mikhail Boiko <mikhailboiko85@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: (No subject)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 21:19:09 -0000
Content-Type: multipart/alternative; boundary=20cf3040ee568bc0fe04c3f34fac

--20cf3040ee568bc0fe04c3f34fac
Content-Type: text/plain; charset=ISO-8859-1

From 86ad9569e30de537451fe0a4731ef57d92810d28 Mon Sep 17 00:00:00 2001
From: Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Wed, 4 Jul 2012 00:03:17 +0300
Subject: [PATCH] Additional CMake include search path

Specify additional include search path for CMake via build-in
CMAKE_INCLUDE_PATH variable.
For example, to add freetype2 include dir you should add this line to you
receipe
OECMAKE_INCLUDE_PATH_append = "${STAGING_INCDIR}/freetype2"

Signed-off-by: Mikhail Boiko <mikhailboiko85@gmail.com>
---
 meta/classes/cmake.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index eda45dd..2f90e36 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -65,6 +65,9 @@ set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})

+# additional cmake include search path
+set( CMAKE_INCLUDE_PATH ${OECMAKE_INCLUDE_PATH} )
+
 EOF
 }

-- 
1.7.9.5

--20cf3040ee568bc0fe04c3f34fac
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>From 86ad9569e30de537451fe0a4731ef57d92810d28 Mon Sep 17 00:00:00 2001=
</div><div>From: Mikhail Boiko &lt;<a href=3D"mailto:mikhailboiko85@gmail.c=
om">mikhailboiko85@gmail.com</a>&gt;</div><div>Date: Wed, 4 Jul 2012 00:03:=
17 +0300</div>
<div>Subject: [PATCH] Additional CMake include search path</div><div><br></=
div><div>Specify additional include search path for CMake via build-in CMAK=
E_INCLUDE_PATH variable.</div><div>For example, to add freetype2 include di=
r you should add this line to you receipe</div>
<div>OECMAKE_INCLUDE_PATH_append =3D &quot;${STAGING_INCDIR}/freetype2&quot=
;</div><div><br></div><div>Signed-off-by: Mikhail Boiko &lt;<a href=3D"mail=
to:mikhailboiko85@gmail.com">mikhailboiko85@gmail.com</a>&gt;</div><div>---=
</div>
<div>=A0meta/classes/cmake.bbclass | =A0 =A03 +++</div><div>=A01 file chang=
ed, 3 insertions(+)</div><div><br></div><div>diff --git a/meta/classes/cmak=
e.bbclass b/meta/classes/cmake.bbclass</div><div>index eda45dd..2f90e36 100=
644</div>
<div>--- a/meta/classes/cmake.bbclass</div><div>+++ b/meta/classes/cmake.bb=
class</div><div>@@ -65,6 +65,9 @@ set( CMAKE_MODULE_PATH ${STAGING_DATADIR}=
/cmake/Modules/ )</div><div>=A0# add for non /usr/lib libdir, e.g. /usr/lib=
64</div>
<div>=A0set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})</div><div>=A0</di=
v><div>+# additional cmake include search path</div><div>+set( CMAKE_INCLUD=
E_PATH ${OECMAKE_INCLUDE_PATH} )</div><div>+</div><div>=A0EOF</div><div>=A0=
}</div>
<div>=A0</div><div>--=A0</div><div>1.7.9.5</div><div><br></div>

--20cf3040ee568bc0fe04c3f34fac--
