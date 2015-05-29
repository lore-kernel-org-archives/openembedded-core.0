Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id CFDD0737F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 23:16:24 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so63767126pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=Yqu0Ab+TfMWbSiordsg46zs108MR5ENma1TAhiHJtxw=;
	b=ydt+m7/WY/X5iwhfhzEfapZ1Rw9n+Tz7cGa9vJ2c1Uft5qfxDwcxaYSXNtyx2TZELC
	i4bv4oRk9aMia60eLyhbB3yOQ9gDILC+lMzf81Di/QlXbn/JNkqo08eaeaTAjZ7j1OXo
	ITABiYwcpOIAqPPwjzd9UBJCNnhtGgO75n7AT+ozKnqp+UQhwCeyRQ41JZgdWi+bHmdx
	dvacxx17UGh9GO578L2O1D7xXvers0AeNx0B8//A+A9HdMtPUjMQWR4OD0/IV+pZn9dv
	f76B2IMNxsiGu5kSmYCfOQj7S0zxufAapltQ5yu/YOWlrVTcqCKHvqcMGHCUujrfdfjX
	jIpg==
X-Received: by 10.66.65.229 with SMTP id a5mr19282689pat.11.1432941385873;
	Fri, 29 May 2015 16:16:25 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:bdbe:55fb:fea4:46c3?
	([2601:9:3580:84c:bdbe:55fb:fea4:46c3])
	by mx.google.com with ESMTPSA id w6sm6686956pbt.3.2015.05.29.16.16.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 May 2015 16:16:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1432920208.git.raj.khem@gmail.com>
Date: Fri, 29 May 2015 16:16:23 -0700
Message-Id: <96791C5F-9A7A-44C4-B2ED-C285C69DB5E5@gmail.com>
References: <cover.1432920208.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [PATCH 0/6] gdb/binutils minor upgrades and misc
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
X-List-Received-Date: Fri, 29 May 2015 23:16:25 -0000
X-Groupsio-MsgNum: 66140
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A02A785D-C604-4BFA-A90E-048FB73C0709";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A02A785D-C604-4BFA-A90E-048FB73C0709
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 29, 2015, at 10:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> This patchset has following
>=20
> gdb minor upgrade to 7.9.1
>=20
> binutils move to latest tip on 2.25 stable branch, it gets
> the issue where copy relocations against protected symbols don't work
> with bfd ld and gcc 5.0 on x86/x86-64 it could help with remaining =
build problem
> with gcc5 seen on x86/x86-64  this also helps musl based systems
> which suffer from same issue with gcc-5. This patch needs some runtime
> testing with gcc 4.9 though
>=20
> glibc patch is needed for non glibc libcs to be able to build in =
OE-core
> currently its broken for uclibc and musl
>=20
> Runqemu patch is required for newer versions of wayland/weston to work
> after switching to libinput. I have tested it on weston/wayaland and =
on
> x11/gnome image it worked ok.
>=20
> alsa-plugins is a build break fix
>=20
> openssl is a refresh of the last patch as a upstream backport no =
functional change

I have added another patch which I forgot last time to fix alas-utils on =
non-glibc case.


--Apple-Mail=_A02A785D-C604-4BFA-A90E-048FB73C0709
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVo80gACgkQuwUzVZGdMxShmACfZUbrTLscPU4DYyFbp2OF9881
EvsAmwe7TPjxtLUB0abMMk+qrThcx6W2
=fujT
-----END PGP SIGNATURE-----

--Apple-Mail=_A02A785D-C604-4BFA-A90E-048FB73C0709--
