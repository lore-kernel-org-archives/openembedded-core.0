Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 24D71605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 13:00:45 +0000 (UTC)
Received: by wijq8 with SMTP id q8so80730911wij.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hG27S+uEbHSSGbuszTHFAEO6mqFMTVS6wQBWvcVc91w=;
	b=o3WJBHrq9b2skiIzV4CSaZvoebTx4gQA/FfdRL7akP1Ggnd/acWuPKHuxBoz7+ZQJA
	6mpD/KsXA9n6He3hYTcn2rtWYwRWqeZ+Fu4TJ02y8vCQFxzsfuxLvfsWCckv7fwt+HAo
	wxCw3zOvPcRUwZdVEFqk/sJ6XUYrwdMQRhepL5q7BSyKfo0tWvndakAC1NbQgmuwB1B1
	K2EsyU5bFeaMtCky+ycr69FpZywOjw+Dr2CpTT228ohwZF5MQdoZ7MkKX7tbX0N1/zcg
	2KtJDTDgiUjYtoDZ5hSN6lP3JRPddZv6GKVHaxk/9a7FGF+3LkMQ+8+TYz67opo8Mc4l
	AS2w==
X-Received: by 10.180.184.201 with SMTP id ew9mr4663104wic.53.1444827645642;
	Wed, 14 Oct 2015 06:00:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r9sm9909344wjz.35.2015.10.14.06.00.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 06:00:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 15:01:00 +0200
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20151014130100.GB22448@jama>
References: <20150907151449.GB2457@jama> <20150918173055.GB2385@jama>
	<CAHQecY67ET70Gz30Hunm6CFiuV4uw5By-M+2WUK1dstyz9_UFw@mail.gmail.com>
	<561D6D00.4050702@windriver.com>
MIME-Version: 1.0
In-Reply-To: <561D6D00.4050702@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: World builds HW Was: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Wed, 14 Oct 2015 13:00:49 -0000
X-Groupsio-MsgNum: 72169
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline

--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 04:43:44PM -0400, Randy MacLeod wrote:
> On 2015-09-18 01:56 PM, Tom King wrote:
> > Martin, Randy et.al <http://et.al>.:
> >
> > I'm moving around things such that I can give Martin a full builder:
> >
> > 24Cores, 256GB RAM,  up to 3TB storage from the donation that HP made to
> > WebOS-Ports (as I consider it essential to webOS-Ports that OE has a
> > strong foundation)
> >
> > Tom
>=20
> Thanks Tom.
> I'm back from vacation, cleaning up old emails.
>=20
> Did the upgrade help Martin?

I'm still waiting for access to that server.

> Do you need additional systems?

More builders are always welcome. In ideal case I would trigger all 3
architectures in parallel on different builders.

> ../Randy
> >
> > On Fri, Sep 18, 2015 at 10:30 AM, Martin Jansa <martin.jansa@gmail.com
> > <mailto:martin.jansa@gmail.com>> wrote:
> >
> >     On Fri, Sep 18, 2015 at 12:24:00PM -0400, Randy MacLeod wrote:
> >      > On 2015-09-07 11:14 AM, Martin Jansa wrote:
> >      > > Full jenkins build test takes over 3 days (depending on sstate
> >     reuse,
> >      > > one MACHINE can take more than 24 hours), so if I add them to
> >      > > master-next after it's merged to oe-core it will take 3-6 days=
 to
> >      > > build-test them (6 days if they are sent just after current
> >     queue is
> >      > > sent for build).
> >      >
> >      > Hi Martin,
> >
> >     Hi Randy,
> >
> >      > Replying privately but you can add the list back in your
> >      > reply if you like.
> >
> >     OK, adding both MLs
> >
> >      > I never build all of meta-oe but a day seems like a long time.
> >      > On a 3-4 year old 24 core system, with 64 GB RAM and
> >      > 2 large disks, I build oe-core + a whitelist of meta-oe + misc
> >     layers in
> >      > 5 hours using 18.3 of the 24 cores on average.
> >      > What are the specs of your build machine?
> >
> >     It's one of VMs running on box donated by HP to webos-ports project=
=2E It
> >     has access to 8 E5-2630L 0 @ 2.00GHz cores (from IIRC 24) and slow =
IO
> >     which we try to compensate a bit by using tmpfs for TMPDIR, VM has =
80G
> >     RAM, so I'm using 72G for tmpfs.
> >
> >     Tom: please fill-in the gaps, I don't know any details about the re=
al HW
> >     it's running on.
> >
> >     The same machine is also running some webos-ports builds sometimes.
> >
> >     BUT be aware that my world build is much bigger than what you're
> >     probably building and changes in oe-core almost always ensure very =
low
> >     sstate reuse.
> >
> >     e.g. last build with only small oe-core upgrade since previous buil=
d:
> >     NOTE: Tasks Summary: Attempted 33283 tasks of which 5252 didn't need
> >     to be rerun and 33 failed.
> >     NOTE: Build completion summary:
> >     NOTE:   do_populate_sysroot: 21% sstate reuse (485 setscene, 1750
> >     scratch)
> >     NOTE:   do_package_qa: 12% sstate reuse (262 setscene, 1760 scratch)
> >     NOTE:   do_package: 4% sstate reuse (76 setscene, 1750 scratch)
> >     NOTE:   do_packagedata: 13% sstate reuse (281 setscene, 1750 scratc=
h)
> >     NOTE:   do_package_write_ipk: 12% sstate reuse (262 setscene, 1756
> >     scratch)
> >     NOTE:   do_populate_lic: 22% sstate reuse (521 setscene, 1806 scrat=
ch)
> >
> >     real    1485m40.070s
> >     user    4166m49.125s
> >     sys     2825m50.068s
> >
> >     BTW: you can see all this information in the world logs I'm sending
> >     to MLs
> >     (but not all the builds make it to ML report).
> >
> >      > A decent build box these days has 32+ cores, 64+ GB RAM  and
> >      > and SSD or RAID disk filesystem. The costs of such a system
> >      > are significant but worth it given the number of people's time
> >      > involved in meta-oe.
> >
> >     That's true, but I have to do with what I have available :).
> >
> >      > Also, it would be nice if OE had a few such machines each
> >      > working on builds for a MACHINE to reduce your turn-around
> >      > to more like a day or so. :)
> >
> >     Yes, it would be nice, I'm trying to get Tom King to set another VM=
 like
> >     this in another location (another HP donated server), hopefully he =
will
> >     finish it soon.
> >
> >     It's all hosted together with OE infrastructure, bandwidth is
> >     limited, but
> >     all I need for these builds is to fetch sources and upload the logs,
> >     there
> >     are no package feeds or sstate from these builds usable outside, but
> >     now it
> >     rsync the downloaded sources to sources.openembedded.org
> >     <http://sources.openembedded.org>
> >
> >     If you know about some idling build servers, I would like to give t=
hem
> >     something to do :).
> >
> >     Regards,
> >
> >     --
> >     Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >     <mailto:Martin.Jansa@gmail.com>
> >
> >
>=20
>=20
> --=20
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,=20
> Canada, K2K 2W5

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYeUgsACgkQN1Ujt2V2gBzG0wCfT1lzyvBAZr1Nnv6jxO/hgXNm
AgoAoJedpcwdJ4exlj01lRyZbK7+cUtL
=xuUi
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
