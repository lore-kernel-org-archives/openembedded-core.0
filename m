Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id EB25977722;
	Tue, 14 Mar 2017 15:30:03 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id u108so126369542wrb.3;
	Tue, 14 Mar 2017 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k7tc2Wbq/U2lgUnapLyB4R2wwakzYa34dfe0bAAdBG4=;
	b=cEy2tmqrVHCcdqIYSUIdqvvGLOArO7dZ7/amMPPJLfQhil9KoYlJx0VShR5S6Jl2lo
	G1bf+2JtLucxk1jNhYEI5jgTN9dwX4UP6H/q8EKCwDgkHQQUbDpMTT4Do3p6TevJ50fW
	sld3iV2yilsCwWM/bHRyUe9PSc0+iaGml7jbs7mp2pTbWzYEk7lnSzH6Lpz9xnhy9yiL
	fVeFF623kr0MKnRzPlVkugNOptHMvLTeLSs8wrfWMzx61yR09bvps0VoTsHyo7C1xnBO
	w3ZnnsfjoBs7aFIpijn0K2fOZWqhy45dlFrCHCpyDjNyS7WZdiMQyKFMGcniNlmT46KZ
	NQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k7tc2Wbq/U2lgUnapLyB4R2wwakzYa34dfe0bAAdBG4=;
	b=kgvJrWaDmGTJxB5JkbuRTftF6FDBIX6iWBegUVPXk5qWQyO/BNadLN/d74cLBlFk4J
	nYTeQ/8pFhF7bMDgbz6o1Lb2DmWjcnO7+lCRhVJmplDSH5kF+YtQt07zwraAZsKZove8
	kRejU4GgQeJkVwXi9JH8bOP7jW3Q4kWiw+vfDXfRs62vscMBVZyPIGrR2RP6jFEObEj6
	mumh1iHvyXx7agd0yWTAtmMmudooxqI50timhpiTjwW3g+oHBIXYH2TpZy8HgLlWEP/2
	nuelScYAOiULU0sfOI4nHfw/ai6jz3oFRXlZZf2W3Uwf2S3tXHwuJkk9EgQA165yApKe
	ANuQ==
X-Gm-Message-State: AMke39kvYpOJpvMRpc2Z7lg3rB3UufaY3JkbQcUD1L6fqqTsDjsORlmAIwe70xLlboEGqg==
X-Received: by 10.223.138.252 with SMTP id z57mr32397892wrz.110.1489505403869; 
	Tue, 14 Mar 2017 08:30:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	32sm29427688wrr.64.2017.03.14.08.30.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Mar 2017 08:30:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Mar 2017 16:30:08 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170314153008.GB3917@jama>
References: <20170311180253.GA3984@jama>
MIME-Version: 1.0
In-Reply-To: <20170311180253.GA3984@jama>
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: Re: State of bitbake world, Failed tasks 2017-03-11
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
X-List-Received-Date: Tue, 14 Mar 2017 15:30:04 -0000
X-Groupsio-MsgNum: 94714
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2017 at 07:02:53PM +0100, Martin Jansa wrote:
> This time the results are very inconsistent across different MACHINEs
> because they were using significantly different metadata.
>=20
> qemuarm is oldest 3 from 4 failures were causes by pending meta-oe
> changes which I've removed from master-next before qemux86* builds were
> restarted (after they failed badly few times).
>=20
> qemux86-64 is latest and contains HOSTTOOLS changes from
> oe-core/master-next that's why there is so many failures.
>=20
> From the failures I see following tools which we need to either add
> to HOSTTOOLS or provide with added -native dependency:
> cc      - tcsh                - http://errors.yoctoproject.org/Errors/Det=
ails/135201/
> cc      - u-boot-mkimage      - http://errors.yoctoproject.org/Errors/Det=
ails/135203/
> cc      - toybox              - http://errors.yoctoproject.org/Errors/Det=
ails/135210/
> cc      - yasm                - http://errors.yoctoproject.org/Errors/Det=
ails/135214/
> cpp     - mkelfimage          - http://errors.yoctoproject.org/Errors/Det=
ails/135211/
> clear   - lprng               - http://errors.yoctoproject.org/Errors/Det=
ails/135207/
> gcc-ar  - ovmf                - http://errors.yoctoproject.org/Errors/Det=
ails/135202/
> join    - netcf               - http://errors.yoctoproject.org/Errors/Det=
ails/135208/
> join    - fontforge           - http://errors.yoctoproject.org/Errors/Det=
ails/135209/
> mknod   - initramfs-live-boot - http://errors.yoctoproject.org/Errors/Det=
ails/135213/
> nl      - dash                - http://errors.yoctoproject.org/Errors/Det=
ails/135215/
> nl      - klibc               - http://errors.yoctoproject.org/Errors/Det=
ails/135198/
> openssl - openflow            - http://errors.yoctoproject.org/Errors/Det=
ails/135216/
> readelf - firefox             - http://errors.yoctoproject.org/Errors/Det=
ails/135212/
> size    - iptraf              - http://errors.yoctoproject.org/Errors/Det=
ails/135204/
> yes     - libnet-ssleay-perl  - http://errors.yoctoproject.org/Errors/Det=
ails/135197/
> zcat    - scsirastools        - http://errors.yoctoproject.org/Errors/Det=
ails/135205/

