Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EF48E71A32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 16:22:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so3262682pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=GIkMJa8whWJBghe6GXArtOm4xbgPhjFoiB1ShzFczn0=;
	b=i3KnFq7lj7TdUvbrNKBPMkwgZh3274N38ij9S++wUc5nJrUIRH6ix+SpQlI83Hg54Y
	sMvhAAkoFxstQ07W0MrUDPoHuvTjune3tEoBFQRR6y0/fqzpVnpIDsYq+dK0NlSr+2qJ
	P0sQFxun3H9ZPeCv2gSZ+MbpBO8BN7DdjWq/kXz/1UPa2A3PjIEBm7Y9YbMBTXU1SwkB
	3rFjJYk0QSrKMm9yPtuAbhzBKe4JSW5VQR9wUPlxrVy1gqnTSe9tGTdXtLliKqKcCiCB
	rAwMBy8GJ7bVSpA2CZqA4EutDHtmjakyPcKmiTtWyFZSfK+1G7Rvzz3OykY6VSllPiS1
	6RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GIkMJa8whWJBghe6GXArtOm4xbgPhjFoiB1ShzFczn0=;
	b=TAIVEpNPWZcpZuQqijffb5HJawAOeRMV77udGIGkIE5zsFgcCnCtIBBY21+QdcO0hc
	LfnnMuesqn8MgQQp0XAYJbB6oE30zpGnG9wdlQB+c3JekwX2gBvLUnoQw4pmjgIz5seE
	p74o9F1QHQ43QsIM/o3TAXuVbFyZCXVEst1Jj18k+NQV+FuD5ExlKZAIKMg1ot2kdg10
	4ocLJXaY1PpkrUgIFqAWyLx6YhJWSAOQrwAJJBOF0XfYvBfYjuIbYxFtpYxuDy209BZF
	DFxzREz/UMOe47f3D9xWijo0p0RhisuO/yjMm+9DW+6dvXOY+C93EmmG5qwIocSg/rDs
	Qo5A==
X-Gm-Message-State: ABUngvdr4RBr6QV9thrmzh6fxKhdq9kAMhk78fjKi0vTW8xf5OMZRxSOzJuIiScvYV5lOQ==
X-Received: by 10.98.214.157 with SMTP id a29mr5165298pfl.162.1477930970325;
	Mon, 31 Oct 2016 09:22:50 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:793b:10a4:267d:c6fc?
	([2601:646:8882:b8c:793b:10a4:267d:c6fc])
	by smtp.gmail.com with ESMTPSA id
	w15sm36622096pfi.55.2016.10.31.09.22.49
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Oct 2016 09:22:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6a58f235-b235-f25c-b068-fe0c84cf4915@linux.intel.com>
Date: Mon, 31 Oct 2016 09:22:42 -0700
Message-Id: <C35FC1E0-3663-4060-9E1C-A286B7A92512@gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
	<1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
	<2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
	<6a58f235-b235-f25c-b068-fe0c84cf4915@linux.intel.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 16:22:50 -0000
X-Groupsio-MsgNum: 88808
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6328FD59-5F5A-4764-A85F-2A92E5FE1CC0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6328FD59-5F5A-4764-A85F-2A92E5FE1CC0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Oct 31, 2016, at 5:53 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 10/31/2016 05:45 AM, Paul Eggleton wrote:
>>> Alex, any idea what's happened here? Do you have the originals from =
when you
>>> did the upgrade?
>>=20
>> Hmm, it seems we aren't the only ones to have hit this:
>>=20
>>  http://osdir.com/ml/blfs-dev/2016-10/msg00013.html
>>=20
>> That said, I still don't think we should blindly trust the latest =
archives
>> until we're sure of what the differences are.
>=20
> Sourceforge is doing too-clever redirecting that fails miserably here:
>=20
> Proxy request sent, awaiting response... 301 Moved Permanently
> Location: =
http://downloads.sourceforge.net/project/boost/boost/snapshots/master/boos=
t_1_62_0.tar.bz2 [following]
>=20
> So we've been fetching a moving master snapshot all along. Patch is =
coming shortly.

we should specify boost/boost/1.62.0/boost_1_62_0.tar.bz2 instead of =
boost/boost/boost_1_62_0.tar.bz2

>=20
> Alex
>=20


--Apple-Mail=_6328FD59-5F5A-4764-A85F-2A92E5FE1CC0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgXb9cACgkQuwUzVZGdMxS6owCgin/JUcvSz7TmumZdLlQtIAav
M/YAoJHV4uqhsTlVXzroWLGs5jFLP1yW
=/irF
-----END PGP SIGNATURE-----

--Apple-Mail=_6328FD59-5F5A-4764-A85F-2A92E5FE1CC0--
