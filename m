Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sxkdy-000692-55
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 22:08:14 +0200
Received: by weyr6 with SMTP id r6so1066965wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2012 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wyaw5W4KP8qpzGetT/PieZX4ThZqaXG+zETVUHFto1Q=;
	b=d7+Ox3z7DE8HGNuGlqSXafIpmu3Liu5BqMAYhEAxDgxd/Bgo3IWHtmuUKldi3bFtkr
	2iJ32KcgHYLZAUQXDWbANK8rDMpPO2rb6kmj8yhAxq6OITVaAkkOq2GWJnmsgObCF855
	D2U+RHeiskIxWkM0rV4NqvjFkLRttjLj2B/MBO3sjqDgt65kr80dJiaTGCNCKlJBW30M
	fKk5YoqT9rqI1/Jr/NQiRm5QifckT+iOu6Mew99y+JU2BN5PN2aJ9plO3HGe2lOJEQH0
	qFRGu1Vlnq/QzrrpkD+563J5G84K8r5gLKdgzmuCkybPyAfTIy9U2cOhV+6yLcNzV0l4
	dFyA==
Received: by 10.180.20.11 with SMTP id j11mr6152209wie.12.1344110191724;
	Sat, 04 Aug 2012 12:56:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm7768545wib.3.2012.08.04.12.56.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 12:56:30 -0700 (PDT)
Date: Sat, 4 Aug 2012 21:56:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120804195625.GA3267@jama.jama.net>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
	<CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
	<CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Sat, 04 Aug 2012 20:08:14 -0000
X-Groupsio-MsgNum: 26911
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 04, 2012 at 12:51:47PM -0700, Khem Raj wrote:
> On Sat, Aug 4, 2012 at 12:37 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > And less than 3min on overo with the patches we sent (and my xfce
> > image is full of gtk-icon-update). Don't misunderstand me: I agree on
> > doing things like this on host if possible. But for me the main time
> > waiting on a new image is do_rootfs and I just suggest to think about
> > having these tasks run only once - but we can do this later or never.
> > A bit off topic: As far as I can remember there were times when it was
> > a no-go having gtk-native in oe-core. I hope they are over...
>=20
> I certainly agree with you that it should be run once. However what if
> you changed something in icons between towo do rootfs runs ?
> but I would like to know how much build time is it adding to do_rootfs ?
> sometimes over optimising is bad too.

I think Andreas patch does run it once *per* do_rootfs, so not for every
package which uses it if there is at least one installed in do_rootfs
then it's executed once.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAdfmkACgkQN1Ujt2V2gBxiiwCdFkG99JuFWvg9BRIT8H2uFMNd
MyMAn325ZV4PLFW+Zwk1ZDlC86WGWrZ7
=rWc1
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
