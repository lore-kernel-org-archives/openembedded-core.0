Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id C3B177318F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 15:46:50 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id bt5so75094924pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=dOnFuU+A0XVhhelRIUuhV3UlVJ7ZZbMWLPAzI+2dvX8=;
	b=dOB19PyGvi0HQLxIuW/T8IHDbd2nqJaEG2HiNo8jCVqJODuK/bkI8pV0wpRw7fzbew
	IlzM2b+gpuaaI/w0pQf0uHL8Dt5nta8xqFxfpK4nJ9pVQS/2lH/Z9QTZQvcZRTIWn3oD
	M0cOftVdOzuRUO4K+us1X9AyN+7kEzdaLTHAuZrHeLan+EjMOhGQNHJuaZwOaTHnJbxQ
	NHnkcbbhttJTZrDsOkUey+1OvCdAWlAYcq754LEm67zZp9xwTqtWl70ajwCtkRG7uP8r
	hjqfjtBKqboSAZsZ1g8SbE8nHmG/bGVUMf2ruz4kFm90+QVsOR/Krc4dujOoK2frmTw5
	4+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=dOnFuU+A0XVhhelRIUuhV3UlVJ7ZZbMWLPAzI+2dvX8=;
	b=nK59qR4+NwYIYusYt2Z3fV4y+lJjOi3EBKtELWuy2//17BunqFBas7Unr9YEp50s+j
	tdgg8Hg+mwviCb49FO9gD6ZAXy71N+lU7o8S/mKyUiSWa6OMKKHGXnaAPwvTp5Gtb9Vd
	pIwSD+e40AC4Qn0JPAuKZK7xu18gIqWZ7XSoq0wo9inmF9jf576V22Z2oyAdzdV0LLMs
	5OQURAUXm/PdbLlAVApIqAUNnv2RPSgn+52Hq9yy/F6sbKlsWN3FF0fcNVRnfS2q4/iP
	u2UFnG4nNKFqx3xibdpwot5MSS70w/fLzNdHlriQyFVBmSJsOZLRkRj906EhJhPqJio4
	aBVw==
X-Gm-Message-State: AOPr4FXsDMZ+QHnxZTQHFzNjt96BvFE2W8hBWfNZRmyCapBF+SDB0/l84tgOm8KhD0nSog==
X-Received: by 10.66.241.73 with SMTP id wg9mr24039515pac.91.1462204011129;
	Mon, 02 May 2016 08:46:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:ecc3:a3e8:c0db:d2ff?
	([2601:646:8800:5a9a:ecc3:a3e8:c0db:d2ff])
	by smtp.gmail.com with ESMTPSA id
	s124sm28636244pfb.63.2016.05.02.08.46.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 08:46:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5727269A.30405@linux.intel.com>
Date: Mon, 2 May 2016 08:46:49 -0700
Message-Id: <95CD514D-A18A-4D04-9A00-AD1034D843EA@gmail.com>
References: <1461761088-15117-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAMKF1spLRX=XrS+Kf8GeC=XufwtTPxQJ-oeEQHH1ay2sOZb4Wg@mail.gmail.com>
	<5727269A.30405@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-powerpc64.inc: disable the use of qemu usermode on ppc64
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
X-List-Received-Date: Mon, 02 May 2016 15:46:52 -0000
X-Groupsio-MsgNum: 81452
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1ACAF1D9-70CE-4181-980A-321F80B8527F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1ACAF1D9-70CE-4181-980A-321F80B8527F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 2, 2016, at 3:06 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 04/29/2016 11:34 PM, Khem Raj wrote:
>> should we replace qemu-ppc with qemu-ppc64 instead of disabling it
>=20
> qemu-ppc64 is already used on 64 bit powerpc, the problem is that it =
always crashes.

Do we need to adjust the emulated machine parameter ?

--Apple-Mail=_1ACAF1D9-70CE-4181-980A-321F80B8527F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcndmkACgkQuwUzVZGdMxRpSACghIOFtyegCd+gXJ3CrInbADRr
pXEAnAlMtkqWmFNDgWgs5Qes9jX3DF1X
=BA3d
-----END PGP SIGNATURE-----

--Apple-Mail=_1ACAF1D9-70CE-4181-980A-321F80B8527F--
