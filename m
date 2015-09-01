Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id AA72676B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:10:53 +0000 (UTC)
Received: by pacwi10 with SMTP id wi10so1730879pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AodbfZ7IFFDMraMmKgafvYh8YVGQrmKJvrzdYGh5H4M=;
	b=FV4G7H6JHeXrNcblnZpkSOC8klECjUOTit9OOCRrRe4xuOzNWJymd/BEAKnwVNkRWp
	0by29Nlhn2HT1yfnk1w47yVq36aOWP0Fw7hijI1VeNdDeKDjpalZCLhNyXMx84BPEwZv
	6ia5DPZsRQh/0sYKCXCcChnPgbMg2Bc827k4By2WCiYUCyIjKipizD4Azzg7bGGlwpZh
	4w/Y+R5GgJrOL9FoWeKw7NIlhlqy/NwAezR3mV0X0/qz4r0njERhqhVbYJeThKRpiuCE
	324EQ158FLR7BbMkFDRaRHMkHbi1gcpcvkvt4Ukgg1+fZzL2EXAhjLAyslkEK4NhyHk0
	Lz9Q==
X-Received: by 10.68.206.74 with SMTP id lm10mr47991999pbc.117.1441127453240; 
	Tue, 01 Sep 2015 10:10:53 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f406:2324:ffaf:a6f9?
	([2601:646:8601:4580:f406:2324:ffaf:a6f9])
	by smtp.gmail.com with ESMTPSA id
	uz5sm18870155pac.1.2015.09.01.10.10.52
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 10:10:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55E5BC60.4010302@windriver.com>
Date: Tue, 1 Sep 2015 10:10:42 -0700
Message-Id: <C9CB6C09-04C9-4546-A7B6-96D9C8423223@gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
	<20150831152103.GB2465@jama>
	<BC8B1BD5-224C-480C-BFC9-F2BA6B0254E9@gmail.com>
	<55E5BC60.4010302@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Tue, 01 Sep 2015 17:10:53 -0000
X-Groupsio-MsgNum: 70419
Content-Type: multipart/signed;
	boundary="Apple-Mail=_568138F4-DAD0-460D-9EF7-BD219FB4FC4C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_568138F4-DAD0-460D-9EF7-BD219FB4FC4C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Sep 1, 2015, at 7:55 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
>=20
> Do you have any sense of the problems when gcc uses an older version =
of GMP?  If
> a newer version is required for gcc -- then can gcc itself check that =
it's a
> proper minimum version available?  (At this point I would assume if =
someone is
> worried about GPLv3 issues, that they would NOT be putting the =
compiler and
> related tools on the target.)  I know we can specify -runtime- minimum =
versions
> easily enough using the > directive.. but I don't think there is an =
easy way to
> specify minimum build version, other then verify we have the correct =
version
> available to us though a file check of some kind.

gcc needs gmp >=3D 4.3.2 now a days but it infact does check for version =
presented to it from build system
thats where the problem lies but as I said it might not be a usual case.

--Apple-Mail=_568138F4-DAD0-460D-9EF7-BD219FB4FC4C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXl3BsACgkQuwUzVZGdMxSVBgCfd0cvAOzyPTYPgkUc/M9T5awh
44sAnAmBRlCZQofdcBqHhfVn3G3Xg/mH
=fksG
-----END PGP SIGNATURE-----

--Apple-Mail=_568138F4-DAD0-460D-9EF7-BD219FB4FC4C--
