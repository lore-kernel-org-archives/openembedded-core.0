Return-Path: <niko.mauno@vaisala.com>
Received: from den-mailgw-01.vaisala.com (den-mailgw-01.vaisala.com
	[63.233.207.20])
	by mail.openembedded.org (Postfix) with ESMTP id B60937898C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 09:45:03 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H+AACNs59ah++ax9VdGgEBAQEBAgEBA?=
	=?us-ascii?q?QEIAQEBAYJ8Iy6BSgQLKAqOYow7ghsygRaUNIE3A1sKhTACgyg2FgECAQEBAQE?=
	=?us-ascii?q?BAgECEAEBAQgNCQgoIwuCOCKBBDEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBAQMCNDcBBUABATgPAgEIGC4yJQIEDQgBAReEaAMWA5x4Aos?=
	=?us-ascii?q?NAQGDFIMBAQEFgWqCQhiBJYIZCItFDIJCNoFbgzAWhW2IHJJPCY0Hg3F2eByMd?=
	=?us-ascii?q?TCHSIkxAgICAgkCEQEBB4EuJQGCAzMaI4MSgiIfggd3iw0BgRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2H+AACNs59ah++ax9VdGgEBAQEBAgEBAQEIAQEBAYJ8Iy6?=
	=?us-ascii?q?BSgQLKAqOYow7ghsygRaUNIE3A1sKhTACgyg2FgECAQEBAQEBAgECEAEBAQgNC?=
	=?us-ascii?q?QgoIwuCOCKBBDEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQE?=
	=?us-ascii?q?BAQMCNDcBBUABATgPAgEIGC4yJQIEDQgBAReEaAMWA5x4AosNAQGDFIMBAQEFg?=
	=?us-ascii?q?WqCQhiBJYIZCItFDIJCNoFbgzAWhW2IHJJPCY0Hg3F2eByMdTCHSIkxAgICAgk?=
	=?us-ascii?q?CEQEBB4EuJQGCAzMaI4MSgiIfggd3iw0BgRcBAQE?=
X-IronPort-AV: E=Sophos;i="5.47,435,1515481200"; d="scan'208";a="13272432"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=mzArqr2scEXaueOiQn2HSl9rUVRiW7VKzEE+1H9wNcQ=;
	b=Ha49q1TqjZ1Oaeu5Cw0djUn2/8OMADG/MbPnHat4RUm1TXOH0KUNIMEsmxgIACW0Qp7GlCB5Fd+F65sfJnOWt6nn/gLIiWTip4sGR/RHROgtdrbOdthf3pJM4cS/y8KXZG5ttXISXLeeXGzyytABbauDoQY0xkekroz67olyu1A=
From: Mauno Niko <niko.mauno@vaisala.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] package_manager.py: Explicit complementary fail
Thread-Index: AQHTsLAJ/vh5qETvJ0Cps4RKTf96v6O6CVkAgALylYCAB5SbgA==
Date: Wed, 7 Mar 2018 09:45:00 +0000
Message-ID: <471b36a1-d51d-1602-6e7f-3589db9a69e9@vaisala.com>
References: <20180228162008.14197-1-niko.mauno@vaisala.com>
	<aff352ce-9c5a-c8bb-fa78-74951722d4f8@linux.intel.com>
	<a96ac7d4-946d-d299-e727-3a5095778675@vaisala.com>
