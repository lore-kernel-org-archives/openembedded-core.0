Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.9018.1612631459700574436
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 09:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sk6oE6Y5;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 19so76211qkc.13
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 09:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zjmcTXb2DCoNBUYiyw71soKj8ynLnV5Cs2kwPxDXxM0=;
        b=sk6oE6Y5U2KNM6rt/HCUDdW/NoQ1tyTGUZRnZIzAkmbX2VRkBuJlTPcNl5ZUaqkEq1
         3/o23Lx4u8wg86b/5WWxxUauTT5SKnpNpXzTckWG0iFRu/D3v2rzobpkU4EVXlM4rmrd
         aknecBPL7G4jpotL064iQrnRS+usV8yiX7eWiCNPyShAnhyKLxTfsEkkogQYCSvF+DbO
         zfVVpQpMhsP+D6aj9vHuoc4ezSLt5wSK03aQi10tZvOpXMyutz8CeXxI6KH/kaYMRaP2
         FGNOrVUlQ4Lss/uJtwhvZohdVv/Wa3rLVnfErtXoBbGGBW2jQRTjmSLDojYYtcgvgeWr
         MuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjmcTXb2DCoNBUYiyw71soKj8ynLnV5Cs2kwPxDXxM0=;
        b=aExQb0FVyLGAI42E8e1s1mbx93653KKxTxExDif6o346dKuAosFWLghUuU41P6+euE
         2YlNkurnXDIGHx/ZeyS01ySzsA63h1u/oKFaBatSyQslI5OCI5i10rbjYkE4yB0hGIMF
         mCGq1QoqyWW47klq9wPzSHrZHoqf5hyJNp/hMTA3EUKu8Pp7jXtq1QsR37A7ELJwJXvU
         XmAb4vqnxWvZKwBhNeVLdzS5eespypuLRBpbWPclnEi8ZwIzev17hW2We7jUhi6thhQq
         NZ0ylZjSPex58MprKvL3SQSUhiO236bGxlE0xDLSQZrUppAsr3XEkKU74EiMRmWxKSfC
         TUrA==
X-Gm-Message-State: AOAM533HHuzpga1eFCg4w6YYoScv723Cm6UlymqlF5fmhKgLdCJVsudY
	mfGf4UyEge6D2aD0b6TrawgBfAD6UudiCMMeMVM=
X-Google-Smtp-Source: ABdhPJzJvnO2G31t7OoX+XYHFADJv5d+COdmdD+rjJ00UFTXGPjJ6uCYLEtZvJVJzXXfQG6cwkxK537AsMOu/lEd+nA=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr9501562qke.474.1612631458821;
 Sat, 06 Feb 2021 09:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org> <20210206090415.1707868-7-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210206090415.1707868-7-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Feb 2021 09:10:32 -0800
Message-ID: <CAMKF1srq4=H0obWk=YSGJNdz=Myu4idmh4mqty=_1h5cG5aXsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/10] autoconf: upgrade to 2.7.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"

we still have few failures left in meta-openembedded

https://errors.yoctoproject.org/Errors/Build/116503/

This is a call to community to be aware and chime in with fixes
this should not stop us from merging this patch after reviewing

On Sat, Feb 6, 2021 at 1:04 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> After too many years, autoconf has made a new release.  On the whole it
> is compatible with previous releases, but some macros are more specific
> about what they expose so minor tweaks to configure.ac may be required.
>
> autoconf also now invokes intltoolize, gtkdocize, and copies
> config.sub/guess, so there is less work for autotools.bbclass to do.
>
> - AC_HEADER_MAJOR-port-to-glibc-2.25.patch
> - add_musl_config.patch
> - autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
> - autoreconf-gnuconfigize.patch
> - check-automake-cross-warning.patch
> - config_site.patch
> - fix_path_xtra.patch
> - performance.patch
> Drop a number of patches which have been integrated upstream.
>
> - man-host-perl.patch
> Don't use the target perl path when building documentation at build time:
>
> - no-man.patch
> Don't build documentation in native builds to avoid further build
> dependencies.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../AC_HEADER_MAJOR-port-to-glibc-2.25.patch  | 101 ---------------
>  .../autoconf/autoconf/add_musl_config.patch   |  26 ----
>  ...in-shebangs-with-modern-use-warnings.patch | 120 ------------------
>  .../autoconf/autoreconf-exclude.patch         | 113 +++++++----------
>  .../autoconf/autoreconf-gnuconfigize.patch    |  38 ------
>  .../autotest-automake-result-format.patch     |  32 ++---
>  .../check-automake-cross-warning.patch        |  34 -----
>  .../autoconf/autoconf/config_site.patch       |  40 ------
>  .../autoconf/autoconf/fix_path_xtra.patch     | 120 ------------------
>  .../autoconf/autoconf/man-host-perl.patch     |  24 ++++
>  .../autoconf/autoconf/no-man.patch            |  21 +++
>  .../autoconf/autoconf/performance.patch       |  60 ---------
>  .../autoconf/autoconf/preferbash.patch        |  39 ++++--
>  .../autoconf/autoconf/program_prefix.patch    |  36 +++---
>  .../remove-usr-local-lib-from-m4.patch        |  28 ++--
>  .../{autoconf_2.69.bb => autoconf_2.71.bb}    |  32 ++---
>  16 files changed, 180 insertions(+), 684 deletions(-)
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/AC_HEADER_MAJOR-port-to-glibc-2.25.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-gnuconfigize.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/config_site.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch
>  create mode 100644 meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
>  create mode 100644 meta/recipes-devtools/autoconf/autoconf/no-man.patch
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/performance.patch
>  rename meta/recipes-devtools/autoconf/{autoconf_2.69.bb => autoconf_2.71.bb} (69%)
>

---snip---

> -SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
> -SRC_URI[sha256sum] = "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd4c2969"
> -
> -SRC_URI_append_class-native = " file://fix_path_xtra.patch"
> +SRC_URI[sha256sum] = "431075ad0bf529ef13cb41e9042c542381103e80015686222b8a9d4abef42a1c"
>
>  RDEPENDS_${PN} = "m4 gnu-config \
>                   perl \
> @@ -69,11 +60,14 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
>
>  EXTRA_OECONF += "ac_cv_path_M4=m4 ac_cv_prog_TEST_EMACS=no"
>
> -do_configure() {
> -       # manually install a newer config.guess/.sub
> +# As autoconf installs its own config.* files, ensure that they're always up to date.
> +update_gnu_config() {
>         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/build-aux
>         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/build-aux
> +}
> +do_configure[prefuncss] += "update_gnu_config"
                              ^^^^
prefuncss seems to be a typo here

>
> +do_configure_class-native() {
>         oe_runconf
>  }
>
> --
> 2.27.0
>
>
> 
>
