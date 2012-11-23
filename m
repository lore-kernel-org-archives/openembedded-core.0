Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tc1Mn-0005Yj-S2 for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 23:04:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLogPU028365;
	Fri, 23 Nov 2012 21:50:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26424-02; Fri, 23 Nov 2012 21:50:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLoW6H028339
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 23 Nov 2012 21:50:35 GMT
Message-ID: <1353707431.21863.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Fri, 23 Nov 2012 21:50:31 +0000
In-Reply-To: <1353600120-22967-4-git-send-email-bjst@enea.com>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-4-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	qANLogPU028365
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] Add ptest for glib.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 22:04:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 17:01 +0100, Bj=C3=B6rn Stenberg wrote:
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/gl=
ib-2.0/glib.inc
> index ed9bed9..91225d5 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -25,9 +25,10 @@ inherit autotools gettext gtk-doc pkgconfig
> =20
>  S =3D "${WORKDIR}/glib-${PV}"
> =20
> -CORECONF =3D "--disable-dtrace --disable-fam --disable-libelf --disabl=
e-systemtap --disable-modular-tests"
> +CORECONF =3D "--disable-dtrace --disable-fam --disable-libelf --disabl=
e-systemtap"
> =20
> -EXTRA_OECONF =3D "--enable-included-printf=3Dno ${CORECONF}"
> +PTEST_CONF =3D "${@base_contains('DISTRO_FEATURES', 'ptest', '', '--di=
sable-modular-tests', d)}"
> +EXTRA_OECONF =3D "--enable-included-printf=3Dno ${CORECONF} ${TEST_CON=
F}"
>  EXTRA_OECONF_class-native =3D "${CORECONF}"
>  EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno ${CORECON=
F}"

The changes to the recipe to install the tests are certainly ugly. I
know you're working on that. Above, there is a typo, TEST_CONF instead
of PTEST_CONF.

Cheers,

Richard
=20




