Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 14F74766EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 23:24:44 +0000 (UTC)
Received: by qkao63 with SMTP id o63so36726515qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 15:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Om/tlpkVI2lXyJl93Iyjmka9u9Qb9Pcyzvdfs7oyi6I=;
	b=AKL81Jakv89uV0uWQvIslgnaPCNAuEsJr0J67zT5sFd3++PCtK8vAMEg6HkvgX7HkO
	Yjwok7RRniLdcDRGmN+ElUwnCZ4svnt8MtSqhJbje9+JzrJ7Lkzxj9864VobdqcZoSnb
	zYhZUrWIijkCU4YSFZzRrpOY8dFWWXuUGleyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Om/tlpkVI2lXyJl93Iyjmka9u9Qb9Pcyzvdfs7oyi6I=;
	b=NtvtUuzvHjj9NhpLmKxYha0wirP5SD5vkjUSW+fgErtZ5dQo6f4U9TJe/H4Fpb+sgp
	C96GJL0Xz6iefDibOHljV/d9iOkpvVkdU/Z+3b2IlOcF/7Uno47StmyiWCw7F5e40N9J
	5h7GPXPkjxpeFCBS2s14d1TbX/95ouTjNwvkhmYUyGsUZfQUXTfrH+jJzBTG2EgdgFPu
	xqAvXiGYGX9+3gKnfnQHsLzH+hdnHiNiiFJ/YNq6N8RpG0A6l+lR7FE9s3OLg/6s62ww
	0ePfjOEciPXehH+62AHt6KsubYGP/AGJjccA8uV1XUZjORGBsm5qn4xRZolzYjVrezOC
	WtSg==
X-Gm-Message-State: ALoCoQklCEi7Jy0dJ6UlDsE0eRWEvCkoNf6Gd/4uYuhvEfUSNeRjCbng0RxkgBVlOsZGVZoi5N+4
X-Received: by 10.55.41.32 with SMTP id p32mr647944qkh.18.1447111484951;
	Mon, 09 Nov 2015 15:24:44 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-230-22.ec.res.rr.com. [75.180.230.22])
	by smtp.gmail.com with ESMTPSA id
	a15sm193690qge.18.2015.11.09.15.24.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Nov 2015 15:24:44 -0800 (PST)
Date: Mon, 9 Nov 2015 18:25:26 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20151109232526.GL8499@bill-the-cat>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
	<20151109202937.GH8499@bill-the-cat>
	<CAP9ODKoZR+w+CmPv0gcpJfDf=QqkFNgPOmAX22YJ5RrjAHfkAg@mail.gmail.com>
	<20151109214736.GK8499@bill-the-cat>
	<CAP9ODKqAmMkQ6bEhU1QTuDVNz3eiYp_YbpMD=9t+JODts-3fCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqAmMkQ6bEhU1QTuDVNz3eiYp_YbpMD=9t+JODts-3fCw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Mon, 09 Nov 2015 23:24:49 -0000
X-Groupsio-MsgNum: 73135
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4WLROc9L6mqjEZ7t"
Content-Disposition: inline

--4WLROc9L6mqjEZ7t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2015 at 08:04:31PM -0200, Otavio Salvador wrote:
> On Mon, Nov 9, 2015 at 7:47 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Mon, Nov 09, 2015 at 07:11:37PM -0200, Otavio Salvador wrote:
> >> On Mon, Nov 9, 2015 at 6:29 PM, Tom Rini <trini@konsulko.com> wrote:
> >> > On Tue, Oct 27, 2015 at 02:05:40PM -0200, Otavio Salvador wrote:
> >> >
> >> >> The U-Boot 2015.10 has been released at October 20th 2015. This also
> >> >> removes the GCC workaround, for the inline behavior, as this version
> >> >> properlu supports the GCC 5.2 as compiler.
> >> >>
> >> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> >
> >> > Sorry for being late on this.  Please make sure to cherry-pick at le=
ast
> >> > c139b5ff0999ec3d44a02ebdb623a92e5782e53e from upstream (or a number =
of
> >> > boards won't boot Linux) and possibly even
> >> > fb3db635757f68e68ab3e943396c34886529b88e /
> >> > 2bb5b638791d0f4f7d2f0e5c276e70a1034805ce /
> >> > 347ea94e2a954ab70f64a3f43d9b374cf4640f26 which are some important MI=
PS
> >> > fixes.
> >>
> >> I queued those here for the next patch version however it seems noone
> >> has yet cooked a proper fix for the ppc issue. Are you aware of anyone
> >> working on it?
> >
> > Does https://patchwork.ozlabs.org/patch/535537/ fix the issue?
>=20
> No; it is a failure at the inline handling due GCC 5.2 behaviour change.

Ah!  https://patchwork.ozlabs.org/patch/540952/

But then you run into (as I see just now) that 535537 only covers
mpc85xx and not all of the rest of the platforms so you'll still want
the patch OE has that removes that line from everyone until I post what
I just did locally.

--=20
Tom

--4WLROc9L6mqjEZ7t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJWQStmAAoJEIRElH1W1v7N6rAQAI6lEairBli5pINZst/znA0u
FzfLnOiEu5LNQRygtvRTLtivOPr70/F5xB/Y8VKvSQX2Jf0qes6aRznG/UJ2Jcgk
Q5cIUSz1XkqXRs0OJuSU8OVNsyGD3y+Wl1vQ8WBWOhFshaCQxgNBND7Xu8LaXKlt
e9DH1slMraEoup/IVQ+w+dyJG5xX2w5Dw3MnF2AkJsX+AYos1gyDJkG/exC2SaIf
4tKNgATfuOeK6vleGbVJ8q5UGDGsZdHBfLlcBkQkbdycb5pMQnl6Wxg4hIgoxKg8
nRQ2wYF8VrwctFjlErZIo/ncdcMQYUT6WhTETrb7S9JIPUzK+PO3KUl0slB2vn9R
v2Upo6KDLZ/GxYu4V3jZG5+yQ2ma2aHWEeE51R7JamBLuY2zQsemu47zJ9ZuWNpL
QAMqlUJZRI1NPxNfZtx2k7htZjOtVNPSqgsaz4ptrL3IBFuciUI0ZAr64iLTKoZH
73tOFeAByt+8Oe8Z8YGCwumKMGVDhVYLFGyTff+RoGVthGAkdU6q4Qm+JPT26hE5
UDD0lrB/hrPcZsJlSq96eC4oHo+YXAoGTVnqmWRtghbGCFx1AiBw3r2KPgv8lR2l
ehVQtpyJkk9QfRtvz3dGMWCShMJYUCuEW4fofC6lypK/cf6JgyOVp9T+NtHbHBYl
qGwPSj9lYr3Z/gXZxdvO
=hnQR
-----END PGP SIGNATURE-----

--4WLROc9L6mqjEZ7t--
