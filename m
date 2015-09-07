Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 050E760043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 21:00:22 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so102281058pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 14:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lIIq3Adc5la95HKMhI/b2Lmaa5INx1agVUNARBPWeIA=;
	b=nMHOMyMGXhvqfsFHJGLFSh0tfdDXbGlStID2o/NK0dSAQ0gqZ+lDpGnhxDmzdJfHyH
	UzmEXD1lkYDpggYsc+DGollygCIsp14naj3loBYGCVtEkU1GQ1rzJuuZeCNi31IRXvZA
	pvIclZEUNQd6EBK9ZZf4Byn7QcNTKL55Dg6Rc/fDkO2j1ubMUzWZfToylc/BwrHgImlC
	Tn7otUq5IHxHNIMgTXANeUIGztB4ibC2U7BO0Vj8nqEAEWZhsXJMDlZeIFq9+oqtX3NH
	xKjCPTLixt6dKdGbVD4hZruYeCTKsiYlZsNpbS1dwfHt07qie6LoD/PXViSn1JUdRHqc
	13Mg==
X-Received: by 10.67.3.3 with SMTP id bs3mr17380762pad.121.1441659622371;
	Mon, 07 Sep 2015 14:00:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:5:1a19:78e8:b08e?
	([2601:646:8601:4580:5:1a19:78e8:b08e])
	by smtp.gmail.com with ESMTPSA id kk1sm777826pdb.80.2015.09.07.14.00.21
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Sep 2015 14:00:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441659401.24871.261.camel@linuxfoundation.org>
Date: Mon, 7 Sep 2015 14:00:14 -0700
Message-Id: <956735BC-7AA6-4513-AA09-3FBFD3250428@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
	<4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
	<1441659401.24871.261.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Mon, 07 Sep 2015 21:00:23 -0000
X-Groupsio-MsgNum: 70768
Content-Type: multipart/signed;
	boundary="Apple-Mail=_84A45B26-A2CC-48B9-AD31-8CD4EF7E0534";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_84A45B26-A2CC-48B9-AD31-8CD4EF7E0534
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 7, 2015, at 1:56 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> A "bitbake core-image-sato -c testimage" replicated it here FWIW, have
> you tried testimage to see if that somehow makes a difference? =
Shoudn't
> be hard to test with that and for sato, it should run pretty quickly.
>=20
> It all works with 219, its only the upgrade patches that seem to break
> things :(

yeah my machine is w/o X and moreover I don=E2=80=99t have sudo on it =
test image seems to need X
I will try to build core-image-sato and try to reproduce it locally. in =
order to analyze
systemd defect it needs to be reproducible outside testimage infra =
anyway.

--Apple-Mail=_84A45B26-A2CC-48B9-AD31-8CD4EF7E0534
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXt+uQACgkQuwUzVZGdMxR75wCfRXRcSaqxnbM2HRXM76ZCZsWI
ZdcAn1hRIsesWtt8DnDb9Kug8hlP0ISs
=ySL/
-----END PGP SIGNATURE-----

--Apple-Mail=_84A45B26-A2CC-48B9-AD31-8CD4EF7E0534--
