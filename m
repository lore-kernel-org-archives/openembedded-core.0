Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW96i-0003wt-30
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:03:32 +0100
Received: by bkbzv15 with SMTP id zv15so1854134bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ofXxH61kwmrHuV4mdZXWFljBc42pu15Zq9zRev1b068=;
	b=P6G5s/GNZPUyo8ms7wZS4e9S9H6xhWBtaM/k+NKznogVORWrpVPHOCIwNJjpCi/5Ka
	QXqBbgSlCKtbzzmhrqtgNsbnUbhseA0+6IE0CDCvNRshbG72zfkdPqXqLWrPejiCGC16
	xIjvKzjiSSCF3Qu0Rl4IHHNZ9bLAeEDfxocH0=
Received: by 10.205.143.18 with SMTP id jk18mr7915184bkc.1.1322755010491;
	Thu, 01 Dec 2011 07:56:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fa8sm12151275bkc.14.2011.12.01.07.56.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 07:56:49 -0800 (PST)
Date: Thu, 1 Dec 2011 16:56:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201155647.GC32202@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<1322744558.17484.126.camel@ted>
	<20111201131337.GG19917@jama.jama.net>
	<D4AB0008-1471-4985-A04B-0394F28EB3E7@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <D4AB0008-1471-4985-A04B-0394F28EB3E7@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 16:03:32 -0000
X-Groupsio-MsgNum: 13453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 04:36:40PM +0100, Koen Kooi wrote:
>=20
> Op 1 dec. 2011, om 14:13 heeft Martin Jansa het volgende geschreven:
>=20
> > On Thu, Dec 01, 2011 at 01:02:38PM +0000, Richard Purdie wrote:
> >> On Thu, 2011-12-01 at 10:59 -0200, Otavio Salvador wrote:
> >>> On Thu, Dec 1, 2011 at 10:37, Richard Purdie
> >>> <richard.purdie@linuxfoundation.org> wrote:
> >>>        On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
> >>>> A while back I've proposed to make .bbappend without
> >>>        corresponding .bb
> >>>> only big fat warning, but not fatal to parse. Now you cannot
> >>>        even build
> >>>> eglibc if there is libdrm bbappend you don't care at all
> >>>        about..
> >>>=20
> >>>=20
> >>>        You can do this by setting:
> >>>=20
> >>>        BB_DANGLINGAPPENDS_WARNONLY
> >=20
> > Good to know, thanks.
> >=20
> >>> This is even worse; you end up with a package without the changes done
> >>> on the bbappend and as most bbappend files do not change PR, adding it
> >>> later won't force a package update.
> >>=20
> >> Which is why its off by default. My point is you can do with Martin is
> >> suggesting, its just not without its drawbacks.
> >=20
> > I think the main advantage of this is that you're allowed to build stuff
> > which doesn't use those dangling appends. Ie start build of eglibc if
> > you know that nothing is bbappending to eglibc and to its dependency
> > tree. And when .bbaappends are fixed you can disable
> > BB_DANGLINGAPPENDS_WARNONLY and build the rest.
> >=20
> > But waiting for _all_ recipes in _all_ layers to get their .bbappends
> > right can sometimes a bit long..
>=20
> Which is why I sent this proposal, to give slow layers like meta-intel ti=
me to fix their stuff without breaking everyones build for 2 days till RP g=
ets fed up and fixes it himself.
> I don't have the time to maintain forks of every layer like you do with S=
HR and frankly speaking, it shouldn't be needed. I understand that things l=
ike review cycles take some time which is why the proposal tries to workaro=
und the delays in layers in OE-core itself instead of angrily demanding mai=
ntainers to act quicker.

But the problem is that we cannot even push newer .bbappend in advance,
I would be happy to push libdrm-2.4.27.bbappend to master branch if it
doesn't break my builds which were still on 2.4.26.

Would be nice to be able to push danglings bbappends for stuff which is
only sitting on ML for review just in case I'll be at daywork or on
holidays or whatever when it gets applied to ie oe-core and someone just
hits update button..

I think the problem is not with *big* layers like oe-core and meta-oe
where is only 1 main maintainer but at least having full time job
related to maintaining it. But to maintain some hobbyist or community
layer in general in free time is sometimes pretty demanding just to stay
compatible with the rest of world (not breaking the rest of world if
they just want some BSP layer available from it). I wouldn't be
surprised if meta-smartphone BSP layers get disabled in layerman next
time I leave for month long holiday...

Just my 2c

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Xo78ACgkQN1Ujt2V2gBzLVgCeNiqHbGfFtW3l1siiooRvbrRq
VaMAn2FHlB15gjiurD8MxdG2KbRvCdos
=m1uF
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
