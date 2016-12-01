Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2C66FF72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 22:40:26 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p9so11674006vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 14:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=W00BsxnHCvvnlhCoJ/UYS+Q23HcN+D0sKd8vUFJ9V+s=;
	b=z3wSbFSq/5F1i0G3CP27YWvA2HJcdHYlKbJ2TxtGqoGqN9TyWr3Sbre7LLFrkFhpry
	sFkrPCMNzACbsHX0Tm6FNjG6vAk3b80Y2QzO1bV8SIF9wc5nRhNAPatqrZvPRDDXaDUJ
	roITrvqhbs7saDytMRV+hcSxZKufqArHfGyBOhYLM/lRcYhsUx5mi3etHpfubBaOPBNr
	3Wigr4aUjYGyfJruU0d9UfBwDQqqYc8ITPYaWsOwey5+QyZAZf2GvGWSSZCkTG1ykLCS
	Og04jvU3VaN2495EBZADMWUExECvuNhfOSacgfwdrnhYEykBI9SKH8B/NzLJrxr3hVEb
	E5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=W00BsxnHCvvnlhCoJ/UYS+Q23HcN+D0sKd8vUFJ9V+s=;
	b=RTEo13Q7cLoBUdQ4Ps9yphdaU1ktQkk+VpWdDBfDqqYVfsJXlP5/rL0uJ+Bc4qsizg
	e9Oj4qtQsLvfcjObFrLmQHH/jAf7mWUxIYwIKAQGaBBsUMoIflrEH0cb3vf/jAzrP6Rk
	0IKM9DWx93Ltn7ehELB41P76UneUHJn8jS9KYzr46Kn9M/yYLhV4sZJsOuYRjFeHjqcp
	0gEEN99eGPU5cFrnLuA8zR0oKJLaeuXmNw7pH/EJsMu+7U/Iw9421nT8rGSU0ShY2qbJ
	staikJQO5gMr4FdN4/aDV/FiwayX172pNNcQl69PUhTWBDkOMPHJNkHrRnG44iv+AK2q
	Z6Dg==
X-Gm-Message-State: AKaTC00CytowEwEFPJCDEp3H7DjbvL5FGv+ndwFKnplLLiBVAmS3IxPl45eSOtPWE1UBcWUStsnmVfSbEEHQtA==
X-Received: by 10.31.197.195 with SMTP id v186mr15253689vkf.84.1480632027791; 
	Thu, 01 Dec 2016 14:40:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 14:39:57 -0800 (PST)
In-Reply-To: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 14:39:57 -0800
Message-ID: <CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Thu, 01 Dec 2016 22:40:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2016 at 8:34 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Some distributions (like opensuse421) supported by the project
> comes with older gcc releases, -fstack-protector=3Dstrong is supported
> by GCC>=3D4.9.
>
> This causes a build failure when install perl-native from a sstate that
> comes from a machine supporting -fstack-protector=3Dstrong [1].
>
> So disable usage of this flag in perl-native builds, this patch could
> be removed when all supported distros comes with GCC>=3D4.9.


Instead of disabling it. Can it be made detectable during configure.

