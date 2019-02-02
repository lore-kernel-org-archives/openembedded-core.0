Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1B71879D6A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 19:30:24 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id w25so8929328otm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 11:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3//21EWVW/NOAgM7VVZ2tJQvOixVq8oGWyFSDMAcHUs=;
	b=qzVuru06JXGSsDtNdFyGeowHFRL5ckwHduW4Kk7xEr0mSroH5l1vNaDIIYkw2+1X5p
	SmfM3WjDbtsClXGV17xzmysww8nwRTafD6o0m8DTToK8UkJadJYdYivO+e9m4zvsBKH5
	MbW9x8lbbKkf0HfI1OODLpeeAmFnxySjZqxKIOF6xFYOsmNWDjF/Io9DeCoB0WSEClVt
	CTf+YdBQbOFGupMqu9wED5XhPqK3Db7vB71vth1xwOGjWxWuOOp2FtZ2XH0ncqZcclNO
	HMxHk8l5reMIZxb/oDOnphzRjrxStvVRKaSXAx6rG5RZ/zpV250QMKIi6hnC9dK2VJex
	PP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3//21EWVW/NOAgM7VVZ2tJQvOixVq8oGWyFSDMAcHUs=;
	b=lAQ8Bvs8Z0zfdImX39R3WO9GmGHDzMfFlu1isfdvUgeNE1g8v9K9zRUROx10Axul50
	32AAn71VU3OnUGpJorW0WDyjZXZeF61pEN4AtDBGtW/ttPrAiP1bdhVh/WGmJBs9X5io
	+/CHnd1jo/Ja7JzP/8TDfaGM+h7wIyJ5ZgV/gkrxuEHkFTkBZ4/byuJVr/wztTfDBDXq
	tLZTgHRdcttJ2Qr+78Rd3ODtrGETCge1glOCm+yA+mOP2neWQcRslX1MeRVNvDUJSqkc
	c/Hy9unsyDSxsHxpwICsb55UGVZBFQku4WfjUd57PxSVX3d14/Ws3jymKKDXkvmF8b5l
	QLJg==
X-Gm-Message-State: AJcUukevi/QhP6HA+dK3r4xXEpPjkW/t9F4ZPFH9My1UJuRJLi3Vy/Lx
	ID5OiRilZFk/gScYAVrs6zAkirt/NWhIoXzkiTY=
X-Google-Smtp-Source: ALg8bN4GgY5BKKnVO9D2NarbjV7TFez7hbMH6aaTP4JjY9MqSkbt4ml9gbP3cxv8BZPBMRKADbtjTxPcXysU6idOOu8=
X-Received: by 2002:a9d:69d7:: with SMTP id v23mr33260961oto.96.1549135825926; 
	Sat, 02 Feb 2019 11:30:25 -0800 (PST)
MIME-Version: 1.0
References: <0912A04B-78C4-4788-B6A0-FDE2E061F0B9@netbsd.org>
In-Reply-To: <0912A04B-78C4-4788-B6A0-FDE2E061F0B9@netbsd.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Feb 2019 20:30:14 +0100
Message-ID: <CANNYZj_AuWu6OxfUpXnsAhSyJ8AOPtJbOYv3K0wE8yt0m4yNvA@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: do_prepare_recipe_sysroot: The file /usr/bin/instmodsh is installed by both perl-native and extutils-makemaker-perl-native, aborting
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
X-List-Received-Date: Sat, 02 Feb 2019 19:30:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In cases like this I would dig deeper and find out *why* these two
components want to install binaries with the same name, how the
binaries differ (if they do), and what do desktop distros do about the
situation. I typically view patches that add 'blind' use of
update-alternatives as treating symptoms rather than the issue, but I
prefer not to fight against it :)

Alex

