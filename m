Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXv2N-0002q2-UD
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 14:54:07 +0200
Received: by wwg12 with SMTP id 12so965383wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 05:50:37 -0700 (PDT)
Received: by 10.216.200.29 with SMTP id y29mr158849wen.3.1308401437648;
	Sat, 18 Jun 2011 05:50:37 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z66sm1887718weq.24.2011.06.18.05.50.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 18 Jun 2011 05:50:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1308391365.git.liezhi.yang@windriver.com>
Date: Sat, 18 Jun 2011 14:50:34 +0200
Message-Id: <9A9B307C-87E6-445D-9432-739EBF04090F@dominion.thruhere.net>
References: <cover.1308391365.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/6 V3] Share gcc work directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jun 2011 12:54:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jun 2011, om 14:41 heeft Robert Yang het volgende geschreven:

> Changes of V3:
>=20
> 1) Use --with-headers to replace the:
>=20
>   sed -i 's:^\([ =
]*\)glibc_header_dir=3D\"${with_build_sysroot}/usr/include\": ...
>=20
> 2) Fix the build of gcc-cross-canadian
>=20
> 3) Fix gcc-crosssdk which make the source incompatible during its
>   building.
>=20
> 4) Test "bitbake meta-toolchain", and also do run test for the
>   pokysdk(unpack the toolchain to /opt, setup the env by sourcing
>   environment-setup-armv5te-poky-linux-gnueabi, and build some pkgs
>   out of poky, then use command file to check the binary file type.
>=20
> 5) Make sure that no gcc build would make the source incompatible,
>   except gcc-cross_csl-arm-2008q1.bb, but I think this is fine, its
>   BINV =3D "4.2.3", not 4.5.1 or 4.6.0.


How does this interact with rm_work?

regards,

Koen=


