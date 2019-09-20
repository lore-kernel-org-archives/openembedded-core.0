Return-Path: <prvs=1598cd53b=Mikko.Rapeli@bmw.de>
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id 9C23B7FA49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1568986732; x=1600522732;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=RYoF21aUaqaBukMrWskO9DDoQc9pIrFT5UCpJNvk+mc=;
	b=kskc4ZSD+4O7CYkb6/4OlK8Zqa/Rka5sMPAiVDCEKIVSZGbk/Q0c+N8n
	bMObmCsAkXPtp1ENg/x75MU7XaGVKx8V7CAXQMKcWOTGnc81GO4328pbL
	d9wFlO3mFKq8i92QoYYfnA2ckMa71M69Jmy6Sa2wV6IY2hDK2xsLaUis2 w=;
IronPort-SDR: Evphmru5ZWXRGcV2u9Jrh4j37kUG2Dm6XSiw2RAOR4EmJMurRWkAqlrYyFqvGXWAsljZAiF122
	xn6EAiEzo6OKQaeA5lpEvIDN34o9OoSl3uZQsPslXPx0LHePg8nxkErn4zUQT/5an9XSBs3xtn
	LBlD7t265ORhUK5/K7zB3lAFag5V1KaJYaTw+/9EIVnAYeiVdOBC+EZaXBrkuvmSWtob5wIEvz
	NJBKvhzqjnKybZMFCsLlbcFJvKA1v6sKr5Ofhyw6tpdpaHtilte36ZArSM47mIsHHHMOW7EjkJ
	D9g=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 20 Sep 2019 15:38:31 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw5.muc with ESMTP/TLS;
	20 Sep 2019 15:38:30 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb3.muc with ESMTP/TLS; 20 Sep 2019 15:38:29 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Fri, 20 Sep 2019 15:38:29 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Fri, 20 Sep 2019 15:38:29 +0200
From: <Mikko.Rapeli@bmw.de>
To: <andrey.z@gmail.com>
Thread-Topic: [OE-core] [PATCH] openssl: Enable os option for with-rand-seed
	as well
Thread-Index: AQHVb7iwvGYgOyuGpECOVm0iv1t2hg==
Date: Fri, 20 Sep 2019 13:38:29 +0000
Message-ID: <20190920133829.GW6154@hiutale>
References: <20190917184947.2244823-1-raj.khem@gmail.com>
	<CAHtQpK4svi46b06dzCfCX7R-i6uiooQ0hi0mmdcOuoY+Ccm+MQ@mail.gmail.com>
In-Reply-To: <CAHtQpK4svi46b06dzCfCX7R-i6uiooQ0hi0mmdcOuoY+Ccm+MQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.41]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, bunk@stusta.de
Subject: Re: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Fri, 20 Sep 2019 13:38:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C6F5A4084838034A980A848D058273ED@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 03:13:44PM +0200, Andrey Zhizhikin wrote:
> Hello Raj,
>=20
> On Tue, Sep 17, 2019 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > with openSSL 1.1.1d we start seeing errors like
> >
> > Error Generating Key
> > 139979727451584:error:2406C06E:random number generator:RAND_DRBG_instan=
tiate:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342=
:
> >
> > when using openssl from openssl-native on build hosts, this is due to
> > limiting the random seed to devrandom, to support older hosts, since th=
e
> > option allows to have a comma separated list of methods to try, we can
> > try the default first and if that fails then fallback to devrandom, thi=
s
> > will ensure that it keeps working with build systems which dont support
> > getrandom()
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Adrian Bunk <bunk@stusta.de>
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
>=20
> Just as a test report for this patch:
>=20
> I've tested this patch on the HW (i.MX8M Mini EVK) and unfortunately
> my sshd given up with a message: PRNG is not seeded
>=20
> Reverting commits (effectively rolling back to openssl 1.1.1c) made
> sshd operable again.:
> 53b5654d6e openssl: Enable os option for with-rand-seed as well
> 2c6b9b918c openssl: Upgrade 1.1.1c -> 1.1.1d

Do you have rng-tools on the image? That helped me with the kernel random p=
ool
initialization for sshd in iMX8 and openssl 1.1.1x.

I don't see how 53b5654d6e could change this behavior for target openssl.
2c6b9b918c could change the behavior and would be suprise. Maybe also
target recipe needs --with-rand-seed=3Dos,devrandom on iMX8 or similar plat=
forms.

-Mikko=

