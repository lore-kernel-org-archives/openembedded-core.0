Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A728971C69;
	Tue, 31 Jan 2017 17:10:50 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id t18so21344475wmt.0;
	Tue, 31 Jan 2017 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=7fokOnxkgkdS0vIhphjSk5COC04nAY3gEu0byJLJSN0=;
	b=uf67JNvkeLbFgQsXpBImLspbnwkiPomkVCzlo+RiYD8JaMu1RXh5L0Fe7Te6RG2WwJ
	OYMAcjgrmBSdazi6lOiFffc2t0glq4k054dmZCiM1/otPwxg6OYz6jyeLxBXy8O+pNGU
	hXveF84kUzpefM/jalU193nKGxFB8S848dGBiM4CZibRPexiGZT9m2jVlgZOq2+FKukd
	J/lb+wBWF892ApCFvfx5ytwCm0rBvPMI0DSgPfC5UxtgJGmrPm5YJAuYuI4NfY9I/zq9
	0MKvJ+giiC3eDSa++53VxSigOET3R7PUJWFEqEEzer7ohmTEXzbZps95juwUM3kZlJSK
	hwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=7fokOnxkgkdS0vIhphjSk5COC04nAY3gEu0byJLJSN0=;
	b=AQDConY7LqNvSbWBQyTlai0sN4VhNPzMAwpcpH65dHJgLhcS+Sqlaba3+cHUJIsl9z
	0el+h+WWsAnSpIwzOkRiSt5Prc0/X86hVx7+h9rYkwzNzdj5ELR/EYMKt0oWih0i4U5J
	zimU7pdodFGm2RoHs9FwLDLS7oc1Rm7R9n8lerOqE9kxMmg8cWUOMtYFaXv03K0M/Qgo
	dWvUsFEhr1DOiSbGwzDfLU1xkfk7QVgqtpa/tgCGyDUSfwaPvL+BYmeHYfV1v1YWrb6i
	tDyvzNynP385EICa+Q7vgu0W0ouealPFkedeXN0lWrNb/YpAZbn0kKM1XA5ufQIb4mZA
	8mUg==
