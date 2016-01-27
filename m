Return-Path: <raj.khem@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7A662134;
	Wed, 27 Jan 2016 05:30:30 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id a85so228605306ykb.1;
	Tue, 26 Jan 2016 21:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=KlQfl/DX36c1UeHbI2fNAEZ32+2FeJj6mq389dqZ8gs=;
	b=UKlTe6A0yiBpK1VZalDnBY0MU+JK43tLctgsrvWjYfH1kHbF1XJJIPT+U7I7au4t7e
	PR+OAPMYuc3ToBX0sqxf90HhGD916mIJljCNyLq9nw8PEIv1sLvs+W5A+lY/8REN/H87
	F+DJqPahhg0uEWZuJtnfSLUAapw921J1bnWhEyqN2QabIwDLAmhiX7B8qx0FjYFoIxCq
	WcSlouPbWYVooHy8YWq7/uTfWmIC0lRDgf5mmP1ac3RqXqvDqh/TsxdorBuadxGCG8cW
	dylKvDHFCiquGbnCHy2hoUgxvP/aMY9n4XoMo3RQT1mIwicv7rOv9+ZdGuDcrL6OehyB
	MMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=KlQfl/DX36c1UeHbI2fNAEZ32+2FeJj6mq389dqZ8gs=;
	b=FQUqZuENKQQGcypPXFoyBtqnDmAZ/m/VbrqU/DUtf4MBP46nDdxV10j2QKP+ZCMD9+
	CptOVRX8U1q8p5/eTKgPPZf33MGeCg9fK0Pi/pfAYHreE3jflkpsgFHCRrjll6q+HMH3
	X8KE9lvh1ofqaOSKio6Y9OpqtHnbLUh22sBkx6O+VGwFkNvVQaAlCmm95h6lB9q4uPKS
	ubgazC/8RIbNYX7iMVCmOikqgTvrfs6vMfIQDKiwsuMxbhvyni/cX+RLa+c5YYFiIsZW
	x4vt3fmVzEagHuT4GOiDR+63VSAJb4w71W2INnc84l1mKwwn34X53nMdrsfx//zc83Bo
	Z2QA==
X-Gm-Message-State: AG10YORERaTR3hvfhYZzGjyRUu+rBWb/xnUv/CDTPXojVy37SCZXLmArZs1oSZwKr7S3LA==
X-Received: by 10.37.4.146 with SMTP id 140mr14268902ybe.18.1453872631074;
	Tue, 26 Jan 2016 21:30:31 -0800 (PST)
Received: from ?IPv6:2600:1002:b014:c92e:ed2f:4d62:56d8:d791?
	([2600:1002:b014:c92e:ed2f:4d62:56d8:d791])
	by smtp.gmail.com with ESMTPSA id
	m188sm3718858ywe.46.2016.01.26.21.30.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 21:30:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56A82765.30403@windriver.com>
Date: Wed, 27 Jan 2016 00:30:26 -0500
Message-Id: <C89DF346-CD9F-4CC5-A41A-8FCD4B87DD06@gmail.com>
References: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
	<56A82765.30403@windriver.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFT] Glibc 2.23 and binutils 2.26
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
X-List-Received-Date: Wed, 27 Jan 2016 05:30:35 -0000
X-Groupsio-MsgNum: 76946
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A3BFF862-90CE-4BB9-BF9E-65F482525B46";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A3BFF862-90CE-4BB9-BF9E-65F482525B46
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 26, 2016, at 9:11 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
> On 01/17/2016 07:54 PM, Khem Raj wrote:
>> Hi all
>>=20
>> upstream glibc and binutils release branches have been cut out and =
are being made ready for next release
>> I have put together update patchset for both of them
>>=20
>> here are the branches
>>=20
>> https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.26
>> https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23
>>=20
>> FYI These are still using autorev to ensure that we test tip of =
release branches
>>=20
>> Please give them a shot in your environments and report any issues =
you encounter.
>>=20
>> Thanks for help
>>=20
>> -Khem
>>=20
>>=20
>>=20
>>=20
>>=20
>=20
> 0001-Generate-relocatable-SDKs.patch is included in SRC_URI twice, =
which causes the following error when building binutils-crosssdk-XXX.
>=20
> ERROR: Command Error: exit status: 1  Output:
> Patch 0001-Generate-relocatable-SDKs.patch is already applied; check =
your series file
> ERROR: Function failed: patch_do_patch
>=20
> binutils-2.26.inc and binutils-crosssdk_2.26.bb both has this patch in =
its SRC_RUI.
>=20

Thanks for report. fixed and squashed into original commit in same =
branch as above.

> Regards,
> Chen Qi
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_A3BFF862-90CE-4BB9-BF9E-65F482525B46
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaoVfYACgkQuwUzVZGdMxTquACfXlFjaTreb/TCI2OIIE974AjE
khgAn1rgEUf/chKvp5ja0/BLV671sIyI
=+8j8
-----END PGP SIGNATURE-----

--Apple-Mail=_A3BFF862-90CE-4BB9-BF9E-65F482525B46--
