Return-Path: <prvs=340a7fc1c=Mikko.Rapeli@bmw.de>
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id 11787780C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1498227463; x=1529763463;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=H9H/gIDHaU6MVeowGWSAfI+NvurJZEr/JZYpI1yxaOQ=;
	b=ZMdzwZkgXKqbzoN/bnRZqQNV+1TAueeo14ZwDoSWj77ScmSk7xXktAfE
	MRroKiHOn3Ue8Ephwb5+cF9SUohOo7DRVkmKB63eHehmfA4UdnMkjmyP4
	cLVVlH6HLSoGQUTQR7MGx3txwCwjGwtSIsPaZ/avhaS2AoK04gnIwT+V1 g=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 23 Jun 2017 16:17:39 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw1.muc with ESMTP/TLS;
	23 Jun 2017 16:17:38 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb5.muc with ESMTP/TLS; 23 Jun 2017 16:17:38 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Fri, 23 Jun 2017 16:17:38 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Fri, 23 Jun 2017 16:17:38 +0200
From: <Mikko.Rapeli@bmw.de>
To: <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] linux-libc-headers: fix duplicate IFF_LOWER_UP
	DORMANT ECHO on musl
Thread-Index: AQHS66a59H4ggohTFUaw0slfF1ObNaIyIx8AgAAv3wCAAAsbgA==
Date: Fri, 23 Jun 2017 14:17:38 +0000
Message-ID: <20170623141737.bksn4w2qbd7fyhzs@hiutale>
References: <20170622151404.27496-1-git@andred.net>
	<CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
	<1498214792.25895.23.camel@andred.net>
	<CAMKF1sowVfO=avnnSJtDhYi=nda0hU_htvcTcmtdWydCxzOqvg@mail.gmail.com>
In-Reply-To: <CAMKF1sowVfO=avnnSJtDhYi=nda0hU_htvcTcmtdWydCxzOqvg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
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
X-List-Received-Date: Fri, 23 Jun 2017 14:17:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AAD506F39C1F914B92591C316115C75C@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

I'm chipping in since I've been messing with these things a bit in upstream
Linux kernel.

On Fri, Jun 23, 2017 at 06:37:52AM -0700, Khem Raj wrote:
> On Fri, Jun 23, 2017 at 3:46 AM, Andr=E9 Draszik <git@andred.net> wrote:
> > connman is not doing anything wrong here.
> >
>=20
> yes I am aware of this
>=20
> > The kernel is redefining IFF_LOWER_UP, because it thinks the libc doesn=
't
> > define it yet (and glibc doesn't).
> >
> > libc-compat.h is the way to solve these kind of issues. There also is h=
ttps:
> > //lkml.org/lkml/2017/3/12/238 which is very similar. I'll pick that ins=
tead.
> >
> see the comment https://lkml.org/lkml/2017/3/16/121
> that worries me for this patch

I'm aware of those review comments but I have not seen any patches posted w=
hich
fix the problem in some other way. Thus I would propose to apply these patc=
hes
as a workaround until upstream fixes the issues.

These header files do not change that often either.

> I am not questioning the correctness of patch too. But
> it would be better to get this patch accepted into kernel
> before applying to OE since these are kind of patches which
> you can get stuck with for life if upstream is not accepting it.

Upstream-Status: Denied

would be a correct marker for now I guess.

Hope this helps,

-Mikko=