scsirastools also needs nroff:

| nroff -man mdadm.8 > mdadm.man
| /bin/sh: 1: nroff: not found
| make[3]: *** [mdadm.man] Error 127


>=20
> Some of these were already merged in newer HOSTTOOLS patch currently
> in oe-core/master:
> mknod cpp readelf split gcc-ar gpg sftp
> and u-boot-mkimage should be fixed in master as well
>=20
> I'll merge most meta-oe changes and retrigger new round of testing,
> next time the failures should be a bit more consistent again.
>=20
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed de=
pencencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||=
min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	=
||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	|=
|unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgnam=
e	||=09
> |-
> ||2017-03-11	||4	||1	||20	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||=
0		||0		||0		||3		||0		||1		||0		||0		||0		||0		||0		||=09
> |}
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2017-03-11 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/pyro/log.report.20170311_062851.log
>=20
> =3D=3D=3D common () =3D=3D=3D
>=20
> =3D=3D=3D common-x86 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxgues=
tdrivers_5.1.14.bb:do_install
>=20
> =3D=3D=3D qemuarm (4) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorren=
t_0.13.6.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/rapidjson/rapidjson_1.1.=
0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb:do_inst=
all
>     * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (19) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_compile
>     * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4=
=2Ebb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-stati=
c-utils_2.0.4.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-protocols/openflow/openfl=
ow_git.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git.b=
b:do_configure
>     * meta-openembedded/meta-oe/recipes-core/toybox/toybox_0.7.2.bb:do_co=
nfigure
>     * meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb:d=
o_compile
>     * meta-openembedded/meta-oe/recipes-extended/dash/dash_0.5.8.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_=
configure
>     * meta-openembedded/meta-oe/recipes-extended/scsirastools/scsirastool=
s_1.6.4.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_2016=
1012.bb:do_configure
>     * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_=
1.65.bb:do_configure
>     * openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb=
:do_compile
>     * openembedded-core/meta/recipes-core/initrdscripts/initramfs-live-bo=
ot_1.0.bb:do_install
>     * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile
>     * openembedded-core/meta/recipes-devtools/mkelfimage/mkelfimage_git.b=
b:do_compile
>     * openembedded-core/meta/recipes-devtools/yasm/yasm_1.3.0.bb:do_compi=
le
>=20
> =3D=3D=3D Number of failed tasks (25) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemuarm.20170307_025324.log/ || http://errors.yoctoproject.org/Er=
rors/Build/33300/
> |-
> || qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemux86.20170309_121824.log/ || http://errors.yoctoproject.org/Er=
rors/Build/33551/
> |-
> || qemux86_64 	|| 20	 || http://logs.nslu2-linux.org/buildlogs/oe/world/p=
yro/log.world.qemux86-64.20170311_042112.log/ || http://errors.yoctoproject=
=2Eorg/Errors/Build/33631/
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (4) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||build-deps
> |-
> ||0	||installed-vs-shipped
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||symlink-to-sysroot
> |-
> ||0	||textrel
> |-
> ||0	||unknown-configure-option
> |-
> ||0	||version-going-backwards
> |-
> ||1	||host-user-contaminated
> |-
> ||3	||file-rdeps
> |}
>=20
>=20
>=20
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>=20
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.sig=
natures.20170307_235322.log/
>=20
> No issues detected
>=20
>=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMgMfgAKCRA3VSO3ZXaA
HD7wAJ9CQyTtPQHvngnLAOiJkiwDZ0ULuACgqgOKYM+PKqc9ZfA3HDQh6ZcSmEQ=
=Dkj+
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
