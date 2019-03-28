Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id 900C17D1AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:56:26 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x61so11816293edc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gj7TwmCaCOjs7+Ci3XnKyZBJzWkNrvgSY5TpH9q4/GU=;
	b=m44OIR0Fg5sFdLK9g/qP+s7LCl0JioPmW1dNnMpxCBgDTnNIkJqHuzx0/WhmjpxzEs
	aiZXff2qsYMFhqvIDnnIo6SHnMF7RFyN8RWAkI1BrhpkPmKgR5PQC4a/iLGbazXhFzC/
	/T7QFo8biC9d2T9rVztRRjiaISLnhtA6gvv6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gj7TwmCaCOjs7+Ci3XnKyZBJzWkNrvgSY5TpH9q4/GU=;
	b=kwG1jkFTI5z8CjRLOs2sTaONxKqsRChBp8nFzZsb/QhKA31I84QMKo1uopdCgn8XS6
	mJJD4O2tQVAOUJcyh3vLDh/nBpAs9Rudg8XQeggcrbSyjx3iWI1/sLWtdJSBhBct/ciH
	Et2WpFdsqft4QBtln+/f7s4N3ZDRicQ6qWwT7vSgYyV/7XINGzXse1w9rfOHbHN/FD6C
	x7NIwgNQ2PWPV9kkDiviFDhHjLN+Dq8miQeeJzkBxY/bbtnrOOhNhLv3DDhHr/fRZSH/
	DAr2vrmlZ8sABW/TQnvBesXQ+CYMs25I6VBeMNCgA9l4dM/If1us5E8Zw+haJHiJ/e1a
	lrtQ==
X-Gm-Message-State: APjAAAVguL3S6VBz9kmuW0JDN5Dw4q5K8rsWZ6qpXo1QdsohEWqvwz0L
	ExOXgCQ6oNK5xYEDvY8WCG/rRw==
X-Google-Smtp-Source: APXvYqzq/FxzxWWIbJbPdoxAY3YWRfUwpweIiyZC8QeePK+Jx6xcTCucotUZ5SmpJX+Jh+JygM+6rg==
X-Received: by 2002:a05:6402:688:: with SMTP id
	f8mr12075332edy.189.1553784987141; 
	Thu, 28 Mar 2019 07:56:27 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105]) by smtp.gmail.com with ESMTPSA id
	i12sm3268657ejp.57.2019.03.28.07.56.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 07:56:26 -0700 (PDT)
Date: Thu, 28 Mar 2019 10:56:22 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190328145622.GN18421@bill-the-cat>
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
	<CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
	<20190328134644.GK18421@bill-the-cat>
	<CAJTo0LYw1UPfhZy0oJZ5+D=nL0THTaFF4M-1gR8YdqGykB-JmQ@mail.gmail.com>
	<CANNYZj-qn9M=hrJoAh-U7SpiUqZ5v2ctC5AzBKM0yoDkT8q6pw@mail.gmail.com>
	<20190328142524.GM18421@bill-the-cat>
	<CAJTo0LYS1ajNPiexSYKK=T9nTaEJ+XkzLvAKQv+7L6cDdUE5dQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYS1ajNPiexSYKK=T9nTaEJ+XkzLvAKQv+7L6cDdUE5dQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Mar 2019 14:56:26 -0000
X-Groupsio-MsgNum: 122728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V5ypyLxjHkpp0hbI"
Content-Disposition: inline

--V5ypyLxjHkpp0hbI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 02:38:40PM +0000, Burton, Ross wrote:
> On Thu, 28 Mar 2019 at 14:25, Tom Rini <trini@konsulko.com> wrote:
> > Bumping PE is what this is for too, to not break package feeds after
> > we've done something wrong in PV.  So lets bump PE and not break feeds.
> > Especially since this is so that CVE check starts to see and correctly
> > complain about issues that will result in "lets move this from master to
> > ..." and so break feeds.
>=20
> Bumping PE is a nuclear-armed hammer when setting CVE_VERSION=3D"2.32"
> is sufficient and will go away when we upgrade to 2.32.1 onwards.

So long as we don't break package feeds, OK.  Thanks!

--=20
Tom

--V5ypyLxjHkpp0hbI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcnOCWAAoJEIf59jXTHXZSVVEQAL3SX7GdH211Mg7RwvyaN26j
rhcaPLVCmlVbFLJFGyE9xc2a9vrc1t3adYjAFK8SXkt/O+ZVQWPW5ZXGZ1tOT3LI
mmgSu+Rs/EdF15YNrev5kKpcpQyumOxBJwNegeakCIVA3btdrYv4nv+9Ua4eFjKG
UmiiloHw52bYaj6MzkUVLccBZCQBsv2BaZLwzrEYm2UM8cN9luU0L7cEZhlGjSwE
RSZzOd8wZQgXavmpa2nERNJcWmX8S15JxhlmrhUKdKJyM2j+Ca5B88dYbQkXimiz
4fzaOpluqccqF1WQWKwxe9pB+eu2SqIre2AINt0lO3gSBkQ/E0xS54yPioo+m5Ci
ImeqNnV4zrurk9OA8LdXfozCwamp2TVCjTrpmKKbQMV5cZHRlGnGDK+Gbzn2p35U
X94WuHsnkLcF+uPcsa2nfwPfYhwTNb+wyJl+MCF4pN9RAytOzDFYoHw0Jgdwm1rY
x59pIO/nksQpVP5oapbfUHlxdhtQL92DaosFVyjo5e5i6RBwqbZNjwQwjylQhvtR
SsxbiUiZ0kIMbQ4N6T/wACN1/O6ET2QB2Ivfgg6iU9LnlD9gLF2bnzuwIWoAyOSK
zpcVJmU7BAbWPbd4kkfzKqslXvD7G7udqm4VWR7XS/tU10XEZpBq3+9SRGJPmxJn
5OGOjp/2jEI+Ovp7jsvL
=2tRD
-----END PGP SIGNATURE-----

--V5ypyLxjHkpp0hbI--
