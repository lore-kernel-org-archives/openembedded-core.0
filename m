Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id CBB8B73185;
	Mon, 11 Apr 2016 06:52:33 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 191so73168412wmq.0;
	Sun, 10 Apr 2016 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=R0U5FVvfNnYYa8/x1+snh6sE3KWku70wuGmCeIY9/+8=;
	b=asn5doPSu/QcB1Y0pu21+m0SoLR3GEvelttjnz3fYg5vjBaH/ZGBcNpjq23WfOgnJ4
	VzMj7NVw0D0hVT5jeMDr62XgX5MBu4BYG4Is3RcZmYcSl35nG1HUEhRGJNf7IIYjPiIm
	/xI/ZIhdUBQxGtvA0nh1QgXzss3xveW4j6on42Ii0pdiE6WZetdS54ilEqq07rLUlzAr
	4o6XtnJ3qKDnX/3SLkHYN59d62/P1aUC2Cur6Dpd3dcKzXrodS5Hia1tnVwCA3RSbKiS
	uG3O3OeWgS/lQuxIZVPC79xFi3rDPNgc0LMQdKBGvkIddoNWGxWrKfBuqLlrHe1njHai
	tHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=R0U5FVvfNnYYa8/x1+snh6sE3KWku70wuGmCeIY9/+8=;
	b=Lbx6H94UU0uiwIjdyK0ozJbvkmhGEY/0b45lKCBiTOtDhZWETJLoFsq1BRscGnTygG
	LZ/1RAHOtoj6JKZ9sBxCcN/lbmeji+WYjYpimcJZTxODVEVlubnJnNz1MjHSlTxTIVYR
	WT96UaTI3IkUAMov4252T4NuhGwqyACoZWIGK3lq7ZtNV9Y20Bar7rmbrJycrSc+cQnd
	5oB2B5WwLu9LQ8cqkWcxm3ToOIUqJcRiO0onWVsexDL5zflFAh8RoRLu1vRN/O6abPY6
	VADSsHvJfIAO3Zxoe3B0exQKQjVpfq7Ls8a47GnOM5N9UeryGy7KGog4008re6AqWFFe
	V6BQ==
X-Gm-Message-State: AD7BkJIIavekLd0zPEMofYad9E86CLJmqVzTLbmbAARymJhQtTlsGdcpPS4w2eTlqjVXHw==
X-Received: by 10.194.248.200 with SMTP id yo8mr22026602wjc.38.1460357553651; 
	Sun, 10 Apr 2016 23:52:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a16sm15708426wme.22.2016.04.10.23.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 23:52:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 Apr 2016 08:53:39 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160411065339.GB9652@jama>
References: <20160410061425.GA9652@jama>
MIME-Version: 1.0
In-Reply-To: <20160410061425.GA9652@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, test-dependencies 2016-04-10
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
X-List-Received-Date: Mon, 11 Apr 2016 06:52:36 -0000
X-Groupsio-MsgNum: 80687
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline

--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 10, 2016 at 08:14:25AM +0200, Martin Jansa wrote:
> This time complete test of all recipes, for both qemux86 and qemuarm.

Somehow I managed to delete the links to logs when sending this.

http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160408_06=
2500.log/
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160408_18=
0900.log/

> qemux86:
>=20
> Found differences:=20
> WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build dep=
endency?
> WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build depende=
ncy?
> WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build depe=
ndency?
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build depend=
ency?
> WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a buil=
d dependency?
> WARN: enchant: enchant rdepends on hunspell, but it isn't a build depende=
ncy?
> Found errors:=20
> ERROR: 50 issues were found in these recipes: chkconfig-alternatives-nati=
ve core-image-rt core-image-rt-sdk core-image-sato-dev core-image-sato-sdk =
core-image-sato-sdk-ptest cpupower cyrus-sasl enchant fontforge gtkmathview=
 jasper libdrm lttng-modules meta-ide-support meta-world-pkgdata nativesdk-=
