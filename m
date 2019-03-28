Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2B67D19E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:46:48 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id q14so17252873edr.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6KarvtuymF3A255eouocsa5kBTZ7yfCZ2UcwdJ9dQx4=;
	b=f2Gv5UmDwu3Jtp0YXzPyuOJbmpaf43on2NZavdwPAujZxCfOlfGbqTwZRmlCJhBacV
	6hd6UAyKbfEgVgZgwz46o7sGp3npqyorXRhsxLHDitWA0DaSrF4QwexXPr7LCkRIhOy8
	RLGQ1vqXoCE/2tM72nu848kAiciucOWMFPAMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6KarvtuymF3A255eouocsa5kBTZ7yfCZ2UcwdJ9dQx4=;
	b=SqUJtx5phvZ2evUjLKudcHxquAKttr/4+DS4To5g6IA+XW0gI67QNkqPp3S2Yti3jF
	s3AQBqLLg7sdg03Wgog3OCl2ODPomRfzlWaBI9vijn7jo69EsC5fnyx0fMKYBR61KzOm
	q4dONjJctpfnnyW1EO5fqrcZ4icjj5GstztcFaROqq/f4kSwHT7iHxiO9bg2l7qKQYWQ
	fU0MeLa6plMrrBto0riUlK82KB88ChRBo7iEqH6cjnyCkjmFG6fvdccwd16pol0+e9/f
	FZMvYTXUqGH3gwpEVAmio5p8udiy4qCg0orLo5gEFLkacKOeCm/t5LEsaZJFA8rxndCO
	NNZA==
X-Gm-Message-State: APjAAAVL9q4XohGQyYPqOABEV8Wylhz/O7X7VE5RKFsdhrcna4lOy7Vr
	H5naDltKXDjTBFSS8dNTCm8wMg==
X-Google-Smtp-Source: APXvYqyrs9XMJZ8s0SfJrl8eFah8xjVffjlt7oJmDqGfmPyuL8NwqVhBVNHOsEk6yomAXrW1vuY5jA==
X-Received: by 2002:a17:906:48c8:: with SMTP id
	d8mr24087075ejt.208.1553780809078; 
	Thu, 28 Mar 2019 06:46:49 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id k3sm7896606edi.65.2019.03.28.06.46.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 06:46:47 -0700 (PDT)
Date: Thu, 28 Mar 2019 09:46:44 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190328134644.GK18421@bill-the-cat>
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
	<CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Mar 2019 13:46:48 -0000
X-Groupsio-MsgNum: 122718
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EGjwyTcQXITbA3JU"
Content-Disposition: inline

--EGjwyTcQXITbA3JU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 01:17:11PM +0000, Burton, Ross wrote:
> On Thu, 28 Mar 2019 at 13:15, Burton, Ross <ross.burton@intel.com> wrote:
> > On Thu, 28 Mar 2019 at 12:07, Alexander Kanavin <alex.kanavin@gmail.com=
> wrote:
> > > The problem with setting PV properly, is that 2.32 is less than 2.32.0
> > > and will cause the 'version going backwards' problem. But if RP/Khem
> > > are fine with it, I would prefer your patch.
> >
> > I just had a look at the code in bitbake and yes, it actually even
> > tests that 1 < 1.0.  I'd say that there's an argument for handling .0
> > releases specially and considering 2.32 =3D=3D 2.32.0.
>=20
> Of course that test exists for people using feeds, and at least dpkg
> thinks 2.32 < 2.32.0, so even if we changed the test the feed would
> still be broken.

Breaking feeds on purpose is bad, so this is a case to pump PE?

--=20
Tom

--EGjwyTcQXITbA3JU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcnNBEAAoJEIf59jXTHXZSr/cP/0DknvLBPIWl0uMxJV8OJTlF
rSrS3ryB1cjVwi5PrzIavwYYUtFSarrpCEGizeMWyszHhCTzwHw5mqrQcDfPRiKp
i61kwwb8aN60XIhOzkkS0nKfhaU95DO+l3TqbFNl+PdxgXLFCqPvBaviQYzUq5O4
RlGNdYOnH3K0rrQYHTLzqBxV3pzj1iL+cqFj9eGTsM3Y7oNZequp3dc0tU0luqnL
n8kSnwfaCH9DNnVM7zuglVab0ypUGHIaJ+K09DqTjNQlu2ul1/4ln8VmfZLmBV2m
liE8zxvTadvPWfBTEwofx3JEB3lGJ2xE03oEGgTIhxRMB4OsT7GC4sjxOwq2DHs5
6Ew/vZZ7MitZcjk1sbw/uZn0A2cJj8l+eDsYKH7xAKcGndd1jCrn5tNB+5nmqQdI
gEXqnanRQRWyRqjJN4fPqE0Phq6qf5A+2r8DKbkrYW0H78l0cTb7ahCvf05A72vE
hsKE9TnVNhxPkAK5ii69s6RYgbvW8CzhoXnGLWaTEyoYmetL1sJYbfBXTMdmYglQ
R38ySb15afeIPJniLA/yUnbajcIM6tyzNtfF+iIBCN8QYB6A5AZS7NMrFQEpm+vX
DonZYj7gwd+9e/OSEqfLPTXhtKZlyvKnyuxN8mGAelbsct13KJ57Ce9DPRyiPYOf
pIr9nssIDsD2qTfOkZxM
=XKsG
-----END PGP SIGNATURE-----

--EGjwyTcQXITbA3JU--
