Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id C58777C3C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 12:21:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h58so4077422edb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 04:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QYm3QBG+MUBGr/fcZUwbQL7jPk82b4QP/oCgdjFLQIs=;
	b=ZN0j68fzWnOYNvq5ZgwuY3TullheCUKTZCmTupInbCoV4jHfUWEgYnI0ats61tL9N5
	gZYyNSdEjrobmzaboY7jTvlLCUlm9CcFPd8Bz+YHIu7IWiTPMJlbWe9RU6/omnkPc6EK
	w6nKewpScBB0FBuDJ4L69y8/qW1cJ0YuzMTXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QYm3QBG+MUBGr/fcZUwbQL7jPk82b4QP/oCgdjFLQIs=;
	b=FowCg3hy/MdglPRFXJ74gIi8w5wI+gRatGGS0IIArr2z0Un6SuYilRwcOalWnnhtCL
	Wo7nE2B1ehEvtdMkAhh2Iuf/v7rjzbRi9AeRJxBouSetJcn6sRyohD2zvcwXgKPrALZ2
	Rwhp/70+Nvba5suIjGSngxK3NLLYrMRfoP/PBABGxXGxFSUnOnJA708OqSiObLVKiSb+
	wVkAQLhwwDy8nffGuogb9iIUAIWlSWV4bTw6A2sFjBNxpRkksgfTo9tLP89IRsRg0tGw
	1mg2gOftAhDoQdVgQB6Cgl8JaU7V76g/+Rvjwy8emB0EhWrhaVCgfRJjMciNfkg1j4Xo
	1ltA==
X-Gm-Message-State: APjAAAWHgK8aZxdIA5GNqz3VOt7Ugbov4JF6QAhaJGXcUPPVe7vVPalw
	0LEGrssT8i4CGukx9HlUw9MdSw==
X-Google-Smtp-Source: APXvYqyVOEUK2ZswhtYGfBUqbkW/cTBWy7qBHRVCmmou9V8RFC2wgcafZaxsdEp90Wi9WkVz2D3ODQ==
X-Received: by 2002:a17:906:5944:: with SMTP id
	g4mr12655932ejr.105.1551702109105; 
	Mon, 04 Mar 2019 04:21:49 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id g5sm1161478ejj.42.2019.03.04.04.21.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 04:21:47 -0800 (PST)
Date: Mon, 4 Mar 2019 07:21:42 -0500
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190304122142.GN5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
	<20190303225159.GM5026@bill-the-cat>
	<CAJTo0LaOGr4iJh0r1s=wWOy3XA47-L+++Dq+zQOV5hD3LCD4Kw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaOGr4iJh0r1s=wWOy3XA47-L+++Dq+zQOV5hD3LCD4Kw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 12:21:49 -0000
X-Groupsio-MsgNum: 121898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WuT04sMzYDXq8et0"
Content-Disposition: inline

--WuT04sMzYDXq8et0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 10:17:21AM +0000, Burton, Ross wrote:
> On Sun, 3 Mar 2019 at 22:52, Tom Rini <trini@konsulko.com> wrote:
> > SSTATE_DIR =3D "${HOME}/work/OE/sstate-cache-${DISTRO_VERSION}${TARGET_=
VENDOR}"
>=20
> FWIW there isn't much point in isolating sstate like that.  You'll
> just rebuild stuff that would have been available.

Martin already chimed in, but this is my "copy this to every project"
site.conf file.  I do modify that base path a little bit for per
project,  But easily removable state is good and important, especially
when chasing "recipe for proprietary thing behaves badly" bugs.

--=20
Tom

--WuT04sMzYDXq8et0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfRhWAAoJEIf59jXTHXZSSVAP/jVIPR2NctdVAnEQ8lvAeEzR
RawOlYi/HWnFsRJGPPSBwy0zeBwv3YcaL2MFmtfxYgAnLW0x/z8EMoaD8XpTY6Gl
IKO9DPhIzCuab6tlg2+1aHSN9LGWjl0fUxNT3hintrz0fpYXmlH/w9YZ6w8jhVVR
BeyjtSkm5sbkb1B7pKWOIgjHpWWTfgTlDhpSpnA7AumWuo7K3RY6jsjsoZI+ZSVO
vrimJVMfshaF2V+1SS09GvGQw3p3uE0N1HsXNug5p1w9SxgrU+FTdG1CJ5aKfylR
d0lRI4+U6o3B+j6FGL4xjRWZxEQK+btTrp8ZyOtwzPiLQ8fDCOMwchdlVT0HWGkH
FKAMX+DXKbbx1FPWUCXN+V2LS5NQoKj+0NJlL6GghfoLG5SSbexK8gxpIGnhgRYI
YrhfNBg4U+x/R+qd9FzBz9trVTdIP42kWwd/AS3hXPjNuJvBcQoOoWSameY3GF03
tbaQf9YP3bE7Nnw6XRE6nPlnpUnTkrJBi5sBs/gzzx7hpdyL/As34BOyzwa2RwuD
N6NDswu2ml42XNy3rW66lQhv5A22+3QuDPG83so6kZ5lql9J4wKlFZqfx1awbyr0
1hOwI7hvNBU0fSeiACqNfIC2oYKamvGg+po9AltetaAK7DmLbZBKolLai8qxIWKp
+hNFk4M7SEI2+gUvhPbx
=KHNj
-----END PGP SIGNATURE-----

--WuT04sMzYDXq8et0--
