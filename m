Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC9A75E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:30:30 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so73192983wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=+C0uSDUhSxf99c9ZLK4T2XBt7WJitbSY4lPgVqrtXgE=;
	b=dgWlq+AN/s/LlOGlkvswvS6ggXT5eQ+jmpUxGC4qxNpS0UZUsrMIoaCeFf3MiwW8qP
	4ohiV54aEQwQkV6S8rFC5DreiAH0SyLiYf+HklQFo7kkdmH2R2fUDlVPd9cHstgEphzh
	i4ssttdCM/a0lnhKC7aSM99PZ73bba7cDdY+krGcxWKd1yK2Dn51lu2akGHJ2wdXHTY7
	ji00ln5/HBoumYvVkW6Gg4kvbatGRuWtTO+b1Q0YulMYgHotKrEgeHIydhUFYEcjUnCl
	TtVOz6jigkNJBcfGNupadCQ8tSE4/Rt05sq4JTBGr8FnzmhrVZs3RSSiht+JX2Ly7mXr
	Ky/g==
X-Received: by 10.194.22.135 with SMTP id d7mr8434424wjf.78.1442597431015;
	Fri, 18 Sep 2015 10:30:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fs9sm16533953wic.24.2015.09.18.10.30.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 10:30:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2015 19:30:55 +0200
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20150918173055.GB2385@jama>
MIME-Version: 1.0
In-Reply-To: <20150907151449.GB2457@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: World builds HW Was: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 18 Sep 2015 17:30:31 -0000
X-Groupsio-MsgNum: 71312
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 12:24:00PM -0400, Randy MacLeod wrote:
> On 2015-09-07 11:14 AM, Martin Jansa wrote:
> > Full jenkins build test takes over 3 days (depending on sstate reuse,
> > one MACHINE can take more than 24 hours), so if I add them to
> > master-next after it's merged to oe-core it will take 3-6 days to
> > build-test them (6 days if they are sent just after current queue is
> > sent for build).
>=20
> Hi Martin,

Hi Randy,

> Replying privately but you can add the list back in your
> reply if you like.

OK, adding both MLs

> I never build all of meta-oe but a day seems like a long time.
> On a 3-4 year old 24 core system, with 64 GB RAM and
> 2 large disks, I build oe-core + a whitelist of meta-oe + misc layers in
> 5 hours using 18.3 of the 24 cores on average.
> What are the specs of your build machine?

It's one of VMs running on box donated by HP to webos-ports project. It
has access to 8 E5-2630L 0 @ 2.00GHz cores (from IIRC 24) and slow IO
which we try to compensate a bit by using tmpfs for TMPDIR, VM has 80G
RAM, so I'm using 72G for tmpfs.

Tom: please fill-in the gaps, I don't know any details about the real HW
it's running on.

The same machine is also running some webos-ports builds sometimes.

BUT be aware that my world build is much bigger than what you're
probably building and changes in oe-core almost always ensure very low
sstate reuse.

e.g. last build with only small oe-core upgrade since previous build:
NOTE: Tasks Summary: Attempted 33283 tasks of which 5252 didn't need to be =
rerun and 33 failed.
NOTE: Build completion summary:
NOTE:   do_populate_sysroot: 21% sstate reuse (485 setscene, 1750 scratch)
NOTE:   do_package_qa: 12% sstate reuse (262 setscene, 1760 scratch)
NOTE:   do_package: 4% sstate reuse (76 setscene, 1750 scratch)
NOTE:   do_packagedata: 13% sstate reuse (281 setscene, 1750 scratch)
NOTE:   do_package_write_ipk: 12% sstate reuse (262 setscene, 1756 scratch)
NOTE:   do_populate_lic: 22% sstate reuse (521 setscene, 1806 scratch)

real	1485m40.070s
user	4166m49.125s
sys	2825m50.068s

BTW: you can see all this information in the world logs I'm sending to MLs
(but not all the builds make it to ML report).

> A decent build box these days has 32+ cores, 64+ GB RAM  and
> and SSD or RAID disk filesystem. The costs of such a system
> are significant but worth it given the number of people's time
> involved in meta-oe.

That's true, but I have to do with what I have available :).

> Also, it would be nice if OE had a few such machines each
> working on builds for a MACHINE to reduce your turn-around
> to more like a day or so. :)

Yes, it would be nice, I'm trying to get Tom King to set another VM like
this in another location (another HP donated server), hopefully he will
finish it soon.

It's all hosted together with OE infrastructure, bandwidth is limited, but
all I need for these builds is to fetch sources and upload the logs, there
are no package feeds or sstate from these builds usable outside, but now it
rsync the downloaded sources to sources.openembedded.org

If you know about some idling build servers, I would like to give them
something to do :).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX8Sk4ACgkQN1Ujt2V2gByg6wCfa+XUWillQLYnMYyvf51KXg3s
B4IAnjyoUxEU9g03kLZyMCK+QfemhVAj
=0RkB
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
