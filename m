Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3C48765C60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 22:06:37 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so51845598pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+zZXiCvOCvwXqBBDnx12y14HwxIghSVini1Gxp+1XDU=;
	b=wetAST11Jkx1jxvex2cW9fSWJ+eBvP6F0JCleOmLOYnpJerGg+eA7GbI5tP3Dtiwpi
	xM2I+wiXiNfLnVdPj3yaD3ppdSHYXEYtg+F0KWqt8CoI9xOBgXu/8w9rn92PBETLbMz1
	dfFgfjhWy876tKfc0TLWguzuCD4LltSc0bpupHZUuDAX0gugz6s5GfwDVrW5oDPqic89
	KjuqGYNKRTRNBETruTGVeOTiQ3hHqP+/odZ3v1r/rYs/Qa+qHMVeT1z/iJq+oAKeQuTq
	ZEUvoNQVhj7Rb8U+daXcl9sqPUTIbPGUwjM8O+N77HdXwrJXpwRFCROM8uELMpE2kwOh
	+Ozw==
X-Received: by 10.68.131.65 with SMTP id ok1mr71878747pbb.16.1435874798390;
	Thu, 02 Jul 2015 15:06:38 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:c41c:adff:6c16:9169?
	([2601:647:4c02:370d:c41c:adff:6c16:9169])
	by mx.google.com with ESMTPSA id fy5sm6736625pdb.93.2015.07.02.15.06.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 Jul 2015 15:06:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55941B9E.3080009@linux.intel.com>
Date: Thu, 2 Jul 2015 15:06:32 -0700
Message-Id: <4DCB7F37-2120-45FC-869B-09AAB14F7DCD@gmail.com>
References: <1435663180-43011-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<1693409.84CV3Pd8dR@peggleto-mobl.ger.corp.intel.com>
	<55941B9E.3080009@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Apple Mail (2.2102)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Check output folder is present before creating files-in-$pkg.txt
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
X-List-Received-Date: Thu, 02 Jul 2015 22:06:39 -0000
X-Groupsio-MsgNum: 67483
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F5F31578-EF32-4092-982F-8554681150E7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F5F31578-EF32-4092-982F-8554681150E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 1, 2015, at 9:55 AM, Leonardo Sandoval =
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>=20
>=20
> files-in-$pkg.txt files are created and placed on top of the =
corresponding buildhistory/packages folders. By the time this task is =
done, the latter folders are *already* created, so that is why in the =
first patch version, I did not include the check. BTW, I could not =
reproduce the issue that Andre had (failed on cairo) so I will ask him =
more detail on his setup.
>=20

disable GPL3, add

INCOMPATIBLE_LICENSE =3D "GPLv3.0 GPLv3 GPL-3.0 GPLv3+ LGPLv3.0 LGPLv3 =
LGPL-3.0 LGPLv3+=E2=80=9D
GCCVERSION =3D "5.1%=E2=80=9D
SDKGCCVERSION  =3D "5.1%=E2=80=9D

to local.conf

then try

bitbake gcc-runtime




--Apple-Mail=_F5F31578-EF32-4092-982F-8554681150E7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWVtewACgkQuwUzVZGdMxQimwCdHkr1+mK995t/VnsLEkWP8gxQ
ZoUAnRl74PLQbS07Y7LQsit/+QO1rhdj
=m60V
-----END PGP SIGNATURE-----

--Apple-Mail=_F5F31578-EF32-4092-982F-8554681150E7--
