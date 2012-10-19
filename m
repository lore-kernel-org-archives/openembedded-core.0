Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TPM4D-0000HG-QG
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 01:33:25 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so487895wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 16:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EEIIK2xPW8gUKUNbGePbpxMbUIavCvoEgN12NSBjdL8=;
	b=RhDZZD+PMAPq0EEzTd8GHqITjAJwIso86KiiOUpAKTj1FHpJ6wNlHkxb4ePmuARQc9
	UAqKH3xofLOBnFVjFoClhQl88Dmuafc4x99mI7w4l0zeqiT2o5FNSCRKDgt3WmmTLxUO
	ORBTmpfVnl90oUalhz9aCxiZWpE1nqavOLffgrstw/pZ+BtNHvO5YpwW9NoFyi3aT8Ck
	99+jck4cEh1hJUqE4wOaPnk7CbcvIlJEWVv9PsotRsIWiTNT5UgZZNR618ecOUyfoR21
	ho7P5XSzTIDvZeXBNodEK7xLwxBqORRUc/30lfipgaKfckpaNjqbXxkST84TbV2wkNBz
	xklw==
Received: by 10.180.87.34 with SMTP id u2mr6181155wiz.4.1350688804297;
	Fri, 19 Oct 2012 16:20:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a10sm6144787wiz.4.2012.10.19.16.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 16:20:03 -0700 (PDT)
Date: Sat, 20 Oct 2012 01:20:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121019232013.GB29349@jama.jama.net>
References: <1350600718-3052-1-git-send-email-denis@denix.org>
	<20121019084432.GH3087@jama.jama.net>
	<20121019165616.GA27336@denix.org>
	<20121019193829.GA29349@jama.jama.net>
	<1350686218.2520.49.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1350686218.2520.49.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 0/2] Add more tunes for new ARM processors Cortex-A15 and Cortex-A7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2012 23:33:25 -0000
X-Groupsio-MsgNum: 30754
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 11:36:58PM +0100, Richard Purdie wrote:
> On Fri, 2012-10-19 at 21:38 +0200, Martin Jansa wrote:
> > On Fri, Oct 19, 2012 at 12:56:16PM -0400, Denys Dmytriyenko wrote:
> > > On Fri, Oct 19, 2012 at 10:44:32AM +0200, Martin Jansa wrote:
> > > > On Thu, Oct 18, 2012 at 06:51:56PM -0400, Denys Dmytriyenko wrote:
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >=20
> > > > > The patchset adds 2 more standard tune files for the new ARM MPCo=
re (multicore)
> > > > > processors Cortex-A15 and Cortex-A7, as per:
> > > > >=20
> > > > > http://www.arm.com/products/processors/cortex-a/cortex-a15.php
> > > > > http://www.arm.com/products/processors/cortex-a/cortex-a7.php
> > > >=20
> > > > Please check this patchset=20
> > > > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October=
/030759.html
> > >=20
> > > Yes, I've seen that patchset. Unfortunately it's still in the queue a=
nd is=20
> > > going through implementation iterations. Once it gets into OE-Core, I=
'd be=20
> >=20
> > Nobody commented on last iteration (except of acks from khem). So I
> > don't plan to send another one.
>=20
> It was made clear that we were concentrating on the release and these
> were something we'd come back to afterwards. I also made it very clear

I'm not complaining that it wasn't merged yet, just saying that it
should be considered for merging before adding more tune files to fix.

> that I'm opposed to something that is repeatedly getting proposed here.
> Lets just say it is unlikely I will simply change my mind if people keep
> sending it.

AFAIK You were against OPTDEFAULTTUNE and that's not used in last
iteration. Last iteration just defines different PKGARCH for different=20
CCARGS as you said:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c6

> I'm trying to get to the point of reviewing the patches that need
> attention and give more constructive feedback having cleared the less
> problematic ones out the way and shortened the backlog but I'm not there
> yet. Ideally I'd like to take a break entirely but sadly that simply
> isn't going to happen :(. I'll try and get to these as soon as I can but
> there is a substantial queue.=20
>=20
> I'd also point out I'm getting considerable "feedback" as soon as
> anything goes into master that destabilises the build so when anything
> does merge, fixing fallout is taking priority too.

Yes that's why I'm reporting that fallout as soon as it's merged when
it's something I haven't noticed when patch was on ML. And I know that
you're often the one who fixes it in the end when commiter does not even
reply on those reports, thanks for doing that.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCB4C0ACgkQN1Ujt2V2gByRkACgk84SCCue5YYIp6FkH9rHHdkA
jQYAnRo7CzYsK3amLarDuUiDdw2MgOtE
=cwe8
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