On Sat, 2 Feb 2019 at 18:38, Jens Rehsack <sno@netbsd.org> wrote:
>
> Hi,
>
> I'm trying to get some recipes building after perl-update, but I'm strugg=
eling for:
>
> ERROR: plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 do_prepare_=
recipe_sysroot: The file /usr/bin/instmodsh is installed by both perl-nativ=
e and extutils-makemaker-perl-native, aborting
> ERROR: plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 do_prepare_=
recipe_sysroot: Function failed: extend_recipe_sysroot
> ERROR: Logfile of failure stored in: /home/sno/gpw-community-bsp/gpw-yoct=
o-platform/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/plack-middleware-fix=
missingbodyinredirect-perl/0.12-r0/temp/log.do_prepare_recipe_sysroot.23078
>
> Logfile contains:
> DEBUG: Executing python function do_prepare_recipe_sysroot
> DEBUG: Executing python function extend_recipe_sysroot
> NOTE: Direct dependencies are ['virtual:native:/home/sno/gpw-community-bs=
p/sources/poky/meta/recipes-devtools/qemu/qemu_3.1.0.bb:do_populate_sysroot=
', '/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/perl-san=
ity/perl_5.28.1.bb:do_populate_sysroot', '/home/sno/gpw-community-bsp/sourc=
es/poky/meta/recipes-devtools/gcc/gcc-cross_8.2.bb:do_populate_sysroot', 'v=
irtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-devel/e=
xtutils-makemaker-perl/extutils-makemaker-perl_7.34.bb:do_populate_sysroot'=
, '/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/gcc/gcc-r=
untime_8.2.bb:do_populate_sysroot', '/home/sno/gpw-community-bsp/sources/po=
ky/meta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot', 'virtual:nat=
ive:/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/perl-san=
ity/perl_5.28.1.bb:do_populate_sysroot', '/home/sno/gpw-community-bsp/sourc=
es/poky/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb:do_populate_sy=
sroot', 'virtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recip=
es-www/http-message-perl/http-message-perl_6.18.bb:do_populate_sysroot']
> ERROR: The file /usr/bin/instmodsh is installed by both perl-native and e=
xtutils-makemaker-perl-native, aborting
> DEBUG: Python function extend_recipe_sysroot finished
> DEBUG: Python function do_prepare_recipe_sysroot finished
> ERROR: Function failed: extend_recipe_sysroot
>
> Typically such an issue is fixed by:
>
> poky:
>
> diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/reci=
pes-devtools/perl-sanity/perl_5.28.1.bb
> index 71653feb53..f66f96919e 100644
> --- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
> +++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
> @@ -168,6 +168,39 @@ perl_package_preprocess () {
>              ${PKGD}${libdir}/perl5/config.sh
>  }
>
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY =3D "100"
> +
> +ALTERNATIVE_${PN} =3D "corelist cpan enc2xs encguess h2ph h2xs instmodsh=
 json_pp libnetcfg \
> +                     piconv pl2pm pod2html pod2man pod2text pod2usage po=
dchecker podselect \
> +                     prove ptar ptardiff ptargrep shasum splain xsubpp z=
ipdetails"
> +ALTERNATIVE_LINK_NAME[corelist] =3D "${bindir}/corelist"
> +ALTERNATIVE_LINK_NAME[cpan] =3D "${bindir}/cpan"
> +ALTERNATIVE_LINK_NAME[enc2xs] =3D "${bindir}/enc2xs"
> +ALTERNATIVE_LINK_NAME[encguess] =3D "${bindir}/encguess"
> +ALTERNATIVE_LINK_NAME[h2ph] =3D "${bindir}/h2ph"
> +ALTERNATIVE_LINK_NAME[h2xs] =3D "${bindir}/h2xs"
> +ALTERNATIVE_LINK_NAME[instmodsh] =3D "${bindir}/instmodsh"
> +ALTERNATIVE_LINK_NAME[json_pp] =3D "${bindir}/json_pp"
> +ALTERNATIVE_LINK_NAME[libnetcfg] =3D "${bindir}/libnetcfg"
> +ALTERNATIVE_LINK_NAME[piconv] =3D "${bindir}/piconv"
> +ALTERNATIVE_LINK_NAME[pl2pm] =3D "${bindir}/pl2pm"
> +ALTERNATIVE_LINK_NAME[pod2html] =3D "${bindir}/pod2html"
> +ALTERNATIVE_LINK_NAME[pod2man] =3D "${bindir}/pod2man"
> +ALTERNATIVE_LINK_NAME[pod2text] =3D "${bindir}/pod2text"
> +ALTERNATIVE_LINK_NAME[pod2usage] =3D "${bindir}/pod2usage"
> +ALTERNATIVE_LINK_NAME[podchecker] =3D "${bindir}/podchecker"
> +ALTERNATIVE_LINK_NAME[podselect] =3D "${bindir}/podselect"
> +ALTERNATIVE_LINK_NAME[prove] =3D "${bindir}/prove"
> +ALTERNATIVE_LINK_NAME[ptar] =3D "${bindir}/ptar"
> +ALTERNATIVE_LINK_NAME[ptardiff] =3D "${bindir}/ptardiff"
> +ALTERNATIVE_LINK_NAME[ptargrep] =3D "${bindir}/ptargrep"
> +ALTERNATIVE_LINK_NAME[shasum] =3D "${bindir}/shasum"
> +ALTERNATIVE_LINK_NAME[splain] =3D "${bindir}/splain"
> +ALTERNATIVE_LINK_NAME[xsubpp] =3D "${bindir}/xsubpp"
> +ALTERNATIVE_LINK_NAME[zipdetails] =3D "${bindir}/zipdetails"
> +
>  require perl-ptest.inc
>
>  FILES_${PN} =3D "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} =
${libdir}/libperl.so* \
>
> meta-cpan:
>
> diff --git a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-per=
l_7.34.bb b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7=
.34.bb
> index a9d21b1..7a958ed 100644
> --- a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.=
bb
> +++ b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.=
bb
> @@ -41,4 +41,11 @@ do_install_prepend_class-native() {
>         export PERL5LIB=3D"${PERL_ARCHLIB}"
>  }
>
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY =3D "90"
> +
> +ALTERNATIVE_${PN} =3D "instmodsh"
> +ALTERNATIVE_LINK_NAME[instmodsh] =3D "${bindir}/instmodsh"
> +
>  BBCLASSEXTEND =3D "native"
>
> But unfortunately it doesn't show any effect.
>
> Any ideas?
>
> Best regards
> --
> Jens Rehsack - rehsack@gmail.com
>

