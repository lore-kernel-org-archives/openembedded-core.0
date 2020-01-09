Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 67D207FE46
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 15:55:08 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d5so6270670qto.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=85xRAtDIZt6fdzfl7daCKAxFWuvdulbBJ34BNO8SvlE=;
	b=FTvYx9rk++fpiIMN1+J0vfMOWKgRZ7BoO32oCWadjHCn0aMLcc6/W69hlywgdcTCdr
	jrJ8h5AQUpFgxzP/YMdGOBFZClsP3Z2Pp26YIH/6smNXfWj1KmLf08bpji4qwL12lX2f
	3w8lcapR2vzDkbRj44mE2JVeOoJarlWaRUR9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=85xRAtDIZt6fdzfl7daCKAxFWuvdulbBJ34BNO8SvlE=;
	b=jU6sEmNJpj/6W0tEUs1bf2k9sNeeITQ6m+mHdNsvuhlSRqy7z+zzHEgCZmcbVuWcYy
	AsYzEX0UKDr/NvIUATUkp2IFP9j6IoP9DXOGoF4frpPV+LVS7Aa2qLsmUBGobZZEJXp7
	RJfxF6JUVDTedtMLxd5leg3NJq5OYrza0YsgIFNHuBO1nDVj9j8GuC5zWzDb8q5S8HW6
	fo8d0eD7XGGVDTG/OEPeUhjpe/Ri1X+WqkDrbiUuXEBhl4WlCDPs+kzlOOytQUiz0JFn
	tLjNkHUioa7/X2mf8ALMNRbW97fG4Vhcepd8sQ+Y2h/llit+kt+Lslfv4Mk8ixQrz/E4
	93cg==
X-Gm-Message-State: APjAAAV7VlBuBDKxNjKGBvida4mEq/REKSSKvuGzNIAH9vp3C6YEzNF4
	OkIQYfNYblIbilfo6EJkciz8fw==
X-Google-Smtp-Source: APXvYqygdNtpZP2TS0hM1rJlefGF7njZbtakMobTY99yWyV6pRQgW28M2OXkSgXeEhqBwd9vJuLztA==
X-Received: by 2002:ac8:67c2:: with SMTP id r2mr8568588qtp.377.1578585308997; 
	Thu, 09 Jan 2020 07:55:08 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id
	p185sm3263473qkd.126.2020.01.09.07.55.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Jan 2020 07:55:08 -0800 (PST)
Date: Thu, 9 Jan 2020 10:55:06 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200109155506.GD31026@bill-the-cat>
References: <20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
	<20200109144454.GB31026@bill-the-cat>
	<CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
	<20200109150148.GC31026@bill-the-cat>
	<CANNYZj-UjHc=f-yvfGXhqRH_4AKKzrAdgaX1i_jpzDSAEFfnRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-UjHc=f-yvfGXhqRH_4AKKzrAdgaX1i_jpzDSAEFfnRQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Jan 2020 15:55:08 -0000
X-Groupsio-MsgNum: 133306
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NP+fiIeNjDlB/E6h"
Content-Disposition: inline

--NP+fiIeNjDlB/E6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 04:33:58PM +0100, Alexander Kanavin wrote:
> On Thu, 9 Jan 2020 at 16:01, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Thu, Jan 09, 2020 at 03:47:24PM +0100, Alexander Kanavin wrote:
> > > On Thu, 9 Jan 2020 at 15:44, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > > The problem here would have been caught with systemd-free and
> > > > busybox-free being a check in lib/oeqa/selftest/cases/imagefeatures=
=2Epy
> > > > yes?
> > >
> > > Yes, and you'd also need to do -c testimage on the image to make sure=
 it
> > > boots and has the network up and working.
> >
> > Yes, but I'm thinking in terms of what to change / add so that it would
> > be part of the standard suite.  busybox-free but systemd is today, yes?
>=20
> I can't parse your question :)

I have to admit I'm guessing at what level of automated run-time testing
we normally have today.  We sanity test a sysvinit+busybox image with
networking, yes?  If so, we also do that on systemd and I assume with
what I put for the systemd+busybox-free we also do there, yes?

--=20
Tom

--NP+fiIeNjDlB/E6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4XTNAACgkQh/n2NdMd
dlL9Dg/+L9agVJu9QFC5FqW63+uA2qcngw2fs6p2PHM30p/kTYAp/ewy30SqVbNW
OkgbiJ25XjW7JzHBFLJJNnc0NC0zHMr6zNIlC+n/2dV5JCaqnjqYoIaH1OD996kf
Cq6AFqO9xZTkmf1COP0to9zRQJvJBVzqsYINESl9IqPoWsSLiPtVXUGI43G9oDdy
JXMgzLpDe1XmFZNrNH/YLDsMTtIEcABi/uB4yLQkC/2X3l6BvCobo2eQ6Az7hXRS
7qdvxWCm6MgEYmHgLr1cidWPyKwikJz3OxajYDO+xUPUEiXIdSn5G2HLGP9ZoM0L
rnnvy+dkFCpzAk9QGj0dOPFPbNJPLVQqw2pPCkoJz6pLU8JN//mbMgOkbkBVZrdx
xUd5tq2L3Kup9Zdnun/0/mOodOSskb4KwjQkhW3tVTdzSJatCv94qX5ieZa6eciw
IQXDLJSak0PwcSzv/wBCaC5ZbNEJ2TWCPXEwTQpNC9BFktlkSEONiJ0NrgWbUo2O
BgUuJ2PLq9f/XOZwRtriMj6zsbEsM6XXNDd9lkxMO1UE07qjmsfOZz4PtX6iGza/
i/vPzRo4sWazX8IlzBOva/lloR4HFDyHMBvk1PrUA4attf6Dkr8eathMu3uTfFUE
SgV9fxk02tyMcZCw6AKAQYBveD6N0jnE+U3sJqnx1riYtWVcrLo=
=6KYI
-----END PGP SIGNATURE-----

--NP+fiIeNjDlB/E6h--