In-Reply-To: <a96ac7d4-946d-d299-e727-3a5095778675@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0601MB2547;
	7:1DhZBsb2ljajzIpntF6sht/89s5VakNvEgacie/iGI18hcELS45ks3T8z5wnlEXrjzC1jo24G70movbj5MPT1GDGscRniT1R4mpVZPQBqr81qXIjvDv1dNTuBg1V66w4NH0dK3WHO8tVHzkziahkG0+EnI1vVWcnTZuBVfMED21Y+4TmwhFziMlnXrq5J3jtMfvd4TEi3XEuDi8ou5oHHuqiJZ+LjS3V3gbr0cWudb6kZ1HPRfaiz7XpFdddWG/0
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 53ad94e9-efff-42eb-f7ef-08d584101871
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4604075)(3008032)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0601MB2547; 
x-ms-traffictypediagnostic: AM5PR0601MB2547:
x-microsoft-antispam-prvs: <AM5PR0601MB2547FB57FBE36F1D887D6E1481D80@AM5PR0601MB2547.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231220)(944501244)(52105095)(6041288)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(2016111802025)(6072148)(6043046)(201708071742011);
	SRVR:AM5PR0601MB2547; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2547; 
x-forefront-prvs: 0604AFA86B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(396003)(39850400004)(346002)(376002)(366004)(189003)(199004)(3660700001)(5660300001)(2906002)(68736007)(53546011)(6506007)(229853002)(31686004)(65956001)(66066001)(65806001)(26005)(478600001)(3280700002)(65826007)(186003)(36756003)(3846002)(105586002)(6116002)(102836004)(59450400001)(2950100002)(6916009)(14454004)(305945005)(7736002)(6486002)(8676002)(58126008)(316002)(53936002)(106356001)(25786009)(6246003)(76176011)(551544002)(81166006)(8936002)(81156014)(99286004)(2900100001)(31696002)(6512007)(2501003)(86362001)(5640700003)(5250100002)(6436002)(97736004)(7520500002)(2351001)(64126003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2547;
	H:AM5PR0601MB2531.eurprd06.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-microsoft-antispam-message-info: MpoVMOq6nNN0/s/c1M0JFQC/C1MB7lNgq1zGAr+j1EW1XT8Wez+hxyQnr2f9vCcavjlC1DZpW+NJmYKbCsp2bK4qXegAMQuvk0OaSYUiK7ebbXUoajEUqLpeiV+TRuw3RSSYa3AGesPBkEqkK1U7mjKdm3MFRxgM5TS3Z51DDaV/kK9aog6EHAiqkUEgfRik4pfdaG5Vq4tG4qgaYKP9sfinFFnM3EkyQ+BSuLsuevwYl+VQmMEcO2LHit/+gLtnAuTSy8i7mxTbMsZqwd/82hVwZoaah6IjfAEZTGbxnXBD61DRVoa8egQR+6jm6kkcBFo/ebGsqIIiPj1dMx2pRA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ad94e9-efff-42eb-f7ef-08d584101871
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2018 09:45:00.5696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2547
Subject: Re: [PATCH] package_manager.py: Explicit complementary fail
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
X-List-Received-Date: Wed, 07 Mar 2018 09:45:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <6BFAFD9FCD44FB4CB6BA2EAF0C4028EA@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On 03/02/2018 03:59 PM, Mauno Niko wrote:
> On 02/28/2018 06:58 PM, Alexander Kanavin wrote:
>> On 02/28/2018 06:20 PM, Niko Mauno wrote:
>>>
>>> Improve associated install() method behaviour in affected OpkgPM and
>>> DpkgPM classes so that a problematic state of affairs becomes directly
>>> obvious for bitbake user, resulting in shell output like:
>>
>> Does rpm need the same fix?
>=20
> RpmPM's respective install() implementation deviates somewhat from it's O=
pkgPM, DpkgPM counterparts. It seems that rpm applies '--skip-broken' switc=
h to dnf command which supposedly ignores just the conflicting packages in =
a given set, while installing all others.
>=20
> The behaviour in opkg/dpkg case however seems to be, that in case of even=
 single conflicting package in a package set, the whole package set is sile=
ntly left uninstalled. I performed a test against a reference image where t=
he issue manifests, and compared to rpm, opkg/dpkg-based SDK images lacked =
over half of target packages:
>=20
> $ wc -l toolchain-target-manifest-*
>    317 toolchain-target-manifest-deb
>    317 toolchain-target-manifest-ipk
>    653 toolchain-target-manifest-rpm
>=20

Steps to reproduce problem with current poky master (at e5f258cecef6c51a4d7=
ebeedbaa29d2126e566e3):

1) Add following line to build/conf/local.conf:
IMAGE_INSTALL_append =3D " openssh-sftp-server"