zeroc-ice netmap netmap-modules openlmi-networking openlmi-providers openlm=
i-storage packagegroup-core-tools-profile perf proxy-libintl python-pyparsi=
ng samba sblim-sfcb tiptop zeroc-ice
>=20
> 2_max/failed/chkconfig-alternatives-native.log
> 2_max/failed/core-image-rt-sdk.log
> 2_max/failed/core-image-rt.log
> 2_max/failed/core-image-sato-dev.log
> 2_max/failed/core-image-sato-sdk-ptest.log
> 2_max/failed/core-image-sato-sdk.log
> 2_max/failed/cpupower.log
> 2_max/failed/cyrus-sasl.log
> 2_max/failed/fontforge.log
> 2_max/failed/lttng-modules.log
> 2_max/failed/meta-world-pkgdata.log
> 2_max/failed/nativesdk-zeroc-ice.log
> 2_max/failed/netmap-modules.log
> 2_max/failed/netmap.log
> 2_max/failed/openlmi-networking.log
> 2_max/failed/openlmi-providers.log
> 2_max/failed/openlmi-storage.log
> 2_max/failed/packagegroup-core-tools-profile.log
> 2_max/failed/proxy-libintl.log
> 2_max/failed/zeroc-ice.log
>=20
> 3_min/failed/core-image-rt-sdk.log
> 3_min/failed/core-image-rt.log
> 3_min/failed/core-image-sato-dev.log
> 3_min/failed/core-image-sato-sdk-ptest.log
> 3_min/failed/core-image-sato-sdk.log
> 3_min/failed/cyrus-sasl.log
> 3_min/failed/fontforge.log
> 3_min/failed/gtkmathview.log
> 3_min/failed/meta-world-pkgdata.log
> 3_min/failed/nativesdk-zeroc-ice.log
> 3_min/failed/perf.log
> 3_min/failed/proxy-libintl.log
> 3_min/failed/python-pyparsing.log
> 3_min/failed/sblim-sfcb.log
> 3_min/failed/zeroc-ice.log
>=20
> qemuarm:
>=20
> Found differences:=20
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build depend=
ency?
> WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a buil=
d dependency?
> WARN: enchant: enchant rdepends on hunspell, but it isn't a build depende=
ncy?
> Found errors:=20
> ERROR: 55 issues were found in these recipes: chkconfig-alternatives-nati=
ve core-image-minimal-initramfs core-image-rt core-image-rt-sdk core-image-=
sato-dev core-image-sato-sdk core-image-sato-sdk-ptest core-image-testmaste=
r-initramfs cyrus-sasl enchant fontforge gtkmathview ipmiutil libdrm meta-w=
orld-pkgdata nativesdk-zeroc-ice netmap-modules perf proxy-libintl remake s=
amba sblim-sfcb zeroc-ice
>=20
> 2_max/failed/chkconfig-alternatives-native.log
> 2_max/failed/core-image-minimal-initramfs.log
> 2_max/failed/core-image-rt-sdk.log
> 2_max/failed/core-image-rt.log
> 2_max/failed/core-image-sato-dev.log
> 2_max/failed/core-image-sato-sdk-ptest.log
> 2_max/failed/core-image-sato-sdk.log
> 2_max/failed/core-image-testmaster-initramfs.log
> 2_max/failed/cyrus-sasl.log
> 2_max/failed/fontforge.log
> 2_max/failed/ipmiutil.log
> 2_max/failed/meta-world-pkgdata.log
> 2_max/failed/nativesdk-zeroc-ice.log
> 2_max/failed/netmap-modules.log
> 2_max/failed/proxy-libintl.log
> 2_max/failed/remake.log
> 2_max/failed/zeroc-ice.log
>=20
> 3_min/failed/core-image-minimal-initramfs.log
> 3_min/failed/core-image-rt-sdk.log
> 3_min/failed/core-image-rt.log
> 3_min/failed/core-image-sato-dev.log
> 3_min/failed/core-image-sato-sdk-ptest.log
> 3_min/failed/core-image-sato-sdk.log
> 3_min/failed/core-image-testmaster-initramfs.log
> 3_min/failed/cyrus-sasl.log
> 3_min/failed/fontforge.log
> 3_min/failed/gtkmathview.log
> 3_min/failed/ipmiutil.log
> 3_min/failed/meta-world-pkgdata.log
> 3_min/failed/nativesdk-zeroc-ice.log
> 3_min/failed/perf.log
> 3_min/failed/proxy-libintl.log
> 3_min/failed/remake.log
> 3_min/failed/sblim-sfcb.log
> 3_min/failed/zeroc-ice.log
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcLSfIACgkQN1Ujt2V2gBwBpwCeMYhDpznwJj1RXDuxgTHSIoEN
Fm8AoJmk342sT1MwwaQIRSWbS5/+LP+X
=qSIU
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
