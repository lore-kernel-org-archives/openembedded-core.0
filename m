Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id A08E178443
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 20:52:02 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id z37so14572418ybh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ubF+SNlwUSr404B6EVOcu9GMBG8f5gKzbYj7gbBVzDY=;
	b=Redv3o4RjNUVffq+vabDRmDbcY6L2O/DKYxkTAKpy+LP6KamgHFLMHzYyhuIRtAkLN
	lzGIH2cCnp9s0yHl0p1XmRrEXOaNcmn+QHW5/yCDsI1/EIet42t930jaZRlEnuUW3Pdu
	YGswRl22uBPgA638yimoKaF93hb/B7pjfoedY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ubF+SNlwUSr404B6EVOcu9GMBG8f5gKzbYj7gbBVzDY=;
	b=A4EHlPTN6z47ulAeHSfwAMSbTkj0lrJ4+zv8KEcvNoK4avKOFR4VWLwVc5SlTQaLew
	7LFo+i+qzVEW4Fcd2NyFvbqoRCBgOVJRHGsquDi9JfGvkv4MNOh5gCURAnLLseCaOy3f
	SGWJb0n7RIHYw/NSGKLunmpgQuHwWSD80EJLGEGerDJGu7o7ht6qGENCE85p9GN7kiwC
	ZcZ9qKK9bwbZy1ptSjxOVUMehyDQ2apjt9kfTecqvtkEkoP7yj897t5lwG+9cp+uBP0r
	LExxcoFvG2PA0h4IS0Pjt5ynEKyZV6m+F6EOjJTQ/Lj0fu/HgbxYRqcF57Mr20pUCW9C
	qVUQ==
X-Gm-Message-State: AIVw113dUqp9qCvCZAMiXwVR+aQegaPgflc3s/DuKh6IU+ye9ISoKJdI
	OJ7z9OVqzOwLiara
X-Received: by 10.37.177.155 with SMTP id h27mr7441094ybj.322.1500670323607;
	Fri, 21 Jul 2017 13:52:03 -0700 (PDT)
Received: from bill-the-cat (cpe-174-106-0-58.ec.res.rr.com. [174.106.0.58])
	by smtp.gmail.com with ESMTPSA id
	y66sm1986358ywy.28.2017.07.21.13.52.02
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 13:52:02 -0700 (PDT)
Date: Fri, 21 Jul 2017 16:52:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170721205245.GO14320@bill-the-cat>
References: <1500590631-2028-1-git-send-email-trini@konsulko.com>
	<1500623241.15277.10.camel@intel.com>
	<20170721112103.GJ14320@bill-the-cat>
	<1500642093.15277.15.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1500642093.15277.15.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image-vm: Convert vmdk/vdi/qcow2/hdddirect images to IMAGE_CMD
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
X-List-Received-Date: Fri, 21 Jul 2017 20:52:02 -0000
X-Groupsio-MsgNum: 100585
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wclo/YjJlGo4VkIX"
Content-Disposition: inline

