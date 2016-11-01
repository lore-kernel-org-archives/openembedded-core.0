Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C802B719C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 16:06:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so6150317pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=g7mW/6f9S7xKUYc7ToICw9ivJ8wgkRs5rFnvMkxKsSs=;
	b=EvQDL76ZNvJYPlG+t8nvwQZvg/vFFFiGPZ5+3emJ3iZUPW2CcxVBzTXzdi+J5KQRSF
	a7oubJNx1KrMVKxrKeDqG32SZUgLpRZaadEhG3h4uG6l1OQPJHwP52B3Wv26sBaW6qXc
	gwfqnpATsXIMRNz6Co6A/ddZWwl/xxtvjFdi0a9W/1zLnyeJgNeeUJJJkZje/Gp8e6e1
	Tn8GmbLgitbdkg5zAiEQ1t/JlpuYQI1EEsXkIgAsyYhTI68jW8FnuiR2g9EtC9s+CuZW
	QZ6HeVNNU2DxaJjquIv0roQH3DbVTfNtUEYfVSggpDlhQMNDuLlpxsVq35ef/fYcxDb0
	NNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=g7mW/6f9S7xKUYc7ToICw9ivJ8wgkRs5rFnvMkxKsSs=;
	b=U2kd5seiMELtkM2T9L5yT69bykzFOlYAAO8gQUnmawaWqd+eHNl76dumFF3hv9Vry4
	SnmN2eRC9KUX5UUlxDQtJem9Eu0TxtQkdY35456vuVZQdKwSm6orIZjo6QlzfrQPTK+8
	/QEiHsgbPiQPv7gExpn2J9uNByzUrNNUYrsH5ZYay7TaF14EfM6asro/m7CB9a3b8G96
	6yPLIdM1vEPrnwvHI1Wb8FJVbx9bdDT4fMwu2Hb16zN8rwjRz5qnwpFlZTV2BSjF/1ck
	oPJJqxqHnW7iDUVIN7OamGQ+8fcmxuShoVMhJnGNUE+lrxa1NmJUiwXFESC4AdLwQ8Xr
	95Xw==
X-Gm-Message-State: ABUngvdiXNMc+8S2K74cbyAB54dEOycBTWYcaJeYCmfcTD6trIZJIezDYFWyBUSaVy6wSw==
X-Received: by 10.98.93.83 with SMTP id r80mr60414225pfb.17.1478016389896;
	Tue, 01 Nov 2016 09:06:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:bd37:fcaa:669f:4910?
	([2601:646:8882:b8c:bd37:fcaa:669f:4910])
	by smtp.gmail.com with ESMTPSA id
	t67sm10286633pfg.46.2016.11.01.09.06.28
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 09:06:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <4187af59-ca62-773d-d814-44dd31cbde88@linux.intel.com>
Date: Tue, 1 Nov 2016 09:06:24 -0700
Message-Id: <5A2C0C3E-AA22-4E5B-91B8-3CA9A5282093@gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
	<1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
	<2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
	<6a58f235-b235-f25c-b068-fe0c84cf4915@linux.intel.com>
	<C35FC1E0-3663-4060-9E1C-A286B7A92512@gmail.com>
	<4187af59-ca62-773d-d814-44dd31cbde88@linux.intel.com>
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
X-List-Received-Date: Tue, 01 Nov 2016 16:06:28 -0000
X-Groupsio-MsgNum: 88870
Content-Type: multipart/signed;
	boundary="Apple-Mail=_41113829-5E0F-470C-9E99-01C820C7019F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_41113829-5E0F-470C-9E99-01C820C7019F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Nov 1, 2016, at 5:40 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 10/31/2016 06:22 PM, Khem Raj wrote:
>=20
>>> Sourceforge is doing too-clever redirecting that fails miserably =
here:
>>>=20
>>> Proxy request sent, awaiting response... 301 Moved Permanently
>>> Location: =
http://downloads.sourceforge.net/project/boost/boost/snapshots/master/boos=
t_1_62_0.tar.bz2 [following]
>>>=20
>>> So we've been fetching a moving master snapshot all along. Patch is =
coming shortly.
>>=20
>> we should specify boost/boost/1.62.0/boost_1_62_0.tar.bz2 instead of =
boost/boost/boost_1_62_0.tar.bz2
>=20
> Incorrect. That will still download a master snapshot tarball. Only if =
the 'project/' is prefixed, SF will give you the release tarball.

if we need projects/ then it should be encoded into SOURCEFORGE_MIRROR =
variable in bitbake.conf. Since that required for
every sf.net project.

>=20
>=20
> Alex
>=20


--Apple-Mail=_41113829-5E0F-470C-9E99-01C820C7019F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgYvYQACgkQuwUzVZGdMxSSKACgjKhEKbRw82dGpXf7u6drAzgr
sMcAn1b98Pc4ezwYlV6yDSs5TMDqTeoU
=zYG8
-----END PGP SIGNATURE-----

--Apple-Mail=_41113829-5E0F-470C-9E99-01C820C7019F--
