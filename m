Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id AD49F602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 19:29:46 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id z190so50734533qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iGaOO//Q57du8zMA0zxuzOBpZnrDSnPvsCc5a+/uj9o=;
	b=Tk/X5zDI3MQR4HGMjdlRtTfww2vQOjYRsIYpNkcu3I+PoMaDD7BC3p90lYZX0qGwbF
	vcbuVSkvvoKzRjaNUDc4F12ppLKkmkrXt4vNKDHHZZCx/57WK8RgspLWycruLDis/q36
	V6in7GY5PNssh6/lAO5xHNUfnTchTPCbEY9uoClh0gRx4KM3oGHkBT8TuA72QleAYBH5
	7GKfeQxw78WLE/PEqvDVF+KV5OaUlctpaD1njr2P2Bi5om5S2Ru1I27I7vHUiOQIOVcC
	TDebaa3M6q+pQwk4ptE7W5/PUD78QL6RfWARdp7l+v0TzikkhS5yS9eUsoH2SwC7T6Op
	7APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iGaOO//Q57du8zMA0zxuzOBpZnrDSnPvsCc5a+/uj9o=;
	b=OrHhDAKCs1x1EHZMKYrJE6pIXIeAYRujuuQw6yCTKF+uyWgN07s+y7PcPYqq3TiSWM
	WCzwuIziKdDTfpDTwGTirXBaCELQRuIjKr98Ms/HpeRQQvCv+yZBlvHH1SJMOdxwxfkH
	sEQRKnfvOMt0yVTjQakwEFKwvVdqHiutty3yaijVJWC+zhbQI+eV01KCnsOIISWImmnQ
	V3x0+580luSg6Sv/0QIbwz8ugUHAqgG4pkuw3qovAgGnNL9hN/Qutv9idD2JUC+/RXSZ
	krntsX/yMQtNvsvGEMINwtF1Ddf15dI9pon3M0Ba/x8hw1odxxp1M0PpkwLVQWhiWO7J
	SM1A==
X-Gm-Message-State: AA6/9RmYDzUM3PIedn/dVInoogcmbh8E/n7QB5gWWpC3wp1oxZoI4a5hlNKRmSDW6Eo+VQ==
X-Received: by 10.194.55.41 with SMTP id o9mr3752747wjp.228.1476300587448;
	Wed, 12 Oct 2016 12:29:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	17sm15377338wju.44.2016.10.12.12.29.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Oct 2016 12:29:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 Oct 2016 21:29:47 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161012192947.GG2923@jama>
References: <1476291665.16008.59.camel@pbcl.net> <20161012173025.GF2923@jama>
	<CAJTo0LaCUJpq5MV3kGtnOz53Mv1V1hr581A7=bBt2yFR8W5CKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaCUJpq5MV3kGtnOz53Mv1V1hr581A7=bBt2yFR8W5CKQ@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: File conflicts in DL_DIR
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
X-List-Received-Date: Wed, 12 Oct 2016 19:29:46 -0000
X-Groupsio-MsgNum: 88134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Content-Disposition: inline

--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 08:11:57PM +0100, Burton, Ross wrote:
> On 12 October 2016 at 18:30, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Github archives are regenerated from time to time and then the checksums
> > are changed, so 3rd option is to use git fetcher with SRCREV matching t=
he
> > has of v${PV} tag.
> >
>=20
> Note that Github maintain that this isn't the case for .tar.gz archives.

I've checked git log of my layers and from last 3 cases where I was
replacing github archive with git SRC_URI it was .tar.gz in two cases and
=2Ezip in one (and they were really failing to fetch because checksums
mismatch).

They might maintain that they don't regenerate them anymore, but if you have
older recipe with checksums which were valid 2 years ago you can still
be surprised by new checksums (I was 3 times in last year by github.com,
last month from few more cases which were still using googlecode.com and
direct release URL stopped working).

Unfortunately this always happens close (or worse shortly after) our
internal release when we switch to different premirror directory and
recipes start failing to fetch.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf+jyoACgkQN1Ujt2V2gByUmQCaA07kB+c7xwlFWpLEwfT567aZ
5lgAn2Kp+R4IemBdKIOueMd6NgzfNMAf
=HqiY
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--
