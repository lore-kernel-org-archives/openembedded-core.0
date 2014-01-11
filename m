Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 81BC16B51E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 23:19:37 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so2516729eek.40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/D4c4ZzPJ/j10evQwqG8znSYnGcXa5nF5RhhhwAnKFQ=;
	b=P4d21GNaBiDSzKD8BkEe9QRYOGVXPR/nAIzVwmXvYxvh6SeCvuDAF9tBSiYvYikx2I
	GDMKoBfBF6STMYY9Mo1fm63uVxa2apcGl1WU0FAzlqjfNnB174yoEODKBHzrY/o/Mnl5
	hqHiZNnBLmjv02XzwMjBsptJk2/w0zYcSC7FTSbSgm1uZ1rBCtOmfmACB/dNkCy/PqpK
	DyZHXvkYNTHQTYTTkw7IvnqoX5XbuE/1A9N4qi7P720t/PdrDo6jupTYPzve++0xId4w
	5fUIlNrK3AVm/5xfwI3c7k/znrofaTjjj92ZULC6Eu/tdGbDu/xXCL7IjzDtEk7WPU3Q
	7dDg==
X-Received: by 10.14.208.199 with SMTP id q47mr18331485eeo.77.1389482374827;
	Sat, 11 Jan 2014 15:19:34 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id d2sm11515959eeh.3.2014.01.11.15.19.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jan 2014 15:19:33 -0800 (PST)
Date: Sun, 12 Jan 2014 00:19:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <20140111231948.GC16995@jama>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<1389452899-633-2-git-send-email-andrei@gherzan.ro>
	<8969D90B-28E6-4C07-A113-93A9C033EFAD@dominion.thruhere.net>
	<CAK18fxGFcszrKH30mhDUAU-sjrJa2t7dHshXj-TWkSnGye1AEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxGFcszrKH30mhDUAU-sjrJa2t7dHshXj-TWkSnGye1AEw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] feature-arm-thumb.inc: Use thumb instruction by default if TUNE_FEATURES thumb
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
X-List-Received-Date: Sat, 11 Jan 2014 23:19:38 -0000
X-Groupsio-MsgNum: 48869
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2014 at 05:16:27PM +0200, Andrei Gherzan wrote:
> On Sat, Jan 11, 2014 at 5:10 PM, Koen Kooi <koen@dominion.thruhere.net>wr=
ote:
>=20
> >
> > Op 11 jan. 2014, om 16:08 heeft Andrei Gherzan <andrei@gherzan.ro> het
> > volgende geschreven:
> >
> > > Avoid a confusion when including thumb in TUNE_FATURES. In the curent
> > behavior,
> > > if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be "-marm"
> > which makes
> > > no sense for me as a default behavior. Obviously I can change this by
> > using
> > > ARM_INSTRUCTION_SET =3D thumb. But this seems strange and confusing. =
So
> > let's do
> > > it the other way around: have thumb instructions as default when
> > TUNE_FATURES
> > > contains "thumb" and switch to "arm" instructions when
> > ARM_INSTRUCTION_SET is
> > > "arm".
> >
> > Since ARM_INSTRUCTION_SET is unset for most things this will change the
> > default, are you sure that this is what you want?
> >
>=20
> I am aware of that but still, do you find it normal to add thumb as
> TUNE_FEATURE and get your self with arm instructions flag?
> And generally people adapt if changes make sense :)

With old behavior it was easier for DISTRO to have final say if it
supports thumb for MACHINEs with thumb in TUNE_FEATURES or not.

But with thumb-only MACHINE I see that this logic is going to be broken.

Should we introduce "arm" TUNE_FEATURE enabled in most MACHINEs (except
yours) and let feature-arm-thumb.inc respect that? (select "thumb" when
preferred or when there is no "arm" in TUNE_FEATUREs)?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLR0ZQACgkQN1Ujt2V2gBzlGACeLr5xvR0iBXML2oGKSlcu525v
1cwAn0QrChTlH0r+hYaAJd5sBsJz2+oN
=mNkc
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
