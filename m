Return-Path: <prvs=343312a63=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAD077BBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1498460567; x=1529996567;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=8Rv19qrrqEjvIEtTKI7DzH38iuMyqWcPrAntnYAZ9s8=;
	b=Libqh1IJfRdYWlI/VE3KabPYWPuHf2/U07FSRaKfVNNR7e7RdV8Ud5Aj
	DQJ8Gzmc2aN0Xh5cOGzLPEWqWmAfGWvom2PSLfcfS/5p6AlKwtULIyq7V
	Ql12ARXkQ1GVkji5nbMILDBTzeVEg0YHL/AQ6mllBBZAX19tvINJm2BYm 0=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 26 Jun 2017 09:02:37 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
	26 Jun 2017 09:02:37 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb5.muc with ESMTP/TLS; 26 Jun 2017 09:02:37 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Mon, 26 Jun 2017 09:02:36 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Mon, 26 Jun 2017 09:02:36 +0200
From: <Mikko.Rapeli@bmw.de>
To: <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] linux-libc-headers: fix duplicate IFF_LOWER_UP
	DORMANT ECHO on musl
Thread-Index: AQHS66a59H4ggohTFUaw0slfF1ObNaIyIx8AgAAv3wCAAAsbgIAAl7uAgAOluAA=
Date: Mon, 26 Jun 2017 07:02:36 +0000
Message-ID: <20170626070236.5p5rr7r7nqhes6nr@hiutale>
References: <20170622151404.27496-1-git@andred.net>
	<CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
	<1498214792.25895.23.camel@andred.net>
	<CAMKF1sowVfO=avnnSJtDhYi=nda0hU_htvcTcmtdWydCxzOqvg@mail.gmail.com>
	<20170623141737.bksn4w2qbd7fyhzs@hiutale>
	<CAMKF1spOU3HZ3JuG58CXzGrKgKmw79RcW+CzesouvQdBV+9Rjw@mail.gmail.com>
In-Reply-To: <CAMKF1spOU3HZ3JuG58CXzGrKgKmw79RcW+CzesouvQdBV+9Rjw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: mikko.rapeli@iki.fi, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 26 Jun 2017 07:02:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <961EAD17699D1447B9C53431DDDDD126@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2017 at 04:20:41PM -0700, Khem Raj wrote:
> On Fri, Jun 23, 2017 at 7:17 AM,  <Mikko.Rapeli@bmw.de> wrote:
> > Hi,
> >
> > I'm chipping in since I've been messing with these things a bit in upst=
ream
> > Linux kernel.
> >
> > On Fri, Jun 23, 2017 at 06:37:52AM -0700, Khem Raj wrote:
> >> On Fri, Jun 23, 2017 at 3:46 AM, Andr=E9 Draszik <git@andred.net> wrot=
e:
> >> > connman is not doing anything wrong here.
> >> >
> >>
> >> yes I am aware of this
> >>
> >> > The kernel is redefining IFF_LOWER_UP, because it thinks the libc do=
esn't
> >> > define it yet (and glibc doesn't).
> >> >
> >> > libc-compat.h is the way to solve these kind of issues. There also i=
s https:
> >> > //lkml.org/lkml/2017/3/12/238 which is very similar. I'll pick that =
instead.
> >> >
> >> see the comment https://lkml.org/lkml/2017/3/16/121
> >> that worries me for this patch
> >
> > I'm aware of those review comments but I have not seen any patches post=
ed which
> > fix the problem in some other way. Thus I would propose to apply these =
patches
> > as a workaround until upstream fixes the issues.
> >
> > These header files do not change that often either.
>=20
> problem is you become incompatible ABI forever that worries me.
> However if bruce is fine to carry this patch as part of linux-yocto
> I might relent. It still will be hassle where folks will have to apply
> this patch to there kernels if they are building musl based systems.

API or ABI? But agreed this is a problem.

> >
> >> I am not questioning the correctness of patch too. But
> >> it would be better to get this patch accepted into kernel
> >> before applying to OE since these are kind of patches which
> >> you can get stuck with for life if upstream is not accepting it.
> >
> > Upstream-Status: Denied
> >
> > would be a correct marker for now I guess.
>=20
> I would rather see some progress made to get it resolved :)
> we need to actually remove glibc'ness completely from kernel.
> and this will fix itself.

Yes. With the glibc'ness in the kernel headers I was just following existin=
g
examples and adding some more. Some of those changes got accepted and only
later came the resistance to remove glibc'ness completely. No-one else
has proposed patches. Maybe I should invent some hobby project time again
for this...

-Mikko=

