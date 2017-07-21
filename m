Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBFA783E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 11:20:21 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id x125so23443860ywa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DmEF5yXukU4/fEAPJHQLMb9CruFkb9UiKPKdU+WPZaY=;
	b=P1ZEHXCcWjjLKKD0X8S06rbT7nxHS95/vzX3LxCc7p0pNrHrwEGbuN2NvIBAxe1nYf
	hi/vTEdW2oal/SZ3SRhDk91VSCpAIOhdX+tJLg+kUxv+rZQBZNTwWE6iRLIgCsMGkiw3
	PGjWGXiVW9O7oS1MKcHVGDcRipsBu9VCbFwyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DmEF5yXukU4/fEAPJHQLMb9CruFkb9UiKPKdU+WPZaY=;
	b=UdvLcA4qdQ81EIZOb60oqVjQKXm2RMEIGeB1A0kYP8tKr1nYPHsGsZhh4NUKSCzpdX
	bUINyzHBVT4kAv0k7KGCZ1h/28s5pptk/0efSRfR0PCIRHCqvFgTtIHRGHrXUUzvQQ6N
	klU1Uj9xGUJ3G/+Y/py7IornLqMVSr9aszu4tBt0zk9jdv4gmzOoafr+S9S1epcElUuD
	TfDRxQC4Ce9VgA6Nat/zjfRxSWUtqMw0PSQWU/EYvq4WpGnFvXCkwwObBcgCKhEzui0R
	ZQnm3oX7MxhdrwhTsJ3rJYkrO9y0Jb1BIyekbRydspTPyjpiMnngmNyoqCGY/2Ql9Mlu
	ScwQ==
X-Gm-Message-State: AIVw111rmGRujhhemf54JTLzzXhE/iagiuk08lwbBR/1wr3NKAGIlG8l
	2AYxQxYnUFQYHHCc
X-Received: by 10.13.241.1 with SMTP id a1mr5870563ywf.55.1500636022956;
	Fri, 21 Jul 2017 04:20:22 -0700 (PDT)
Received: from bill-the-cat (cpe-174-106-0-58.ec.res.rr.com. [174.106.0.58])
	by smtp.gmail.com with ESMTPSA id z3sm1579300ywf.69.2017.07.21.04.20.21
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 04:20:22 -0700 (PDT)
Date: Fri, 21 Jul 2017 07:21:03 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170721112103.GJ14320@bill-the-cat>
References: <1500590631-2028-1-git-send-email-trini@konsulko.com>
	<1500623241.15277.10.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1500623241.15277.10.camel@intel.com>
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
X-List-Received-Date: Fri, 21 Jul 2017 11:20:22 -0000
X-Groupsio-MsgNum: 100563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lAxbTa9qRtQJ0itf"
Content-Disposition: inline

--lAxbTa9qRtQJ0itf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2017 at 09:47:21AM +0200, Patrick Ohly wrote:
> On Thu, 2017-07-20 at 18:43 -0400, Tom Rini wrote:
> > The support for writing vmdk/vdi/qcow2 images has not been converted to=
 make
> > use of the IMAGE_CMD infrastructure and instead relies on custom logic =
for
> > adding tasks in the right place.  Convert these images to making use of
> > IMAGE_CMD.
>=20
> Thanks for working on this. I still have
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10204 open for
> enhancing vmdk/vdi/qcow2.
>=20
> However, your patch doesn't go as far as described in that bug, does it?
> Instead of allowing, for example, IMAGE_FSTYPES =3D "wic.vmdk", it merely
> changes how IMAGE_FSTYPES =3D "vmdk" is implemented.
>=20
> The current patch has its merits as it simplifies the implementation,
> but I think it would be worthwhile to go all the way, even if it changes
> how images are going to be named.

Ah, interesting.  I guess the first thing I would argue against is
saying that hdddirect should be masked.  There are reasons to want to
have a raw image created.

I will take a look into using CONVERSIONCMD for vmdk/qcow2/vdi to allow
for wic.vmdk to work.  But we also must have vmdk.xz work (and fwiw with
my series you can get arbitrary compression that we support done, I did
vmdk.xz, qcow2.lzo and vdi.bz2 just for 'fun').

But I'm not 100% sure that I like changing the normal case from "vmdk"
to "wic.vmdk" or "hdddirect.vmdk" just to get a disk image to throw at
${VM_TECHNOLOGY}.

--=20
Tom

--lAxbTa9qRtQJ0itf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZceOfAAoJEIf59jXTHXZSBOcP/Rd1rHEuucKw7KX634GLWulN
HYpbzwgTCDXIXd6vVLEruwdy/Eq7YQzn/YMhH3IXIfdUdHkeH/IVyPatFwGAkpyW
f2fKbr0SvFZVYoSQo9LOrtNjHiaPendHVOVG3VrleOrVRz/IKbD6qttb1tuMGFnu
C3pCCXsdB/gfFX5927inUertSAluxFUKZNArlU7gSCQIgSsUUewCfwQGpdUos08V
3GU75OPhNhYTMoH4D4CIAnOQADU5mJtnupbTPRmdoX8SFB9ksDIrZpMFgk5trfnJ
W9SgSP/8J/US6SWKJ5D/s/T6FotMOpNnEvZ+Y4joygr6Q5jQmPH12OaQiH+WNsWG
tnuRiIdMVsZssVlnxZXxnZflNovgQtCovftJCqb91Jqf6tpaeA2mVhIV3CUYrTct
v9c4n25teDZtuiZdUmn7SsPtHMtcxTF31LZ4XV7doI7BcBSHogYrT7iF6CioB34A
DVwnf4ChZnbjPsumjzhNs2v8OfDZpT9OOeZkro+UvCCi92jSHD0Tpaxft1WfEel2
vdzygy+Uy59X2VSbCZ3fPoJZ2fUtyANtf1lLVgDe8FdyIDg9gO9kFn9FJOdLORES
IZJjrHu4hxgxPUVBS6I9CkP1LqBI+ME0saenNoDSsJgCM7aewsNwWTtmIf82PvOH
t5YwXaho9SlMuaGSGUqc
=B1gz
-----END PGP SIGNATURE-----

--lAxbTa9qRtQJ0itf--
