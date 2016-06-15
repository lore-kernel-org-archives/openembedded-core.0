Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0B1073196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 19:21:10 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hf6so2059546pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Bc4XA7gSl3nF/ung6wEqnMyEGDk2KSF9rW0OuBw0/ak=;
	b=hc0GlObknz4dLjfxQVR1cJ9hL+PLCpDUVy9waIxELKKE9/g+LfngIs41qm6BHvxrj9
	VDh+xOMnGelwBOlyR9cGYJ+XEmEyHaDicm52S4ofsqMnh8eFCSGvphfYsb8Dv7Uz4Re/
	NpsvEYdG9+xnp51JUyoxzjzJaJYwFNIRqrSOBQjR61H7HIlh7z04BN1/TTgFs8Klmk9O
	qbczu//52xNj2yztLY6OsNuY4MBqIVQEJSJipP+3jPiqJX7fGJEE/GeKJ6O/6gBEIaZk
	viKHFXiuLc0lCApMuwwfM+SjEERoKbximOCECzT1JrXiMmRmOt83ouRUPnUsR8gqMlN4
	ct7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Bc4XA7gSl3nF/ung6wEqnMyEGDk2KSF9rW0OuBw0/ak=;
	b=JJdZaddBe9lzYw15fjwpMBwnIIniiVqSeBnKlFRRTPs8YE4z6zL3DSSX2AsKnoFyBr
	pd0OZ78YGWXoOlV+uVrwUx1tvVh3TE/5i4dVRI4wN8wbnn1ieLGJVYk9L3oUto64Ybx5
	q07xSq6eDj5JrwnS4fLsutg+7XH2vioRWngevwMkkoMP7FyImk9inVbz7wtzoXtBfKhQ
	h41ZqvQmgV/jbeJqQ4ICTtoPrt/1TujmeDGyBPkAzc1PvM9dI2Wa758QAdfYdfk1CjK/
	umEKiJde1z73aBn7RV3GvDidN6ub5e18iiD2yF6oX7kEwqLDCbBH89DkQU1ym4RHu5GI
	kRdw==
X-Gm-Message-State: ALyK8tKkqTRR7VaDUXrOWnrUA0lKVY6zn/YmS2x9qZIhx4oXL6BexaLFYo5UdLJ/JenrvQ==
X-Received: by 10.67.23.48 with SMTP id hx16mr344757pad.7.1466018470907;
	Wed, 15 Jun 2016 12:21:10 -0700 (PDT)
Received: from [10.0.0.112] ([76.126.209.57]) by smtp.gmail.com with ESMTPSA id
	w2sm54870228pfb.46.2016.06.15.12.21.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2016 12:21:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160615121104.GC16659@ad.chargestorm.se>
Date: Wed, 15 Jun 2016 12:21:09 -0700
Message-Id: <E52D3056-AB02-49E8-B23F-E99375143C3D@gmail.com>
References: <1465941589-20879-1-git-send-email-sgw@linux.intel.com>
	<20160615121104.GC16659@ad.chargestorm.se>
To: Anders Darander <anders@chargestorm.se>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: add iwlwifi-8000C-19 version
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
X-List-Received-Date: Wed, 15 Jun 2016 19:21:10 -0000
X-Groupsio-MsgNum: 83478
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2AD6ED39-F0FC-43F7-92BF-660332FF1574";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2AD6ED39-F0FC-43F7-92BF-660332FF1574
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 15, 2016, at 5:11 AM, Anders Darander <anders@chargestorm.se> =
wrote:
>=20
> * Saul Wold <sgw@linux.intel.com> [160615 00:00]:
>=20
>> This version is required for certain iwlwifi hardware
>> can not use the most recent firmware blob
>=20
>> [YOCTO #9771]
>=20
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> When this is merged, I will remove this blob from meta-intel, as they =
will conflict
>=20
>=20
>> .../linux-firmware/iwlwifi-8000C-19.ucode             | Bin 0 -> =
2382972 bytes
>> .../linux-firmware/linux-firmware_git.bb              |  10 =
++++++++++
>> 2 files changed, 10 insertions(+)
>> create mode 100644 =
meta/recipes-kernel/linux-firmware/linux-firmware/iwlwifi-8000C-19.ucode
>=20
> Would it be possible to get this file from a server somewhere?
>=20
> Adding a 2MB file, which most people won't need, doesn't feel right to
> me.

may be host the .bin file on yp.org and fetch it ?
>=20
> Cheers,
> Anders
>=20
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2AD6ED39-F0FC-43F7-92BF-660332FF1574
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldhqqUACgkQuwUzVZGdMxRZEgCePnEHYqSz/xd94iQw78j7Je8A
Yt0An3Wwk1RhoW29a2+TlpBXAwLqetJd
=o2nw
-----END PGP SIGNATURE-----

--Apple-Mail=_2AD6ED39-F0FC-43F7-92BF-660332FF1574--
