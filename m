Return-Path: <trini@konsulko.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id CFECF7FEB3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 14:44:56 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z76so6185099qka.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 06:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uIka7jE4/SkDXbatxKaDFFwxFSgWHaPMo+STCOt5hn8=;
	b=ETWvtIsLT2ZRnURxgRAN7h55/EnTdls/6cjzi7xcCCEvGL4C/KWfZk0EjH0ybxcXnj
	dZirG3wIKdntE1NCF7oMGStGl6shRCCSjTvNiI5/Y3EFXOy9aiupbO5PTZ+ScYY8dOvY
	Vt4r4jzxZCuY0dJy7KwdTtQM1Bxd+ykb4Hg6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uIka7jE4/SkDXbatxKaDFFwxFSgWHaPMo+STCOt5hn8=;
	b=JfEq7hd3nX7mlS6ZRjt1JjjEgIkXACrnBprj8Vt1a6lzMvBPQO74fi8lTjmMe/rc19
	Ky9tQnc3cDOZz977yUWFz0UyJMCQ5kz5IvBIbeBE+zLPasHtYHBaFGHJfFRX/Ehtbmz2
	4IgrBXTg9P92zpW2B5WiF72Dzov9hIkC3UhB+eQywJCQF97TrjdmkhHi85Cm2EfXUxZi
	AXu4JQbyM3Wmws2jTjHvtRD4IYJFO0Joxs5ty6bsGNty2dt5QYMbipnAyOy0D3dPbLKw
	PvLVPPpHCOdt7++dIGY9UH3+197zoOLq+YfNQZb0hqYjad6HnsiTiL9rD5BaxrHO1xLk
	P0bg==
X-Gm-Message-State: APjAAAVozHEL68j3lGRJUsf9xo02XVCjzYKG5qSnzg2EWvCouy0Zj8Ng
	XosaPyZGSdvQHGZGBg2THiQ4Mg==
X-Google-Smtp-Source: APXvYqwfhnEfiVxbkh602tmKFZr3aQeLt8q4vZKnuNA0WZRE4+E7V+WmK9j2cYB5bRnYiWtvnWpmtg==
X-Received: by 2002:a05:620a:6b6:: with SMTP id
	i22mr9363154qkh.301.1578581097671; 
	Thu, 09 Jan 2020 06:44:57 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id
	x19sm3364845qtm.47.2020.01.09.06.44.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Jan 2020 06:44:56 -0800 (PST)
Date: Thu, 9 Jan 2020 09:44:54 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200109144454.GB31026@bill-the-cat>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Jan 2020 14:44:57 -0000
X-Groupsio-MsgNum: 133299
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yAnL4aV/QzGiAmsL"
Content-Disposition: inline

--yAnL4aV/QzGiAmsL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 03:36:08PM +0100, Alexander Kanavin wrote:
> On Thu, 9 Jan 2020 at 14:55, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>=20
> >
> > That may be but I think this is an oversight, not an intention and we
> > should support busybox-free images...
> >
>=20
> Right, I'll fix the build, but the implementation of runtime testing is up
> to people who need this kind of feature.

The problem here would have been caught with systemd-free and
busybox-free being a check in lib/oeqa/selftest/cases/imagefeatures.py
yes?

--=20
Tom

--yAnL4aV/QzGiAmsL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4XPGMACgkQh/n2NdMd
dlJ7hQ/9GvrJQa/B2Ska5jb05TrekvZy5cUT68TpA5qkkHtJpnPV2S03MQWCiFMY
98wwR/e+R0qzfEhgzh6VNskBJx6kufDZI0PVZrsuZo5eWkm2OiEyx9YIcZLkBDxo
iXa+3ypY2u1MkW+vI+DtTgQnROglOeO9W5R3wTS0TsPqe6NeZDVXD6rX2x6gm7vh
sKF+vYpbLQ/n7OOOyOTG5SE2d7exSBLUbWDIt3ssUWvzCXgIbwvkJ3yP4aU/owR4
M1BiqqgDFby6jUMgwPCpU4xoWTBaAFW97seEOXVeTdUA6E0XXekRc13nA9mnw33P
Gk6+YBjCFe8mf8YQQ/aY8IHbUWtG4IFXeBlpysZXYnr+s3/djycLvUxhEREAhG9B
NRdV37hZjWAoLOoYczOcQJ1siZavCOD1Dwmf/GwBC/RhLy7Q2u178GHpWxfnTCuQ
I5XSlHeW5jeKhWjhtFbF7qQZ68EGm8+txVoKSY1ejK9Rhi/gyGamkp+wIpiHOuw8
C4LwA+7sC+tmZ1Ube2tpCiBaXyt9bzPGdi0/dRWiBQTGb0sCwZV8uITnEi6B0cGS
d/STNobu99ktsiQpcRFXHToD5JK+XQKM05LaWMs8uVbdAZF5HSXZViy2v+HOSI78
aKwD8Ifm7nBuBDE9Diwhu8YFH0Hz/azZmwkRts8q93jOEKAss+Y=
=TeKy
-----END PGP SIGNATURE-----

--yAnL4aV/QzGiAmsL--
