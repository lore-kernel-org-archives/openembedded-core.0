Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 24E847C760
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 12:42:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z84so4547179wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 04:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version;
	bh=f+/5/2ganLJ42N80mAhVpKL7IHnvRJhX+9qo1St03Ek=;
	b=BGEu8EEPjYGdWw6M/3cAViQvW6yij89F97NMfZMn48Gm9zxMr2xY3EIaD7bsdEkZOf
	mn0523izaJ6wnLDTfXZLefsQekLJtWbMcboBjEc0fzhcdFU34N8zNXpQsHGeNY0dfljm
	0nhpGmAFVErRVIr513yFQDs+CdAHSd4Z9dcl3H/zVT6ThKNZ3xhxwA3n7Sr4yk9s5XZA
	mAn90Af6HWZ/uMtKyOs9fJjOX40j4x8D8C/5/5dLMmxzq/+z9VMlnPmrbjUrX8Z6ZRzY
	YaAYdqqVai21e9NnFhFeJFJAoqVbuxU1xANc1v1kvvp+HTyZWJa8Ev3eNg9qc6z8t4Zg
	IsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version;
	bh=f+/5/2ganLJ42N80mAhVpKL7IHnvRJhX+9qo1St03Ek=;
	b=jUOQPXOUpGMDJXUTpA+tS6Ne50BzS20rnkubWyEbOMoMyhL/dWQsD4cgEfAZMC6MBl
	xf3XwYeuLj/VL6GD9fgLOjq4u9WB8whqEOaKTq+rDUlj9Mng3qGMcvFlVfqj49tr4OdY
	UEk/vSRlu4elSBX7kDEpjLiMRNtrvldtpWvHIds3zmO6OS2qcPjwQ5N0hM8FwNd0o/qc
	tpUvGv21LD5TSX6PbNMKB41Hw4BPt5K/PweTdJ/zLxLuZRGS7DnKSOxhpram/N+FPbsU
	3yOC/SMSqHGsmNnRubNl3pLxV6J9fdcRMm0VH+6i/96jbdD54bZNK1+yvtGGQUD3AAD9
	i4Mw==
X-Gm-Message-State: APjAAAWs/e+XrrxMVRs206+sVkZ6LAw6lUI6UUL6+4QqTg+lGpnnJx+p
	shjrJbUcuXxT/Btb1XTICnw=
X-Google-Smtp-Source: APXvYqxvfQBWb4VbCn7D8pD+25xWnAA/HZvjdWLHgTwOUH88gt+rDk2NWJ4VmpHi9jrEFiALI8uL9w==
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr10606187wmh.141.1551703348739; 
	Mon, 04 Mar 2019 04:42:28 -0800 (PST)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	v10sm11227125wrn.26.2019.03.04.04.42.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 04 Mar 2019 04:42:27 -0800 (PST)
Message-ID: <05308ef55e13c6133346a06f7e96af1e9ca3daca.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 04 Mar 2019 12:42:26 +0000
In-Reply-To: <CAJTo0LbmxKG-CbZb+EwbnthF3Z-uLj99pPCumPwiVpatjrjaAw@mail.gmail.com>
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
	<20190304111117.16769-1-luca.boccassi@gmail.com>
	<CAJTo0LbmxKG-CbZb+EwbnthF3Z-uLj99pPCumPwiVpatjrjaAw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] swig: fix build with musl
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
X-List-Received-Date: Mon, 04 Mar 2019 12:42:28 -0000
X-Groupsio-MsgNum: 121900
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-w7ZS3Mgw1s9tvTxwR56T"

--=-w7ZS3Mgw1s9tvTxwR56T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-04 at 11:18 +0000, Burton, Ross wrote:
> On Mon, 4 Mar 2019 at 11:12, <luca.boccassi@gmail.com> wrote:
> > +    mkdir -p ${WORKDIR}/build/Source/CParse
>=20
> Use ${B} instead of ${WORKDIR}/build.
>=20
> Ross

Thanks, please see v4

--=20
Kind regards,
Luca Boccassi

--=-w7ZS3Mgw1s9tvTxwR56T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAlx9HTIACgkQSylmgFB4
UWIxGAf/bVMrqC04DHSmZMCI5cIWKJD5FFvtCD9dcikPLBLSDBRVAK5lzxUCkLnU
Jwr7LhCxgQ/ZWxNCnoehLeQnmX0AxeFRRZsxBSgoVCWX9PaFCmLc8+Oj40iP5FO+
f1KlrvISKXqz6Jbs3iFPOsJCmRrcQ42zVFVHjFVA7DW1wKVqjk2vObluUdpBMDKa
oh3UlZSpG/2Bp2kMVR/SaMbbtpXIGDRmV1B7SsNOwjZ8NsLFNmDeWYOrqSKWNQxK
ci8ftV3zax9bIe3p0Tc0IOi8vj4/5eaoAdVd8lNeAfsAsU0sn1rl7r/r48Tr0DAO
sUCNd7/2xn4ovSNZll3vGIq7tjtlYg==
=lKCb
-----END PGP SIGNATURE-----

--=-w7ZS3Mgw1s9tvTxwR56T--