2) Perform 'bitbake -c populate_sdk core-image-sato' against each 'package_=
deb', 'package_rpm' and 'package_ipk' values of PACKAGE_CLASSES variable an=
d make note of contents of each resulting build/tmp/deploy/sdk/poky-glibc-x=
86_64-core-image-sato-i586-toolchain-2.4+snapshot.target.manifest files.

3) Compare resulting target.manifest files and notice that vast amount of t=
arget packages (mostly *-dev, *-dbg, but others too) are missing from SDK w=
hen PACKAGE_CLASSES is set to ipk or deb:

# wc -l sdk-sato-*/*.target.manifest=20
  601 sdk-sato-deb/....target.manifest
  601 sdk-sato-ipk/....target.manifest
 1413 sdk-sato-rpm/....target.manifest


In OpkgPM, DpkgPM cases, install_complementary() seems to fail the whole se=
t (without QA warnings) if there is even one conflicting package (such as '=
openssh' in this case).=20

In RpmPM case, implementation deviates somewhat from it's OpkgPM, DpkgPM co=
unterparts - a '--skip-broken' switch is applied to dnf command which effec=
tively would seem to (silently) leave out only the conflicting 'openssh' pa=
ckage (without QA warnings), instead of whole set.=20

Without this patch, there is no explicit notification of shortcoming to bit=
bake user.=20

With this patch applied, warnings are printed to console during bitbake ope=
ration (full output in appendix below) in package_ipk, package_deb cases. T=
his should be helpful to bitbake user who then can mitigate the situation (=
eg. by adding 'openssh' to 'PACKAGE_EXCLUDE_COMPLEMENTARY' variable).

--

Appendix 1: PACKAGE_CLASSES =3D "package_ipk"

WARNING: core-image-sato-1.0-r0 do_populate_sdk: Unable to install packages=
. Command '/home/oe/branches/upstream/master/build/tmp/work/qemux86-poky-li=
nux/core-image-sato/1.0-r0/recipe-sysroot-native/usr/bin/opkg --volatile-ca=
che -f /home/oe/branches/upstream/master/build/tmp/work/qemux86-poky-linux/=
core-image-sato/1.0-r0/opkg.conf -t /home/oe/branches/upstream/master/build=
/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/temp/ipktemp/ -o /home/=
oe/branches/upstream/master/build/tmp/work/qemux86-poky-linux/core-image-sa=
to/1.0-r0/sdk/image/opt/poky/2.4+snapshot/sysroots/i586-poky-linux  --force=
_postinstall --prefer-arch-to-version   install sato-screenshot-dbg console=
kit-dbg libpopt-dev libmb-dev libgles2-mesa-dev initscripts-dev gcc-runtime=
-dbg packagegroup-base-wifi-dev openssh-dev matchbox-panel-2-dev iptables-d=
bg libglapi-dev packagegroup-base-pci-dev libtag-dev libfontenc-dbg libnss-=
mdns-dbg xcursor-transparent-theme-dev libmb-dbg sysvinit-inittab-dbg libst=
artup-notification-1-dbg libexif-dev iw-dev libnss-mdns-dev libx11-dev dist=
cc-dbg libatk-1.0-dbg libsqlite3-dev libxinerama-dev vte-dbg bash-dev xf86-=
video-vmware-dev libglib-2.0-dev libdbus-glib-1-dev util-linux-dev bzip2-de=
v libz-dbg libxtst-dbg kmod-dbg orc-dbg ca-certificates-dev libxkbfile-dbg =
packagegroup-core-x11-base-dev xf86-video-cirrus-dev libfakekey-dbg libpcre=
-dbg libnl-3-dbg libevdev-dbg libogg-dev libdbus-glib-1-dbg netbase-dev sha=
red-mime-info-dbg packagegroup-core-boot-dev libxxf86vm-dev xrandr-dbg pack=
agegroup-base-zeroconf-dev pcmanfm-dev binutils-dev packagegroup-core-ssh-d=
ropbear-dev libinput-dev libxxf86dga-dev pointercal-xinput-dev sysvinit-ini=
ttab-dev libxcursor-dbg xauth-dbg busybox-dev shadow-securetty-dev connman-=
conf-dbg libxcursor-dev psplash-dev libgcrypt-dev libwayland-egl-dev libfm-=
extra-dev libinput-dbg libtirpc-dbg libtirpc-dev libarchive-dev packagegrou=
p-base-zeroconf-dbg gtk+3-dbg libxfixes-dev opkg-dbg gstreamer1.0-plugins-b=
ase-dev base-passwd-dev curl-dev shadow-securetty-dbg sysvinit-dev avahi-db=
g libgbm-dev netbase-dbg liblzo2-dbg mini-x-session-dev modutils-initscript=
s-dbg libwrap-dev libstartup-notification-1-dev acl-dev udev-extraconf-dev =
packagegroup-base-dbg libspeex-dbg libxml2-dbg libwebp-dev openssh-dbg libu=
sb-1.0-dev packagegroup-core-boot-dbg libnfsidmap-dbg packagegroup-base-blu=
etooth-dev xf86-video-fbdev-dbg libxcb-dev libdmx-dbg attr-dev packagegroup=
-core-x11-sato-games-dev xdpyinfo-dev libevent-dbg xserver-nodm-init-dev vt=
e-dev alsa-state-dbg matchbox-panel-2-dbg libarchive-dbg alsa-lib-dbg formf=
actor-dev pointercal-xinput-dbg connman-dbg libpng16-dbg libusb-1.0-dbg lib=
xxf86vm-dbg libxdamage-dbg wpa-supplicant-dbg opkg-arch-config-dev packageg=
roup-core-x11-sato-dev xmodmap-dev libmenu-cache-dbg libgudev-1.0-dbg libpi=
xman-1-dev modutils-initscripts-dev libxi-dev libsbc-dev libxcb-dbg puzzles=
-dev libcroco-dbg xmodmap-dbg pciutils-dbg ncurses-dbg xinput-dbg libxv-dbg=
 gconf-dev init-ifupdown-dbg libnl-3-dev packagegroup-base-usbgadget-dev xh=
ost-dbg libxcb-util-dbg packagegroup-core-device-devel-dbg libdmx-dev base-=
files-dbg libepoxy-dev gstreamer1.0-plugins-bad-dev pulseaudio-dbg libatk-b=
ridge-2.0-dev libxkbcommon-dbg wayland-dev wayland-dbg gst-examples-dbg lib=
gcc-s-dbg xserver-xf86-config-dbg hicolor-icon-theme-dbg pcmanfm-dbg libxco=
mposite-dbg util-linux-dbg xinput-calibrator-dbg opkg-arch-config-dbg ofono=
-dbg l3afpad-dbg libxmu-dbg xset-dev distcc-dev libxcomposite-dev avahi-dev=
 matchbox-keyboard-dbg libmenu-cache-dev target-sdk-provides-dummy-dbg libx=
fixes-dbg xinput-calibrator-dev libfm-extra-dbg mtdev-dev alsa-lib-dev libp=
ng16-dev eudev-dev libxv-dev libfontconfig-dev nfs-export-root-dbg packageg=
roup-core-nfs-server-dbg libatspi-dev glibc-locale-dbg alsa-utils-dbg libca=
iro-dbg xinput-dev libevdev-dev libxext-dev libgnutls-dev attr-dbg flac-dev=
 acl-dbg xz-dev libspeexdsp-dbg matchbox-terminal-dev xf86-input-libinput-d=
bg libwebp-dbg iptables-dev xset-dbg libxxf86dga-dbg ncurses-dev sysvinit-d=
bg formfactor-dbg libatspi-dbg libfreetype-dbg libgpg-error-dbg libvorbis-d=
bg xserver-xorg-dev libpcre2-dbg libsndfile-d
Collected errors:
 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - package openssh-dev-7.6p1-r0.i586 requires openssh =3D 7.6p1-r0, but=
 none of the providers can be installed
 *=20
 * Solution 1:
 *   - allow deinstallation of packagegroup-core-ssh-dropbear-1.0-r1.all

 *   - do not ask to install a package providing dropbear-dev

 *   - do not ask to install a package providing packagegroup-core-ssh-drop=
bear-dev

 * Solution 2:
 *   - do not ask to install a package providing openssh-dev


Appendix 2: PACKAGE_CLASSES =3D "package_deb"

WARNING: core-image-sato-1.0-r0 do_populate_sdk: Unable to install packages=
. Command '/home/oe/branches/upstream/master/build/tmp/work/qemux86-poky-li=
nux/core-image-sato/1.0-r0/recipe-sysroot-native/usr/bin/apt-get  install -=
-force-yes --allow-unauthenticated nettle-dev busybox-dbg distcc-config-dev=
 libnfsidmap-dbg alsa-plugins-dbg attr-dbg libspeex-dev libmenu-cache-dbg l=
ibxi-dev settings-daemon-dbg wireless-tools-dbg xcursor-transparent-theme-d=
bg libnl-3-dev pciutils-dev libsbc-dbg libxcomposite-dev libmb-dbg libnfsid=
map-dev glibc-locale-dbg gstreamer1.0-plugins-good-dev ca-certificates-dbg =
libdrm-dev libffi-dev libsndfile-dev orc-dev libspeexdsp-dev shutdown-deskt=
op-dbg libnss-mdns-dev libunistring-dev xdpyinfo-dev packagegroup-core-nfs-=
server-dev nfs-utils-dbg openssl-dbg settings-daemon-dev libcairo-dev libgp=
g-error-dbg gstreamer1.0-dbg libfakekey-dbg matchbox-panel-2-dbg util-linux=
-dbg libtool-dev libreadline-dbg libxcb-dev packagegroup-core-ssh-dropbear-=
dbg libusb-1.0-dev libpng16-dbg packagegroup-base-alsa-dbg libfm-extra-dbg =
eudev-dev libpixman-1-dev libxtst-dev alsa-lib-dev matchbox-wm-dev libogg-d=
ev pciutils-dbg pcmanfm-dbg packagegroup-core-x11-sato-apps-dev vte-dev lib=
dbus-glib-1-dev libice-dev libpcre2-dev packagegroup-core-x11-utils-dev sat=
o-screenshot-dbg xinput-dbg libxcomposite-dbg packagegroup-base-nfs-dev als=
a-utils-dev sato-screenshot-dev libgdk-pixbuf-2.0-dev alsa-state-dbg flac-d=
bg dbus-dev shared-mime-info-dbg libatk-1.0-dev packagegroup-base-nfs-dbg s=
ysvinit-dev packagegroup-base-bluetooth-dbg libxrandr-dbg libtag-dev waylan=
d-dbg netbase-dev dpkg-dbg mtdev-dev sudo-dbg libgpg-error-dev libtirpc-dbg=
 libxv-dev libxext-dev packagegroup-distro-base-dbg xset-dbg xf86-video-vmw=
are-dbg flac-dev matchbox-theme-sato-dev perl-dev libtirpc-dev librsvg-2-de=
v packagegroup-machine-base-dbg libffi-dbg libxau-dev opkg-utils-dbg libxft=
-dbg libdmx-dbg wpa-supplicant-dev packagegroup-machine-base-dev libxau-dbg=
 attr-dev matchbox-terminal-dbg shared-mime-info-dev libpciaccess-dbg dropb=
ear-dbg libmb-dev libwebp-dev run-postinsts-dbg xf86-input-libinput-dbg lib=
png16-dev libgles2-mesa-dev gconf-dbg libxmu-dev xinput-calibrator-dev libs=
tartup-notification-1-dbg xdpyinfo-dbg libxxf86dga-dbg packagegroup-core-x1=
1-utils-dbg bluez5-dbg xset-dev libxdmcp-dev libexif-dev libcap-dbg libsm-d=
bg nfs-export-root-dbg libexpat-dbg libpcre-dbg libxcursor-dev target-sdk-p=
rovides-dummy-dev xauth-dbg libharfbuzz-dbg packagegroup-base-ipv6-dbg libg=
crypt-dev xrandr-dev matchbox-keyboard-dev libxxf86dga-dev libgnutls-dev rp=
cbind-dev shadow-dev base-passwd-dbg nfs-utils-dev sysvinit-inittab-dev pac=
kagegroup-base-ipv6-dev libxtst-dbg libgudev-1.0-dev libevdev-dbg packagegr=
oup-core-x11-base-dev packagegroup-base-dev libexif-dbg apt-dev libspeexdsp=
-dbg kmod-dbg matchbox-session-sato-dev libsqlite3-dev libxxf86misc-dev xho=
st-dev libxi-dbg consolekit-dbg psplash-dbg pulseaudio-client-conf-sato-dev=
 libxkbcommon-dev mobile-broadband-provider-info-dev udev-extraconf-dbg pac=
kagegroup-core-nfs-server-dbg l3afpad-dbg packagegroup-core-ssh-dropbear-de=
v libgmp-dbg sudo-dev libpopt-dev bluez5-dev libxinerama-dev libxshmfence-d=
ev v86d-dbg libdbus-glib-1-dbg xserver-xorg-dbg busybox-dev libevent-dbg pa=
ckagegroup-core-x11-xserver-dev shadow-securetty-dev packagegroup-distro-ba=
se-dev bash-dev libcairo-dbg openssl-dev nfs-export-root-dev bzip2-dev xser=
ver-xf86-config-dev connman-conf-dbg connman-dev libevdev-dev libxfont2-dev=
 libfontconfig-dev libinput-dbg libfontenc-dev ca-certificates-dev connman-=
dbg gstreamer1.0-plugins-good-dbg matchbox-terminal-dev shadow-dbg libxdmcp=
-dbg shutdown-desktop-dev packagegroup-core-boot-dbg libdrm-dbg xinput-cali=
brator-dbg alsa-utils-dbg libxdamage-dev xcursor-transparent-theme-dev libs=
tartup-notification-1-dev alsa-state-dev packagegroup-base-zeroconf-dbg con=
nman-gnome-dev glib-networking-dbg packagegroup-core-x11-sato-games-dev pac=
kagegroup-base-usbgadget-dbg libjpeg-dbg xhost-dbg util-linux-dev matchbox-=
wm-dbg mini-x-session-dbg packagegroup-base-zeroconf-dev packagegroup-core-=
boot-dev xmodmap-dbg libxinerama-dbg vte-dbg=20
Reading package lists...
Building dependency tree...
Reading state information...
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 openssh-dev : Depends: openssh (=3D 7.6p1-r0) but it is not going to be in=
stalled
               Recommends: libcrypto-dev but it is not installable
               Recommends: openssh-keygen-dev but it is not installable
               Recommends: openssh-misc-dev but it is not installable
               Recommends: openssh-scp-dev but it is not installable
               Recommends: openssh-sftp-dev but it is not installable
               Recommends: openssh-sftp-server-dev but it is not installabl=
e
               Recommends: openssh-ssh-dev but it is not installable
               Recommends: openssh-sshd-dev but it is not installable
               Recommends: openssl10-dev but it is not installable
               Recommends: shadow-sysroot-dev but it is not installable
               Recommends: update-alternatives-opkg-dev but it is not insta=
llable
E: Unable to correct problems, you have held broken packages.


