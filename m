Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 1084D65D33
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 08:00:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,971,1392159600"; d="scan'208";a="52251660"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 04 Jun 2014 10:00:38 +0200
Received: from COSNADEXC11.usr.ingenico.loc (10.31.4.211) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 4 Jun 2014 10:00:37 +0200
Received: from COSNADEXC23.usr.ingenico.loc ([169.254.3.176]) by
	COSNADEXC11.usr.ingenico.loc ([10.31.4.211]) with mapi id
	14.02.0328.009; Wed, 4 Jun 2014 10:00:37 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] libav: add PACKAGECONFIG for theora,
	libvorbis, speex and openssl
Thread-Index: AQHPf8sS4eBzekyCrki+zpaRCYcvOQ==
Date: Wed, 4 Jun 2014 08:00:37 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA1C95088@COSNADEXC23.usr.ingenico.loc>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA1C947B6@COSNADEXC23.usr.ingenico.loc>
	<538C989E.7010200@linux.intel.com>
In-Reply-To: <538C989E.7010200@linux.intel.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.2.97]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Wed, 04 Jun 2014 08:00:42 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Saul,

> bb.utils.contains_any() instead of your contains_one implementation.

It is different, that's why I have added it.

+# Check codecs that require --enable-nonfree
+USE_NONFREE =3D "${@contains_one('PACKAGECONFIG', [ 'faac', 'openssl' ], d=
)}"

contains_any will not work if PACKAGECONFIG have only one item (faac for ex=
ample).

Should it be a possible addition to bitbake ?

Matthieu


-----Message d'origine-----
De=A0: Saul Wold [mailto:sgw@linux.intel.com]=20
Envoy=E9=A0: lundi 2 juin 2014 17:31
=C0=A0: Matthieu CRAPET; openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] [PATCH 1/4] libav: add PACKAGECONFIG for theora, li=
bvorbis, speex and openssl

On 06/02/2014 12:03 AM, Matthieu CRAPET wrote:
> Hi,
>
> Should I rebase/repost this? Aside libav versions/pinning preferences, th=
is single patch deserves to be commited.
>
Yes please, but I think you want to consider using
bb.utils.contains_any() instead of your contains_one implementation.

Sau!

> Regards,
> Matthieu
>
>
> -----Message d'origine-----
> De : openembedded-core-bounces@lists.openembedded.org=20
> [mailto:openembedded-core-bounces@lists.openembedded.org] De la part=20
> de Matthieu Crapet Envoy=E9 : mercredi 21 mai 2014 13:38 =C0 :=20
> openembedded-core@lists.openembedded.org
> Objet : [OE-core] [PATCH 1/4] libav: add PACKAGECONFIG for theora,=20
> libvorbis, speex and openssl
>
> Dropped libvorvis dependency because there is already a (better) builtin =
vorbis codec.
> Don't confuse codec names: "vorbis" (builtin) and "libvorbis" (using exte=
rnal library).
>
> Changes:
> - add --enable-nonfree when faac or openssl are used
> - add DESCRIPTION
> - sort PACKAGECONFIG entries
>
> Tested with libav-0.8.11 & libav-9.13.
>
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>   meta/recipes-multimedia/libav/libav.inc | 39 ++++++++++++++++++++++++++=
-------
>   1 file changed, 31 insertions(+), 8 deletions(-)
>
> [...]
>

