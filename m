Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9924565C85;
	Tue, 13 Jan 2015 18:38:54 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w62so4576241wes.11;
	Tue, 13 Jan 2015 10:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=+fCBpp4d2ZSacD52tCi588Zi2eS3cLrAJtWKMIickBY=;
	b=b7wg46JfZGdeuH48iiZUOSH6ZkwnFBWzK5xzmSJR1CZlmKm/YIW1MENMPvYA3BIa0l
	xLKXIoAmLxuZL0wIwqBr6aORI6aJh3l8GWASj4wJj3CqHZ6d0i3k0tkhXZsN29EtlyrE
	LqcUex2L/4yxRb5UWQ4ewb4zjHlftiGY8rKbytWz3+v2FqWMxCy942U801BwU/eWGCiq
	f5OURkqgNdY6/cuds5mccsIrGx0tSN2frSSfiRV49gKdDV1Cok/n7bL5HLCqWGdalhsC
	/Eb3/j7bElQpL8eQvyoY0s9KZTTiQx6GNrXXyRWmmzxQIa4sNTKwk/H7j/IuVmULInut
	grnQ==
X-Received: by 10.195.12.15 with SMTP id em15mr23532956wjd.80.1421174334273;
	Tue, 13 Jan 2015 10:38:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b10sm26756460wjr.32.2015.01.13.10.38.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jan 2015 10:38:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Jan 2015 19:38:54 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150113183854.GA2478@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-01-13
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
X-List-Received-Date: Tue, 13 Jan 2015 18:38:58 -0000
X-Groupsio-MsgNum: 61320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Finally only one recipe failing

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-01-13 =3D=3D

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150113_183718.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compile

=3D=3D=3D Number of failed tasks (1) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20150113_151939.log// ||=20
|-
|| qemux86 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20150113_161858.log// ||=20
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20150113_171930.log// || http://errors.yoctoproject.org:80/Errors/=
Search/1/4068/
|}

=3D=3D=3D PNBLACKLISTs (50) =3D=3D=3D

=3D=3D=3D QA issues (42) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||libdir
|-
||0	||textrel
|-
||42	||version-going-backwards
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse=
] ?=3D "depends on blacklisted libimobiledevice"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLICT: =
4 files conflict with gnome-keyring"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken polkit-gnome"
meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBLACKL=
IST[gnome-bluetooth] ?=3D "dbus-binding-tool fails with: Unable to load gno=
me-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D-B=
us interface name"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "BROKEN: fails to link against sctp_connectx symbol"
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNB=
LACKLIST[libimobiledevice] ?=3D "cannot run test program while cross compil=
ing"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gn=
ome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 1024 exc=
eeded, use -L<N> to change it"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Requires newer libav which has negative D_P"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or=
 directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "BRO=
KEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or dir=
ectory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?=
=3D "BROKEN: Doesn't work with B!=3DS"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-f=
ramework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incorrect=
ly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plu=
gins] ?=3D "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=3D "F=
ails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala=
] ?=3D "Fails to build since vala upgrade to 0.26.1"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from m=
eta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 42	issue: version-going-backwards
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl w=
ent backwards which would break package feeds from (0:2.16-r0.76 to 0:2.16-=
r0.75) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
bg went backwards which would break package feeds from (0:2.16-r0.76 to 0:2=
=2E16-r0.75) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
ev went backwards which would break package feeds from (0:2.16-r0.76 to 0:2=
=2E16-r0.75) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
oc went backwards which would break package feeds from (0:2.16-r0.76 to 0:2=
=2E16-r0.75) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-l=
ocale went backwards which would break package feeds from (0:2.16-r0.76 to =
0:2.16-r0.75) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-s=
taticdev went backwards which would break package feeds from (0:2.16-r0.76 =
to 0:2.16-r0.75) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl w=
ent backwards which would break package feeds from (0:1.03-r0.75 to 0:1.03-=
r0.74) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
bg went backwards which would break package feeds from (0:1.03-r0.75 to 0:1=
=2E03-r0.74) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
ev went backwards which would break package feeds from (0:1.03-r0.75 to 0:1=
=2E03-r0.74) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
oc went backwards which would break package feeds from (0:1.03-r0.75 to 0:1=
=2E03-r0.74) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-l=
ocale went backwards which would break package feeds from (0:1.03-r0.75 to =
0:1.03-r0.74) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-s=
taticdev went backwards which would break package feeds from (0:1.03-r0.75 =
to 0:1.03-r0.74) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl went backwards which would break package feeds from (0:1.997-r0.73 to 0=
:1.997-r0.72) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dbg went backwards which would break package feeds from (0:1.997-r0.73 =
to 0:1.997-r0.72) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dev went backwards which would break package feeds from (0:1.997-r0.73 =
to 0:1.997-r0.72) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-doc went backwards which would break package feeds from (0:1.997-r0.73 =
to 0:1.997-r0.72) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-locale went backwards which would break package feeds from (0:1.997-r0.=
73 to 0:1.997-r0.72) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-staticdev went backwards which would break package feeds from (0:1.997-=
r0.73 to 0:1.997-r0.72) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages went backwards which would break package =
feeds from (0:2.0.0-1+git0+79155bd3f1-r0.27 to 0:2.0.0-1+git0+79155bd3f1-r0=
=2E25) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dbg went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.27 to 0:2.0.0-1+git0+79155bd3f=
1-r0.25) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dev went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.27 to 0:2.0.0-1+git0+79155bd3f=
1-r0.25) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-doc went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.27 to 0:2.0.0-1+git0+79155bd3f=
1-r0.25) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-locale went backwards which would break p=
ackage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.27 to 0:2.0.0-1+git0+79155b=
d3f1-r0.25) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-staticdev went backwards which would brea=
k package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.27 to 0:2.0.0-1+git0+791=
55bd3f1-r0.25) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime went backwards which would break package feeds from (0:1.0-r0.1=
33 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-dbg went backwards which would break package feeds from (0:1.0-=
r0.133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-dev went backwards which would break package feeds from (0:1.0-=
r0.133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-doc went backwards which would break package feeds from (0:1.0-=
r0.133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-locale went backwards which would break package feeds from (0:1=
=2E0-r0.133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-staticdev went backwards which would break package feeds from (=
0:1.0-r0.133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network went backwards which would break package feeds from (0:1.0-r0.133=
 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-dbg went backwards which would break package feeds from (0:1.0-r0=
=2E133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-dev went backwards which would break package feeds from (0:1.0-r0=
=2E133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-doc went backwards which would break package feeds from (0:1.0-r0=
=2E133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-locale went backwards which would break package feeds from (0:1.0=
-r0.133 to 0:1.0-r0.131) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-staticdev went backwards which would break package feeds from (0:=
1.0-r0.133 to 0:1.0-r0.131) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwa=
rds which would break package feeds from (0:1.34-r8.114 to 0:1.34-r8.112) [=
version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went ba=
ckwards which would break package feeds from (0:1.34-r8.114 to 0:1.34-r8.11=
2) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went ba=
ckwards which would break package feeds from (0:1.34-r8.114 to 0:1.34-r8.11=
2) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went ba=
ckwards which would break package feeds from (0:1.34-r8.114 to 0:1.34-r8.11=
2) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went=
 backwards which would break package feeds from (0:1.34-r8.114 to 0:1.34-r8=
=2E112) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev w=
ent backwards which would break package feeds from (0:1.34-r8.114 to 0:1.34=
-r8.112) [version-going-backwards]

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS1Zj4ACgkQN1Ujt2V2gBy5/QCglMVyUHlbwz6nveIxti/YgYOb
c7IAoKAHj38Mbld59OJc6is+n15N6Q18
=cxbb
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
