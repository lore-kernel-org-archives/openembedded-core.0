Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QA2Ba-0004JU-Hs
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Apr 2011 17:40:54 +0200
Received: by fxm19 with SMTP id 19so630080fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2011 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=bplC49Sw9oOlCyH+dXuADhN/R0NAHwI26uCrYNB0A/8=;
	b=XDLDb6q0g4rrlM1T53SMQAGLj+4faMiMlPPPgP6Wi+JfWSqbbNgsCiexm5Vz3JD5p1
	i4PCsfKsLBME9Wr315+P1rEmo4V/Gc54+Yr/MDzFytXDqfN7B8IHSIEHkFpBn58ELTNU
	tQKNKU6byDBPn+R3DAvM/mDZkG9QyHNGyZMsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=VZi+uPaJisaGenvG56MAhcFfJLHZrkzzh/AbdzjJ3PhIne1TEpxSQvay8lzt5/hFS6
	phUuKZfEC+Evj1c+5dPbZfYOIsR0P/XV/5K6PhQ6B04YykqY+Jn2X0dRZRFItQ08kFTL
	E+i4y4iRSb0IVxb1ZmzOcdYIQbasD3RrrgKFs=
Received: by 10.223.74.83 with SMTP id t19mr1012928faj.149.1302709119196; Wed,
	13 Apr 2011 08:38:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Wed, 13 Apr 2011 08:38:09 -0700 (PDT)
In-Reply-To: <e97fe275402062a86c56f70560b9660786d07db7.1302686656.git.qing.he@intel.com>
References: <cover.1302686656.git.qing.he@intel.com>
	<e97fe275402062a86c56f70560b9660786d07db7.1302686656.git.qing.he@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Apr 2011 08:38:09 -0700
Message-ID: <BANLkTi=X7oZBjqnnrqFQe8=cca0pdtPJhQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] sat-solver: fix arch=all packages
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
X-List-Received-Date: Wed, 13 Apr 2011 15:40:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2011 at 2:26 AM, Qing He <qing.he@intel.com> wrote:
> From: Qing He <qing.he@intel.com>
>
> add a new options to set noarch archs as all so platform independent
> packages can be recognized and installed.
>

I think this patch does not belong to oe-core as it seems distro specific

> Signed-off-by: Qing He <qing.he@intel.com>
> ---
> =C2=A0.../sat-solver/sat-solver/sat-solver_poky.patch =C2=A0 =C2=A0| =C2=
=A0 19 +++++++++++++++++++
> =C2=A0meta/recipes-extended/sat-solver/sat-solver_git.bb | =C2=A0 =C2=A04=
 ++--
> =C2=A02 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.=
patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
> index b762bac..e055545 100644
> --- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
> +++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
> @@ -5,8 +5,27 @@ Add a missing "any" architecture type and update the sem=
antics to use it.
> =C2=A0Disable the built-in archpolicies structure, and replace it with on=
e
> =C2=A0we generate in the recipe.
>
> +Also add poky semantics option in CMake.
> +
> =C2=A0Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +Signed-off-by: Qing He <qing.he@intel.com>
>
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 443281e..4456a87 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -45,6 +45,11 @@ MESSAGE(STATUS "Building for Debian")
> + ADD_DEFINITIONS( -DDEBIAN -DDEBIAN_SEMANTICS)
> + ENDIF ( DEBIAN )
> +
> ++IF ( POKY )
> ++MESSAGE(STATUS "Building for Poky")
> ++ADD_DEFINITIONS( -DPOKY -DPOKY_SEMANTICS)
> ++ENDIF ( POKY )
> ++
> + IF ( MULTI_SEMANTICS )
> + MESSAGE(STATUS "Enabling multi dist support")
> + ADD_DEFINITIONS( -DMULTI_SEMANTICS)
> =C2=A0diff --git a/src/knownid.h b/src/knownid.h
> =C2=A0index 7757ae0..4b8bee7 100644
> =C2=A0--- a/src/knownid.h
> diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/re=
cipes-extended/sat-solver/sat-solver_git.bb
> index a693776..0d5a5e6 100644
> --- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
> +++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.BSD;md5=3D62272bd11c=
97396d4aaf1c41bc11f7d8"
> =C2=A0DEPENDS =3D "libcheck rpm zlib expat db"
>
> =C2=A0PV =3D "0.0-git${SRCPV}"
> -PR =3D "r8"
> +PR =3D "r9"
>
> =C2=A0SRC_URI =3D "git://gitorious.org/opensuse/sat-solver.git;protocol=
=3Dgit \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sat-solver_rpm5.patch \
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://gitorious.org/opensuse/sat-solver.gi=
t;protocol=3Dgit \
>
> =C2=A0S =3D "${WORKDIR}/git"
>
> -EXTRA_OECMAKE +=3D "-DLIB=3Dlib -DRPM5=3DRPM5"
> +EXTRA_OECMAKE +=3D "-DLIB=3Dlib -DRPM5=3DRPM5 -DPOKY=3DPOKY"
>
> =C2=A0inherit cmake pkgconfig
>
> --
> 1.7.0
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


