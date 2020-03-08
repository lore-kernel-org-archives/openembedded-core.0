Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id D031C60234
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2020 02:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1639; q=dns/txt; s=axis-central1;
	t=1583635230; x=1615171230;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=pVS4cW4HnCy8VXaV+fFHFAqLcMKYxZsJGt0YPe1u82A=;
	b=HemFfsQIL95aWNJrMKGtdvGk0jarDlz3D/Tczab6trWsBjulDkp7xot+
	MKoC2v5m88CatK2yES61ku5eqccXIqGRa9JkRhDhDEbC8YPRtqr38ej+W
	+vIzscfh5Hoy+xx+CGyB+BGpCCSC6kuaMSqjEbTkcdXn6lsWrUaLDDoT4
	/yHSXgs1NcDvsp85vowXHdjc5DT+FMWWLyki1nANWe2ZCNNWpOaxJH4E0
	Da5+dBKJjcGixjTicHUIAu4bVfxyQ2pNJ++INUhYcsf1u/2pkjnz+vw7O
	oxERlAubetnGftdd2KadSl7Fr1Nl6VnAD6FVaYtIgnCYCVPCVLy5kzkHO w==;
IronPort-SDR: v+vhexZwAdCf8CvcJd0W1UUh+SIGA4aqZbk5LXv/njAr09H7zinEgx58fx9pc3KEycBHzF4kCb
	cE35kbMN7vI2nY+oKcGov62GUT9/1aEaMxAoiGjIPLwlFv1piL01FJ0ohIZHQNrrFlhXHpH7P4
	AuiDYJE+8Nw4RBkatqUNaQQzMBpv0Gx4uCeu5fQ6hPRqk5sokLngu5mNcwV/9VEVFj0TaY3KD9
	CpUHVbv+qVSs7AC1CtuvSbPGRabn5ON/Uq0clmAomeP7SisDs/mIvFSLDahPxCd/k3Jf/LqKat
	uqk=
X-IronPort-AV: E=Sophos;i="5.70,528,1574118000"; 
   d="scan'208";a="6036181"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] glibc: Explicitly disable msgfmt
Thread-Index: AQHV9NENjDBBXmhf9USal278ewzB3ag9+nYw
Date: Sun, 8 Mar 2020 02:40:24 +0000
Message-ID: <d57e3c452f934d9791fdd43a399fe314@XBOX03.axis.com>
References: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] glibc: Explicitly disable msgfmt
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
X-List-Received-Date: Sun, 08 Mar 2020 02:40:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 7 mars 2020 23:38
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] glibc: Explicitly disable msgfmt
>=20
> If configure is rerun it finds msgfmt from gettext-native which is instal=
led
> during package_write_ipk|deb and means builds are not determinisic.
>=20
> Whether msgfmt is needed is debatable (libc.mo files arne't generated wit=
hout

arne't -> aren't

> it) however we should at least be consistent which this patch ensures.

Add a period and two commas:

it). However, we should at least be consistent, which this patch ensures.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glibc/glibc.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-
> core/glibc/glibc.inc
> index 58d2ba7bc44..23a6ca99ae0 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -9,8 +9,11 @@ inherit autotools texinfo features_check systemd
>=20
>  LEAD_SONAME =3D "libc.so"
>=20
> +# msgfmt could come from gettext-native but we don't depend on that and
> +# disable for reproducibility
>  CACHED_CONFIGUREVARS +=3D " \
>    ac_cv_path_BASH_SHELL=3D${base_bindir}/bash \
> +  ac_cv_prog_MSGFMT=3D \
>    libc_cv_slibdir=3D${base_libdir} \
>    libc_cv_rootsbindir=3D${base_sbindir} \
>    libc_cv_localedir=3D${localedir} \
> --
> 2.25.0

//Peter


