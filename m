Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4133676FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:34:18 +0000 (UTC)
Received: by padfa1 with SMTP id fa1so2236082pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ndxcCzEed5Vsd/nzF+XraQldGjnocHDMUnvcyrvr6uM=;
	b=EukLR7XXt8aA3CXt2R/3YFG7Cg6SMyYCYxDfVQNhGepm9ELSzTmobi8B8zY6KwRxju
	jGmASVubeNkFu/aa1lmOBICgVn1RxoZbnEvQhYNV6MnwqxjUNzgSVW69ddh3HrwATmV9
	9yaDsyrRq4ptdJJVQ56ehjNlMa8nopNfcleMvOlJ6TbNBH+49FtHQcPTxQ3+milpu4Mg
	aOLcmnV1+jFQRHHfB74bD7/nATfkLbjVEEjgogCg98jEvy/I0S0BZyiouda5fIoRwKh8
	LznaOf5ck94BCVEUFudx9GW+fNsmdLsyCByEGhTRpjNBJqXljP5cdPFOr5NcnRZar9pt
	AhJQ==
X-Received: by 10.66.150.66 with SMTP id ug2mr202760pab.4.1441316058752;
	Thu, 03 Sep 2015 14:34:18 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:5d8c:8e6c:621a:cbb3?
	([2601:646:8601:4580:5d8c:8e6c:621a:cbb3])
	by smtp.gmail.com with ESMTPSA id j17sm79360pdl.59.2015.09.03.14.34.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Sep 2015 14:34:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <f87dd02d2553c3cc459aac628e0435b93e1d32bb.1441305437.git.patrick.ohly@intel.com>
Date: Thu, 3 Sep 2015 14:34:12 -0700
Message-Id: <78A0B9F1-2E28-492F-B07B-445089E6827E@gmail.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
	<cover.1441305437.git.patrick.ohly@intel.com>
	<f87dd02d2553c3cc459aac628e0435b93e1d32bb.1441305437.git.patrick.ohly@intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] initramfs-framework: create /dev/console
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
X-List-Received-Date: Thu, 03 Sep 2015 21:34:19 -0000
X-Groupsio-MsgNum: 70615
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9E96053F-B040-4CE4-8AAB-43A240ED51C9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9E96053F-B040-4CE4-8AAB-43A240ED51C9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 3, 2015, at 11:42 AM, Patrick Ohly <patrick.ohly@intel.com> =
wrote:
>=20
>     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
> +
> +    # Create device nodes expected by some kernels in initramfs
> +    # before even executing /init.
> +    install -d ${D}/dev
> +    mknod -m 622 ${D}/dev/console c 5 1
> }
>=20

may be just use USE_DEVFS =3D =E2=80=9C0=E2=80=9D instead if we are not =
letting devtmpfs into initrd image

--Apple-Mail=_9E96053F-B040-4CE4-8AAB-43A240ED51C9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXovNgACgkQuwUzVZGdMxSRkACgjbHRfLrm+my/vE9GA3NE4kk0
4toAn2eIqt4RnUXqyi5FcvTkw975fgm7
=asUB
-----END PGP SIGNATURE-----

--Apple-Mail=_9E96053F-B040-4CE4-8AAB-43A240ED51C9--
