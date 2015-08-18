Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id DADED60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 09:03:27 +0000 (UTC)
Received: by wijp15 with SMTP id p15so94568310wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OKrv0YWb6s4aPLAK/SSW4m9bpGQFLpHTD6kHzNdS+NA=;
	b=aKJDVyHTWKskgl5bOEFz5RfVEr3v3NrYzewKjQINuQSjYxvoUGoFT1paoqPrbJMOFH
	oF9OmQfEKYKUHHUnGZxL508C/CHrtbVAbnPQxyYnujMK6HcfhReNSuNbF5sMYbyX086i
	FnZj7OFcLg1O7AeQmVZGKztYh6pLSCsH0X+hK8Dt9JXsQqrwvsmhLDavteJuOklEQRSu
	9PjrDZLseVUtmAE2cM/MQ0wUSzXMag0+khRUFu4+CgMsCyq5zEhleEwRwAP1P5zUJwde
	R5qoSMGaN0KtR0OYX3VBbofPsWBNshDVaQijiHKjnj4QwKWcxACd+a2MuYM4SliJlf2a
	TTcw==
X-Received: by 10.180.75.243 with SMTP id f19mr42040672wiw.52.1439888606100;
	Tue, 18 Aug 2015 02:03:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pe1sm20401067wic.20.2015.08.18.02.03.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 02:03:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 11:03:28 +0200
To: Philip Balister <philip@balister.org>
Message-ID: <20150818090328.GG2458@jama>
References: <55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
	<CAP9ODKpXke_FaA_bSUtPSjqMKWtUsyU44qsm73KfZNrajfZrnQ@mail.gmail.com>
	<55CC588E.6030200@balister.org>
MIME-Version: 1.0
In-Reply-To: <55CC588E.6030200@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Tue, 18 Aug 2015 09:03:29 -0000
X-Groupsio-MsgNum: 69559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Content-Disposition: inline

--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2015 at 10:42:54AM +0200, Philip Balister wrote:
> On 08/11/2015 10:46 PM, Otavio Salvador wrote:
> > On Tue, Aug 11, 2015 at 5:36 PM, Burton, Ross <ross.burton@intel.com> w=
rote:
> >>
> >> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> can we freeze this thread please.
> >>
> >>
> >> Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex,=
 if
> >> someone on this list asks what Poky is, 99% of the time they're trolli=
ng.
> >> :)
> >>
> >> The original and unanswered question was "should oe-core continue to
> >> maintain GPLv2 recipes where upstream has moved to GPLv3 or should tho=
se
> >> recipes move to a standalone layer" with various implied questions:
> >>
> >> - If the v2 recipes move to a separate layer, who own/maintains/tests =
it?
> >> - Should there be v2 recipes for every recipe that has moved to v3, or=
 only
> >> (as is now) the "more-core" recipes (currently YP tests that core-imag=
e-base
> >> builds without GPLv3, nothing else more complicated)
> >> - Should meta-gplv2 only contain recipes from oe-core, or all layers? =
 If
> >> other layers decide to hold both v3 and v2 recipes (not that I'm aware=
 any
> >> have), what makes oe-core special?
> >>
> >> I'm torn, Richard is torn.  Neither of those are useful to forming a
> >> decision.  Does anyone else have any *useful* feedback?
> >=20
> > I think it is a matter of resource usage.
> >=20
> > Up to now, the GPLv2 maintenance has not been so hard and thus I would
> > say for us to stay as is for now. We should revisit this for every
> > release and review if it is time for split it or not.
> >=20
>=20
> This would be a good time to remind us who the audience is for the gplv2
> recipes so we understand the amount of manpower behind their maintenance.
>=20
> My concern keeping then in core is that the commnunity who uses them
> will reduce over time and they will bitrot. If that happens, we should
> create a layer for them and remove them from core.

It's still better to let them bitrot collectively in central layer than
every OE user with this requirement maintaining old GPLv2 recipes in own
layers and re-inventing the workarounds needed to build the rest of the
system with latest upstream layers.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXS9N8ACgkQN1Ujt2V2gBz3HACfWNvBKeq7TfBOhgLZPc8+WaFG
dggAniZ/7hC1W6343vXkGqzHbcFSHcXe
=qNZu
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--
