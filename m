Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id BCB6177507;
	Sat, 11 Mar 2017 23:29:52 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id p77so6649472ywg.0;
	Sat, 11 Mar 2017 15:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ogqxUeabCbJi5ewzaYkEt3td49LzlKj6XhlCCQQWODk=;
	b=NxMzM3iTwKIBc/HEnMoT3Qi6O9VXQs+628QqjAR8R2/jYidPgHhYVRg0VKllqQ/wdG
	ZI9mfPJ4HpBz4vU+QEE4Bt8xNXVbwu988Gq1e7z0Z8Cu7hED79wUWfZTweqk0pzMkz6P
	I77sXfRDd0Ps1FzWTgJnQaehNLGiVQe7Myxr+zR/kKuuvbq1s38vvsOJxqvl3h+1twlu
	XVuvUEAevZ6joN7PBSyXTL8/XywL0cAJTlNngNH3ASXamA03B+re8VEF7zEQGOd/49ZS
	BezscUqyvmJOo9MlUOPZ17rB2/ydKuEejen29JAGocWmksHwM9GYYb2pX2JI/NuG2jJE
	Lv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=ogqxUeabCbJi5ewzaYkEt3td49LzlKj6XhlCCQQWODk=;
	b=KSfj0RpUsZxZiceVRPoaP1B54gCvoCscLxjxP7idqppQwi6jutIO5RMMx9NcBGVh+x
	x5J/Z/dnTsJ/Kaelh1TzW1Apk/S/ErtX36oUoIRcHSyUvfpOlVBQPJE3BFYLCQHN9Mba
	41tv1Hb4yFdIOJdbk2eei5+zKi+/NA50uTKJRs/mUcsGtNRMSZKFP91vm6jGCWxzgTFJ
	i/NqE2A061iA84QsfAgO8r5opZ792JKPCUuYu6nPP6BVNcoGTobU1ysqKvfPGgj1RjNQ
	gETfdITvt7KItckJeQoJFc+ACbPZIn4/mqCyG0LPy7QOYX9lUj8OfS5+cCXHRPvuCOPn
	t0eA==
X-Gm-Message-State: AMke39m9ifk4lJmRk5gyw6yEIGwcSVxkXUVsWLKOiuYFb/Ka6lqHxX4afFWL5ORBHssfxbSiozgRWSHLuSXQHw==
X-Received: by 10.37.74.138 with SMTP id x132mr10960032yba.40.1489274993349;
	Sat, 11 Mar 2017 15:29:53 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.174.25 with HTTP; Sat, 11 Mar 2017 15:29:52 -0800 (PST)
In-Reply-To: <20170311180253.GA3984@jama>
References: <20170311180253.GA3984@jama>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sat, 11 Mar 2017 18:29:52 -0500
X-Google-Sender-Auth: Ij4El4HGRRvsZ3sjWY0S1i74DKc
Message-ID: <CAPuovEJn-rrTfNZ9k0fkpbHuuGy0yauk_8QWrAy0c4EHMxAX4Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-03-11
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
X-List-Received-Date: Sat, 11 Mar 2017 23:29:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2017 at 1:02 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> This time the results are very inconsistent across different MACHINEs
> because they were using significantly different metadata.
>
> qemuarm is oldest 3 from 4 failures were causes by pending meta-oe
> changes which I've removed from master-next before qemux86* builds were
> restarted (after they failed badly few times).


You can add aufs-util to this list

| make: cc: Command not found

Regards,
Mark

>
> qemux86-64 is latest and contains HOSTTOOLS changes from
> oe-core/master-next that's why there is so many failures.
>
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
>
> Some of these were already merged in newer HOSTTOOLS patch currently
> in oe-core/master:
> mknod cpp readelf split gcc-ar gpg sftp
> and u-boot-mkimage should be fixed in master as well
>
> I'll merge most meta-oe changes and retrigger new round of testing,
> next time the failures should be a bit more consistent again.
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'3'|Failed tasks                     !!c=
olspan=3D'6'|Failed depencencies                    !!|Signatures          =
  !!colspan=3D'12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemuarm=
||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||li=
bdir        ||textrel       ||build-deps    ||file-rdeps    ||version-going=
-backwards       ||host-user-contaminated        ||installed-vs-shipped  ||=
unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig  =
   ||pkgname       ||
> |-
> ||2017-03-11    ||4     ||1     ||20    ||N/A   ||N/A   ||N/A   ||N/A   |=
|N/A   ||N/A   ||0     ||0             ||0             ||0             ||0 =
            ||3             ||0             ||1             ||0            =
 ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Failed tasks 2017-03-11 =3D=3D
>
> INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/pyro/log.report.20170311_062851.log
>
> =3D=3D=3D common () =3D=3D=3D
>
> =3D=3D=3D common-x86 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxgues=
tdrivers_5.1.14.bb:do_install
>
> =3D=3D=3D qemuarm (4) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorren=
t_0.13.6.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/rapidjson/rapidjson_1.1.=
0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb:do_inst=
all
>     * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile
>
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>
> =3D=3D=3D qemux86_64 (19) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_compil=
e
>     * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4=
.bb:do_compile
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
>
> =3D=3D=3D Number of failed tasks (25) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 4     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/pyro/log.world.qemuarm.20170307_025324.log/ || http://errors.yoctoproject=
.org/Errors/Build/33300/
> |-
> || qemux86      || 1     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/pyro/log.world.qemux86.20170309_121824.log/ || http://errors.yoctoproject=
.org/Errors/Build/33551/
> |-
> || qemux86_64   || 20    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/pyro/log.world.qemux86-64.20170311_042112.log/ || http://errors.yoctoproj=
ect.org/Errors/Build/33631/
> |}
>
> =3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D
>
> =3D=3D=3D QA issues (4) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||0     ||version-going-backwards
> |-
> ||1     ||host-user-contaminated
> |-
> ||3     ||file-rdeps
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.sig=
natures.20170307_235322.log/
>
> No issues detected
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

