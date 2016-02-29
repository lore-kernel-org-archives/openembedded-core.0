Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 71EBB771F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:00:32 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so33686649wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 00:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=kUcgJ6sYyzxHcL9XUAusaiYXgWXMAFtlurEjafnL9dE=;
	b=xWcXa3LbTKnwJ+71Q8evqob06FxyMk5uu+vgWZhtGi1zV7O0O63OrIpcPvYK4zzvY0
	NPaCPAszs633rZJgkjpQTfzECZw0/70ShzlqwBGUfDEDB5kQAHzA471aaaXoqUD4maGl
	6eWiDQ0n3QO87su3URUwE0ZlQrztoRTXTE+CFPEeNqVO+G9+/oecPIEPZ9/jWKeEccTL
	Wh9r9JAfldVv8n13T+3H5/EzMmaqJ4QXF0tqsrYsCH5UXVmNKeKKwXc4P7NhqM/EmNtG
	xcP8BH6lse6x0892CEBppeBiWJ6W7loDTwkiPZ5C13dW4UDJeHguaFWJWUqv4Oe+fu3w
	I3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=kUcgJ6sYyzxHcL9XUAusaiYXgWXMAFtlurEjafnL9dE=;
	b=B7VK5IF2Fk7YxwVDDIlo+r870rJ4wPeXB1mgRQsP+ghSeSxFE/VlYhxTvwJN94Lyts
	zf+dnqJmUzd990ZdWN9XPU2D4Z7WwrUj2W+eFpiNUByqYdNZqwx9dKpYl17C+Njvi5wO
	PEsSPg0bSi7GOyirD1tk4tjMWq/YQLwaeuHQXAWd6xDJA3g4vuiNL/elImpoKiCVh/Pe
	2A/8n8N7wGohACaNYmILFAWOaWQGk5tne5I6QHHMjNDgCD0FZL53tPunHq7K6bpTx2J8
	zMxUy5kXbsKBt3sQEw3KgHCvDZPMe/4TrnwzgqavceHUgCw1KJI9FE3LTVqazQMuUr0Z
	fYcw==
X-Gm-Message-State: AD7BkJL/0GTAnK/5pj+U0r0IbagAECArWMWPS0vP1tcuFXMHUCBIbge4CKgQHMKnvxmhSQ==
X-Received: by 10.194.103.5 with SMTP id fs5mr13486448wjb.42.1456732833177;
	Mon, 29 Feb 2016 00:00:33 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	da6sm15123082wjb.24.2016.02.29.00.00.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 00:00:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0LYt_SVFavOCtZmdcXcgZBarR+RMArwA_MJn7Amiy4iZuw@mail.gmail.com>
Date: Mon, 29 Feb 2016 09:00:30 +0100
Message-Id: <062AD77D-2CDB-4D36-89AA-7F8072A8283A@gmail.com>
References: <898F5FB0-0062-4647-8A7A-1DE402384A75@gmail.com>
	<CAJTo0LYt_SVFavOCtZmdcXcgZBarR+RMArwA_MJn7Amiy4iZuw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] avahi: make dbus optional but default
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
X-List-Received-Date: Mon, 29 Feb 2016 08:00:33 -0000
X-Groupsio-MsgNum: 78867
Content-Type: multipart/signed;
	boundary="Apple-Mail=_319321D1-F32C-4334-84C7-FAD07EBC5DA1";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_319321D1-F32C-4334-84C7-FAD07EBC5DA1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 29.02.2016 um 00:24 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> On 28 February 2016 at 11:39, Jens Rehsack <rehsack@gmail.com> wrote:
> +PACKAGECONFIG[dbus] =3D ",--disable-dbus,dbus"
>=20
> Add --enable-dbus for clarity, please.

This switch isn't documented in configure help. I try it out, but when =
it complains, I leave it out.

> -       rm -rf ${D}${datadir}/dbus-1/interfaces
> -       rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
> +       ${@bb.utils.contains('PACKAGECONFIG','dbus','rm -rf =
${D}${datadir}/dbus-1/interfaces','',d)}
> +       ${@bb.utils.contains('PACKAGECONFIG','dbus','rmdir =
--ignore-fail-on-non-empty ${D}${datadir}/dbus-1','',d)}
>=20
> The interfaces files should probably be installed in avahi-dev as =
they're genuinely useful, and then I think the rmdir =
--ignore-fail-on-non-empty can always be executed.

Especially that one fails when no dbus support is added. So, nope - it =
should not always executed.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_319321D1-F32C-4334-84C7-FAD07EBC5DA1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW0/qfAAoJEESZlq7c5QqdQnkQAIYwYTKwJP3cSUUMP1x9wjDR
qxy0y9T4BXxWXYPSaZN/j2QnHOV1ThMBbhqBCQfVB37YW3gw00qqF7Mb1pb3MbzO
XDQdEzPT2jdwA/ElP2c0Ccl+BrDzlEUsFQ9W+1PtznG+Ft3Q2hcomBa8njw0QmZ0
iMkZK4/oUeGVbr6itW4W/9JNZKjzVikgaNYPRhuwGw4PL1VR0umTNQwMevl+4GR/
6VK97ycpStVo8fWbiMCzw+7KhO3/21dUfDPGe9H5S/pq5zuxaA+WRA3XMTda+qAv
b6Iau2mTc3vkilT/LGqo96xlK7PLeIp9BVTUQyp7IkmzYn6SomCvn1UhoOH9CB1L
rJYRz4FY77+gMIjmh5YS7vFsV2qbwRJI/YW5DEBi4/kInTZliyqbCgg70xdAiZsA
05UrqTmbMVik3HyhWEg7fysGcqKcLeArI3SWrJ9RHUW8yCQzwRn37ppCpb99nA4K
QIWCzU15FPVYXcqLIiN1Q5fcLe0Xmx0Q5SW8kSHoI6SK+id0XEzFEtxQmu0NfgQ5
l6UQeY2cqGSlWM0dSkldcjn6lnBYtzAXDS+f/NgR3P2tSiaNFFuQsJhQQ1LBXpyN
dIgeg4KMzE8zPn39SPIY+pOF6XsMu45bfU/aFzfWI/Q6KvRZdxM914qOd4Qc2TTq
5YpC/NwvY7w2p4JNSUyE
=vbQg
-----END PGP SIGNATURE-----

--Apple-Mail=_319321D1-F32C-4334-84C7-FAD07EBC5DA1--
