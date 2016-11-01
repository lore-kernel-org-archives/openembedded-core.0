Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 50325601F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 16:45:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so6225988pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=6RDzX2HlWhdSlo/bCdzdMLa49Y8vbrzNtuN0FmOn+Ac=;
	b=xA2/53NSpksvZddjgaegcY58vciVW4yXahW4Za9ea6IEF1pGhkm7mpwIUxP5ev6jf8
	IsmpY5MhKgSTs4uj6OE0Ah8RzlBq0v+VhtvLDO1YFMCTeFThNDyd6uXNiEmtDDbYL2+Y
	25Akcb1z8JnyvCRiE6JDf8SgcDBqhcC3n9OOlABf8koIifBkylik1D6q3K2ppLEWji0g
	NRL+QAubD0aOAwqNa3BmLDVRaVVuWsX7JtHFGaVgdpMiusRreBsOjRfldqxaDoSyPQuR
	EKRHhHAK1DA7O8xRD5/LrWZVnnTWpyXIbFWL8SXBwQnAWaXs42CQpySIGzyCumTiD2jm
	gQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6RDzX2HlWhdSlo/bCdzdMLa49Y8vbrzNtuN0FmOn+Ac=;
	b=fCjFpZFa2g80nGyjiYdHLnUP09Fyoj625xcmMpBxD1GRyYMY9FJWslI57NG63DoCwI
	g36IwdFkS0xGnF+JnYHrrDz94iD1oAY4PB/+Jfs0vwne64uclmKqvv2CzKpJXDKFTryF
	fOrE4gpXqT20tdI9FAJBvuuG4U7bZr3xlCnalVrpHjNP7FfauBt4fYozpCjmWlzouqZb
	DJwTTktafuy23BL86ZJ8LMX/2kyq7b+vXQC11YAtcq4zqfKUk3WIMh/ifcsWC1ngJuIg
	eFJwsZWqVlnjPJtGSK2GD2lnTJpbyz4qcT+6ypKBOJAkn0tiA9laetr5Hvz5FwnkJxcw
	JXiw==
X-Gm-Message-State: ABUngvfIxkj9QomyjtTvVMTIbUQxCEgdw4N6+jKH0ijoCetTZIXSvHK8XOYUltBhhNtR7Q==
X-Received: by 10.98.198.85 with SMTP id m82mr1515902pfg.69.1478018755387;
	Tue, 01 Nov 2016 09:45:55 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:bd37:fcaa:669f:4910?
	([2601:646:8882:b8c:bd37:fcaa:669f:4910])
	by smtp.gmail.com with ESMTPSA id
	k67sm19993746pfj.47.2016.11.01.09.45.53
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 09:45:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cfa1b8cc-7134-fccf-2033-08f4e6c40104@linux.intel.com>
Date: Tue, 1 Nov 2016 09:45:48 -0700
Message-Id: <E9D64287-7893-4199-8439-F065E146E6AE@gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
	<1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
	<2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
	<6a58f235-b235-f25c-b068-fe0c84cf4915@linux.intel.com>
	<C35FC1E0-3663-4060-9E1C-A286B7A92512@gmail.com>
	<4187af59-ca62-773d-d814-44dd31cbde88@linux.intel.com>
	<5A2C0C3E-AA22-4E5B-91B8-3CA9A5282093@gmail.com>
	<cfa1b8cc-7134-fccf-2033-08f4e6c40104@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Fix SRC_URI checksums
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
X-List-Received-Date: Tue, 01 Nov 2016 16:45:57 -0000
X-Groupsio-MsgNum: 88872
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4D50A1DD-EA64-4CDA-817E-DA9A98AF5C1D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4D50A1DD-EA64-4CDA-817E-DA9A98AF5C1D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Nov 1, 2016, at 9:33 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 11/01/2016 06:06 PM, Khem Raj wrote:
>=20
>>>> we should specify boost/boost/1.62.0/boost_1_62_0.tar.bz2 instead =
of boost/boost/boost_1_62_0.tar.bz2
>>>=20
>>> Incorrect. That will still download a master snapshot tarball. Only =
if the 'project/' is prefixed, SF will give you the release tarball.
>>=20
>> if we need projects/ then it should be encoded into =
SOURCEFORGE_MIRROR variable in bitbake.conf. Since that required for
>> every sf.net project.
>=20
> Would you then also fix the remaining recipe-specific part of the URI =
in all those recipes? I don't have the bandwidth for that right now, and =
it's a problem that is unlikely to happen in other recipes.
>=20

I wonder if same problem would not happen for other sf.net packages.
probably we never run into it probably because it gets backed up on yp =
download mirror
and then used. I am not expecting you to fix it, don't worry.

--Apple-Mail=_4D50A1DD-EA64-4CDA-817E-DA9A98AF5C1D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgYxsEACgkQuwUzVZGdMxSnugCeMs0/Cu/Jng0namoDT3P7lXeq
CvoAmQFG971V3w2QTEeNYdpFNGjz2SBt
=T0f1
-----END PGP SIGNATURE-----

--Apple-Mail=_4D50A1DD-EA64-4CDA-817E-DA9A98AF5C1D--
