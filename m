Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB9B77AA9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:26:21 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id w22so318138ywa.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YtCixec70J7Ay6zVw7DE5hNPOf4NB32JiuZAapkx/uk=;
	b=jVj5wMPSNzfCz16m80pT3M6TF0w2f0QWFv/FIGX5BaUMOiDgeee8e+/V4/Ph7ea/Vr
	hK7yK2aJfmYCl1CgMKPmplCq8i3rlrSynbZorbX7ZfnloOBAzVZv+G9jKWo+3qA2AsDZ
	4uwoZvXqr1Fw9unW+/ySNQa2kdKcmi0KhvS74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YtCixec70J7Ay6zVw7DE5hNPOf4NB32JiuZAapkx/uk=;
	b=C+tbcTrmBrESvWElFJZ9Mktow+uoWFhNvWFsYU34/agPZknIKIvTxqILch6zZQFhoJ
	ClLNXuDkh+u1v7obEuuVrAguTW4pfCTOF+ns/QLpe7T4DeWr6vRWIEARy/69Eg8p6YVE
	cEuyYH4LFQCL7jDbi0uchWIX/HN4KSFW0t+Q3m+J5RB2bYa2l4vL2ShUf2XkUWAmL5sd
	HXX14ktJ+K6hLiYIv5eHM2GHir86VwoHe1NsmLqySf/Ao59Vcmk4YEP+xCb17+cTlEZl
	2N6lNu8qoFoldScvlD2kROJc3k2i3Sm2C21FtxVItZKlZsZx+10x4qp8K4BBQifGamZ7
	N6QQ==
X-Gm-Message-State: AHPjjUgJxfE2T1v4B2jO2qSLcVBUt2nlTWFqYA/hzO1DvzZjPJRRN1qV
	9vSduZJ8KJnSVmjCdp3fXQZqrQ==
X-Google-Smtp-Source: AOwi7QA0L14BsYL/vsT/FzT2e95HL1/t7PWxv2VIVvn68GpS6oAK63H1A6jJelIdyeVAstJ3geC21g==
X-Received: by 10.129.163.67 with SMTP id a64mr6556129ywh.236.1506709582657;
	Fri, 29 Sep 2017 11:26:22 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:59d1:1e23:9925:e8d6])
	by smtp.gmail.com with ESMTPSA id
	q36sm2054159ywa.82.2017.09.29.11.26.21
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 11:26:22 -0700 (PDT)
Date: Fri, 29 Sep 2017 14:26:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Riku Voipio <riku.voipio@linaro.org>
Message-ID: <20170929182625.GB3112@bill-the-cat>
References: <CAAqcGHk4xEzrbMxZtree8EGCAZ2mBX6X=h5w4aD2ZvQJ14=XJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAqcGHk4xEzrbMxZtree8EGCAZ2mBX6X=h5w4aD2ZvQJ14=XJw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "cross-distro@lists.linaro.org" <cross-distro@lists.linaro.org>,
	arm@gentoo.org, opensuse-arm@opensuse.org,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	debian-arm@lists.debian.org, arm@lists.fedoraproject.org,
	linux-arm@lists.infradead.org
Subject: Re: SFO17 Cross-Distro meeting notes
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
X-List-Received-Date: Fri, 29 Sep 2017 18:26:22 -0000
X-Groupsio-MsgNum: 103523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rkP7PWE2Nphkw5Dx"
Content-Disposition: inline

--rkP7PWE2Nphkw5Dx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 02:06:21AM +0300, Riku Voipio wrote:

[snip]
> On arm64, Kernel doesn't self-decompress. The bootloaders are stringly
> recommended to support decompressing kernel images. It's optional in
> grub, make sure your grub does. At least iPXE and u-boot don't support
> booting Image.gz on arm64, and should be fixed.

Not strictly true.  We do expect that if you're loading in a
compressed something that you uncompress it then boot it.  I assume part
of the reason that Linux didn't go for self-decompression this time is
the "my goodness, it's tricky to get here's where we are, here's what
else is in the system, lets not stomp anything and get ourself to where
we need to be" is in fact tricky.

That said, patches to check for ${VALID_COMPRESSION_HEADER}, uncompress
a chunk, confirm valid Image header, and uncompress to where it needs to
reside would be welcome.

Thanks!

--=20
Tom

--rkP7PWE2Nphkw5Dx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzpBRAAoJEIf59jXTHXZSeH0P/RXV7RI0bN2tLI2FwTnxse7b
LCDbXQg0iHsHTS4ykRWJRQ4jZQvCRleSgX4CcKEm3NjbAPG/4plNm4Oh+gjz91u1
EYaGg7gnBQbeeh2xwuv9Gr6NgEfRtsIA45I2MU4jAQCqrc9ZrhMrkn7k8EhHc/9L
e+engHSDTuFrkZ78pAoeoTNSlNSE61VLt/CPn/Uqj35O2af0lepkxNcHFE0oMjJ9
j3xgisCExWHVUgIQPBx0r39KfBfABDIUOonjp3shtt5S8HVs9/hJdTM5KXhJybQW
0scf/pFwomuKp6JA81hWGYMrqVo1Zp1LLlD0Tcq+KUQhtu5ieUK6yfuVMC79M/RA
HVhvIHyQCQ+oVe7lMAunCmhQWE6FxNS+urcCpXGTLq2+NVQwFrYTa7vlFGi5WMM5
Rt0tLBd2xD6PJ6IWTd8p3vY2tfvPCJNn9fHUCeJbgcWAkoJN7Q747BMflwmWpH+/
GqaHMr/Lklt0PDoAtGdGlj7fuSkdS8+PjhrFWWgZtzE81D6BxtxD1omK/9aeGSrh
RxkeBt1poq0F2wwLHw2adEJP+NN15hBBQz/VCGCEUCAfmRNIqmf5GW+9k8LVn6Xb
HgegFKGBeKBi4bBoppaRoeLvwt7EucA+ih9i4U5RpDrs5meskO0FmVihdOV/4pVi
4NIpmJk2lgnbxZmqzzUf
=TsKp
-----END PGP SIGNATURE-----

--rkP7PWE2Nphkw5Dx--