X-Gm-Message-State: AIkVDXKynihH0/qh6D/4YXSKpgS2ECAYRD5xjF5rsq0geO3Ntl4bvhbc+H3AShgBXyKSQw==
X-Received: by 10.28.226.67 with SMTP id z64mr18069849wmg.137.1485882649983;
	Tue, 31 Jan 2017 09:10:49 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s26sm29127509wra.26.2017.01.31.09.10.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 31 Jan 2017 09:10:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 31 Jan 2017 18:10:49 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170131171049.GA3273@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-01-31
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
X-List-Received-Date: Tue, 31 Jan 2017 17:10:54 -0000
X-Groupsio-MsgNum: 92673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There is a lot more failures this time (mostly because of RSS), but
I wanted to share it anyway, to be clear about the current state of
other layers.
:

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
||2017-01-27	||183	||190	||187	||367	||182	||184	||0	ls: cannot access 'log=
=2Edependencies.qemux86.20170128_005734.log//2_max/failed/*.log': No such f=
ile or directory
||0	ls: cannot access 'log.dependencies.qemux86.20170128_005734.log//3_min/=
failed/*.log': No such file or directory
||0	||0	||0		||0		||2		||0		||6		||38516		||0		||2		||0		||0		||0		||0		||=
=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-01-27 =3D=3D

INFO: jenkins-job.sh-1.8.13 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170131_055841.log

=3D=3D=3D common (180) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox-addon/firefox-addon-webconverger=
_git.bb:do_configure
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ach_45.6.0esr.=
bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-af_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-an_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ar_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-as_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ast_45.6.0esr.=
bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-az_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-be_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-bg_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-br_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-bs_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ca_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-cs_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-cy_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-da_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-de_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-dsb_45.6.0esr.=
bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-el_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-eo_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-et_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-eu_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-fa_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ff_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-fi_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-fr_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-gd_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-gl_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-gn_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-he_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-hr_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-hsb_45.6.0esr.=
bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-hu_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-id_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-is_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-it_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ja_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-kk_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-km_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-kn_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ko_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-lij_45.6.0esr.=
bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-lt_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-lv_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-mai_45.6.0esr.=
bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-mk_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ml_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-mr_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ms_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-nl_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-or_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-pl_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-rm_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ro_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ru_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-si_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-sk_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-sl_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-son_45.6.0esr.=
bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-sq_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-sr_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-ta_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-te_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-th_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-tr_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-uk_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-uz_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-vi_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-xh_45.6.0esr.b=
b:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_45.6.0es=
r.bb:do_install
    * meta-browser/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_45.6.0es=
r.bb:do_install
    * meta-openembedded/meta-filesystems/recipes-filesystems/unionfs-fuse/u=
nionfs-fuse_0.26.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.=
bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-ba=
ckgrounds_2.32.0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime=
-data_2.18.0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.=
20.2.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourcevie=
w2_2.10.5.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.=
0.bb:do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.1=
4.bb:do_configure
    * meta-openembedded/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:=
do_configure
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.1.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb:do_configure
    * meta-openembedded/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1=
=2Ebb:do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.10/g=
streamer_0.10.36.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19=
=2E21.bb:do_configure
    * meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18=
=2Ebb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/openconnect/op=
enconnect_git.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/openflow/openflow=
_git.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/netcat/netcat-openb=
sd_1.105.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/wireshark/wireshark=
_2.2.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.b=
b:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0=
=2Ebb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb:do_=
configure
    * meta-openembedded/meta-oe/recipes-connectivity/networkmanager/network=
manager-openvpn_1.2.6.bb:do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/telepathy/libtelepathy=
_0.3.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb:do_c=
onfigure
    * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:do_con=
figure
    * meta-openembedded/meta-oe/recipes-devtools/php/php_7.1.0.bb:do_install
    * meta-openembedded/meta-oe/recipes-devtools/vala-dbus-binding-tool/val=
a-dbus-binding-tool_git.bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb:d=
o_configure
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.10.bb:do_com=
pile
    * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_201508=
24.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb=
:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-gla=
mo_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-100dp=
i_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-utopi=
a-100dpi_1.0.4.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1=
=2E0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-lucidaty=
pewriter-100dpi_1.0.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1=
=2E1.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.5.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.=
6.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb:do_co=
nfigure
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mix=
er_2.0.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixe=
r_1.2.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:d=
o_configure
    * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.=
14.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.1=
1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.13.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb:do_=
configure
    * meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.51.0.bb:d=
o_compile
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.8=
=2Ebb:do_configure
    * meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-support/udisks/udisks_1.0.5.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb:do_=
configure
    * meta-openembedded/meta-oe/recipes-support/usb-modeswitch/usb-modeswit=
ch_2.2.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs=
_0.15.bb:do_configure
    * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.=
65.bb:do_compile
    * meta-openembedded/meta-python/recipes-connectivity/gateone/gateone_gi=
t.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-cffi_1.=
9.1.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-ndg-htt=
psclient_0.4.2.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-pyyaml_=
3.12.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-cffi_1.9=
=2E1.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-ndg-http=
sclient_0.4.2.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-pbr_1.10=
=2E0.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-pyyaml_3=
=2E12.bb:do_compile
    * meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_c=
ompile
    * meta-openembedded/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.=
6.bb:do_install
    * meta-openembedded/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0=
=2Ebb:do_install
    * meta-openembedded/meta-webserver/recipes-webadmin/netdata/netdata_git=
=2Ebb:do_configure
    * meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb=
:do_compile
    * meta-openembedded/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.=
bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_configure
    * meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_install
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-gs=
m0710muxd_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/omext_0.2.bb:do_compile
    * openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant_2.6.bb:do_compile
    * openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do=
_configure
    * openembedded-core/meta/recipes-devtools/qemu/qemu_2.7.1.bb:do_configu=
re
    * openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.16.bb:do_configure
    * openembedded-core/meta/recipes-extended/cups/cups_2.2.1.bb:do_configu=
re
    * openembedded-core/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb:=
do_compile
    * openembedded-core/meta/recipes-kernel/latencytop/latencytop_0.5.bb:do=
_compile
    * openembedded-core/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb:do_c=
onfigure

=3D=3D=3D common-x86 (6) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-graphics/terminus-font/terminus-fon=
t_4.38.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nou=
veau_1.0.12.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.6.bb:do_compile
    * openembedded-core/meta/recipes-kernel/cryptodev/cryptodev-module_1.8.=
bb:do_compile

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compi=
le
    * meta-qt5/recipes-qt/tufao/tufao_1.2.1.bb:do_configure
    * meta-webos-ports/meta-luneui/recipes-webos/luna-sysmgr-common/luna-sy=
smgr-common.bb:do_configure

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-=
utils_2.0.4.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_co=
mpile

=3D=3D=3D Number of failed tasks (560) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 183	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemuarm.20170126_124504.log/ || http://errors.yoctoproject.org/Er=
rors/Build/30645/
|-
|| qemux86 	|| 190	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemux86.20170126_124511.log/ || http://errors.yoctoproject.org/Er=
rors/Build/30646/
|-
|| qemux86_64 	|| 187	 || http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.world.qemux86-64.20170127_072955.log/ || http://errors.yoctoproject.=
org/Errors/Build/30922/
|}
=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D
=3D=3D=3D QA issues (38526) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||host-user-contaminated
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||2	||installed-vs-shipped
|-
||2	||textrel
|-
||38516	||version-going-backwards
|-
||6	||file-rdeps
|}



=3D=3D=3D Failed dependencies for qemuarm (367) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log/
Found differences:=20
Found errors:=20
    * ERROR: 367 issues were found in these recipes: a2jmidid at-spi2-atk a=
udiofile bundler collectd crash crda cups dbus-daemon-proxy devilspie2 dvb-=
apps efivar fbida firefox-addon-webconverger firefox-l10n-ach firefox-l10n-=
af firefox-l10n-an firefox-l10n-ar firefox-l10n-as firefox-l10n-ast firefox=
-l10n-az firefox-l10n-be firefox-l10n-bg firefox-l10n-bn-bd firefox-l10n-bn=
-in firefox-l10n-br firefox-l10n-bs firefox-l10n-ca firefox-l10n-cs firefox=
-l10n-cy firefox-l10n-da firefox-l10n-de firefox-l10n-dsb firefox-l10n-el f=
irefox-l10n-en-gb firefox-l10n-en-us firefox-l10n-en-za firefox-l10n-eo fir=
efox-l10n-es-ar firefox-l10n-es-cl firefox-l10n-es-es firefox-l10n-es-mx fi=
refox-l10n-et firefox-l10n-eu firefox-l10n-fa firefox-l10n-ff firefox-l10n-=
fi firefox-l10n-fr firefox-l10n-fy-nl firefox-l10n-ga-ie firefox-l10n-gd fi=
refox-l10n-gl firefox-l10n-gn firefox-l10n-gu-in firefox-l10n-he firefox-l1=
0n-hi-in firefox-l10n-hr firefox-l10n-hsb firefox-l10n-hu firefox-l10n-hy-a=
m firefox-l10n-id firefox-l10n-is firefox-l10n-it firefox-l10n-ja firefox-l=
10n-kk firefox-l10n-km firefox-l10n-kn firefox-l10n-ko firefox-l10n-lij fir=
efox-l10n-lt firefox-l10n-lv firefox-l10n-mai firefox-l10n-mk firefox-l10n-=
ml firefox-l10n-mr firefox-l10n-ms firefox-l10n-nb-no firefox-l10n-nl firef=
ox-l10n-nn-no firefox-l10n-or firefox-l10n-pa-in firefox-l10n-pl firefox-l1=
0n-pt-br firefox-l10n-pt-pt firefox-l10n-rm firefox-l10n-ro firefox-l10n-ru=
 firefox-l10n-si firefox-l10n-sk firefox-l10n-sl firefox-l10n-son firefox-l=
10n-sq firefox-l10n-sr firefox-l10n-sv-se firefox-l10n-ta firefox-l10n-te f=
irefox-l10n-th firefox-l10n-tr firefox-l10n-uk firefox-l10n-uz firefox-l10n=
-vi firefox-l10n-xh firefox-l10n-zh-cn firefox-l10n-zh-tw font-adobe-100dpi=
 font-adobe-utopia-100dpi font-bh-100dpi font-bh-lucidatypewriter-100dpi fo=
ntforge font-misc-misc fso-gsm0710muxd gateone geany glibmm gnokii gnome-ba=
ckgrounds gnome-mime-data gpe-scap gstreamer gtk-engines gtkhtml2 gtkmathvi=
ew gtksourceview2 kexecboot kexec-tools-klibc latencytop libgnomekbd libgxi=
m libidl-native libmbim libnet-ssleay-perl libsdl2-mixer libsdl2-ttf libsdl=
-mixer libsdl-ttf libsexy libtelepathy menulibre minidlna mosh mpd netcat-o=
penbsd netdata networkmanager-openvpn nostromo ode omext openconnect openfl=
ow openzone php pidgin pkgconfig pmbw pong-clock poppler postgresql python3=
-cffi python3-ndg-httpsclient python3-pyyaml python-cffi python-ndg-httpscl=
ient python-pbr python-pyyaml pywbem qemu qtwayland qtwebkit quilt-native r=
pm sthttpd sylpheed syslog-ng system-config-keyboard ubi-utils-klibc udisks=
 udisks2 unionfs-fuse usb-modeswitch vala-dbus-binding-tool wireshark wpa-s=
upplicant xdg-user-dirs xf86-video-glamo xstdcmap

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (182) =3D=
=3D=3D
    * a2jmidid -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/a2jmidid.log
    * at-spi2-atk -- http://logs.nslu2-linux.org/bofile.log
    * bundler -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/bundler.log
    * collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/collectd.log
    * crash -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20170127_071311.log//2_max/failed/crash.log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//2_max/failed/crda.log
    * cups -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//2_max/failed/cups.log
    * dbus-daemon-proxy -- http://logs.nslu2-linux.org/buildlogs/oe/world/p=
yro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/dbus-daemon-=
proxy.log
    * devilspie2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//2_max/failed/devilspie2.log
    * dvb-apps -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/dvb-apps.log
    * efivar -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//2_max/failed/efivar.log
    * fbida -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20170127_071311.log//2_max/failed/fbida.log
    * firefox-addon-webconverger -- http://logs.nslu2-linux.org/buildlogs/o=
e/world/pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/fir=
efox-addon-webconverger.log
    * firefox-l10n-ach -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-=
ach.log
    * firefox-l10n-af -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-a=
f.log
    * firefox-l10n-an -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-a=
n.log
    * firefox-l10n-ar -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-a=
r.log
    * firefox-l10n-as -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-a=
s.log
    * firefox-l10n-ast -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-=
ast.log
    * firefox-l10n-az -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-a=
z.log
    * firefox-l10n-be -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-b=
e.log
    * firefox-l10n-bg -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-b=
g.log
    * firefox-l10n-bn-bd -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-bn-bd.log
    * firefox-l10n-bn-in -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-bn-in.log
    * firefox-l10n-br -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-b=
r.log
    * firefox-l10n-bs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarog
    * firefox-l10n-cy -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-c=
y.log
    * firefox-l10n-da -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-d=
a.log
    * firefox-l10n-de -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-d=
e.log
    * firefox-l10n-dsb -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-=
dsb.log
    * firefox-l10n-el -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-e=
l.log
    * firefox-l10n-en-gb -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-en-gb.log
    * firefox-l10n-en-us -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-en-us.log
    * firefox-l10n-en-za -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-en-za.log
    * firefox-l10n-eo -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-e=
o.log
    * firefox-l10n-es-ar -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-es-ar.log
    * firefox-l10n-es-cl -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-es-cl.log
    * firefox-l10n-es-es -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-es-es.log
    * firefox-l10n-es-mx -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-es-mx.log
    * firefox-l10n-et -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-e=
t.log
    * firefox-l10n-eu -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-e=
u.log
    * firefox-l10n-fa -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-f=
a.log
    * firefox-l10n-ff -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-f=
f.log
    * firefox-l10n-fi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-f=
i.log
    * firefox-l10n-fr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-f=
r.log
    * firefox-l10n-fy-nl -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-fy-nl.log
    * firefox-l10n-ga-ie -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-ga-ie.log
    * firefox-l10n-gd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-g=
d.log
    * firefox-l10n-gl -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies firefox-l10n-hr -- http://logs.nslu2-linux.org/buildlogs=
/oe/world/pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/f=
irefox-l10n-hr.log
    * firefox-l10n-hsb -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-=
hsb.log
    * firefox-l10n-hu -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-h=
u.log
    * firefox-l10n-hy-am -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-hy-am.log
    * firefox-l10n-id -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-i=
d.log
    * firefox-l10n-is -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-i=
s.log
    * firefox-l10n-it -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-i=
t.log
    * firefox-l10n-ja -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-j=
a.log
    * firefox-l10n-kk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-k=
k.log
    * firefox-l10n-km -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-k=
m.log
    * firefox-l10n-kn -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-k=
n.log
    * firefox-l10n-ko -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-k=
o.log
    * firefox-l10n-lij -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-=
lij.log
    * firefox-l10n-lt -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-l=
t.log
    * firefox-l10n-lv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-l=
v.log
    * firefox-l10n-mai -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-=
mai.log
    * firefox-l10n-mk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-m=
k.log
    * firefox-l10n-ml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-m=
l.log
    * firefox-l10n-mr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-m=
r.log
    * firefox-l10n-ms -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-m=
s.log
    * firefox-l10n-nb-no -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-nb-no.log
    * firefox-l10n-nl -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-n=
l.log
    * firefox-l10n-nn-no -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/ailed/firef=
ox-l10n-pl.log
    * firefox-l10n-pt-br -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-pt-br.log
    * firefox-l10n-pt-pt -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-pt-pt.log
    * firefox-l10n-rm -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-r=
m.log
    * firefox-l10n-ro -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-r=
o.log
    * firefox-l10n-ru -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-r=
u.log
    * firefox-l10n-si -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-s=
i.log
    * firefox-l10n-sk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-s=
k.log
    * firefox-l10n-sl -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-s=
l.log
    * firefox-l10n-son -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-=
son.log
    * firefox-l10n-sq -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-s=
q.log
    * firefox-l10n-sr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-s=
r.log
    * firefox-l10n-sv-se -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-sv-se.log
    * firefox-l10n-ta -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-t=
a.log
    * firefox-l10n-te -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-t=
e.log
    * firefox-l10n-th -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-t=
h.log
    * firefox-l10n-tr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-t=
r.log
    * firefox-l10n-uk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-u=
k.log
    * firefox-l10n-uz -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-u=
z.log
    * firefox-l10n-vi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-v=
i.log
    * firefox-l10n-xh -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10n-x=
h.log
    * firefox-l10n-zh-cn -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-zh-cn.log
    * firefox-l10n-zh-tw -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/firefox-l10=
n-zh-tw.log
    * font-adobe-100dpi -- http://logs.nslu2-linux.org/buildlogs/oe/world/p=
yro/log.dependencie font-bh-lucidatypewriter-100dpi -- http://logs.nslu2-li=
nux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.20170127_071311.lo=
g//2_max/failed/font-bh-lucidatypewriter-100dpi.log
    * fontforge -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//2_max/failed/fontforge.log
    * font-misc-misc -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/font-misc-misc.=
log
    * fso-gsm0710muxd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/fso-gsm0710mux=
d.log
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/gateone.log
    * geany -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20170127_071311.log//2_max/failed/geany.log
    * glibmm -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//2_max/failed/glibmm.log
    * gnokii -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//2_max/failed/gnokii.log
    * gnome-backgrounds -- http://logs.nslu2-linux.org/buildlogs/oe/world/p=
yro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/gnome-backgr=
ounds.log
    * gnome-mime-data -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/gnome-mime-dat=
a.log
    * gpe-scap -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/gpe-scap.log
    * gstreamer -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//2_max/failed/gstreamer.log
    * gtk-engines -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//2_max/failed/gtk-engines.log
    * gtkhtml2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/gtkhtml2.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//2_max/failed/gtkmathview.log
    * gtksourceview2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/gtksourceview2.=
log
    * kexec-tools-klibc -- http://logs.nslu2-linux.org/buildlogs/oe/world/p=
yro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/kexec-tools-=
klibc.log
    * latencytop -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//2_max/failed/latencytop.log
    * libgnomekbd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//2_max/failed/libgnomekbd.log
    * libgxim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/libgxim.log
    * libidl-native -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.dependencies.qemuarm.20170127_071311.log//2_max/failed/libidl-native.log
    * libmbim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/libmbim.log
    * libnet-ssleay-perl -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/libnet-ssle=
ay-perl.log
    * libsdl2-mixer -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.dependencies.qemuarm.20170127_071311.log//2_max/failed/libsdl2-mixer.log
 /logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.201=
70127_071311.log//2_max/failed/menulibre.log
    * minidlna -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/minidlna.log
    * mosh -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//2_max/failed/mosh.log
    * mpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20170127_071311.log//2_max/failed/mpd.log
    * netcat-openbsd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/netcat-openbsd.=
log
    * netdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/netdata.log
    * networkmanager-openvpn -- http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/network=
manager-openvpn.log
    * nostromo -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/nostromo.log
    * ode -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20170127_071311.log//2_max/failed/ode.log
    * omext -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20170127_071311.log//2_max/failed/omext.log
    * openconnect -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//2_max/failed/openconnect.log
    * openflow -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/openflow.log
    * openzone -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/openzone.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20170127_071311.log//2_max/failed/php.log
    * pidgin -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//2_max/failed/pidgin.log
    * pkgconfig -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//2_max/failed/pkgconfig.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//2_max/failed/pmbw.log
    * pong-clock -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//2_max/failed/pong-clock.log
    * poppler -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/poppler.log
    * postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//2_max/failed/postgresql.log
    * python3-cffi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170127_071311.log//2_max/failed/python3-cffi.log
    * python3-ndg-httpsclient -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/python=
3-ndg-httpsclient.log
    * python3-pyyaml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/python3-pyyaml.=
log
    * python-cffi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//2_max/failed/python-cffi.log
    * python-ndg-httpsclient -- http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/pythbki=
t -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.q=
emuarm.20170127_071311.log//2_max/failed/qtwebkit.log
    * rpm -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20170127_071311.log//2_max/failed/rpm.log
    * sthttpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/sthttpd.log
    * sylpheed -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/sylpheed.log
    * syslog-ng -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//2_max/failed/syslog-ng.log
    * ubi-utils-klibc -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/ubi-utils-klib=
c.log
    * udisks2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//2_max/failed/udisks2.log
    * udisks -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//2_max/failed/udisks.log
    * unionfs-fuse -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170127_071311.log//2_max/failed/unionfs-fuse.log
    * usb-modeswitch -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/usb-modeswitch.=
log
    * vala-dbus-binding-tool -- http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/vala-db=
us-binding-tool.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//2_max/failed/wireshark.log
    * wpa-supplicant -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/wpa-supplicant.=
log
    * xdg-user-dirs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.dependencies.qemuarm.20170127_071311.log//2_max/failed/xdg-user-dirs.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//2_max/failed/xf86-video-gl=
amo.log
    * xstdcmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//2_max/failed/xstdcmap.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (184) =3D=
=3D=3D
    * a2jmidid -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/a2jmidid.log
    * at-spi2-atk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//3_min/failed/at-spi2-atk.log
    * audiofile -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//3_min/failed/audiofile.log
    * bundler -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//3_min/failed/bundler.log
    * collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/collectd.log
    * crash -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20170127_071311.log//3_min/failed/crash.log
    * crda -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//3_min/failed/crda.log
    * cups -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//3_min/failed/cups.log
    * dbus-daemon-proxy -- http://logs.nslu2-li  * firefox-l10n-ast -- http=
://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.20=
170127_071311.log//3_min/failed/firefox-l10n-ast.log
    * firefox-l10n-az -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-a=
z.log
    * firefox-l10n-be -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-b=
e.log
    * firefox-l10n-bg -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-b=
g.log
    * firefox-l10n-bn-bd -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-bn-bd.log
    * firefox-l10n-bn-in -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-bn-in.log
    * firefox-l10n-br -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-b=
r.log
    * firefox-l10n-bs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-b=
s.log
    * firefox-l10n-ca -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-c=
a.log
    * firefox-l10n-cs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-c=
s.log
    * firefox-l10n-cy -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-c=
y.log
    * firefox-l10n-da -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-d=
a.log
    * firefox-l10n-de -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-d=
e.log
    * firefox-l10n-dsb -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-=
dsb.log
    * firefox-l10n-el -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-e=
l.log
    * firefox-l10n-en-gb -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-en-gb.log
    * firefox-l10n-en-us -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-en-us.log
    * firefox-l10n-en-za -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-en-za.log
    * firefox-l10n-eo -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-e=
o.log
    * firefox-l10n-es-ar -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-es-ar.log
    * firefox-l10n-es-cl -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-es-cl.log
    * firefox-l10n-es-es -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-es-es.log
    * firefox-l10n-es-mx -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarld/pyro/log.dependencies.qemuarm.20170127_07131=
1.log//3_min/failed/firefox-l10n-ga-ie.log
    * firefox-l10n-gd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-g=
d.log
    * firefox-l10n-gl -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-g=
l.log
    * firefox-l10n-gn -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-g=
n.log
    * firefox-l10n-gu-in -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-gu-in.log
    * firefox-l10n-he -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-h=
e.log
    * firefox-l10n-hi-in -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-hi-in.log
    * firefox-l10n-hr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-h=
r.log
    * firefox-l10n-hsb -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-=
hsb.log
    * firefox-l10n-hu -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-h=
u.log
    * firefox-l10n-hy-am -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-hy-am.log
    * firefox-l10n-id -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-i=
d.log
    * firefox-l10n-is -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-i=
s.log
    * firefox-l10n-it -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-i=
t.log
    * firefox-l10n-ja -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-j=
a.log
    * firefox-l10n-kk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-k=
k.log
    * firefox-l10n-km -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-k=
m.log
    * firefox-l10n-kn -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-k=
n.log
    * firefox-l10n-ko -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-k=
o.log
    * firefox-l10n-lij -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-=
lij.log
    * firefox-l10n-lt -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-l=
t.log
    * firefox-l10n-lv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-l=
v.log
    * firefox-l10n-mai -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-=
mai.log
    * firefox-l10n-mk -- http://logs./world/pyro/log.dependencies.qemuarm.2=
0170127_071311.log//3_min/failed/firefox-l10n-pa-in.log
    * firefox-l10n-pl -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-p=
l.log
    * firefox-l10n-pt-br -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-pt-br.log
    * firefox-l10n-pt-pt -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-pt-pt.log
    * firefox-l10n-rm -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-r=
m.log
    * firefox-l10n-ro -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-r=
o.log
    * firefox-l10n-ru -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-r=
u.log
    * firefox-l10n-si -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-s=
i.log
    * firefox-l10n-sk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-s=
k.log
    * firefox-l10n-sl -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-s=
l.log
    * firefox-l10n-son -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-=
son.log
    * firefox-l10n-sq -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-s=
q.log
    * firefox-l10n-sr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-s=
r.log
    * firefox-l10n-sv-se -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-sv-se.log
    * firefox-l10n-ta -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-t=
a.log
    * firefox-l10n-te -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-t=
e.log
    * firefox-l10n-th -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-t=
h.log
    * firefox-l10n-tr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-t=
r.log
    * firefox-l10n-uk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-u=
k.log
    * firefox-l10n-uz -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-u=
z.log
    * firefox-l10n-vi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-v=
i.log
    * firefox-l10n-xh -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10n-x=
h.log
    * firefox-l10n-zh-cn -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/firefox-l10=
n-zh-cn.log
    * firefox-l10n-zh-tw -- httpisc.log
    * fso-gsm0710muxd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/fso-gsm0710mux=
d.log
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//3_min/failed/gateone.log
    * geany -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20170127_071311.log//3_min/failed/geany.log
    * glibmm -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//3_min/failed/glibmm.log
    * gnokii -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//3_min/failed/gnokii.log
    * gnome-backgrounds -- http://logs.nslu2-linux.org/buildlogs/oe/world/p=
yro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/gnome-backgr=
ounds.log
    * gnome-mime-data -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/gnome-mime-dat=
a.log
    * gpe-scap -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/gpe-scap.log
    * gstreamer -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//3_min/failed/gstreamer.log
    * gtk-engines -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//3_min/failed/gtk-engines.log
    * gtkhtml2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/gtkhtml2.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//3_min/failed/gtkmathview.log
    * gtksourceview2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/gtksourceview2.=
log
    * kexecboot -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//3_min/failed/kexecboot.log
    * kexec-tools-klibc -- http://logs.nslu2-linux.org/buildlogs/oe/world/p=
yro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/kexec-tools-=
klibc.log
    * latencytop -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//3_min/failed/latencytop.log
    * libgnomekbd -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//3_min/failed/libgnomekbd.log
    * libgxim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//3_min/failed/libgxim.log
    * libidl-native -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.dependencies.qemuarm.20170127_071311.log//3_min/failed/libidl-native.log
    * libmbim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//3_min/failed/libmbim.log
    * libnet-ssleay-perl -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/libnet-ssle=
ay-perl.log
    * libsdl2-mixer -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.dependencies.qemuarm.20170127_071311.log//3_min/failed/libsdl2-mixer.log
    * libsdl2-ttf -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//3_min/failed/libsdl2-ttf.log
    * libsdl-mixer -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170127_071311.log//3_min/failed/libsdl-mixer.log
    * libsdl-ttf -- http://logs.rld/pyro/log.dependencies.qemuarm.20170127_=
071311.log//3_min/failed/netcat-openbsd.log
    * netdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//3_min/failed/netdata.log
    * networkmanager-openvpn -- http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/network=
manager-openvpn.log
    * nostromo -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/nostromo.log
    * ode -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20170127_071311.log//3_min/failed/ode.log
    * omext -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20170127_071311.log//3_min/failed/omext.log
    * openconnect -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//3_min/failed/openconnect.log
    * openflow -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/openflow.log
    * openzone -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/openzone.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20170127_071311.log//3_min/failed/php.log
    * pidgin -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//3_min/failed/pidgin.log
    * pkgconfig -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//3_min/failed/pkgconfig.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//3_min/failed/pmbw.log
    * pong-clock -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//3_min/failed/pong-clock.log
    * poppler -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//3_min/failed/poppler.log
    * postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//3_min/failed/postgresql.log
    * python3-cffi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170127_071311.log//3_min/failed/python3-cffi.log
    * python3-ndg-httpsclient -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/python=
3-ndg-httpsclient.log
    * python3-pyyaml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/python3-pyyaml.=
log
    * python-cffi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemuarm.20170127_071311.log//3_min/failed/python-cffi.log
    * python-ndg-httpsclient -- http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/python-=
ndg-httpsclient.log
    * python-pbr -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20170127_071311.log//3_min/failed/python-pbr.log
    * python-pyyaml -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.dependencies.qemuarm.20170127_071311.log//3_min/failed/python-pyyaml.log
    * pywbem -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//3_min/failed/pywbem.log
    * qemu -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170127_071311.log//3_min/failed/qemu.log
 ies.qemuarm.20170127_071311.log//3_min/failed/ubi-utils-klibc.log
    * udisks2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20170127_071311.log//3_min/failed/udisks2.log
    * udisks -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170127_071311.log//3_min/failed/udisks.log
    * unionfs-fuse -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.dependencies.qemuarm.20170127_071311.log//3_min/failed/unionfs-fuse.log
    * usb-modeswitch -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/usb-modeswitch.=
log
    * vala-dbus-binding-tool -- http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/vala-db=
us-binding-tool.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170127_071311.log//3_min/failed/wireshark.log
    * wpa-supplicant -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/wpa-supplicant.=
log
    * xdg-user-dirs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.dependencies.qemuarm.20170127_071311.log//3_min/failed/xdg-user-dirs.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170127_071311.log//3_min/failed/xf86-video-gl=
amo.log
    * xstdcmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20170127_071311.log//3_min/failed/xstdcmap.log

=3D=3D=3D Failed dependencies for qemux86 (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170128_005734.log/
ls: cannot access 'log.dependencies.qemux86.20170128_005734.log//2_max/fail=
ed/*.log': No such file or directory

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (0) =3D=3D=
=3D
    * * -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependen=
cies.qemux86.20170128_005734.log//2_max/failed/*
ls: cannot access 'log.dependencies.qemux86.20170128_005734.log//3_min/fail=
ed/*.log': No such file or directory

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (0) =3D=3D=
=3D
    * * -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependen=
cies.qemux86.20170128_005734.log//3_min/failed/*

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170130_065148.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends on b=
lacklisted webkit-efl"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.tils/xfsdump/xfsdump_3.1.4.=
bb:PNBLACKLIST[xfsdump] ?=3D "Depends on broken xfsprogs"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D "BROKEN: fails to build because of python + conflicts with gn=
ome-menu3"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnom=
e-panel] ?=3D "Depends on broken libgweather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[=
gnome-session] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D "Depends on broken libgnomeui"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D "Depends on broken libgnomecups"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D "Depends on broken libgnomeprint"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D "Fai=
ls to build with gcc-6"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D "Fail=
s to build with gcc-6"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-support/tracker/tracker_0.14.2.tmap/netmap-modules_git.b=
b:PNBLACKLIST[netmap-modules] ?=3D "BROKEN: not compatible with default ker=
nel version 4.8"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 con=
flicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 "Depends on broken wvstreams"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 "BROKEN: fails since last autotools.bbclass changes"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kmeta-oe/recipes-sato/claws-mail/claws-plugin=
-rssyl_0.34.bb:PNBLACKLIST[claws-plugin-rssyl] ?=3D "depends on blacklisted=
 claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D "BROKEN: not compatible with default kernel ver=
sion 4.8"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D "BROKEN: many errors when building with =
gcc-6"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D "rdepends on python-pycairo which was removed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core"
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D "$=
{@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blu=
ez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "dep=
ends on blacklisted iksemel"
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]=
 ?=3D "RDEPENDS on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/pisi_ilds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 6	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/armv5te-oe-linux-gnueabi/libmodule-build-=
perl/0.31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no pr=
oviders found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/core2-64-oe-linux/libmodule-build-perl/0.=
31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers=
 found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/i586-oe-linux/libmodule-build-perl/0.31-r=
0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers fou=
nd in RDEPENDS_libmodule-build-perl? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]


count: 38516	issue: version-going-backwards
abootimg-0.6+gitrAUTOINC+7e127fee6a: Package version for package abootimg-d=
bg went backwards which would break package feeds from (0:0.6+gitr0+7e127fe=
e6a-r0.46 to 0:0.6+gitr0+7e127fee6a-r0.0) [version-going-backwards]
=2E.. skip following 38514 lines ...
zsh-5.0.5: Package version for package zsh went backwards which would break=
 package feeds from (0:5.0.5-r0.52 to 0:5.0.5-r0.0) [version-going-backward=
s]


count: 0	issue: host-user-contaminated


count: 2	issue: installed-vs-shipped
iproute2: 2 installed and not shipped files. [installed-vs-shipped]
pcmciautils: 4 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
2a309cd bitbake: Bump version to 1.33.0 (develoment version)
not included in master yet:=20
23e5bdc world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
3a617a4 sanity.conf: Update minimum bitbake version requirements to 1.33.0
not included in master yet:=20
303ecee qemux86: Add identical qemux86copy variant for tests
94747d0 sstate-sysroot-cruft.sh: Extend the whitelist
a883860 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
a6b2485 buildhistory.bbclass: metadata-revs show repo parent
0d050e9 metadata-revs: provide more information
e05a118 report-error: Allow to upload reports automatically
5cf85ce flex: upgrade to 2.6.3
50ea30b Revert "flex: upgrade to 2.6.3"
c3ceaba Revert "flex: upgrade to 2.6.2"
6c49eb3 allarch: drop immediate STAGING_DIR_HOST expansion

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
5ecbf9b poppler: update to 0.51.0
not included in master yet:=20
d95ddd7 kodi: Add krypton/17.x Jarvis/16.x recipes
5f453ae kodi: Fix build with pic on x86_64
f5962a8 kodi-17: Add packageconfig for lcms support
720a6a6 kodi-17: Fix build with musl
d20fcdd kodi-17: Update to latest
0f5b12c kodi-17: Fix build for qemuarm and update to latest
af36464 opensaf: 5.0.0 -> 5.1.0
693a20a lftp: update to 4.7.5 and change SRC_URI source
c88d8bd tcpdump: upgrade to 4.8.1
d778c85 iscsitarget: Fix call trace of ahash API calling
8b973aa relayd: derive PV from SRCPV
c1ecc8d rsyslog: use atomic builtins to avoid race issue
c28a522 dibbler: fix SRC_URI from ${P} to ${BP}
a3e2a3f fwts: upgrade to 17.01.00 release
45581e1 iscsitarget: fix inconsistent crash while login to iscsi target fro=
m initiator
e342498 iscsitarget: use upstream to build with linux kernel >=3D 4.3
1bba45e iscsitarget: update patch to contain changes required to build with=
 only linux v4.8 and above
5399ec7 picocom: Fix build
6c5f9ff calibrateproto: add, from oe-core
b714be8 libxcalibrate: add, from oe-core
b601292 onboard: initial add 1.3.0
543810c nginx: update to version 1.11.8
8379a4a python-ipaddress: update to version 1.0.18
175286e python-flask-bootstrap: update to version 3.3.7.1
c871881 python-netaddr: update to version 0.7.19
04451fe tremor: add (from oe-core)
ed96ba6 wireshark: update package to 2.2.4
c1c1b16 xfce: add dbus-glib-native to DEPENDS to fix do_configure
b76e2cf luajit: mips and mipsel are 32bit targets too
d4b4276 libgphoto2: remove bash runtime dependency.
bb04b80 Revert "calibrateproto: add, from oe-core"
b10db47 Revert "libxcalibrate: add, from oe-core"

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
c0ba8ab qtbase: Remove comments about ICU and QtWebKit
not included in master yet:=20
333949a Upgrade to Qt 5.8
d1f7c36 cmake_qt5.bbclass: add qtbase-native to DEPENDS

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
249f674 firefox: do not link against crmf library it is not there
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
59e4d6c org.webosports.app.contacts: Bump SRCREV
not included in master yet:=20
172419d pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
bd8e365 README: update to depend on morty branches
22bce6f glib-2.0: rename .bbappend to match new version from oe-core
e187402 connman: rename .bbappend to match new version from oe-core
2685f76 openssl,pmcertificatemgr: use openssl files from /etc
0307de6 libsdl2: upgrade to 2.0.4 included in oe-core
19a3700 alsa-lib,alsa-utils: rename bbappend to match new version from oe-c=
ore
d1bc015 librolegen: Fix build with newer toolchain
3d51a6d activitymanager: Fix build with newer toolchain
150691a presage: Fix build with newer toolchain
0aea4fa mmsd, packagegroup-webos-test: drop python-pygobject
48edab0 connman: rename bbappend to match new version from oe-core
3891690 opkg: rename bbappend to match new version from oe-core
5aa42ed pulseaudio: rename bbappend to match new version from oe-core
be264bc freeimage: bump SRCREV to fix build with gcc6
d69d51e alsa-{lib,utils}: rename bbappend to match new version from oe-core
274015b glib-2.0: rename bbappend to match new version from oe-core
c55cf96 pidgin: rename bbappend to match new version from oe-core
c321e11 geoclue: use 2.4.4 version from meta-oe
31e9247 mesa: add LIC_FILES_CHKSUM for 10.3.8
566c4f7 libsdl2: use gles2 instead of opengl
1d18378 Mojomail: Switch to own fork for testing
07cb88a FreeImage: Use test branch for gcc6
10db2f7 libhybris: Fix compilation for gcc6
c3413a2 pulseaudio: install also 2 new headers mem.h and srbchannel.h to fi=
x pulseaudio-modules-droid build
c89b92f luneos(-package): update for new kernel names
5728ccb README: update to depend on master branches
6d2145e qtbase: enable fontconfig
5f9b42e qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
df8a457 luna-next: Make compatible with Qt 5.7
054f621 qtwayland, qtwebengine: temporary drop bbappend
55765a8 luna-sysservice: Fix build with qt 5.7
4c47750 luna-next, luna-webappmanager: temporary drop from image
8da7626 packagegroup-luneos-development: drop qt5-opengles2-test
078b97d libconnman-qt: replace with libconnman-qt5 from meta-qt5
29361e4 libqofono: use the recipe from meta-qt5

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
c3ce9b9 meta-lg: use android hybris HAL from build.webosports.org for hamme=
rhead
not included in master yet:=20

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJDEpwAKCRA3VSO3ZXaA
HMXrAJ45HMn9VVv8KUkRta3WRIf6LbIofgCggu10k8eqC9HTvlQEvoSgxdhk1ts=
=o/2Z
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
