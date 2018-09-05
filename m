Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id DEB0579408
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 22:07:23 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id j131-v6so3274975ywc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=djmqJxdY9Y3ADbPiBniGZyUFgZAuNzDV5fYJVLaEKu8=;
	b=GWFXB+0EHv0t7iI8tjAmUQHojorwZs/l5DkUEUEb1P6DLT39zEj9GXDVAOgbN7cxfQ
	/cAA4YJic2GajVUchD69K07RTI3TZYbDOISRrAPmuRsQx8+wJfl0vunK1dkj1iN3R6Vw
	ISdODkiAJ0j8QywIH4o5nhUTQp6YkzALPnNXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=djmqJxdY9Y3ADbPiBniGZyUFgZAuNzDV5fYJVLaEKu8=;
	b=VUd5Xg/LQg+ASnCnNxjO2Rmth20j6aGH15ah23oAbvkmRmZ2b64F6FromE2bSoWDjX
	oJZytLDoT08QW01/DofusEKAYmh4/kfXetTQLZZ3M6jT9D6beG6nJY9f8blzhvEiTZ6P
	HoZmSb65QJLktWNxAptFXRX8qsF3YFwIWxZPbGHMU/pmeWqH78za3nxZsKJn2mmgxGa8
	knjWouX6vIHg589UJroor/mPFqo0FnQ/XvCqzLxAobTbNf7zC5lhevT0XXpA1fMXNLTX
	wDv1j3jqHDIBUVLh62z0IA7UKfA0PO2EMec8t/pU3D+kOyp4Gm+q1hI7eZZ7a+KyXIpU
	o8RA==
X-Gm-Message-State: APzg51BNHDmot90h+AhT5pJW4YmAmDxiqcWRJuL2pUyd3k75QHPmbJp8
	TRg9j1o9hx/aYTlyy66eLU8LZg==
X-Google-Smtp-Source: ANB0VdbwWEJBp9vSdcGVm0b2ry7Xf8hKKDZ454NK8oJwIZ0MObc2B5ith5eO81pBmTnqhU64ITnQmw==
X-Received: by 2002:a81:9944:: with SMTP id
	q65-v6mr22262618ywg.336.1536185244630; 
	Wed, 05 Sep 2018 15:07:24 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	p126-v6sm1124901ywf.22.2018.09.05.15.07.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 15:07:23 -0700 (PDT)
Date: Wed, 5 Sep 2018 18:07:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Emmanuel Roullit <emmanuel.roullit@gmail.com>
Message-ID: <20180905220721.GM26633@bill-the-cat>
References: <1536177205-505-1-git-send-email-emmanuel.roullit@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1536177205-505-1-git-send-email-emmanuel.roullit@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: squashfs does support partition uuid
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
X-List-Received-Date: Wed, 05 Sep 2018 22:07:24 -0000
X-Groupsio-MsgNum: 115888
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UfldEabGvYS2yxfg"
Content-Disposition: inline

--UfldEabGvYS2yxfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 09:53:25PM +0200, Emmanuel Roullit wrote:

> wic allows the user to create disk image and reference each created
> partitions via its partition UUID.
>=20
> squashfs does not support filesystem UUID but it does offer support for
> partition UUID.
>=20
> $ lsblk -o NAME,FSTYPE,UUID,PARTUUID
> NAME   FSTYPE   UUID                                 PARTUUID
> sda
> |-sda1 vfat     6078-ACD0                            95aa4ffb-741d-4d99-a=
df6-0358bc890046
> |-sda2 squashfs                                      7d46da2d-29cc-4d5a-9=
e39-d0381c4abb0c
> |-sda3 squashfs                                      d4a3e24e-410a-4f2c-8=
ad5-8f8321de177b
> |-sda4 ext4     d72ec529-78e4-4cd3-b39b-781b6b1cb47c f3edc990-f4f6-4536-9=
587-44dae4ceb99f
> `-sda5 ext4     a0b265aa-e935-40b8-9c6b-e9e58ad3890f 6e72ebaa-29ed-41cd-8=
44c-3f76976cf41d
>=20
> Removing this constrain allows a user to create squashfs-based rootfs and=
 boot
> from it with such kernel argument 'root=3DPARTUUID=3D7d46da2d-29cc-4d5a-9=
e39-d0381c4abb0c'
>=20
> Signed-off-by: Emmanuel Roullit <emmanuel.roullit@gmail.com>

Please add in:
Fixes: 2fbdcf4e59c8 ("wic: kparser.py: Check for SquashFS and use-uuid")

> ---
>  scripts/lib/wic/ksparser.py | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index e590b2f..92f0b6d 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -196,11 +196,6 @@ class KickStart():
>                          raise KickStartError('%s:%d: %s' % \
>                                               (confpath, lineno, err))
>                      if line.startswith('part'):
> -                        # SquashFS does not support UUID
> -                        if parsed.fstype =3D=3D 'squashfs' and parsed.us=
e_uuid:
> -                            err =3D "%s:%d: SquashFS does not support UU=
ID" \
> -                                  % (confpath, lineno)
> -                            raise KickStartError(err)
>                          # using ArgumentParser one cannot easily tell if=
 option
>                          # was passed as argument, if said option has a d=
efault
>                          # value; --overhead-factor/--extra-space cannot =
be used

So I got this logic slightly wrong then.  We should correct the check
that we don't have parsed.fsuuid rather than use_uuid.  Thanks!

--=20
Tom

--UfldEabGvYS2yxfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbkFOZAAoJEIf59jXTHXZS3O0P/RPurAQYGnN+hKCgm26UuLJg
EsD9BNFw6bPkEf31nnb/I+sxaPw9LOEOoz1aC1AdAHxMCT9agAieAtfyCvmgb+X9
9UwkdgBv5RmRYvCAP2JBLIr9Vr13onwBQm5sBgPiTfrNeJjTKf910J/mO1yLbd/z
wS9X/OGDQMc1V7sjUot3j2QKmDrLdJIZeEyPyA0Yd5OIi4WXRh3txZGl5j7ouCMg
yNl5WxpZvDHV9nCBmvAl/1ENuQMD4+hf8TG7MLIMylgvpGK/uqQALr6aeQn5DwuZ
piPeBQl5wZEnWxA5yqR3rYmBsxyP30KHojBzHahZteULy2dwnKDcrcWE+JLBloAU
zbmzUyvbSPlYTrRLoTyt8t4lIwDbY0MUqENO9VI2os3uUdcNp0U9GikJk8leOKPw
5Y1JqHr2ywkWqgAwCr6Hz0y95/6VGAV3EHwFILtI064RO4IenSvKdzgPaI3d56nU
8Xj1jFIhaNYWbx8HYJz+FBJUJZlcJfFIBlz8G3cl7H0QHIu5ufLNX7QtFZ84p1vd
PYo2oG3jt9Rr3z2oD6JVPMMF+gTNiRDDeVd1EsPHXo1+h0jyy90kEZk1MqUu/xwW
kOX5MC5W6DnMYhsUOgBlykZ7BPkBbrp7f+w4I09sThLKDm3UZDtcrgQ1nx3bjxyF
8PfVpwQxShMGzYZ5Kq9D
=SU1t
-----END PGP SIGNATURE-----

--UfldEabGvYS2yxfg--
