Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 069C378207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 16:18:50 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id i6so75449487ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WSdgxrlugxgnF7WJhDpNLxanbnyQzQ+ZWj93zwLlmG0=;
	b=TT0uqPUWhjp6jSf7uZZtc5yoCKDlnblY7TQcsYLj8dNfkjJENyqzmyhTcPZGuL35jH
	uOCMovbb8Gdu9va5jez99WvKabGBa6E5aT0M3JL1+6WlsE3JzaThBeWnpaNVLcXOZY1Y
	ReDrjCTF8OmcpGbeyJv+YSU7kck+RKY4MPmHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WSdgxrlugxgnF7WJhDpNLxanbnyQzQ+ZWj93zwLlmG0=;
	b=my9xBIVBuMUH2iauBm6/1r96o2VZ3Jzwx4U3TaHfK5Lz0iGz09qQhjoxe9/u6jUFHB
	QwE5oVG6vInx1Umj2t9APAOHnAUog3S6Wd9foDiFhwM6ppOuw7ZxXuHoY8b6MPbwpVr6
	jyqPqNrt6HwhJx3gK+ZtmCqSdsy9arxnPVHzJYEYaKghphLdq4+/0VDbP0ey8yL3tPl0
	jUFBxoMuKlv4DrsUYhznbb8HvtqCDw76J6l/v+Yg+6wfql06heqllidA+MmYbgQC3LqN
	thOx9Q65xTvhaTqOU6R+F0kxQd/nSFInT2Fo+v03b6jP/OC4di/6ZfLN7sFnt+GWI+l0
	fUdw==
X-Gm-Message-State: AIVw110fCI+eBNaZvUIvwyxr4aWsFNkQCP+Fkco/BbdbLM/D3mihNpiJ
	tiahiibfq8xTxNac
X-Received: by 10.129.145.5 with SMTP id i5mr3856477ywg.451.1501172331699;
	Thu, 27 Jul 2017 09:18:51 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:81d6:3916:37bc:8569])
	by smtp.gmail.com with ESMTPSA id
	k124sm7042427ywf.49.2017.07.27.09.18.50
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 27 Jul 2017 09:18:50 -0700 (PDT)
Date: Thu, 27 Jul 2017 12:20:10 -0400
From: Tom Rini <trini@konsulko.com>
To: "Wold, Saul" <saul.wold@intel.com>
Message-ID: <20170727162010.GB26163@bill-the-cat>
References: <1501012696-2666-1-git-send-email-trini@konsulko.com>
	<1501171718.27323.389.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1501171718.27323.389.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types
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
X-List-Received-Date: Thu, 27 Jul 2017 16:18:51 -0000
X-Groupsio-MsgNum: 100772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2Z1lsQWmAqukVl5"
Content-Disposition: inline

--f2Z1lsQWmAqukVl5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 04:08:40PM +0000, Wold, Saul wrote:
> On Tue, 2017-07-25 at 15:58 -0400, Tom Rini wrote:
> > The vmdk/vdi/qcow2 IMAGE_FSTYPEs predate wic.=A0=A0As such, they provide
> > some similar underlying functionality in order to produce a "disk"
> > image
> > that in turn can be converted into different formats that various
> > hypervisor types work with.=A0=A0They do not however provide the ability
> > for
> > other disk image types to be converted into these same output types.
> > Furthermore, they are less flexible than what wic does provide.=A0=A0Th=
is
> > drops the old style vmdk/vdi/qcow2 types and re-introduces them under
> > the CONVERSION_CMD framework.=A0=A0The equivalent of vmdk is now wic.vm=
dk
> > and so forth for the other types.
> >=20
> I like this also! =A0Strong work!
>=20
> Would this allow us to further collapse the live-vm-common.bbclass back
> to just image-live.bbclass. =A0I know that the magic mapping that happens
> in set_live_vm_vars() has caused confusion in the past and removing
> that mapping would be pretty awesome.

Yes, with this there is only one user of live-vm-common.bbclass, so it
could be folded back.

--=20
Tom

--f2Z1lsQWmAqukVl5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZehK6AAoJEIf59jXTHXZSoDsP/27mnjeiS3u4+BwBSIcnP4L7
LMfLKxfJ+flQb9EJFELZW4g/0Ft479faPkX3P55D8Q27b7h2nsPjHqCnDOIZDGvy
gsvW6f5TWXwmiyc9Rhloo9dqdRJMwj3vOHmhjRXKGqbkoXCbyBXbF5cQnqapIFsA
U3UQIgFXVV7lrSKRX2MCJ+FzpjxFP5ZlmMz9W+Ua9QkCCwn1pT7zAD5AqvRK1ed9
6t8MaQOIlisutlAuh1hI835aOC51nx7m1QkLsghPSRwLJdA1EFH3xF8ZL4AknQkc
D4K01B0yv97wVAQumvoQDjdWQrVbaVnzHdkAgOZ/LO44dZPNfs6Iq0ZyahLf6l5X
pakk4q5GW28aC0RdmFqMczrBhQvbbwGeObxXW02ZSDVtfA2Z6f9WYGFOUrdP/jN0
Ipw9hBP8mFq6yBtjvHmBc03k3OgaA8zZlWG1IG38NOGDWOwgPlsqkL0c5z2L6fpf
Yu/QpcjOSsJ+ITQLxrv/uWH0eXtPXRXAvNTFba1kuR33/Z/EJYqUCInchXscg1qW
+YY4tA0BrIWj16uR6IJg4tdKyi7mUPbaNqv8KxEszjsuzCmLwj+ecWHeDHnbvUW2
DAqb1DH5hs9IrQkT0nabkU+jEQX4A12QLlKe9lCshMUT7VO/7sCTHJoRUZGhca3j
mrSlz1s8VUVCXr68l6jw
=O+7I
-----END PGP SIGNATURE-----

--f2Z1lsQWmAqukVl5--
