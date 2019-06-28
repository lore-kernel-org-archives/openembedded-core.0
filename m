Return-Path: <Luca.Boccassi@microsoft.com>
X-Greylist: delayed 7203 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 29 Jun 2019 00:22:23 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150110.outbound.protection.outlook.com [40.107.15.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6DA7CF98
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 00:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=WFhS7zlogpZzIjqZaKE5HgLsfr+AljSYUinmsYX2ogmd1gR4LfusGBcztYK29zPV66pV/X+IBTPXrFBZKgELpp7lCCFbrcS+YWaM9ZvKPyZQIt0IMAO2i0o2txfmDQNdvzdMCt9wCtYl/d3vZviinZAY2DvnTn31fsgEFCNyY77EqapMpJFb614HOPuOLCcPiuX7o0VhIgEmhitflELAIMSRAy80rteS2KyGDQQJGaUa7L8D6GfHJLJq0MIz9rCN9RKvjZY4pVOEV/xfChs4ZNaR41VEN4sb3vMkLRnw8iDjaYGvGjQCkxPs36JQ6BDUXc4DDXp82k6hvdM2ZF2JPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EzqueB3xRt9YpwYuBQAtSHG34OwDaqC/5yMKR430Vm8=;
	b=iXjyzj1H6/WbPO7aFBlYwzSJ0sBW6naifoSAFDOPFv5Ch0aUgJ4QkbdKMElFBI3vhFdiB6t1kN17PcRlTOmV3YK0K56avuka5YL3nbitRPTaLKVDVznyq0YBspcUZqVDIs/hNXQ3wGKYVEbcHTIuylZCHTJhBcJHjEMWTjbeHpb0MMjyIMI82TTiNDp2vGs+XoOnHOfTHmx+sLw8aa2tlOvNadK0FSBVx90Y/WfClCZY6KQbAe+i6//qABMImN60VRwTttEFQBRnKQaaoIzsh71QH5RisDcuVbCvruTqsxIx0kka0LUE6otln762n/hSVEfbrIqG0kURxcycptlrrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=microsoft.com;dmarc=pass action=none
	header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EzqueB3xRt9YpwYuBQAtSHG34OwDaqC/5yMKR430Vm8=;
	b=LtDJsEoJl/nL8LUwGTZxuFFjVYT1dQ5K8vaRSzX0Z/BC7Hi0ONAnWdfp+AMCgxcZDhZ8c6ieC7FFlmdCk2d4KK+bL7MzWO9a+GuL3XAlQYy2UhXVD43h6X+xRTDiDET/Qg/Xrv4wXoYAuD/2vpekllBTF5mssDqvJkhyJHLoIMo=
Received: from HE1PR8303MB0092.EURPRD83.prod.outlook.com (129.75.142.219) by
	HE1PR8303MB0074.EURPRD83.prod.outlook.com (129.75.142.213) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.4; Fri, 28 Jun 2019 16:52:13 +0000
Received: from HE1PR8303MB0092.EURPRD83.prod.outlook.com
	([fe80::1888:c619:efc6:749d]) by
	HE1PR8303MB0092.EURPRD83.prod.outlook.com
	([fe80::1888:c619:efc6:749d%6]) with mapi id 15.20.2052.003;
	Fri, 28 Jun 2019 16:52:12 +0000
From: Luca Boccassi <Luca.Boccassi@microsoft.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow
	correct operation with opkg
Thread-Index: AQHVLdHVeMUfzMcN1EGX2ods0QZRWg==
Date: Fri, 28 Jun 2019 16:52:12 +0000
Message-ID: <3fe59bbe44185ac5436afc8d48d2c2e313686ae9.camel@microsoft.com>
References: <81618ab958486def551d22764d960944fb09b73d.camel () linuxfoundation
	! org>
In-Reply-To: <81618ab958486def551d22764d960944fb09b73d.camel ()
	linuxfoundation ! org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Luca.Boccassi@microsoft.com; 
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebc524f7-92ba-4cb5-9cf9-08d6fbe8f7e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
	SRVR:HE1PR8303MB0074; 
x-ms-traffictypediagnostic: HE1PR8303MB0074:
x-microsoft-antispam-prvs: <HE1PR8303MB00749895F6191A704D33908CF1FC0@HE1PR8303MB0074.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:480;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(189003)(199004)(81156014)(6916009)(73956011)(4001150100001)(4326008)(66946007)(76176011)(25786009)(66066001)(2501003)(76116006)(6116002)(229853002)(10290500003)(36756003)(6436002)(6486002)(14444005)(66446008)(66616009)(66556008)(64756008)(66476007)(256004)(3846002)(2906002)(446003)(53936002)(316002)(71190400001)(26005)(305945005)(102836004)(6306002)(11346002)(2616005)(22452003)(14454004)(54906003)(5640700003)(6512007)(486006)(10090500001)(478600001)(5660300002)(107886003)(71200400001)(99286004)(118296001)(8676002)(86362001)(6246003)(81166006)(6506007)(68736007)(966005)(2351001)(11926002)(186003)(7736002)(8936002)(99936001)(72206003)(476003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR8303MB0074;
	H:HE1PR8303MB0092.EURPRD83.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AABqTiX9J1I9DqiUGE3ANGZ9XuzlIAS+ye8MrYvYkj1Y/r7MkguuaOhd8q/3CuQN5eKkDb3l5fs+qk8QEfoKmauVthd+4Wlj//bPkP6llBZTIUDjSaEc6NzIowPFZvbZLpgw2aWKuVwoh5WvjpIjQj43hVrkSVSuGSnxnkIPJaXc7CtKM7KvBXMDT6PjXi5lYUA/NHegGssOsRBUwG2lDM+53wzbiR1FAVh0LV3sukIbTerkiBPO1HXAAn9PvIXQUsIKvzVzMmKN0pgsjdrReQdUUy9yfBwDjzZYqjM2teowlafAv1b0jbu2cVXmF9oGsPaGIoyJuV1x4wismLMEJGmTWXM88r0qH8GCYRmdzmypEZYself/tXv2WZXOVYchmzWIhnse4/eGGcWf+eG0JtRZ1f52WJam3gE9IAlCKYs=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc524f7-92ba-4cb5-9cf9-08d6fbe8f7e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 16:52:12.6176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: luboccas@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR8303MB0074
Cc: Sinan Kaya <Sinan.Kaya@microsoft.com>,
	Anatol Belski <Anatol.Belski@microsoft.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Sat, 29 Jun 2019 00:22:24 -0000
X-Groupsio-MsgNum: 126369
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mIXSBDmWkFcAq9GLwdIt"

--=-mIXSBDmWkFcAq9GLwdIt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-01-03 at 13:59 +0000, Richard Purdie wrote:
> On Mon, 2018-12-31 at 20:56 +0100, Andrej Valek wrote:
> > Your previous solution is working for me, so I was not working on
> > fixing
> > this. I thought, that You will just add missing packages, and that
> > is.
> > I don't have setup for failing machine.
> >=20
> > Is there any simple way to get all missing perl packages?
>=20
> I reworked the patch a bit, tested and just merged a working version
> of
> it:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dd4e27863f3874fb7dc=
543eed8dcf6a8c4d146fb5
>=20
>=20
> Cheers,
>=20
> Richard

Hello Richard,

Due to this change in thud, the populate_sdk step when PACKAGE_CLASSES
is set to package_deb rather than rpm does not work anymore:

2019-06-27T13:18:54.5591007Z [WARN] [15901] ERROR: mc:generic-lnx-
sdk:generic-image-gen1-1.0-r0 do_populate_sdk: Unable to install
packages. Command '/source/build-proj-generic-x86-64-dev/tmp-generic-
lnx-sdk-glibc/work/_generic_x86_64_dev-linux/generic-image-gen1/1.0-
r0/recipe-sysroot-native/usr/bin/apt-get  install --force-yes --allow-
unauthenticated cryptsetup libprotobuf17 libxslt-dev m4 gnupg util-
linux-uuidd openssh-ssh util-linux-uuidgen python3-pip cmake logrotate
volatile-binds-dev sudo update-alternatives-opkg key-store-system-
trusted-privkey util-linux-mkfs libfontconfig1 base-files libgmp-dev
openssh-scp lz4-dev perl libsepol1 diffutils libc-staticdev lighttpd
cryptodev-linux-dev udev-hwdb cppnetlib cppnetlib-staticdev openssl-
staticdev libx11-6 cpio sed-dev openssh-sshd ethtool unzip-dev openssh-
keygen db procps-dev libprotobuf-c-dev diskprep ncurses-staticdev pango
grub util-linux-agetty util-linux-readprofile less util-linux-sulogin
keyutils libatomic-dev libsigc-2.0-0 packagegroup-core-boot util-linux-
utmpdump locale-base-en-us libxext6 gawk libsrpm-dev cppneturi-dev
libxml2-dev libarchive init-ifupdown bzip2-dev dpkg ncurses-dev
libgomp-staticdev shadow-securetty-dev libgcc-s-dev cppnetlib-dev
rsyslog findutils which linux-libc-headers-dev libffi-dev which-dev
util-linux-fsck libarchive-dev makedumpfile liblzo2-dev libxml++-2.6-2
python3 libgomp1 sharutils libubsan1 boost liblzo2-2 packagegroup-core-
standalone-sdk-target dtc shadow-securetty util-linux-lsblk lz4-
staticdev libdevmapper libstdc++-dev libgdbm-dev bridge-utils key-
store-ima-privkey lttng-tools-dev libselinux-bin shadow apt valgrind
util-linux-losetup flex-dev volatile-debug-binds libpng16-16 libc6-dev
grep perf util-linux-mountpoint util-linux-fdisk libprotobuf-dev tpm2-
abrmd libcroco-dev openssl-engines libxrender1 libcgroup-dev make
openssh lttng-tools libreadline-dev ncurses-tools nettle-dev libz-dev
libaio1 libselinux1 grpc-dev e2fsprogs-dev util-linux-sfdisk
libcpprest2.10 util-linux-prlimit rapidjson-dev net-tools tar shared-
mime-info libsrpm1 util-linux-switch-root.static squashfs-tools
openssl-conf selinux-policy curl-dev ntp libz1 libasan5 libnginx-dev
procps zip util-linux-dev libharfbuzz0 socat libsigc-2.0-dev libxcb1
gawk-dev tpm2-tools ima-inspect libgomp-dev iptables openssl-misc
libstdc++6 libgdbm-compat4 libcap-dev update-rc.d db-dev lvm2
packagegroup-core-tools-debug shared-mime-info-dev libcairo2 libgdbm6
libreadline-staticdev libxslt openssl xz lz4 libaio-staticdev libnginx-
staticdev nettle python3-dev base-passwd rsync libstdc++-staticdev
iproute2 ntttcp os-release gettext xz-dev libubsan-dev libxml++-2.6-dev=20
libsrpm-staticdev dhcp-client unzip util-linux-mount udev coreutils-dev=20
elfutils glibc-binary-localedata-en-us libaio-dev boost-staticdev
cppneturi-staticdev packagegroup-base-extended kbd-keymaps libnginx1
cppneturi bash diffutils-dev m4-dev libglib-2.0-0 libglib-2.0-dev libz-
staticdev util-linux-swaponoff v86d curl libcpprest-dev netbase ima-
evm-utils gzip util-linux-kill glibmm libatomic1 util-linux-cfdisk
systemd-analyze libreadline7 systemd-serialgetty-dev tpm2-tss rrdtool
openssl-bin openssl-dev gettext-dev ifupdown util-linux-switch-root
rng-tools libasan-dev systemd-serialgetty kmod libcap2 util-linux-
getopt grep-dev kdump policycoreutils-setfiles libcroco e2fsprogs-
staticdev target-sdk-provides-dummy acl boost-dev libxml2 e2fsprogs
flex libxft2 libpixman-1-0 shadow-base cryptodev-linux libffi6 attr
packagegroup-core-sdk policycoreutils-sestatus systemd libprotobuf-c1
bzip2 libatomic-staticdev libgmp10 shadow-dev util-linux-umount lsb
python-dev util-linux-ionice libxdmcp6 systemd-dev git libcgroup run-
postinsts kbd pciutils libcap-staticdev kmod-dev ncurses-terminfo-base
sed util-linux-blkdiscard libxau6 coreutils grpc make-dev kexec-tools
dbus-dev kexec libpcre-dev' returned 100:
2019-06-27T13:18:54.5592415Z [WARN] [15902] Reading package lists...
2019-06-27T13:18:54.5592628Z [WARN] [15903] Building dependency tree...
2019-06-27T13:18:54.5593124Z [WARN] [15904] Some packages could not be inst=
alled. This may mean that you have
2019-06-27T13:18:54.5593526Z [WARN] [15905] requested an impossible situati=
on or if you are using the unstable
2019-06-27T13:18:54.5593893Z [WARN] [15906] distribution that some required=
 packages have not yet been created
2019-06-27T13:18:54.5599962Z [WARN] [15907] or been moved out of Incoming.
2019-06-27T13:18:54.5600415Z [WARN] [15908] The following information may h=
elp to resolve the situation:
2019-06-27T13:18:54.5600834Z [WARN] [15909] The following packages have unm=
et dependencies:
2019-06-27T13:18:54.5601383Z [WARN] [15910]  target-sdk-provides-dummy : Co=
nflicts: bash
2019-06-27T13:18:54.5601724Z [WARN] [15911]                              Co=
nflicts: coreutils
2019-06-27T13:18:54.5602246Z [WARN] [15912]                              Co=
nflicts: coreutils-dev
2019-06-27T13:18:54.5602590Z [WARN] [15913]                              Co=
nflicts: perl
2019-06-27T13:18:54.5603147Z [WARN] [15914]                              Co=
nflicts: perl-module-strict
2019-06-27T13:18:54.5603989Z [WARN] [15915]                              Co=
nflicts: perl-module-vars
2019-06-27T13:18:54.5605346Z [WARN] [15916]                              Co=
nflicts: perl-module-warnings
2019-06-27T13:18:54.5606090Z [WARN] [15917] E: Unable to correct problems, =
you have held broken packages.

Same config worked fine in sumo.

Any suggestion on how to fix it? Is it possible to enter the working
directory to run apt manually, so that I can dig further into the
dependency issue?

Thanks!

--=20
Kind regards,
Luca Boccassi

--=-mIXSBDmWkFcAq9GLwdIt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAl0WRboACgkQSylmgFB4
UWIKUwgAg8mw+SG04oUOFaAcChvIBW2FWUVJfRoPyFx10nDflbJwWQ6PA7FRgire
Sl8PwKVFe89TW2yoyxc8Tb1ijv2IvPOTcQh6yk4MjEZCSJSOrYR+mGTQoA0GINpt
P5GUwRAD+F7MQDC+46lUuRE+SlE2PcsHU06G7EXbC/peHulW4Weh5LNmBEHMcGCZ
CMIPLoeIcCvc6u7RUgw2y/ByfkSW7BDQl92kBK0wl4BpZ5B9MNkNGD45wkQQDUPk
dWLxZmaHbOal7hO1P/yMl7XPTG6rJzGMFdT7XsRN8InWYuvNULXPhp6riwEXgosv
cuA6U3ZNjjR/F0CGTax/Udsuy4RT/A==
=7aaP
-----END PGP SIGNATURE-----

--=-mIXSBDmWkFcAq9GLwdIt--
