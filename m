Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0CABF7D1AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:25:27 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h22so17382028edw.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SPPRfHzWkvBW/HiouYi9fWcoC11+vHDLBCOixraUdQQ=;
	b=VLq5VTtZ2hjwtpoK0MjDiQSXNpObj9onQLtitj7yADk+3OcFWwS//TNloEmuuPrdLT
	cwT7Oapji7axt996naFreEjBKXs87+uRznyusjHCeSlzGt/0m7MkhhX4Rd+0nqOyZi5z
	AZ/qFzsP604hHwnz+4KCfuz2l0Z4H/+SHEnWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SPPRfHzWkvBW/HiouYi9fWcoC11+vHDLBCOixraUdQQ=;
	b=qWtfP5uEl8iOV6ge1O5nyAkECfH9ovsuxoyt9fXgJ/ZMMQDJsQ4LyK1RAKwAMFgisW
	R3mdAYYuJQby2dRJiy+MojfghQ6PxgX/bGZUlMRm9mvWZ1eLa2NZambDqti0X52BWXsM
	clC3p9fgN5IQ8049ewZ1oTAHOO7PcSYY/diMICjKP35zUyf6JZZemCXVKSHGo+TeFyBg
	nNogHoDxC557WMSBEqU6W+7XYnIPtB7wghBY8lh1ZZPylUIqW4NmYdwOf54m4UKntrHC
	NGKlqpGgX+ZEs0hksLHVnLh3FXfUjBOU6utdEU3vQKstx8xdRxXwQDBo87FgEy+NdpMc
	50sQ==
X-Gm-Message-State: APjAAAWhjFTtL5cQ+qTH0KPnmwDL57bSPGNFEwwSoVhU3AI7lexr/7vv
	9GYSLlsQGQHAhsJd1igDB+V1Jw==
X-Google-Smtp-Source: APXvYqz4E6Fhx5RJwqE7W2YjNmX1r8PwtJzEtfMCH6ObgigRarPzEx3mJYoi7ZSxJ5tCYSMbRUXj7Q==
X-Received: by 2002:a17:906:b80e:: with SMTP id
	dv14mr15305938ejb.157.1553783128786; 
	Thu, 28 Mar 2019 07:25:28 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id p3sm7751857edp.44.2019.03.28.07.25.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 07:25:27 -0700 (PDT)
Date: Thu, 28 Mar 2019 10:25:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190328142524.GM18421@bill-the-cat>
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
	<CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
	<20190328134644.GK18421@bill-the-cat>
	<CAJTo0LYw1UPfhZy0oJZ5+D=nL0THTaFF4M-1gR8YdqGykB-JmQ@mail.gmail.com>
	<CANNYZj-qn9M=hrJoAh-U7SpiUqZ5v2ctC5AzBKM0yoDkT8q6pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-qn9M=hrJoAh-U7SpiUqZ5v2ctC5AzBKM0yoDkT8q6pw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 14:25:28 -0000
X-Groupsio-MsgNum: 122723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5irP38Gi3mZ60aXr"
Content-Disposition: inline

--5irP38Gi3mZ60aXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 03:08:00PM +0100, Alexander Kanavin wrote:
> On Thu, 28 Mar 2019 at 14:51, Burton, Ross <ross.burton@intel.com> wrote:
>=20
> > Bumping PE is even worse as a PE never goes away.  I say we leave it
> > as it is, and ask upstream nicely if they'll match the tag/version in
> > the future.
>=20
> The tag and version upstream are both 2.32. It's Khem who declared PV
> to be 2.32.0 :)

Bumping PE is what this is for too, to not break package feeds after
we've done something wrong in PV.  So lets bump PE and not break feeds.
Especially since this is so that CVE check starts to see and correctly
complain about issues that will result in "lets move this from master to
=2E.." and so break feeds.

--=20
Tom

--5irP38Gi3mZ60aXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcnNlTAAoJEIf59jXTHXZSiyMP/izG3pPQ0B31QNut2VXDwl+w
dXxp+YRzCF3Eku2JeQkQvfkkm4n6RcnU5FHuAZF+pZ21XaVY2mPr/Air4LR0cA3X
xfNDBQsZqg3BnSpkzwH2iLhkmIwGqi0Mawk2Hjmq0olRA26QLIV+COsznc3kWYP7
H/JCSamiKrELJmuI8CY66Wl5/501CaZK5pv/t5IdB57A+rsOIyTMpL0kRwRNjphu
tin47RwCYKBQHOjLVb9UY5E7JT9GRnxpfd8YzexPxU7UWm2KTN3AJOebRhqT3aH3
wPKcFMPCFi2M9LVU1rY+d3XSqrSdHYcbGnkQHuxpsgVhrb62COH0T+6lCelZMVad
MxgDS0e7gO4JbyMReTRKNx7Bl/yHV9f8GYtHdjDlG2L66e5jPMit3tbnFpx8FXdq
vc1coyBaJYRGJPq2fuNlhmKqb1fxnDlt9kmz3prHykbej/+gElCCNf5gt4kbFbZY
LWQXl/21AhB2qa++8elUBPLmMw9jN2cJ2q4X+BHyr6R0QEJyfiSyszuSbKhcmfvP
56f917+QLWQDM+Svw/CyBKGmjsaU+bTw4XkanQdm+6cPr6BdZ9mDksN+9xCcVowV
vrGK6hHM/T2iWOIsirg+fkWG6RoRiYLomuGzFI+QVnWD68AZPGhIxIz0UESogc88
I9tMIAxb2gPh4gyQCn4Y
=IGgR
-----END PGP SIGNATURE-----

--5irP38Gi3mZ60aXr--