>
> [YOCTO #10338]
>
> [1] http://errors.yoctoproject.org/Errors/Details/109589/
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-devtools/perl/perl-native_5.24.0.bb   |   1 +
>  ...emove-fstack-protector-strong-for-native-.patch | 103 +++++++++++++++=
++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/perl/0001-Configure-Remove=
-fstack-protector-strong-for-native-.patch
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/reci=
pes-devtools/perl/perl-native_5.24.0.bb
> index af2ad7b..b1f0179 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
> @@ -11,6 +11,7 @@ SRC_URI +=3D "\
>             file://debian/errno_ver.diff \
>             file://dynaloaderhack.patch \
>             file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
> +           file://0001-Configure-Remove-fstack-protector-strong-for-nati=
ve-.patch \
>            "
>
>  SRC_URI[md5sum] =3D "59456ae4bd4b06cb6e57cb19a3b2d349"
> diff --git a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack=
-protector-strong-for-native-.patch b/meta/recipes-devtools/perl/perl/0001-=
Configure-Remove-fstack-protector-strong-for-native-.patch
> new file mode 100644
> index 0000000..7391ac5
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protec=
tor-strong-for-native-.patch
> @@ -0,0 +1,103 @@
> +Some distributions (like opensuse421) supported by the project
> +comes with older gcc releases, -fstack-protector=3Dstrong is supported
> +by GCC>=3D4.9.
> +
> +This causes a build failure when install perl-native from a sstate that
> +comes from a machine supporting -fstack-protector=3Dstrong [1].
> +
> +So disable usage of this flag in perl-native builds, this patch could
> +be removed when all supported distros comes with GCC>=3D4.9.
> +
> +[YOCTO #10338]
> +
> +Upstream-status: Inappropriate [configuration]
> +
> +[1] http://errors.yoctoproject.org/Errors/Details/109589/
> +
> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> +---
> + Configure | 54 ------------------------------------------------------
> + 1 file changed, 54 deletions(-)
> +
> +diff --git a/Configure b/Configure
> +index efbdcfd..d5bd98c 100755
> +--- a/Configure
> ++++ b/Configure
> +@@ -5468,30 +5468,6 @@ default|recommended)
> +               eval $checkccflag
> +               ;;
> +       esac
> +-
> +-      # on x86_64 (at least) we require an extra library (libssp) in th=
e
> +-      # link command line. This library is not named, so I infer that i=
t is
> +-      # an implementation detail that may change. Hence the safest appr=
oach
> +-      # is to add the flag to the flags passed to the compiler at link =
time,
> +-      # as that way the compiler can do the right implementation depend=
ant
> +-      # thing. (NWC)
> +-      case "$osname" in
> +-      amigaos) ;; # -fstack-protector builds but doesn't work
> +-      *)      case "$gccversion" in
> +-              ?*)     set stack-protector-strong -fstack-protector-stro=
ng
> +-                      eval $checkccflag
> +-                      case "$dflt" in
> +-                      *-fstack-protector-strong*) ;; # It got added.
> +-                      *) # Try the plain/older -fstack-protector.
> +-                         set stack-protector -fstack-protector
> +-                         eval $checkccflag
> +-                         ;;
> +-                      esac
> +-                      ;;
> +-              esac
> +-              ;;
> +-      esac
> +-      ;;
> + esac
> +
> + case "$mips_type" in
> +@@ -5634,21 +5610,6 @@ case "$ldflags" in
> +       ;;
> + *) dflt=3D"$ldflags";;
> + esac
> +-# See note above about -fstack-protector
> +-case "$ccflags" in
> +-*-fstack-protector-strong*)
> +-      case "$dflt" in
> +-      *-fstack-protector-strong*) ;; # Don't add it again
> +-      *) dflt=3D"$dflt -fstack-protector-strong" ;;
> +-      esac
> +-      ;;
> +-*-fstack-protector*)
> +-      case "$dflt" in
> +-      *-fstack-protector*) ;; # Don't add it again
> +-      *) dflt=3D"$dflt -fstack-protector" ;;
> +-      esac
> +-      ;;
> +-esac
> +
> + : Try to guess additional flags to pick up local libraries.
> + for thislibdir in $libpth; do
> +@@ -8571,21 +8532,6 @@ EOM
> +           ''|' ') dflt=3D'none' ;;
> +       esac
> +
> +-      case "$ldflags" in
> +-          *-fstack-protector-strong*)
> +-              case "$dflt" in
> +-                  *-fstack-protector-strong*) ;; # Don't add it again
> +-                  *) dflt=3D"$dflt -fstack-protector-strong" ;;
> +-              esac
> +-              ;;
> +-          *-fstack-protector*)
> +-              case "$dflt" in
> +-                  *-fstack-protector*) ;; # Don't add it again
> +-                  *) dflt=3D"$dflt -fstack-protector" ;;
> +-              esac
> +-              ;;
> +-      esac
> +-
> +       rp=3D"Any special flags to pass to $ld to create a dynamically lo=
aded library?"
> +       . ./myread
> +       case "$ans" in
> +--
> +2.1.4
> +
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

