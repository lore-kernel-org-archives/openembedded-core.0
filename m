Return-Path: <prvs=031a76740=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6387DE2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1557904277; x=1589440277;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=9u80uFv++UbzYgtCTPXvC50sHSS35cJnzvhsIbMynDw=;
	b=OfS+MyOT5jMVWwb4VBLiY1tLEtODicthwUp1zaFm89d5BTVyFl1ZXtgc
	9uYpT2SbKRakycdMNQ4WdqFFSqDv6b/ivy2OeTn8hvA+ZnMcYibQRAVoz
	7C2h6YVKFQeEakHdvVVct9jJrZIpMni0zMAr11Pp3foqn8m0KbGpQMu8l 4=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 15 May 2019 09:11:16 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
	15 May 2019 09:11:15 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb5.muc with ESMTP/TLS; 15 May 2019 09:11:15 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 15 May 2019 09:11:14 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Wed, 15 May 2019 09:11:14 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2] ptest: Add RDEPENDS frpm PN-ptest to PN
	package
Thread-Index: AQHVCu1hX0H0r5uiUkOKtz2c1c9W8A==
Date: Wed, 15 May 2019 07:11:14 +0000
Message-ID: <20190515071113.GC3459@hiutale>
References: <20190514215604.24839-1-richard.purdie@linuxfoundation.org>
	<20190514215604.24839-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190514215604.24839-2-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] ptest: Add RDEPENDS frpm PN-ptest to PN package
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
X-List-Received-Date: Wed, 15 May 2019 07:11:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5EB086CB96E0FD4FA5BD95CEF9EAE4EE@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2019 at 10:56:04PM +0100, Richard Purdie wrote:
> Many different ptests are breaking as they assume that ${PN}-ptest
> depends on ${PN}. It doesn't currently but should. If we fix this, many
> different ptests start passing when they previously failed.
>=20
> It does depend on fixing an issue in the dbus-test recipe which is done
> in the preceeding patch (mentioned in case this gets backported).

Awesome! Thanks for this. In our case we build many packages and their
ptests but they may not be installed to images by default. Thus this helps.

Same also applies to our SDK. We build more stuff for the SDK than what is
installed by default.

Reviewed-by: Mikko Rapeli <mikko.rapeli@bmw.de>

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/ptest.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 936bf82736e..fa4c36ec769 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -13,6 +13,7 @@ PTEST_ENABLED =3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'ptest', '1', '0', d)}"
>  PTEST_ENABLED_class-native =3D ""
>  PTEST_ENABLED_class-nativesdk =3D ""
>  PTEST_ENABLED_class-cross-canadian =3D ""
> +RDEPENDS_${PN}-ptest +=3D "${PN}"
>  RDEPENDS_${PN}-ptest_class-native =3D ""
>  RDEPENDS_${PN}-ptest_class-nativesdk =3D ""
>  RRECOMMENDS_${PN}-ptest +=3D "ptest-runner"
> --=20
> 2.20.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

