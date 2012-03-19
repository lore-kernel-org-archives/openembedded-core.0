Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9dzn-0007IU-MT
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 15:55:39 +0100
Received: by wibhm17 with SMTP id hm17so3232345wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 07:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=bCoOtMXYtsdz4u6JlRpeFAAKj0Qf8p9RCJWDOZhEYU0=;
	b=lM2NM5TvCtYnBTsKItIVZarwVachn8Rc8k40Q3KLgSx+9HOSXOtRpUPI22Up57Qr4e
	Hwt3cblkZxxFcTE1nZYsB839GQ0FwWlgNoJwVqU9cjHglUXvheumvUzxl3Y2/zkUwjDI
	J/XyHuYfUupHtIzmxox6h+fLg/8s0XpMPoKkgiBv4RLSyxlVrtMXgEigmN/Jf5dr8Cjs
	WTbl7OIVlEWx/xc+T/zyoLw0yPhShwb2/d5l5zFPkVmpsNv13/DqFG6N9XzSR4wBWKmk
	CVAZYejHFtZhIZmqUw8wExZHZqV6x3Jk+Lp8QRl3Gs/rwxlMnoP8bBlwF5exThBSY0Zf
	5iVg==
Received: by 10.180.104.137 with SMTP id ge9mr20360536wib.20.1332168408492;
	Mon, 19 Mar 2012 07:46:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm26094579wib.3.2012.03.19.07.46.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 07:46:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1331799945-14172-1-git-send-email-bjst@enea.com>
Date: Mon, 19 Mar 2012 15:46:44 +0100
Message-Id: <20671C9C-1AC1-482A-9B4A-C40EE9087BD7@dominion.thruhere.net>
References: <22576197.WV0krj9sgO@helios>
	<1331799945-14172-1-git-send-email-bjst@enea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmXj+30x86PHiMv7/cpZDHgyluPaUuZn3DvOZfeHjyON9iayRNjllW1m/wb1RCh250rpeJU
Subject: Re: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Mon, 19 Mar 2012 14:55:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 15 mrt. 2012, om 09:25 heeft Bj=F6rn Stenberg het volgende =
geschreven:
>=20
> +++ b/meta/recipes-extended/pigz/pigz.inc
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "A parallel implementation of gzip"
> +DESCRIPTION =3D "pigz, which stands for parallel implementation of =
gzip, is a \
> +fully functional replacement for gzip that exploits multiple =
processors and \
> +multiple cores to the hilt when compressing data. pigz was written by =
Mark \
> +Adler, and uses the zlib and pthread libraries."
> +HOMEPAGE =3D "http://zlib.net/pigz/"
> +SECTION =3D "console/utils"
> +LICENSE =3D "Zlib"
> +
> +SRC_URI =3D "http://zlib.net/pigz/pigz-${PV}.tar.gz \
> +           file://ldflags.patch"
> +
> +PROVIDES_virtclass-native +=3D "gzip-native"
> +
> +DEPENDS_virtclass-native =3D "zlib-native"
> +
> +do_install () {
> +        install -d ${D}${bindir}
> +        install ${B}/pigz ${D}${bindir}/gzip
> +        install ${B}/unpigz ${D}${bindir}/gunzip
> +}

This is either missing update-alternatives entries or it is missing =
RREPLACES/RCONFLICTS with gzip/busybox/etc. Or both.

regards,

Koen=


