Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8C2779CA;
	Sat, 11 Mar 2017 18:02:53 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id g10so81770980wrg.2;
	Sat, 11 Mar 2017 10:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=C51AezziuaFEam3NlHdTVgyDLTp6b3ZQCaad10UrRxQ=;
	b=uLqqe8AzPYZQqA+zXzXGJdnUnD1fcN1pNiLJMhWmd+GItXM4Y2pLMmN9WxnCOBZ6ah
	vYxelAKMB7ogaxU5Cq6h/+7+uRl1TpdCbKHxl7swBEIEnI023TL7qq7OKMBSOboQGp65
	Pj6EF3ho1NRgdCGY8UqOd96xYZq/7psq/YW5MZH4q4V/lyep3Ra4nWcfKiM1DLlcwzBs
	rlnUcgEd/1c6wW4VA7qu8eC49EW/7/ixYJFySJF3zz9pc7PgoOvzLUqZlXu52tQTO4cz
	Zb7XOCbe58ixOMmYT7DTU9SqTBrKQRqa9XoZYH6hT3yz2MWRUxgKQVyd5t5MljxyhpT0
	jM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=C51AezziuaFEam3NlHdTVgyDLTp6b3ZQCaad10UrRxQ=;
	b=o78sw/8Vsiuy9x4YxP0t78RDD1R1zoAgR2mowKWMiqWMeHYGPU/di8LNrXNuxkvYtH
	Bu3fdnTad5tGQsr1cWyfoxF6Tl2/WwB6t44JDkZY66eTsDJB1xXbdMPYeyOQ2CxX/tkf
	iR8nK96k7BsvFa33BkxWEHe7yE3+wWQXxQOpA3QugPKVvQmPXwzPam6KKbs2QuQf7qWB
	yRnwWVl0yVviaKhELTDNmEZRPHZOuPw3lj6+nxR4TnTbTIm/tfkIGqRpWs2Spks4f7Dk
	eHqKxWpf9a7E4HGDOb5lPVSYodaDYvKxgap3v+r69qM9JajeLLeAiD0Pe0Y/ZyVXgbNW
	6eMQ==
X-Gm-Message-State: AMke39m7d1nzNQVBoDrCXCjE4ImNdOYe+UM4mlI6Fr3FAHA6NgPFkZQwDkB4Xskzd8vjLw==
X-Received: by 10.223.165.85 with SMTP id j21mr20109342wrb.186.1489255374077; 
	Sat, 11 Mar 2017 10:02:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k10sm4450590wmg.10.2017.03.11.10.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 Mar 2017 10:02:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 11 Mar 2017 19:02:53 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170311180253.GA3984@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-11
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
X-List-Received-Date: Sat, 11 Mar 2017 18:02:56 -0000
X-Groupsio-MsgNum: 94607
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time the results are very inconsistent across different MACHINEs
because they were using significantly different metadata.

qemuarm is oldest 3 from 4 failures were causes by pending meta-oe
changes which I've removed from master-next before qemux86* builds were
restarted (after they failed badly few times).

qemux86-64 is latest and contains HOSTTOOLS changes from
oe-core/master-next that's why there is so many failures.

=46rom the failures I see following tools which we need to either add
to HOSTTOOLS or provide with added -native dependency:
cc      - tcsh                - http://errors.yoctoproject.org/Errors/Detai=
ls/135201/
cc      - u-boot-mkimage      - http://errors.yoctoproject.org/Errors/Detai=
ls/135203/
cc      - toybox              - http://errors.yoctoproject.org/Errors/Detai=
ls/135210/
cc      - yasm                - http://errors.yoctoproject.org/Errors/Detai=
ls/135214/
cpp     - mkelfimage          - http://errors.yoctoproject.org/Errors/Detai=
ls/135211/
clear   - lprng               - http://errors.yoctoproject.org/Errors/Detai=
ls/135207/
gcc-ar  - ovmf                - http://errors.yoctoproject.org/Errors/Detai=
ls/135202/
join    - netcf               - http://errors.yoctoproject.org/Errors/Detai=
ls/135208/
join    - fontforge           - http://errors.yoctoproject.org/Errors/Detai=
ls/135209/
mknod   - initramfs-live-boot - http://errors.yoctoproject.org/Errors/Detai=
ls/135213/
nl      - dash                - http://errors.yoctoproject.org/Errors/Detai=
ls/135215/
nl      - klibc               - http://errors.yoctoproject.org/Errors/Detai=
ls/135198/
openssl - openflow            - http://errors.yoctoproject.org/Errors/Detai=
ls/135216/
readelf - firefox             - http://errors.yoctoproject.org/Errors/Detai=
ls/135212/
size    - iptraf              - http://errors.yoctoproject.org/Errors/Detai=
ls/135204/
yes     - libnet-ssleay-perl  - http://errors.yoctoproject.org/Errors/Detai=
ls/135197/
zcat    - scsirastools        - http://errors.yoctoproject.org/Errors/Detai=
ls/135205/

Some of these were already merged in newer HOSTTOOLS patch currently
in oe-core/master:
mknod cpp readelf split gcc-ar gpg sftp
and u-boot-mkimage should be fixed in master as well

I'll merge most meta-oe changes and retrigger new round of testing,
next time the failures should be a bit more consistent again.

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2017-03-11	||4	||1	||20	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0	=
	||0		||0		||3		||0		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-11 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170311_062851.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.14.bb:do_install

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorrent_=
0.13.6.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/rapidjson/rapidjson_1.1.0.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb:do_install
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (19) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_compile
    * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.b=
b:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-=
utils_2.0.4.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/openflow/openflow=
_git.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git.bb:=
do_configure
    * meta-openembedded/meta-oe/recipes-core/toybox/toybox_0.7.2.bb:do_conf=
igure
    * meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-extended/dash/dash_0.5.8.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_co=
nfigure
    * meta-openembedded/meta-oe/recipes-extended/scsirastools/scsirastools_=
1.6.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_201610=
12.bb:do_configure
    * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.=
65.bb:do_configure
    * openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb:d=
o_compile
    * openembedded-core/meta/recipes-core/initrdscripts/initramfs-live-boot=
_1.0.bb:do_install
    * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb:=
do_compile
    * openembedded-core/meta/recipes-devtools/yasm/yasm_1.3.0.bb:do_compile

=3D=3D=3D Number of failed tasks (25) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170307_025324.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/33300/
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170309_121824.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/33551/
|-
|| qemux86_64 	|| 20	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.world.qemux86-64.20170311_042112.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/33631/
|}

=3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D

=3D=3D=3D QA issues (4) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||3	||file-rdeps
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170307_235322.log/

No issues detected



--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMQ7zAAKCRA3VSO3ZXaA
HBxVAJ9imPlZ/5xnENK2LrqPKl6mv5kwTgCfdwmLDpwjcMfaTC1Sm/69AKP1IqM=
=JRZe
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
