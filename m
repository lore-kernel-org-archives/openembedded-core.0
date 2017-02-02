Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 95E7A65D00;
	Thu,  2 Feb 2017 12:06:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so12706219wmd.3;
	Thu, 02 Feb 2017 04:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GQhf1KYWFD5psj+XhfqxqWY9FkJK4IQnRZO3SYKgZlc=;
	b=EH0OdLZdApN2+PDpyO7f6Qg1a6zyg74Nu+ghfrWSvrctJv1C2P9u1gmpQWtqZ+5+Ow
	CIxlH9MIMJMphqBdzMIi37XUZMnOq2osivzjH92SEGyUVjGi57QjZwEsbELbbPM3GcK8
	c1T5lPePSHFGnAspRCdniaEr6ZQ3GLXeeFKpO6IHechBUc/a89u8B5j9zAd/wZYTseLR
	XcbG3aIQCNwO+9BKiS7e17W6iSnXPf4R22HZl0N/3jdkRJuxj8OX9NXqQfXzaboItaNP
	DSg3n5NfnLZ5dD7+7W+rMGm563LFwAkXj+mq4cRi0zxhtsyfswx0Tng5+BWpiQHhXxmZ
	anSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GQhf1KYWFD5psj+XhfqxqWY9FkJK4IQnRZO3SYKgZlc=;
	b=HM46HfEPVYglJFqeEFObzhc98KvBVVFN2NHQD8KRzqK9wghgGgQCxM4kDej2KWbvyv
	G53FcmfpoUQfLrOElqnC2RzrENgTEbm166FUjhz1CmweOawnseLDexrcYqNBMTV2hBHh
	DMrum5+1CRbBEw7g0X8T9ztt4jtFrCQUdyatRsD9PTMUpmkWxYgyfWF1gROjLiFoAKjd
	W+dvM/0mEC42czLt1AGXXrXSvxbMIXCGwMmweVjSbxiA9dbRA0Jumz6Lbx1wu//As80c
	wIW/ZxO1EhhzyuSoH+FszETQKXsOQC0PENUm9X80kxP0RzkriYD2lD7JArCa3AAlgk8K
	CSXA==
X-Gm-Message-State: AIkVDXLORy9vAE5vu4toO+O/QG4jSQHPyHry8P6IiFdymtVay5+ASWl9CU7tPyEQC7p09A==
X-Received: by 10.28.131.72 with SMTP id f69mr7933185wmd.140.1486037173233;
	Thu, 02 Feb 2017 04:06:13 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b87sm2829613wmi.0.2017.02.02.04.06.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Feb 2017 04:06:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Feb 2017 13:06:11 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170202120611.GA3269@jama>
References: <20170131171049.GA3273@jama>
MIME-Version: 1.0
In-Reply-To: <20170131171049.GA3273@jama>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-01
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
X-List-Received-Date: Thu, 02 Feb 2017 12:06:15 -0000
X-Groupsio-MsgNum: 92788
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 06:10:49PM +0100, Martin Jansa wrote:
> There is a lot more failures this time (mostly because of RSS), but
> I wanted to share it anyway, to be clear about the current state of
> other layers.
> :

Still a lot of failures, I've updated the report script to stop
processing test-dependencies jenkins jobs, so it's a bit shorter now,
I've sent fixes for firefox*, geoclue and vboxguestdrivers, so next
report shouls be at least 50 lines shorter as well.

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
||2017-02-01	||178	||184	||182	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0	=
	||0		||2		||0		||6		||156		||0		||2		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-01 =3D=3D

INFO: jenkins-job.sh-1.8.15 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170202_004847.log

=3D=3D=3D common (176) =3D=3D=3D
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
    * meta-openembedded/meta-python/recipes-connectivity/gateone/gateone_gi=
t.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-cryptog=
raphy-vectors_1.6.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-ndg-htt=
psclient_0.4.2.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-cryptogr=
aphy-vectors_1.6.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-pbr_1.10=
=2E0.bb:do_compile
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

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compi=
le
    * meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-t=
