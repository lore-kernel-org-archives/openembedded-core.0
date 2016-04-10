Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0262077109;
	Sun, 10 Apr 2016 06:13:20 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n3so66099165wmn.0;
	Sat, 09 Apr 2016 23:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=KMSZFPnd5/X5EayO7QwJx2P5mZG3slzxgU2Htf5iYkA=;
	b=GvEZQEnwQrDPPsQZr/zUVamqcAnDBXbSgVf9CoXqlwGjI5TTaBXa00xEdTJ+yle2pg
	D88mDo8iXz+9Ms1KerfgphsqctIjuvr/9yu0PjDnj4pUncjraBUSjzKA+DLG9dkvjYka
	4/9E7EvRuQ81byngMAZUlJQObCsKA0nC9D0+CZZjoT/4Nyx9p1t+jyNHY7SdjeO0Rbm/
	RM048TWisUfWJEIdoj/rgmRE9gruJO0QB6hTh/MLkUZOQ16e2qgXu+I3k7+J3uoxpCHy
	etNpKA25zdKnqpMi2BaMo2f/sfqB7yX0RAcOMxqkcFdX3gjSgQkqo6VLUBwcF7HRixTj
	ms5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=KMSZFPnd5/X5EayO7QwJx2P5mZG3slzxgU2Htf5iYkA=;
	b=k8NN3FBe4VQbrYV5qvyK+JoLok0B2qMlt8Dt4MZ548Edy3ISvOICMene7Uq45TPydZ
	0n55ZcOOwr4XRv82XHol16FePlCwH9WYx8xltzIY+ZEMvcdZ3cz6js5ic+P53u9TaZHo
	Tqbgfy/85/u6TZyP7VpbpTcJyDm5tHhMaHFmQ++8L3odQ8BSbSSbp3eMxF/Qz+UljHq5
	svj/dANiEx5XeUI5FCKsPdeSEYL1ykYV6FAnwT8z+l+jbX/q+2UKzfjPiKW0GqiLP4RD
	ZGjDE5X4IM93fm/Yq9xlLGKSmN3Vh7aSVltcrOca0pND132RnUcNfQV5FLUpj7ViX/8F
	MQCA==
X-Gm-Message-State: AD7BkJLnRM8vA5wy9ahyCJP9OM3Bg4wC+H8uyz0Tumqw5eJOloTO1/CbLcabH+AibuWb1A==
X-Received: by 10.194.58.169 with SMTP id s9mr17746508wjq.52.1460268800457;
	Sat, 09 Apr 2016 23:13:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r8sm21273575wjz.34.2016.04.09.23.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Apr 2016 23:13:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 10 Apr 2016 08:14:25 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160410061425.GA9652@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, test-dependencies 2016-04-10
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
X-List-Received-Date: Sun, 10 Apr 2016 06:13:21 -0000
X-Groupsio-MsgNum: 80668
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time complete test of all recipes, for both qemux86 and qemuarm.

qemux86:

Found differences:=20
WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build depend=
ency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?
WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependenc=
y?
Found errors:=20
ERROR: 50 issues were found in these recipes: chkconfig-alternatives-native=
 core-image-rt core-image-rt-sdk core-image-sato-dev core-image-sato-sdk co=
re-image-sato-sdk-ptest cpupower cyrus-sasl enchant fontforge gtkmathview j=
asper libdrm lttng-modules meta-ide-support meta-world-pkgdata nativesdk-ze=
roc-ice netmap netmap-modules openlmi-networking openlmi-providers openlmi-=
storage packagegroup-core-tools-profile perf proxy-libintl python-pyparsing=
 samba sblim-sfcb tiptop zeroc-ice

2_max/failed/chkconfig-alternatives-native.log
2_max/failed/core-image-rt-sdk.log
2_max/failed/core-image-rt.log
2_max/failed/core-image-sato-dev.log
2_max/failed/core-image-sato-sdk-ptest.log
2_max/failed/core-image-sato-sdk.log
2_max/failed/cpupower.log
2_max/failed/cyrus-sasl.log
2_max/failed/fontforge.log
2_max/failed/lttng-modules.log
2_max/failed/meta-world-pkgdata.log
2_max/failed/nativesdk-zeroc-ice.log
2_max/failed/netmap-modules.log
2_max/failed/netmap.log
2_max/failed/openlmi-networking.log
2_max/failed/openlmi-providers.log
2_max/failed/openlmi-storage.log
2_max/failed/packagegroup-core-tools-profile.log
2_max/failed/proxy-libintl.log
2_max/failed/zeroc-ice.log

3_min/failed/core-image-rt-sdk.log
3_min/failed/core-image-rt.log
3_min/failed/core-image-sato-dev.log
3_min/failed/core-image-sato-sdk-ptest.log
3_min/failed/core-image-sato-sdk.log
3_min/failed/cyrus-sasl.log
3_min/failed/fontforge.log
3_min/failed/gtkmathview.log
3_min/failed/meta-world-pkgdata.log
3_min/failed/nativesdk-zeroc-ice.log
3_min/failed/perf.log
3_min/failed/proxy-libintl.log
3_min/failed/python-pyparsing.log
3_min/failed/sblim-sfcb.log
3_min/failed/zeroc-ice.log

qemuarm:

Found differences:=20
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?
WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependenc=
y?
Found errors:=20
ERROR: 55 issues were found in these recipes: chkconfig-alternatives-native=
 core-image-minimal-initramfs core-image-rt core-image-rt-sdk core-image-sa=
to-dev core-image-sato-sdk core-image-sato-sdk-ptest core-image-testmaster-=
initramfs cyrus-sasl enchant fontforge gtkmathview ipmiutil libdrm meta-wor=
ld-pkgdata nativesdk-zeroc-ice netmap-modules perf proxy-libintl remake sam=
ba sblim-sfcb zeroc-ice

2_max/failed/chkconfig-alternatives-native.log
2_max/failed/core-image-minimal-initramfs.log
2_max/failed/core-image-rt-sdk.log
2_max/failed/core-image-rt.log
2_max/failed/core-image-sato-dev.log
2_max/failed/core-image-sato-sdk-ptest.log
2_max/failed/core-image-sato-sdk.log
2_max/failed/core-image-testmaster-initramfs.log
2_max/failed/cyrus-sasl.log
2_max/failed/fontforge.log
2_max/failed/ipmiutil.log
2_max/failed/meta-world-pkgdata.log
2_max/failed/nativesdk-zeroc-ice.log
2_max/failed/netmap-modules.log
2_max/failed/proxy-libintl.log
2_max/failed/remake.log
2_max/failed/zeroc-ice.log

3_min/failed/core-image-minimal-initramfs.log
3_min/failed/core-image-rt-sdk.log
3_min/failed/core-image-rt.log
3_min/failed/core-image-sato-dev.log
3_min/failed/core-image-sato-sdk-ptest.log
3_min/failed/core-image-sato-sdk.log
3_min/failed/core-image-testmaster-initramfs.log
3_min/failed/cyrus-sasl.log
3_min/failed/fontforge.log
3_min/failed/gtkmathview.log
3_min/failed/ipmiutil.log
3_min/failed/meta-world-pkgdata.log
3_min/failed/nativesdk-zeroc-ice.log
3_min/failed/perf.log
3_min/failed/proxy-libintl.log
3_min/failed/remake.log
3_min/failed/sblim-sfcb.log
3_min/failed/zeroc-ice.log
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcJ7zQACgkQN1Ujt2V2gBwukgCaA1G3gHSpS8A62kiG21IwG9O3
0u4An2+rnbrdWPUROjM9MymHU1y+PaSe
=1FRd
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
