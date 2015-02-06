Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0A50D72DF2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:02:23 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id l61so14185212wev.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 07:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a92itV/7EHLddTL3qjYd1uy2zc+eQ5ugx+iKb2hkwx8=;
	b=OR4iS0g0SXOSKNfAKnPmP/uPRO7ThMH1ta+CjTbziKREtMH2vSVQjr0vxyGgZDtrur
	RXf9Y1YBZJ4Lr4EWg69bjdLNUaY3v8Pfbo/OyqRjZkvGDD+UTiSTyRXgZcVA65A9KRtl
	c9ah9Cp5qoMhQEO3qJfB16JEWYIuOqv/JCK5hic6igJoM8L5Lc0NQeeSoGZ9627hwQbb
	4QOIhDbjcknrttSt7yHnOOkU5TnkKScEAnPpPjZKPjABk3pswQe+eCNVfz6W8qLxFo3Y
	8W7jMSyDWjvyPcJqc5VjR4XL3zr/i1Nbf4jzFfZkORwzXSbtDgqFKAfWgxs2TyoGvGQI
	zveQ==
X-Received: by 10.194.92.9 with SMTP id ci9mr8502197wjb.142.1423234943873;
	Fri, 06 Feb 2015 07:02:23 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x10sm1823826wif.15.2015.02.06.07.02.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Feb 2015 07:02:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Feb 2015 16:02:41 +0100
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150206150241.GG2287@jama>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
	<4479188.gEPuv5Te0O@peggleto-mobl5.ger.corp.intel.com>
	<1423222962.20217.13.camel@linuxfoundation.org>
	<CAP9ODKqxCyd=h0ZdyjjY+eogPumbtY3VMBwvskSBQEcw8+D5+g@mail.gmail.com>
	<CAJTo0LZeVbSajYg6iNZo33O1BGRrU8SuQgnDA=Ra+XpOFprcuQ@mail.gmail.com>
	<CAP9ODKoE12hnigK3Z1MKjV5TYRu-EACd2KsCgD0M2hZSEFeNww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoE12hnigK3Z1MKjV5TYRu-EACd2KsCgD0M2hZSEFeNww@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 15:02:30 -0000
X-Groupsio-MsgNum: 62145
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y9PDtDHaFrXNoMPU"
Content-Disposition: inline

--y9PDtDHaFrXNoMPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 06, 2015 at 12:21:23PM -0200, Otavio Salvador wrote:
> On Fri, Feb 6, 2015 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
> >
> > On 6 February 2015 at 14:10, Otavio Salvador <otavio@ossystems.com.br>
> > wrote:
> >>
> >> I think they should re-run. Otherwise we can end having errors and QA
> >> issues unnoticed until a full rebuild.
> >
> >
> > That was the state of things until my original patch last week.  The pa=
tch
> > had the side-effect that changing QA tasks causing *everything* to rebu=
ild.
> > I'm really not sure that's a good solution.
>=20
> If someone adds a QA tasks it is because it matters. In this case we
> ought to have it in an immediate effect so it does makes sense to
> rerun everything.
>=20
> I know it is bad from build time point of view but predictability and
> correctness is more important from my point of view.

Agreed, especially when someone decides to make something fatal it
should highlight all failing recipes before it's enabled in "official"
build instead of sneaking the failures one-by-one as sstate is being
invalidated by other changes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y9PDtDHaFrXNoMPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTU15EACgkQN1Ujt2V2gBy0DACgm850Ieg+8wRztLs1D8ajUmWl
DuMAnA+eSIGByAviSMA4lacgJw26wy3D
=WieS
-----END PGP SIGNATURE-----

--y9PDtDHaFrXNoMPU--
