Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3D6D60119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 00:37:34 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id z36so187992qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 17:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yKMWQWwL/Z8hoeYi3Tc8oUctLTjbCYSfktZE8MMOB3k=;
	b=uSh1J/QBAt+ZmueP62lhZ6LmF9ucLGlTvE2zesHTeDw8BJhAjtL0QrzQTdNPhgh28m
	+L9rFKMNuIESwG1TgsU5P12KGzxr2HPcEUl5j5UxJc7fbewbWt7CTPoKpVwiL5HvPFNE
	Cu38htN4WrcRDT0pfu3+O/5jqN3Qq0GB+n7z+YdBUQqZFV/BpkrP6PeUINcsh4TWrCK8
	+s4uce+pTVyZHKFWEk/TqPOfofthNPXE+TOYP9mZo3izn24xVsoct+ngh4wB6vXIOfhL
	mWSCYR3FkEY7PLLht1MHVwrD2gre9Op6/g4G+Al1yD2nsnl1goXOupu1I1zqETV4Z0/f
	cN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yKMWQWwL/Z8hoeYi3Tc8oUctLTjbCYSfktZE8MMOB3k=;
	b=l+gD7j6a4lRTQIvJTiOu7qX0ovEfdAliKQTAJGLgeF4G1w1RiYvGctJqLqBc2SNkc4
	YTCs+zUadnYQk0qKsoKJnb8IGe0DKE1GKiHdPLt6B/hdbq6iGdWUK1o03lLEniAmGl5q
	51rmeAPapMwzlNfT1X7h2ktCJP579cyiCvpiLGymP/8nBAVbHu4LVVvTi6/3V9fPMjJj
	SmMRSPwH5SgHqkOimpu7ONz6JFOkGJiCCmjMSZE9JypOh8NrnVISB7hFpr+M3r/JEkz2
	+28Z11s1ollJUlLuPWfHld3A6/oD/e45m3+4wfB3im8EFGM8qFC1GYrti7obCJL4UKgj
	t0fQ==
X-Gm-Message-State: ALyK8tLYqBGDLU94s7BCidkNgLSfl4+KayV11pEKzdMe6nuj1jq9yHjr8RHo9qAUG9hNLL8xngaJ0AYefApTkA==
X-Received: by 10.200.52.197 with SMTP id x5mr39432625qtb.41.1467851854812;
	Wed, 06 Jul 2016 17:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 17:37:05 -0700 (PDT)
In-Reply-To: <565533bd47b30072b1961aba56cf05316e2d19b2.1467848566.git.paul.eggleton@linux.intel.com>
References: <cover.1467848566.git.paul.eggleton@linux.intel.com>
	<565533bd47b30072b1961aba56cf05316e2d19b2.1467848566.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 17:37:05 -0700
Message-ID: <CAMKF1sqUmM6x+G-xA2OC-9u0Wt2nVyeaF6DRnc0jW0x9+fBdMg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] gcc: add runtime packages to RRECOMMENDS
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
X-List-Received-Date: Thu, 07 Jul 2016 00:37:35 -0000
Content-Type: text/plain; charset=UTF-8

looks good to me

On Wed, Jul 6, 2016 at 4:48 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> In order to use certain features of gcc, you need the corresponding
> runtime library. It seems to me that these ought to be installed by
> default when installing the compiler since they are required if certain
> command line options are used, so add them to RRECOMMENDS. I used
> RRECOMMENDS since some of these packages may or may not exist depending
> on architecture and build options; additionally it makes it possible to
> use BAD_RECOMMENDATIONS if you really want to exclude them.
>
> The impact of this isn't too bad in the context of an image providing
> on-target compilation - about a 30MB increase in size for an image
> containing gcc and g++.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 37c5c62..f436fa2 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -42,6 +42,10 @@ FILES_${PN} = "\
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
>  "
>  INSANE_SKIP_${PN} += "dev-so"
> +RRECOMMENDS_${PN} += "\
> +    libssp \
> +    libssp-dev \
> +"
>
>  FILES_${PN}-dev = "\
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
> @@ -69,10 +73,19 @@ FILES_g77-symlinks = "\
>      ${bindir}/g77 \
>      ${bindir}/f77 \
>  "
> +RRECOMMENDS_g77 = "\
> +    libg2c \
> +    libg2c-dev \
> +"
> +
>  FILES_gfortran = "\
>      ${bindir}/${TARGET_PREFIX}gfortran \
>      ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
>  "
> +RRECOMMENDS_gfortran = "\
> +    libquadmath \
> +    libquadmath-dev \
> +"
>  FILES_gfortran-symlinks = "\
>      ${bindir}/gfortran \
>      ${bindir}/f95"
> @@ -98,6 +111,12 @@ FILES_g++-symlinks = "\
>      ${bindir}/c++ \
>      ${bindir}/g++ \
>  "
> +RRECOMMENDS_g++ = "\
> +    libstdc++ \
> +    libstdc++-dev \
> +    libatomic \
> +    libatomic-dev \
> +"
>
>  FILES_${PN}-doc = "\
>      ${infodir} \
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

