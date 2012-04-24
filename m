Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SMeRZ-0002WX-V1
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 14:02:05 +0200
Received: by wibhj13 with SMTP id hj13so500646wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 04:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=eJCXceBmAK227nM7Vzd9LJCJbr//GGkZyBAiZ6ZfbXI=;
	b=VfX37bPNajQKmS9LR8++Xe4Qj8Xq+8ewSA/hGJuIjBBZvgo0GKA9McMXWuI9fn0/SL
	9hoYz6IlX9o0PX/+4jlZemWTbL3xd1kGvKfWNyIaTALZoZiWOgSSsXWZ+c476LIQTfdC
	UuZ1QOeASRoS60SlTNVmD7yiuW1ID/mV6ksWwm8cLsmVtbeSuy4HlJ5ZoVDjEQWU2VZ4
	tXCSAfHLRD+M+inFozrwY/3Iqu+3zFbTLAfnsdsvC4TZE9VSZvSrzAehtCivoLedbnDk
	c6X6MuWDw//mPYuz2BE4pksWILvW0h93BCm+0qPgogUgZNeG6c7fs3Q0Ig99NZV8qmcJ
	SdSA==
Received: by 10.180.85.70 with SMTP id f6mr30800900wiz.5.1335268351246;
	Tue, 24 Apr 2012 04:52:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n20sm46094950wiw.5.2012.04.24.04.52.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 04:52:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335309284-8645-1-git-send-email-tasskjapp@gmail.com>
Date: Tue, 24 Apr 2012 13:52:28 +0200
Message-Id: <A58E3FFD-B70E-43F6-B38E-130BF0EF4128@dominion.thruhere.net>
References: <4F9714DD.6070608@gmail.com>
	<1335309284-8645-1-git-send-email-tasskjapp@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl5DMKycjxx7nitn9P9Jywd5SMmLROU2M2GRAJJqByMGYMuVe4I5dmeKwWKYMkzCEuoJb7a
Subject: Re: [PATCH] boost: set python-root correctly
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
X-List-Received-Date: Tue, 24 Apr 2012 12:02:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 apr. 2012, om 01:14 heeft Tasslehoff Kjappfot het volgende =
geschreven:

> ---
> meta/recipes-support/boost/boost.inc       |    8 +++++++-
> meta/recipes-support/boost/boost_1.49.0.bb |    2 +-
> 2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/boost/boost.inc =
b/meta/recipes-support/boost/boost.inc
> index c9306df..fbdf292 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -42,7 +42,7 @@ BOOST_LIBS =3D "\
> #BOOST_LIBS +=3D "python"
> #DEPENDS +=3D "python"
> #PYTHON_ROOT =3D "${STAGING_DIR_HOST}/${prefix}"
> -#PYTHON_VERSION =3D "2.5"
> +#PYTHON_VERSION =3D "2.7"
>=20
> # Make a package for each library, plus -dev
> PACKAGES =3D "${PN}-dbg ${BOOST_PACKAGES}"
> @@ -123,6 +123,7 @@ BJAM_TOOLS   =3D "-sTOOLS=3Dgcc \
> 		'-sNO_ZLIB=3D1' \
> 		'-sBUILD=3Drelease <optimization>space <threading>multi =
<inlining>on <debug-symbols>off' \
> 		'-sPYTHON_VERSION=3D${PYTHON_VERSION}' \
> +		'-sPYTHON_ROOT=3D${PYTHON_ROOT}' \
> 		'--layout=3Dsystem' \
> 		"
>=20
> @@ -140,6 +141,11 @@ do_boostconfig() {
> 	then
> 		echo 'using gcc : 4.3.1 : ${CXX} : compileflags =
-DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> =
${S}/tools/build/v2/user-config.jam
> 	fi=09
> +
> +        echo "using python : ${PYTHON_VERSION} : : =
${STAGING_INCDIR}/python${PYTHON_VERSION} ;" >> =
${S}/tools/build/v2/user-config.jam
> +
> +        CC=3D"${BUILD_CC}" CFLAGS=3D"${BUILD_CFLAGS}" ./bootstrap.sh =
--with-toolset=3Dgcc --with-python-root=3D${PYTHON_ROOT}
> +        sed -i '/^using python/d' project-config.jam
> }
>=20
> addtask do_boostconfig after do_patch before do_configure
> diff --git a/meta/recipes-support/boost/boost_1.49.0.bb =
b/meta/recipes-support/boost/boost_1.49.0.bb
> index 71fdc48..533cd10 100644
> --- a/meta/recipes-support/boost/boost_1.49.0.bb
> +++ b/meta/recipes-support/boost/boost_1.49.0.bb
> @@ -2,7 +2,7 @@ include boost.inc
>=20
> LIC_FILES_CHKSUM =3D =
"file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31bef20d78c"
>=20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"

Shouldn't the INC_PR in boost.inc be increased instead?

regards,

Koen=


