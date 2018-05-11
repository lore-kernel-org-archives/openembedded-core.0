Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F21177058
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 15:45:13 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id g9-v6so1698251ywb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=g64lKVXw3On82xGQIxd5MTt8s5/3jNeA3jQ/3uuTENs=;
	b=aK2sre14VVU9u2QRCTa4XCeS8KVQI9UGYo1n2+ecwXzBUMeA/wXwvXGWyPW9a8IXUL
	BStioa7BOUkLhaR6fmbZpVmu13HWnAavnXjaYfOeDSMV42x5ZVtOEFnNMSZVtarRSMgA
	bHL7/rzSjxBMKOo3paaOWz0ExSMYBMMRb+fTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=g64lKVXw3On82xGQIxd5MTt8s5/3jNeA3jQ/3uuTENs=;
	b=CvXQgWB1LlL4qEjs6701UoY/cHotIli8oz53WEu0njMP3y9KUOoSWVR2gbcDxri5yY
	k9WnZzxQL8s3mN8buCbNLWeuoATiaLiw7lUgkXjRcbpEoFQr/dMqU3ito3T2wYP/8bvz
	PrYqwNSxeokiXTRSFkLiXF1xxufVK9YXj3HTTeUTAkKDwjphx8askEmpXB+jCIMJX2bI
	tKjkj9vv2yihacRmMky4VBmS8Q28iotGNcTDAMS7sh+/JxKc232Gz5W0HpzgotK1zV5k
	l4K4AGcEMwDMDy6bicF2qNQgOj7ERoKrVpAchRgKLr+NbMp22S+vtc+v9t36wEJ47x++
	WeGg==
X-Gm-Message-State: ALKqPwemo5NtXvjDvEyxQlzXsIYms06AEh0Zvxd1Lqt5aY7TiFnh98s5
	EqqZ6XQrzc+nM3YzDV3QldeyGA==
X-Google-Smtp-Source: AB8JxZrpzHOjUBT0RmV47xt2i77LkK8xqX/aPdWvNa1Mvi0ChvHulqg+QR6V1oJ/VA6CWCAh5BbaEg==
X-Received: by 2002:a0d:ec97:: with SMTP id
	v145-v6mr2932156ywe.390.1526053514161; 
	Fri, 11 May 2018 08:45:14 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	h202-v6sm1516240ywc.21.2018.05.11.08.45.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 08:45:13 -0700 (PDT)
Date: Fri, 11 May 2018 11:45:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20180511154510.GZ12235@bill-the-cat.ec.rr.com>
References: <20180511143231.15292-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180511143231.15292-1-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>,
	ed.bartosh@linux.intel.com
Subject: Re: [meta-oe][PATCH] wic: Fix partition files UIDs on multi rootfs images
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
X-List-Received-Date: Fri, 11 May 2018 15:45:13 -0000
X-Groupsio-MsgNum: 111293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CWNZ5uIaB6K6BCbu"
Content-Disposition: inline

--CWNZ5uIaB6K6BCbu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2018 at 04:32:31PM +0200, Ricardo Ribalda Delgado wrote:

> When a wks makes reference to multiple rootfs, libspeudo data is not
> properly chossen. This results in filesystems with invalid UIDs for all
> the files.
>=20
> This can be tested with this .wks file:
> part / --source rootfs --fstype=3Dext4 --rootfs-dir=3Dcore-image-base
> part /mnt/data1/ --fstype=3Dext4 --source rootfs --rootfs-dir=3Dcore-imag=
e-minimal
> part /mnt/data2/ --fstype=3Dext4 --source rootfs --rootfs-dir=3Dcore-imag=
e-minimal
>=20
> And this script
>=20
> $bitbake core-image-minimal core-image-base syslinux
> $losetup --partscan --find --read-only --show test*direct
> $sudo mount /dev/loop0p1 /mnt
> $ls -lan /mnt
> otal 40
> drwxr-xr-x 18 =A0 =A00 =A0 =A00 =A01024 May 11 16:11 .
> drwxr-xr-x 25 =A0 =A00 =A0 =A00 =A04096 May =A06 06:31 ..
> drwxr-xr-x =A02 1000 1000 =A03072 May 11 15:51 bin
> drwxr-xr-x =A02 1000 1000 =A01024 May 11 13:59 boot
> drwxr-xr-x =A02 1000 1000 =A01024 May 11 13:59 dev
> drwxr-xr-x 25 1000 1000 =A03072 May 11 15:51 etc
> drwxr-xr-x =A03 1000 1000 =A01024 May 11 13:59 home
> drwxr-xr-x =A06 1000 1000 =A03072 May 11 15:51 lib
> drwx------ =A02 =A0 =A00 =A0 =A00 12288 May 11 16:11 lost+found
> drwxr-xr-x =A02 1000 1000 =A01024 May 11 13:59 media
> drwxr-xr-x =A03 1000 1000 =A01024 May 11 15:50 mnt
> drwxr-xr-x =A02 1000 1000 =A01024 May 11 13:59 proc
> drwxr-xr-x =A02 1000 1000 =A01024 May 11 15:51 run
> drwxr-xr-x =A02 1000 1000 =A03072 May 11 15:51 sbin
> drwxr-xr-x =A02 1000 1000 =A01024 May 11 13:59 sys
> drwxr-xr-t =A02 1000 1000 =A01024 May 11 13:59 tmp
> drwxr-xr-x 10 1000 1000 =A01024 May 11 14:54 usr
> drwxr-xr-x =A08 1000 1000 =A01024 May 11 14:55 var
> $sudo losetup -d /dev/loop0
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--CWNZ5uIaB6K6BCbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa9bqGAAoJEIf59jXTHXZSgL4P/23Qu1BOhcSqPC5H3BQ91Ddo
rnayHvN16I4LxBYKWFO1xfOvU179Ns3Z1jfiFveHI6s/8m86QtrBLzMKdYc/Xvkx
uUDOKlO3uWzeeGTdxyWneo1q0GKOxfAa7OIB7zAFFPe67CovYdkZEPiECC/YhSVY
HU9NZB4Qu7/vF+LQu80hGS7qSDBoGYlaJhtSSbi3W3WlSXui1WR4Ny0cVfmy9BDB
gKW2skyu0H6LVKQY8wCraEE7+6r1LALOA0K+EYsQQM5w4lXGe2dc/m7lEFnPUwDA
3gUXbarI5Xwm4u5e8ObwsWycH0XfRCtqHIRLr6WRToXiC+PtTmQuVwxCh5uPWa4e
z85okIMJLYSzqU2vQZiH86JIBQnXxH3v2RwvVLZuUq5PdFdvtAP/XPWTBV93Yldp
N+IkG9mI2YvmBwZJktPQ3u3k2QPGyayrZT1Tad1rnIghh3E2BCsk2hRRDDdjV363
IvQFpaEWEEZCRzj7pYN8NJlOSwWtfoQ5XGoLq3FrSE8qYNWMOHHGTTNeK9c6XNU+
eLDNwbY+mwcAVl6cth3mF0aYA+5xFVYkV60KBpbWaq0nanJrYQoVlH3xCGiKNGTh
gZbnIV9K0X1vc9gHL2fGDVnEio5fmIr0ycRkh3kuzTB57kKRo3eLcrsMn62oYXiP
wt3d4DabxPgPDPxXBJXi
=w5jt
-----END PGP SIGNATURE-----

--CWNZ5uIaB6K6BCbu--