ools_git.bb:do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/libshr-glib_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (544) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 178	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemuarm.20170131_071030.log/ || http://errors.yoctoproject.org/Er=
rors/Build/31568/
|-
|| qemux86 	|| 184	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/=
log.world.qemux86.20170131_074416.log/ || http://errors.yoctoproject.org/Er=
rors/Build/31570/
|-
|| qemux86_64 	|| 182	 || http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.world.qemux86-64.20170201_020136.log/ || http://errors.yoctoproject.=
org/Errors/Build/31729/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (166) =3D=3D=3D
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
||156	||version-going-backwards
|-
||2	||installed-vs-shipped
|-
||2	||textrel
|-
||6	||file-rdeps
|}



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
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D "BROKEN: =
fails to build with latest oe-core"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D "Depends on broken xfsprogs"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs"
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
meta-gnometype name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[net=
map-modules] ?=3D "BROKEN: not compatible with default kernel version 4.8"
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
ox/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?=3D "BROKEN: doesn'=
t build with B!=3DS (Makefile without ${S} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Not compatible with currently used ffmpeg 3"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
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
meta-oe/recipes-suppo] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez=
5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES=
', '', d)}"
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
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "RDEPEND=
S on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins] =
?=3D "BROKEN: fails to build with new binutils-2.27"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
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
oviders found in RDEPENDS_libmodule-build-perl? [ild-perl/0.31-r0/recipe-sy=
sroot-native/usr/bin/perl-native/perl.real, but no providers found in RDEPE=
NDS_libmodule-build-perl? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]


