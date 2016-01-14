Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4B373183
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:25:55 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id n128so103609673pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=fuFjFZiHF6+Eu41hgOlSBhtayl7fewrLPf0EEmtJUCg=;
	b=IhLP1sD5NOB3LQ5lwUxdK5UOD/qLXDJ1L5JW11eYpSvS7VitygH7yH3TtlVvAtfzSD
	izahVHnYK9O+JBlI9ytg2552O8ibyM4SnLPNgWINI2sHbtHSPpQv2of3goLtbc8QUO10
	NaW2cCnMyxAGWbUToai5iy0MJpob1bQ3E6xLkBaQfmzAMa2vsR7nXRfGkHkUnHTPz5IR
	KYn8nUrDYtGNqQIb16HvN5ykkdEyF6E8G4HiQR2/v3dGHnt8bC8W1iXrkyfHOktiUcRV
	NYDXAx6WFum/7dpuzQhOi0vnPiuYGk1xax/a0M/3Fp92L4aooAxp4qRKMzedDXdj8r/g
	wjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=fuFjFZiHF6+Eu41hgOlSBhtayl7fewrLPf0EEmtJUCg=;
	b=QGyGm4dpKWOzmjiblZp8+c91UWEzvAhtrMJ6oKobC0s72YfYNXTqD/a9HQktdJG5GP
	GPltvdL2k6stf2Rms69uHjYL/2LYp73xZYBw5O0HhO44QjP8Pv0RzdhH/mGBDa8/v4b0
	MutSGbp2+GHKLtdSF6DBd1sNANjOgTgDG9qbXFKd9L4QjeT3Lwu8O7tMaeVVu3Ohlovc
	GvOfyXVISCDvJGWgsr/aiUwRQ/joINg/7cO/BDeUTBiQ972iInKgdJc3PBzbby+nRwvF
	LQoZnie98Hq/aijA3yNYtT3G8LI2ccj+z+DW0nS4S250c1SSHQMYIYn2IKVhYPwMYiYH
	V1sQ==
X-Gm-Message-State: ALoCoQmdx2UaghzFl0hdjgvNtZ7zq7TzVCHksRVlIijuueeh8i5uQG0mHKrBEjaIkO6CPms23qzAhfzKNJNPcD2v/blxABzjLg==
X-Received: by 10.98.16.72 with SMTP id y69mr8124927pfi.95.1452795956776;
	Thu, 14 Jan 2016 10:25:56 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28?
	([2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28])
	by smtp.gmail.com with ESMTPSA id
	dg1sm10837514pad.18.2016.01.14.10.25.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 10:25:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450746422-10755-1-git-send-email-armccurdy@gmail.com>
Date: Thu, 14 Jan 2016 10:25:51 -0800
Message-Id: <F80AC6C0-500C-42FD-B35F-F9F53FF4F446@gmail.com>
References: <1450746422-10755-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] directfb.inc: enable bfd linker workaround for all arm targets
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
X-List-Received-Date: Thu, 14 Jan 2016 18:25:57 -0000
X-Groupsio-MsgNum: 76074
Content-Type: multipart/signed;
	boundary="Apple-Mail=_17705D6C-C36C-4DB3-8B70-39E97ED6B41A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_17705D6C-C36C-4DB3-8B70-39E97ED6B41A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Andre

I have a fix for this issue in binutils

can you try it out if it works for you ?

=
https://github.com/kraj/openembedded-core/commit/0e35ad5a35262cfb7a6249ce1=
58f76d1399d6cb4


> On Dec 21, 2015, at 5:07 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Although the gold linker problems with DirectFB have only so far been
> observed with armv7a, they could potentially affect future arm targets
> too. Since there's no particular downside to using the bfd linker for
> DirectFB, apply the workaround to all arm targets.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-graphics/directfb/directfb.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/directfb/directfb.inc =
b/meta/recipes-graphics/directfb/directfb.inc
> index b905ab0..603aba3 100644
> --- a/meta/recipes-graphics/directfb/directfb.inc
> +++ b/meta/recipes-graphics/directfb/directfb.inc
> @@ -23,7 +23,7 @@ S =3D "${WORKDIR}/DirectFB-${PV}"
> LDFLAGS_append =3D" -lts -lm"
>=20
> # Workaround for linking issues seen with armv7a + gold
> -LDFLAGS_append_armv7a =3D "${@base_contains('DISTRO_FEATURES', =
'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> +LDFLAGS_append_arm =3D "${@base_contains('DISTRO_FEATURES', =
'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
>=20
> BINCONFIG =3D "${bindir}/directfb-config"
>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_17705D6C-C36C-4DB3-8B70-39E97ED6B41A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaX6DMACgkQuwUzVZGdMxRPFQCeInh/8kpvzvYw0tuK7zHXYiRF
5mAAnAgc61/XiXEP/0ZZcPv6zKFkg6i3
=Btzf
-----END PGP SIGNATURE-----

--Apple-Mail=_17705D6C-C36C-4DB3-8B70-39E97ED6B41A--
