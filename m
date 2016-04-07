Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id CBC7D76312
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 19:01:46 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id bx7so43667961pad.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 12:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=FHDbK7dOsfk+oOVLV3bWWfDdBwXfnsgukyLWDYCLRAI=;
	b=etLjOsNgwtXHFj38oCQgHGIxGnnETk1rJB/WsgvaS34hX/uX3vmQc+W9typYzTt9UX
	4QsCKgmXJzWbntJuTh2DQNgr91QR6rbss63DuiGjt4UcTuYTfgkZYVu4M9dydGvRzHcK
	kSsl4B3Dk20CV0sP1omLnLpAACdSjXDoOCs0JUtKZSof1+TXp7ooPXdCgbZDnCZRdWj0
	6QVgel0Aws/mg+c5Z9E6WU7QZyz5fjL9um6wtgBmp0E9RDaKd6CiXf516HM6q1S+VCzx
	ePmTnf8nDaTAX/CzxsneK8VnklrainT1tqrUxdIkgJLUriMoXnwFqwfnJuKGepzHFKrV
	3IjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=FHDbK7dOsfk+oOVLV3bWWfDdBwXfnsgukyLWDYCLRAI=;
	b=M0YCt7BndDnO1FzOAz5+FE8vgroMuDNAK4RoKOD/ZsBF0M92TdRqv8c4kSii8uHeve
	jSfZmfxjTNOj3QG3n6gjz12fLytgHD+1itLsYXLzTJLrXsjjhbcllH6g9C5C8wjzb11e
	K6bT3pWLHKWwfate+1i2W5G66LcL+78dzL7YcCZyrrVfXwR2vdRO7DhHMY/KxSPMBTxg
	uTEb+GGNCEdOmDg/JfpMbUU2WLL/BZY6CKl5kW3d2Scf65OwnGu8UoPEl26Y80J7X5kI
	Lv8LohJC9U93Cb88+Mw7U5RuweOwwtgD/dGxN9HQ1nkBMLwV1Vky7ET7JD0g1LI9FXXc
	ydhg==
X-Gm-Message-State: AD7BkJLelg5T2ZK37xGTgG3QdVO+aprOu28VBL6Sfvy5YJdb/5u5wX8j32Pe8F7UerSRFQ==
X-Received: by 10.66.65.201 with SMTP id z9mr6777956pas.143.1460055707218;
	Thu, 07 Apr 2016 12:01:47 -0700 (PDT)
Received: from [172.20.98.214] (ip67-91-94-2.z94-91-67.customer.algx.net.
	[67.91.94.2]) by smtp.gmail.com with ESMTPSA id
	oy2sm13843853pac.38.2016.04.07.12.01.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2016 12:01:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <57069A2A.4040901@opendreambox.org>
Date: Thu, 7 Apr 2016 12:01:41 -0700
Message-Id: <EAFEA49B-06C0-446C-80F0-0B300EFFB863@gmail.com>
References: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
	<57069A2A.4040901@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Thu, 07 Apr 2016 19:01:47 -0000
X-Groupsio-MsgNum: 80610
Content-Type: multipart/signed;
	boundary="Apple-Mail=_98BF66C7-3556-48FB-B1BA-2FC7170AF229";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_98BF66C7-3556-48FB-B1BA-2FC7170AF229
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 7, 2016, at 10:34 AM, Andreas Oberritter <obi@opendreambox.org> =
wrote:
>=20
> Hi Khem,
>=20
> On 07.04.2016 09:02, Khem Raj wrote:
>> echo would fail if /sys is not mounted and boot would abort
>=20
> are you sure about the dependency between echo and sysfs? It seems =
quite
> unlikely to me. I'd guess the real problem is mdev failing to start
> without syses.

real problem was missing mounting sysfs on /sys, but I wanted to keep =
the other
way of setting it instead of echo

>=20
> Regards,
> Andreas
>=20
>=20
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-core/busybox/files/mdev | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/busybox/files/mdev =
b/meta/recipes-core/busybox/files/mdev
>> index 9625247..8c9c06e 100755
>> --- a/meta/recipes-core/busybox/files/mdev
>> +++ b/meta/recipes-core/busybox/files/mdev
>> @@ -1,10 +1,12 @@
>> #!/bin/sh
>> -
>> +mount -t proc proc /proc
>> +mount -t sysfs sysfs /sys
>> mount -t tmpfs tmpfs /dev  -o size=3D64k,mode=3D0755
>> mkdir /dev/pts /dev/shm
>> chmod 777 /dev/shm
>> mount -t devpts devpts /dev/pts
>> touch /dev/mdev.seq
>> +#sysctl -w kernel.hotplug=3D/sbin/mdev
>> echo "/sbin/mdev" > /proc/sys/kernel/hotplug
>> mdev -s
>>=20
>>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_98BF66C7-3556-48FB-B1BA-2FC7170AF229
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcGrpkACgkQuwUzVZGdMxQSlgCfZSG2xIx1mItIRVtybkhM/d9E
xnAAnAwSnh6H54WvrQCkvliS2vVBsHY0
=mnyb
-----END PGP SIGNATURE-----

--Apple-Mail=_98BF66C7-3556-48FB-B1BA-2FC7170AF229--
