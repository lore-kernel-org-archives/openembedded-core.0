Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWVkt-0004Ro-7w
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 17:42:15 +0200
Received: by wye20 with SMTP id 20so4576334wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 08:38:49 -0700 (PDT)
Received: by 10.227.155.84 with SMTP id r20mr6570480wbw.110.1308065929576;
	Tue, 14 Jun 2011 08:38:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm5124757wbh.12.2011.06.14.08.38.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 08:38:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308065443.25285.268.camel@phil-desktop>
Date: Tue, 14 Jun 2011 17:38:45 +0200
Message-Id: <E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>
References: <1308065443.25285.268.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Tue, 14 Jun 2011 15:42:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 17:30 heeft Phil Blundell het volgende geschreven:

> This is not particularly pretty but I couldn't think of any obviously
> better way of doing it.  Any suggestions?
>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
> meta/recipes-devtools/binutils/binutils-cross.inc |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc =
b/meta/recipes-devtools/binutils/binutils-cross.inc
> index 4b90972..5a41970 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
> @@ -5,7 +5,8 @@ EXTRA_OECONF =3D "--with-sysroot=3D${STAGING_DIR_TARGET}=
 \
>                 --program-prefix=3D${TARGET_PREFIX} \
>                 --disable-install-libbfd \
>                 --disable-werror \
> -                --enable-poison-system-directories"
> +                --enable-poison-system-directories \
> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
'--enable-gold=3Ddefault', '', d)}"

Out of curiousity, how well does gold work nowadays? Last I remember =
hearing of it was in its x86-only days.

regards,

Koen=


