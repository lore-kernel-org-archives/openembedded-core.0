Return-Path: <trini@konsulko.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 78B927FED3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 15:01:52 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id o18so3080379qvf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JlVvIWTj1pdu4JNCdmZcGYoTxDPL/wuN9jT4CDMD/pQ=;
	b=hqbsw8cFB9AKI1aKV/Qju/hWp0C1I8wkLuJtxMrd6DExD/HOLA/9ONtP7/rHZSzKEB
	h/eMxNJESj1GYyU9f5IxdleN75Oe1iiT0iDYOVd+fzbN2DIHgtrgJ8z7lxNDifVYqSxO
	DBAaoJYOiqX22tjwNe8lS3qUPjTKD6U3mYyAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JlVvIWTj1pdu4JNCdmZcGYoTxDPL/wuN9jT4CDMD/pQ=;
	b=Imjpf0Jq2Gascj/S7Vl/WmtLGH0bf0ui46m9oYlBLJyhUEZfzE6p+XrYSIpBsIQfan
	Yz+/CQOfPDjfqrvgxpTB4IxDggoeSVfSccAmegmUQv23dZ3rb/9ke126GxZQgcpES74d
	5InpgfuiGQMqsaI+aAGlEFPPkfpQPQaM7T2+Ee86AORiW0tKgFw+QM3OxUlxaJd02js3
	SgzgI4GKndauN3RDK5dp8ri0Lr+zySfbkatrkfVmSOpY8WVdR0lmXi88nobzEqCd8/AK
	seF2LXsRQCJH38ILsAlYVsdV0QZP0bcasXD3lXapLiEle9ERJv8bDa4hGeVYjW64RkXF
	9Xbg==
X-Gm-Message-State: APjAAAU9YMVqVvgaPat3ioQQKofy8zfOMyX4BvYipY1pDqev85nHVvwU
	roAVb164wRlqZ46MQgW0TLIBuQ==
X-Google-Smtp-Source: APXvYqy/jou5LD9/P1qIzGK2OuYRnZ+A1e6ck2X33bIhQGalxzidaf1Wg0OEOwLCL6IxPtm24We05A==
X-Received: by 2002:a0c:e790:: with SMTP id x16mr9115083qvn.18.1578582113302; 
	Thu, 09 Jan 2020 07:01:53 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id w1sm3502160qtk.31.2020.01.09.07.01.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Jan 2020 07:01:52 -0800 (PST)
Date: Thu, 9 Jan 2020 10:01:48 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200109150148.GC31026@bill-the-cat>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
	<20200109144454.GB31026@bill-the-cat>
	<CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 15:01:52 -0000
X-Groupsio-MsgNum: 133303
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Y8a5CJOPM/zJV44"
Content-Disposition: inline

--8Y8a5CJOPM/zJV44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 03:47:24PM +0100, Alexander Kanavin wrote:
> On Thu, 9 Jan 2020 at 15:44, Tom Rini <trini@konsulko.com> wrote:
>=20
> > The problem here would have been caught with systemd-free and
> > busybox-free being a check in lib/oeqa/selftest/cases/imagefeatures.py
> > yes?
>=20
> Yes, and you'd also need to do -c testimage on the image to make sure it
> boots and has the network up and working.

Yes, but I'm thinking in terms of what to change / add so that it would
be part of the standard suite.  busybox-free but systemd is today, yes?

--=20
Tom

--8Y8a5CJOPM/zJV44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4XQFkACgkQh/n2NdMd
dlLD2g/9GqPC4TXVwBjj8heIFzuvnRUSa55D3vzfub5PqS4HjPMzaZKSo6R8Aw5e
kY8enNme0NkgeqWzGM820O8kU6Jtcg31FI7WmWKfBdIjoWpQMlBkBYcMU0oBas2c
8klpAqWHlsY1kJwYdUiKwDnnDNzQDb8VMjD8rI8Y52hUOPXGaxPAd9JMrjSxDq+C
0UYSnzodGP2u0qDy/HSOaQImApNOGYMim5hrKdczxtcxkoqV+/qOCVitQEnwi3Ju
jomewLYU332VZEMNhqCfhJ3gIsv+5VAwf2TIuJCPRQgIzVMjyIyCPMNW4zSLeNBN
OfbcMS7qYLdCUke7gQMz67QRqnbnBgl2wGXEtl7Ixb+Tu6l7QDkquJ6K2bUkYYla
HSNo7Hjgy7wge0ujRqyIQQHZvKs61g6GizA8ikj6Z2rhnWh9OIbOIYrdtnVpdzBh
7rrPe0OfzhySWqjUUffKrq3v9V6qfziKk3mjFSQFIwZq+8UVkI7yC4VQly3ZWQph
uyCpDm6xen9dWKq3HDfd7lHEHgvmdmXxUrZDjxTtmf5cOIsQu+9DG2poarxSauF9
fJ//Xdr5bHVauOnrTZFVbQYuK4YgwRi9E1RvwZLoyoC/Ya30v8UvUxBsf48475qx
PUG+mHqCXFFC0gFUP3LUUGoMZZdeSdzJKUL++RzLuEc+STkYykI=
=PjeG
-----END PGP SIGNATURE-----

--8Y8a5CJOPM/zJV44--