--wclo/YjJlGo4VkIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2017 at 03:01:33PM +0200, Patrick Ohly wrote:
> On Fri, 2017-07-21 at 07:21 -0400, Tom Rini wrote:
> > On Fri, Jul 21, 2017 at 09:47:21AM +0200, Patrick Ohly wrote:
> > > On Thu, 2017-07-20 at 18:43 -0400, Tom Rini wrote:
> > > > The support for writing vmdk/vdi/qcow2 images has not been converte=
d to make
> > > > use of the IMAGE_CMD infrastructure and instead relies on custom lo=
gic for
> > > > adding tasks in the right place.  Convert these images to making us=
e of
> > > > IMAGE_CMD.
> > >=20
> > > Thanks for working on this. I still have
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10204 open for
> > > enhancing vmdk/vdi/qcow2.
> > >=20
> > > However, your patch doesn't go as far as described in that bug, does =
it?
> > > Instead of allowing, for example, IMAGE_FSTYPES =3D "wic.vmdk", it me=
rely
> > > changes how IMAGE_FSTYPES =3D "vmdk" is implemented.
> > >=20
> > > The current patch has its merits as it simplifies the implementation,
> > > but I think it would be worthwhile to go all the way, even if it chan=
ges
> > > how images are going to be named.
> >=20
> > Ah, interesting.  I guess the first thing I would argue against is
> > saying that hdddirect should be masked.  There are reasons to want to
> > have a raw image created.
>=20
> I'm not sure I understand what you mean with "hdddirect should be
> masked" - it's been a while that I looked at the code.
>=20
> > I will take a look into using CONVERSIONCMD for vmdk/qcow2/vdi to allow
> > for wic.vmdk to work.  But we also must have vmdk.xz work (and fwiw with
> > my series you can get arbitrary compression that we support done, I did
> > vmdk.xz, qcow2.lzo and vdi.bz2 just for 'fun').
>=20
> The same is true with CONVERSIONCMD. They can be chained multiple times.
>=20
> > But I'm not 100% sure that I like changing the normal case from "vmdk"
> > to "wic.vmdk" or "hdddirect.vmdk" just to get a disk image to throw at
> > ${VM_TECHNOLOGY}.
>=20
> Yes, that's the biggest user-visible change. Basically the internal
> implementation (multiple conversions chained together) becomes visible
> in the end-result.
>=20
> That is a good and a bad thing. The good thing is that it is visible how
> the .vmdk image was created. The bad thing is that some users might not
> care and get confused.

So, Patrick, Ed and I talked on IRC a bit about this, and I think
without putting too many words in their mouths, I think it can be
summarized like this.

We all agree that vmdk/qcow2/vdi are a type of conversion.  It would be
quite handy to use these conversions on other things, such as wic.

And at least from my point of view, the contents of "hdddirect" doesn't
matter so much as the overall functionality.

So that here's where I'm at now.  I've found out when Patrick's chaining
compression code (so that you could do silly things like ext3.gz.bz2 or
_useful_ things like wic.vmdk.xz) was broken, and I see the best way to
fix that too.  So I'm going to v2 this series shortly which addresses
the problem of chaining compression types, and then brings the VM stuff
over to using that too.

--=20
Tom

--wclo/YjJlGo4VkIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZcmmcAAoJEIf59jXTHXZS+5QP/3Bv8bwXdl8cVn0iDe0gFL/S
BdQ3C6vG9jFq7jG0XleClOhPl1H+aiYPFLcqoJDXFiCbeS51iaiGQCPwARSvihlZ
04rfGqk6A6abJuRZLXV2VuXlr0cUuQg0ZjngaPbqBPUIIiMjWyMX0ktzsXrRAlcl
SoIF5ehzfMJhYVclVr6JZIZ7oMCHPHU6+h3R0vlM/mk/8uj44eVovHi+j1KJREwY
cjQe5vAEB6MGnUkxqe49TkL5ktOI6bsalfcpBD+l2CmwXnt8+G6gflFf97fxA+dA
I1yxHw47ESVqO4tbMWclwRqlMqSgI+k+5FDVcU1ueagAAvQUPRE0sJxv18uxkSRs
VZI4nCWcfWD58u+50p4KIODf4D056HysZxxQZjprYqonGxriOdeLKQQcHt7dJ+Yy
lWGzsTfgJQCnkz9BMivCiDMOsc59SL2Lc4gvzmQ5cQBYdGR3mYs81kp6ObLCm46I
gKD5F4l5+/AjcpTn3KHKWxFNrLYt7E9/2aFTBW6R/AEWWLed+cLeDCdgDzjWvv6T
Av44RbMIyjkbbGnybubc7mc2emWngCisXFygb7j3wVEfr9XoNhiq0kJ7x1e+1oxp
BMd6QPQvUw0s7qy/LcXmExmKJWsi3khvsnHxUghTT0qJztn4wxe9d+3n5yu6VpXg
r0Zie5rtUc5rUZHbwgd0
=5Z4F
-----END PGP SIGNATURE-----

--wclo/YjJlGo4VkIX--
