Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 800A37318D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:52:17 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id x65so11525661pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ot5rgGtWhaSReCkF4PmrdBI4lQdXyQawY/hqFhCBsDQ=;
	b=cD5wT9NbSLGuNMTHt7vFeZEXii4lD4j6esAVg2hvxzCh9lCHiuF9yc0NQ59fNQuKUR
	URZwFwXUN8amk7lzSvh2y8plpL9V2Qo/DiZR2B3a9iYqdE+2onYppZiPaRvQuRIYJaEa
	Rai3rvWxeXu2VRWGrKX2mL1hQZ592AWIiItCGnRnk1VkJH0I9BWTkT57CYYKPYBk+9VH
	G92D/dekovcGuM+v3aW9NZgQp6cwxh11MbkOLbGdj+TZK/GO3vPan5m6Z/oCqy3+klsS
	kp8ZLQtNnkQPk50c3/dZGzbNvTmthXO63eQ8ZSOLrUkn5hK9wh9ODDcDErPtbLV0fx3D
	ZNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=ot5rgGtWhaSReCkF4PmrdBI4lQdXyQawY/hqFhCBsDQ=;
	b=F/7DS8t+Y7M6LvLDyMWfx+lb/KpuGUE7KN7gD2qlxojvdKYAKL1FW2SqLhE4QVbpDl
	i+e/rINAGpMwJFihIEIg4qV0yvvQf7XE5E5CvS6VCcaU5J1UPvvuxWJi8K8xqkpg6s/z
	ZdKOzzUUzPP2oGC5xhQZydy9fvxhrN2IRes4+7oh6jeacJMMKF6EOBuiHM0n0Y3/BPBS
	ATCD6NcE7nitnXRZT6dxDo6QI+SwHMgH3OK+23FSsHSrPgxPolKpJe9BEqEuDfbn91/T
	u+k8af9g/k/AZ2Aapg/5FbFFeQvnLzY5fx15QnoSLP6bKERdNPs9kVX2IRbNzDGZdK5b
	i7sw==
X-Gm-Message-State: AG10YOR4l4hqB7pqDerfvsGkkRRgMoWKzbQoK9EE/HaP6nzyJNT9kXSNXf7/Bcozn9JXDg==
X-Received: by 10.98.72.202 with SMTP id q71mr52000257pfi.69.1455040338613;
	Tue, 09 Feb 2016 09:52:18 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:b9ee:5c31:ac9c:2c66?
	([2601:646:8802:5d5c:b9ee:5c31:ac9c:2c66])
	by smtp.gmail.com with ESMTPSA id
	76sm52058284pft.44.2016.02.09.09.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 09:52:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <201602091307.54737.marex@denx.de>
Date: Tue, 9 Feb 2016 09:52:12 -0800
Message-Id: <DAAB901F-8B5F-4D66-A0EE-5961DE7C6FA4@gmail.com>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<1455017471-6682-6-git-send-email-marex@denx.de>
	<CAJTo0LZ7fpKqnuyzWmQ02dw5DnKS4+XBbAEx=nNmZDi-Fq6+ZA@mail.gmail.com>
	<201602091307.54737.marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] liburcu: Add nios2 support
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
X-List-Received-Date: Tue, 09 Feb 2016 17:52:19 -0000
X-Groupsio-MsgNum: 77873
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A1A075FD-01C3-41A6-9E77-94F8DF35001E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A1A075FD-01C3-41A6-9E77-94F8DF35001E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 9, 2016, at 4:07 AM, Marek Vasut <marex@denx.de> wrote:
>=20
> On Tuesday, February 09, 2016 at 12:53:01 PM, Burton, Ross wrote:
>> On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:
>>> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D0f060c30a27922ce9c0d557a639b4fa3
>>> \ +LIC_FILES_CHKSUM =3D
>>> "file://LICENSE;md5=3De548d28737289d75a8f1e01ba2fd7825 \
>>=20
>> Why did the license checksum change?
>=20
> Because the LICENSE file now contains one more entry for nios2, which =
changed
> the checksum of the whole file. Maybe we should trim the checksum to =
use only
> the header in the LICENSE file and not the whole file to prevent this =
?
>=20
> This is the change which triggered the change of the checksum:
>=20
> +diff --git a/LICENSE b/LICENSE
> +index 3147094..a06fdcc 100644
> +--- a/LICENSE
> ++++ b/LICENSE
> +@@ -45,6 +45,7 @@ compiler.h
> + arch/s390.h
> + uatomic/alpha.h
> + uatomic/mips.h
> ++uatomic/nios2.h

I don=E2=80=99t know how the LICENSE file looks like but including file =
names in license file is
probably worth ignoring in checksums.

> + uatomic/s390.h
> + system.h
> +
>=20
> Best regards,
> Marek Vasut
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A1A075FD-01C3-41A6-9E77-94F8DF35001E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla6J1AACgkQuwUzVZGdMxRnRwCdH4CquNAudpiHVWdJSXZEqBqX
CroAnjn8vyRRWL/LF3LCkjuzqv+FWL+z
=068f
-----END PGP SIGNATURE-----

--Apple-Mail=_A1A075FD-01C3-41A6-9E77-94F8DF35001E--