count: 156	issue: version-going-backwards
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ca=
t went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:2=
=2E0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ch=
root went backwards which would break package feeds from (0:2.0.4-r0.53 to =
0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-cp=
io went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:=
2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-dd=
 went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:2.=
0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-dm=
esg went backwards which would break package feeds from (0:2.0.4-r0.53 to 0=
:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-fa=
lse went backwards which would break package feeds from (0:2.0.4-r0.53 to 0=
:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-fs=
type went backwards which would break package feeds from (0:2.0.4-r0.53 to =
0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-gu=
nzip went backwards which would break package feeds from (0:2.0.4-r0.53 to =
0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-gz=
ip went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:=
2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ha=
lt went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:=
2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ip=
config went backwards which would break package feeds from (0:2.0.4-r0.53 t=
o 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ki=
ll went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:=
2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ki=
nit went backwards which would break package feeds from (0:2.0.4-r0.53 to 0=
:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ln=
 went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:2.=
0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-lo=
setup went backwards which would break package feeds from (0:2.0.4-r0.53 to=
 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: bc-static-utils-2.0.4: Package version for packag=
e klibc-static-utils-mkfifo went backwards which would break package feeds =
=66rom (0:2.0.4-r0.53 to 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-mk=
nod went backwards which would break package feeds from (0:2.0.4-r0.53 to 0=
:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-mo=
unt went backwards which would break package feeds from (0:2.0.4-r0.53 to 0=
:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-mv=
 went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:2.=
0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-nf=
smount went backwards which would break package feeds from (0:2.0.4-r0.53 t=
o 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-nu=
ke went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:=
2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-pi=
vot-root went backwards which would break package feeds from (0:2.0.4-r0.53=
 to 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-po=
weroff went backwards which would break package feeds from (0:2.0.4-r0.53 t=
o 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-re=
adlink went backwards which would break package feeds from (0:2.0.4-r0.53 t=
o 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-re=
boot went backwards which would break package feeds from (0:2.0.4-r0.53 to =
0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-re=
sume went backwards which would break package feeds from (0:2.0.4-r0.53 to =
0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-ru=
n-init went backwards which would break package feeds from (0:2.0.4-r0.53 t=
o 0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-sh=
 went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:2.=
0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-sl=
eep went backwards which would break package feeds from (0:2.0.4-r0.53 to 0=
:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-sy=
nc went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:=
2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-tr=
ue went backwards which would break package feeds from (0:2.0.4-r0.53 to 0:=
2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-um=
ount went backwards which would break package feeds from (0:2.0.4-r0.53 to =
0:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils-un=
ame went backwards which would break package feeds from (0:2.0.4-r0.53 to 0=
:2.0.4-r0.1) [version-going-backwards]
klibc-static-utils-2.0.4: Package version for package klibc-static-utils we=
nt backwards which would break package feeds from (0:2.0.4-r0.53 to 0:2.0.4=
-r0.1) [version-going-bpackage feeds from (0:1.65-r0.51 to 0:1.65-r0.0) [ve=
rsion-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-dev=
 went backwards which would break package feeds from (0:1.65-r0.54 to 0:1.6=
5-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-doc=
 went backwards which would break package feeds from (0:1.65-r0.48 to 0:1.6=
5-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-doc=
 went backwards which would break package feeds from (0:1.65-r0.51 to 0:1.6=
5-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-doc=
 went backwards which would break package feeds from (0:1.65-r0.54 to 0:1.6=
5-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-loc=
ale went backwards which would break package feeds from (0:1.65-r0.48 to 0:=
1.65-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-loc=
ale went backwards which would break package feeds from (0:1.65-r0.51 to 0:=
1.65-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-loc=
ale went backwards which would break package feeds from (0:1.65-r0.54 to 0:=
1.65-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-sta=
ticdev went backwards which would break package feeds from (0:1.65-r0.48 to=
 0:1.65-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-sta=
ticdev went backwards which would break package feeds from (0:1.65-r0.51 to=
 0:1.65-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl-sta=
ticdev went backwards which would break package feeds from (0:1.65-r0.54 to=
 0:1.65-r0.0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl wen=
t backwards which would break package feeds from (0:1.65-r0.48 to 0:1.65-r0=
=2E0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl wen=
t backwards which would break package feeds from (0:1.65-r0.51 to 0:1.65-r0=
=2E0) [version-going-backwards]
libnet-ssleay-perl-1.65: Package version for package libnet-ssleay-perl wen=
t backwards which would break package feeds from (0:1.65-r0.54 to 0:1.65-r0=
=2E0) [version-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+e0c8915ea1: Package version for packa=
ge luna-sysmgr-common-dbg went backwards which would break package feeds fr=
om (0:3.0.0-3+git0+e0c8915ea1-r0.68 to 0:3.0.0-3+git0+e0c8915ea1-r0.1) [ver=
sion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+e0c8915ea1: Package version for packa=
ge luna-sysmgr-common-dbg went backwards which would break package feeds fr=
om (0:3.0.0-3+git0+e0c8915ea1-r0.72 to 0:3.0.0-3+git0+e0c8915ea1-r0.1) [ver=
sion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+e0c8915ea1: Package version for packa=
ge luna-sysmgr-common-dev went backwards which would break package feeds fr=
om (0:3.0.0-3+git0+e0c8915ea1-r0.68 to 0:3.0.0-3+git0+e0c8915ea1-r0.1) [ver=
sion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+e0c8915ea1: Package version for packa=
ge luna-sysmgr-common-dev went backwards which would break package feeds fr=
om (0:3.0.0-3+git0+e0c8915ea1-r0.72 to 0:3.0.0-3+git0+e0c8915ea1-r0.1) [ver=
sion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+e0c8915ea1: Package version for packa=
ge luna-sysmgr-common-doc went backwardwould break package feeds from (0:3.=
0.0-3+git0+e0c8915ea1-r0.68 to 0:3.0.0-3+git0+e0c8915ea1-r0.1) [version-goi=
ng-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+e0c8915ea1: Package version for packa=
ge luna-sysmgr-common went backwards which would break package feeds from (=
0:3.0.0-3+git0+e0c8915ea1-r0.72 to 0:3.0.0-3+git0+e0c8915ea1-r0.1) [version=
-going-backwards]
python3-cffi-1.9.1: Package version for package python3-cffi-dbg went backw=
ards which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [v=
ersion-going-backwards]
python3-cffi-1.9.1: Package version for package python3-cffi-dev went backw=
ards which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [v=
ersion-going-backwards]
python3-cffi-1.9.1: Package version for package python3-cffi-doc went backw=
ards which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [v=
ersion-going-backwards]
python3-cffi-1.9.1: Package version for package python3-cffi-locale went ba=
ckwards which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0)=
 [version-going-backwards]
python3-cffi-1.9.1: Package version for package python3-cffi-staticdev went=
 backwards which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0=
=2E0) [version-going-backwards]
python3-cffi-1.9.1: Package version for package python3-cffi went backwards=
 which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [versi=
on-going-backwards]
python3-cryptography-1.6: Package version for package python3-cryptography-=
dbg went backwards which would break package feeds from (0:1.6-r0.8 to 0:1.=
6-r0.0) [version-going-backwards]
python3-cryptography-1.6: Package version for package python3-cryptography-=
dev went backwards which would break package feeds from (0:1.6-r0.8 to 0:1.=
6-r0.0) [version-going-backwards]
python3-cryptography-1.6: Package version for package python3-cryptography-=
doc went backwards which would break package feeds from (0:1.6-r0.8 to 0:1.=
6-r0.0) [version-going-backwards]
python3-cryptography-1.6: Package version for package python3-cryptography-=
locale went backwards which would break package feeds from (0:1.6-r0.8 to 0=
:1.6-r0.0) [version-going-backwards]
python3-cryptography-1.6: Package version for package python3-cryptography-=
staticdev went backwards which would break package feeds from (0:1.6-r0.8 t=
o 0:1.6-r0.0) [version-going-backwards]
python3-cryptography-1.6: Package version for package python3-cryptography =
went backwards which would break package feeds from (0:1.6-r0.8 to 0:1.6-r0=
=2E0) [version-going-backwards]
python3-pyopenssl-16.2.0: Package version for package python3-pyopenssl-dbg=
 went backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16=
=2E2.0-r0.0) [version-going-backwards]
python3-pyopenssl-16.2.0: Package version for package python3-pyopenssl-dev=
 went backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16=
=2E2.0-r0.0) [version-going-backwards]
python3-pyopenssl-16.2.0: Package version for package python3-pyopenssl-doc=
 went backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16=
=2E2.0-r0.0) [version-going-backwards]
python3-pyopenssl-16.2.0: Package version for package python3-pyopenssl-loc=
ale went backwards which would break package feeds from (0:16.2.0-r0.8 to 0=
:16.2.0-r0.0) [version-going-backwards]
python3-pyopenssl-16.2.0: Package version for package python3-pyopenssl-sta=
ticdev went backwards which would break package feeds from (0:16.2.0-r0.8 t=
o 0:16.2.0-r0.0) [version-going-backwards]
python3-pyopenssl-16.2.0: Package version for package python3-pyopenssl-tes=
ts went backwards which would break package feeds from (0:3.12-r0.1 to 0:3.=
12-r0.0) [version-going-backwards]
python3-pyyaml-3.12: Package version for package python3-pyyaml went backwa=
rds which would break package feeds from (0:3.12-r0.1 to 0:3.12-r0.0) [vers=
ion-going-backwards]
python-cffi-1.9.1: Package version for package python-cffi-dbg went backwar=
ds which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [ver=
sion-going-backwards]
python-cffi-1.9.1: Package version for package python-cffi-dev went backwar=
ds which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [ver=
sion-going-backwards]
python-cffi-1.9.1: Package version for package python-cffi-doc went backwar=
ds which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [ver=
sion-going-backwards]
python-cffi-1.9.1: Package version for package python-cffi-locale went back=
wards which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [=
version-going-backwards]
python-cffi-1.9.1: Package version for package python-cffi-staticdev went b=
ackwards which would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0=
) [version-going-backwards]
python-cffi-1.9.1: Package version for package python-cffi went backwards w=
hich would break package feeds from (0:1.9.1-r0.2 to 0:1.9.1-r0.0) [version=
-going-backwards]
python-cryptography-1.6: Package version for package python-cryptography-db=
g went backwards which would break package feeds from (0:1.6-r0.8 to 0:1.6-=
r0.0) [version-going-backwards]
python-cryptography-1.6: Package version for package python-cryptography-de=
v went backwards which would break package feeds from (0:1.6-r0.8 to 0:1.6-=
r0.0) [version-going-backwards]
python-cryptography-1.6: Package version for package python-cryptography-do=
c went backwards which would break package feeds from (0:1.6-r0.8 to 0:1.6-=
r0.0) [version-going-backwards]
python-cryptography-1.6: Package version for package python-cryptography-lo=
cale went backwards which would break package feeds from (0:1.6-r0.8 to 0:1=
=2E6-r0.0) [version-going-backwards]
python-cryptography-1.6: Package version for package python-cryptography-st=
aticdev went backwards which would break package feeds from (0:1.6-r0.8 to =
0:1.6-r0.0) [version-going-backwards]
python-cryptography-1.6: Package version for package python-cryptography we=
nt backwards which would break package feeds from (0:1.6-r0.8 to 0:1.6-r0.0=
) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient-dbg went backwards which would break package feeds from (0:0.4.2-r0.2=
1 to 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient-dbg went backwards which would break package feeds from (0:0.4.2-r0.2=
3 to 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient-dev went backwards which would break package feeds from (0:0.4.2-r0.2=
1 to 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient-dev went backwards which would break package feeds from (0:0.4.2-r0.2=
3 to 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient-doc went backwards which would break package feeds from (0:0.4.2-r0.2=
1 to 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient-doc went backwards which would break package feeds from (0:0.4.2-r0.2=
3 to 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package rds which would break package feeds f=
rom (0:0.4.2-r0.23 to 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient went backwards which would break package feeds from (0:0.4.2-r0.21 to=
 0:0.4.2-r0.0) [version-going-backwards]
python-ndg-httpsclient-0.4.2: Package version for package python-ndg-httpsc=
lient went backwards which would break package feeds from (0:0.4.2-r0.23 to=
 0:0.4.2-r0.0) [version-going-backwards]
python-pyopenssl-16.2.0: Package version for package python-pyopenssl-dbg w=
ent backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16.2=
=2E0-r0.0) [version-going-backwards]
python-pyopenssl-16.2.0: Package version for package python-pyopenssl-dev w=
ent backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16.2=
=2E0-r0.0) [version-going-backwards]
python-pyopenssl-16.2.0: Package version for package python-pyopenssl-doc w=
ent backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16.2=
=2E0-r0.0) [version-going-backwards]
python-pyopenssl-16.2.0: Package version for package python-pyopenssl-local=
e went backwards which would break package feeds from (0:16.2.0-r0.8 to 0:1=
6.2.0-r0.0) [version-going-backwards]
python-pyopenssl-16.2.0: Package version for package python-pyopenssl-stati=
cdev went backwards which would break package feeds from (0:16.2.0-r0.8 to =
0:16.2.0-r0.0) [version-going-backwards]
python-pyopenssl-16.2.0: Package version for package python-pyopenssl-tests=
 went backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16=
=2E2.0-r0.0) [version-going-backwards]
python-pyopenssl-16.2.0: Package version for package python-pyopenssl went =
backwards which would break package feeds from (0:16.2.0-r0.8 to 0:16.2.0-r=
0.0) [version-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-dbg went back=
wards which would break package feeds from (0:3.12-r0.20 to 0:3.12-r0.0) [v=
ersion-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-dbg went back=
wards which would break package feeds from (0:3.12-r0.22 to 0:3.12-r0.0) [v=
ersion-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-dev went back=
wards which would break package feeds from (0:3.12-r0.20 to 0:3.12-r0.0) [v=
ersion-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-dev went back=
wards which would break package feeds from (0:3.12-r0.22 to 0:3.12-r0.0) [v=
ersion-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-doc went back=
wards which would break package feeds from (0:3.12-r0.20 to 0:3.12-r0.0) [v=
ersion-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-doc went back=
wards which would break package feeds from (0:3.12-r0.22 to 0:3.12-r0.0) [v=
ersion-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-locale went b=
ackwards which would break package feeds from (0:3.12-r0.20 to 0:3.12-r0.0)=
 [version-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-locale went b=
ackwards which would break package feeds from (0:3.12-r0.22 to 0:3.12-r0.0)=
 [version-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-staticdev wen=
t backwards which would break package feeds from (0:3.12-r0.20 to 0:3.12-r0=
=2E0) [version-going-backwards]
python-pyyaml-3.12: Package version for package python-pyyaml-staticdev wen=
t backwards which would break package feeds from (0:3.12-r0.22 to 0:3.12-r0=
=2E0) [version-going-backwards]
python-pyyaml-3.12: Package version for pacent backwards which would break =
package feeds from (0:2.3-r0.46 to 0:2.3-r0.0) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-dbg went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.67 =
to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-dbg went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.71 =
to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-dev went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.67 =
to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-dev went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.71 =
to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-doc went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.67 =
to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-doc went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.71 =
to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-locale we=
nt backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.=
67 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-locale we=
nt backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.=
71 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-mkspecs w=
ent backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0=
=2E67 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-mkspecs w=
ent backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0=
=2E71 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-staticdev=
 went backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-=
r0.67 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-staticdev=
 went backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-=
r0.71 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao went back=
wards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.67 to 0=
:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao went back=
wards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.71 to 0=
:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]


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
oppler: update to 0.51.0
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
e3c8469 onboard: initial add 1.3.0
5cfc356 nginx: update to version 1.11.8
c55d406 python-ipaddress: update to version 1.0.18
4751b71 python-flask-bootstrap: update to version 3.3.7.1
f1e1e05 python-netaddr: update to version 0.7.19
cccfbdb tremor: add (from oe-core)
275101c wireshark: update package to 2.2.4
4ffeaf1 xfce: add dbus-glib-native to DEPENDS to fix do_configure
9a6ea91 luajit: mips and mipsel are 32bit targets too
271bbe0 libgphoto2: remove bash runtime dependency.
306d47a python-selectors34: add new recipe for version 1.1
dbdb2c7 python-serpent: add new recipe for version 1.16
f01190d python-pyro4: update to version 4.53
a4b6d42 python-psutil: upgrade to version 5.0.1
9f6da5e python-click: update to version 6.7
2efbc1e python-cffi: Fix build for per-recipe sysroot.
cd9c5ce python-ndg-httpsclient: Fix build for per recipe sysroot.
90f6b5c python-pyopenssl: Fix build for per recipe sysroot.
56f1ea9 jack: add ARM NEON support for sample conversions
52c7bba fluidsynth: add ARM NEON support for sample interpolation
1fd940f nano: upgrade to 2.7.4
26ce753 remove some more True options to getVar calls
7cc8699 inetutils: register hostname.1 man page as an alternate
7344e23 multipath-tools: fix building of shared objects
280e767 multipath-tools: update to 0.6.4
cb16b43 opencv: Configure freetype via PACKAGECONFIG
576248e nginx: handle systemd service file
709329f libnet-ssleay-perl: fix build error
d7f39e1 python-cffi: Don't overwrite inherited dependencies
911739d python-pyopenssl: Don't overwrite inherited dependencies
e13ee3e python3-multidict: make repeated builds work even without sphinx
d607794 python-pyyaml: add dependency on python
dd1fc9a python-pytz: update to 2016.10
c162c91 gst-instruments: add recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
c0ba8ab qtbase: Remove comments about ICU and QtWebKit
not included in master yet:=20
333949a Upgrade to Qt 5.8
d1f7c36 cmake_qt5.bbclass: add qtbase-native to DEPENDS
c684acf qtbase: create empty oe-device-extra.pri
72e2a67 qtwayland: Add libxkbcommon in the dependencies

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
249f674 firefox: do not link against crmf library it is not there
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
6e1d346 alsa-utils: rename bbappend to match new version from oe-core
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
a04ef72 android-system: restore mount for hal-droid
not included in master yet:=20

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJMgsgAKCRA3VSO3ZXaA
HPQ3AJ4y+6wd603ORLNFg0UymUlAQaM2ZwCdFFXPdhCBeHX4c953qLuPK3FqITI=
=x7jR
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
