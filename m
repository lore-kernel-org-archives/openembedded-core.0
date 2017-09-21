Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5E77778258
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 21:21:42 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id q80so4977231ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2bVM/+azkXrn9Qq1ocjES9d6EOzzF57DyNyeWAe11Og=;
	b=IvOYySFI6s2YLzZ0tpnRumopNaYvuAOy692tnMJ6JY2m2tbaIM4q177Quuor7AnwoT
	ORWCNz3oVyR41NafBeDSHBbLtO7ErUlWHzvk7rbZJvEN4ng4cuhHSmrOeUFVcf1mDHok
	/C/qrish3A3dt8da117MzecG1M4fdE5FnMXDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2bVM/+azkXrn9Qq1ocjES9d6EOzzF57DyNyeWAe11Og=;
	b=AjPWhF3dxm/VExdh92AD/BJFdb6oIccsWrXjj/vuEUG0gOh0V+XBIhb58yXq2CaDe2
	zNgsifeAaKTHrg7th6Sq5wUiTqj9Pnwq+y1S6OkYuC/Fes7LzqxdcCP107GtxholZ23K
	Ny9NpeRrYkMzrppQf1kDmhWHgSgYKATDx+SDHGI8Zv1rG0vOClZRIDmz9PDd2m2GWo7O
	2Vzpmdeg1p7yKOG9hEui3y13iW+YS/Mf0x+yONRf+n7kNzCbTduko7MFCbDrdyd7USuL
	iSdZfYbX4FjqWnR0kOi27NC8sLFSyFsQ7GJcln3HgLotcT9nBhtj2jGQN8UfzEP9qzl9
	ODAg==
X-Gm-Message-State: AHPjjUh2uwPfX+ZxVDFM3Br0k6QKMWFGdvQPP99p9hGSglXY+z1DcEfI
	9PBBAmAlyAZdbndw6Mu2y+ED3A==
X-Google-Smtp-Source: AOwi7QBkY2uDCWjsBl5I0ksoqHemTN3MZKgrmCg0Wo330h5wFBj/Drl441T6OOlo+zwpfEN293OOlQ==
X-Received: by 10.129.167.194 with SMTP id e185mr2510570ywh.120.1506028904096; 
	Thu, 21 Sep 2017 14:21:44 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:24e9:4a96:6457:ac31])
	by smtp.gmail.com with ESMTPSA id
	s125sm867788ywd.65.2017.09.21.14.21.43
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 14:21:43 -0700 (PDT)
Date: Thu, 21 Sep 2017 17:21:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20170921212144.GM30205@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
	<a6131189-f150-5383-6858-5d296e2389ed@windriver.com>
MIME-Version: 1.0
In-Reply-To: <a6131189-f150-5383-6858-5d296e2389ed@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Thu, 21 Sep 2017 21:21:43 -0000
X-Groupsio-MsgNum: 103241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HmK7y6O+lKZIGkr"
Content-Disposition: inline

--+HmK7y6O+lKZIGkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2017 at 04:20:30PM -0500, Mark Hatle wrote:
> On 9/21/17 4:15 PM, Otavio Salvador wrote:
> > On Thu, Sep 21, 2017 at 2:46 PM, Tom Rini <trini@konsulko.com> wrote:
> >> When we have been told to use the UUID we should also update the fstab
> >> to make use of PARTUUID instead of hard-coding the device in question.
> >> This will make the resulting image much more portable.
> >>
> >> Signed-off-by: Tom Rini <trini@konsulko.com>
> >=20
> > Adding more features which changes the fstab goes to the opposite
> > direction of reproducible builds; is it desirable?
>=20
> There should be a corresponding way to specify the UUID for a generated
> partition.  This would allow someone to pre-allocate the UUID and use it =
for
> their generated image, and thus the reproducible build.

WIC does not today, but the underlying tools do, allow you to specify
the UUID to use, yes.

--=20
Tom

--+HmK7y6O+lKZIGkr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZxC1nAAoJEIf59jXTHXZSNqcP+wdU5maaUvRgemomx8pZICJs
9kBChw4fxTtF0wqUDPu2iX0keYIpqSJQryKc+fV/fnL4AN3uP/s1DHmunQIxar4O
ZO3DiZRqqnzRWb/0TmpVLiRDCo6J4TvD9qyM9z3ZcC39NzlDWKNAw+TzqfSUTk/A
sRjEKs59vGH64S9SsV2mvDxd6Sq4IpMhcNzujHmBuVaxs7ro9Q5RErvXgLaT/Qla
tgjG/DxpdUtfFTEmm59qP9OCKQzI3+MbeyI8a9ISlqyeHLfWKoQarSKQb48FPw0J
tMVjGY3Wjtvqd3hzJ7LwJlVs+OTgX5zMqedPt2ICPIDLUbDi1qmeGD/x4OnqpH/e
JRsi+l6eKwJ9t8A+5+BZa+oe60PxrLLzBgBTACJ3sghoMZ7bMrjAlxSOUzLmwyeZ
Tj4yJZXnSLwbciFilBT/dwzMBssllFD7CTkrjqyMEU4sWx/l+MyXiD5DfTFziHmZ
OTky+pLdP0FnrxU7EUI1DKH46PfH8b9k0s/Dxi7aHXVuGFU3et5XqRbRgLu2BFyv
ieubvf19RovhwfjqYhR1LYoclFwn1ps5u0pebQJb3PJt+lFoDY0SIrJk0/952k+o
zWP7Yd6TkNNpidAZA2ZVFGpk2fEfpokUWjrUxt9ngMBlBsFrGJSKMuMCEnYUeFC7
jAb0rCCxXIdKXCffhIpH
=30NJ
-----END PGP SIGNATURE-----

--+HmK7y6O+lKZIGkr--
