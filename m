Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SXb9M-0003A8-6N
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 18:44:32 +0200
Received: by eaal1 with SMTP id l1so2947206eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=NFepoACAGUu9F/9x0wsqZHrfIsMTa4CgMAbOBUkvVjo=;
	b=Ii2klPib3oz/ijNQakyqBiZ4lmFaI9xDHbWDPJVZPsfw03yWktRMCkADhUqb33GNi5
	aTPxqmmCQMD5pq51nqFw59J02eipBsippcM6VmrKL/AO0USlMaiL/ckE6g785GYn0vRV
	R2qmC0ru1JBBE1O5vmniWh2PGADBX9ahok+1vwriO4gr6rjDqn5tG9X3VcYAJKIuOyFW
	uwAR7hawvJOX2wWUgdgXVD6DLhEiW3fheeswMSN0zgbCmof4flyVXpOHN5suPAsN56WA
	Hso9HvJDcjFK0BEyH9LUSK4sMk5tl2g7mmvPWEUCLxAKhhPb+yBFnbxJAtV/zQNe7iJB
	duuQ==
Received: by 10.14.37.70 with SMTP id x46mr9164eea.146.1337877260975; Thu, 24
	May 2012 09:34:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 24 May 2012 09:33:50 -0700 (PDT)
In-Reply-To: <1337853612.8248.103.camel@ted>
References: <1337853612.8248.103.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 May 2012 09:33:50 -0700
Message-ID: <CAMKF1spW6Q+CPG-Hx6jc-1aEXBMoanAykt5EZsu-=gJJvyof-w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Drop old/stale/broken csl recipe
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
X-List-Received-Date: Thu, 24 May 2012 16:44:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2012 at 3:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The patches this recipe refers to don't exist so nobody can have
> been using this so lets just remove it.

Looks good to me

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1=
.bb b/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
> deleted file mode 100644
> index 8ab1e7f..0000000
> --- a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
> +++ b/dev/null
> @@ -1,3 +0,0 @@
> -require binutils_csl-arm-2008q1.bb
> -require binutils-cross.inc
> -PR =3D "r1"
> diff --git a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb b/=
meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
> deleted file mode 100644
> index 182b01f..0000000
> --- a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
> +++ b/dev/null
> @@ -1,25 +0,0 @@
> -require binutils.inc
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -SRC_URI =3D "\
> - =C2=A0 =C2=A0 http://www.codesourcery.com/gnu_toolchains/arm/portal/pac=
kage2553/public/arm-none-eabi/arm-2008q1-126-arm-none-eabi.src.tar.bz2 \
> - =C2=A0 =C2=A0 file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patc=
h \
> - =C2=A0 =C2=A0 file://binutils-uclibc-100-uclibc-conf.patch \
> - =C2=A0 =C2=A0 file://110-arm-eabi-conf.patch \
> - =C2=A0 =C2=A0 file://binutils-uclibc-300-001_ld_makefile_patch.patch \
> - =C2=A0 =C2=A0 file://binutils-uclibc-300-006_better_file_error.patch \
> - =C2=A0 =C2=A0 file://binutils-uclibc-300-012_check_ldrunpath_length.pat=
ch \
> - =C2=A0 =C2=A0 file://docs_hack2.patch \
> - =C2=A0 =C2=A0 "
> -
> -PV =3D "2.18+csl-arm-2008q1-126"
> -
> -S =3D "${WORKDIR}/binutils-stable"
> -
> -do_unpack2() {
> - =C2=A0 =C2=A0 =C2=A0 cd ${WORKDIR}
> - =C2=A0 =C2=A0 =C2=A0 tar -xvjf ./arm-2008q1-126-arm-none-eabi/binutils-=
2008q1-126.tar.bz2
> -}
> -
> -addtask unpack2 after do_unpack before do_patch
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


