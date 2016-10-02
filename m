Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6726E5CB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 20:37:10 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id r9so6831691paz.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=PBdqCLJKKIlPxPs1llJ5bGTVegGjOzQJWiJcUxKTzwg=;
	b=sjqQYqvRFcs6tvAsCKjbaGyXRpGQ1dOlKRMhUwmuo+3HEj1Hy3cZyo0g6eDqozzA6g
	rhIA35jqUPfUYzHr1M9ooyn34wUeGB2siYDwR7Ggxstt0eKLLWPCDtINrea9OmwVfOa0
	gy/0w8FcLLHpbBqavAlfRZx8U8pw5995mYgNL/nAEMln3depC+lHvlM+lTijAaDLaH+h
	M4mEs3fPBl5JTs54smfg6HeNbHu5Z4AzJVzQ+fwejSH9TY4jbzziEJfm19ph0bnCfs8q
	FlsNnnyRHHTZI7sKoBVy6jr0ntehceJX+olhZ6LGebUl+HNGhqh0Bc8/E5Z4IPsqQaEy
	rUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PBdqCLJKKIlPxPs1llJ5bGTVegGjOzQJWiJcUxKTzwg=;
	b=aLh6+n58EDW8HBdQtSb/1WFirZqz4BPDnefcj5hO2a1AOE/cR9m/TrboWZVrwOQF4E
	CzeiOzsPT60aacxSP/92XFu3HVy1NfE/YsfIos84W3T+X16U8oZ/KQ7K0nI/knogJicp
	hvU+NZjpnVtwQXdxANx8jnPGf2m+9KYuMYsDWNgX82gwZ2fbj7J6q/ASAp0pHO1dGWeq
	d5tEUOthyDOnRd1VplpJ4ZEc7HQfGavm1M2MRCsYBmxr3lWxXpo2ulktbj9FjvD/SCeH
	/6Sr/G85B5ZUBVSLhRg9R6S4jPv7r+QDxe37eyxjhfBwWRJX9glg9/msYPS1Zy7Ss5O4
	sSYw==
X-Gm-Message-State: AA6/9Rn6gOyj8lrE+upJLtsRQwKmxb7VvPK7q6hOQD+LOXfYIjze/0BqgQuQxLB9biqsDg==
X-Received: by 10.66.173.47 with SMTP id bh15mr31717075pac.42.1475440632361;
	Sun, 02 Oct 2016 13:37:12 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:40e4:d250:309a:ad0f?
	([2601:646:8882:b8c:40e4:d250:309a:ad0f])
	by smtp.gmail.com with ESMTPSA id
	h123sm41929028pfe.87.2016.10.02.13.37.10
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 13:37:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1473711245-24377-1-git-send-email-armccurdy@gmail.com>
Date: Sun, 2 Oct 2016 13:37:10 -0700
Message-Id: <C620C32B-A94F-431D-936D-B07D55673384@gmail.com>
References: <1473711245-24377-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: don't restrict device node paths to 40 characters
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
X-List-Received-Date: Sun, 02 Oct 2016 20:37:10 -0000
X-Groupsio-MsgNum: 87771
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4C30AB8F-B204-49B7-A5B4-0404FE2425D8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4C30AB8F-B204-49B7-A5B4-0404FE2425D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 12, 2016, at 1:14 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> 40 character paths work OK for device nodes in /dev but not for
> device nodes created in a chroot, LXC container, etc.
>=20
> Since the 'path' array is already a 4k buffer, the sscanf 40
> character limit seems to be a typo or historical mis-merge. Update
> the sscanf limit and bring the code in sync with the Buildroot
> version:
>=20
>  =
https://git.buildroot.net/buildroot/commit/?id=3D8876b6751e0bc19a375429006=
1808f0f8420708e

what is upstream worthiness of this patch ? it seems it could be
a good change

>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/makedevs/makedevs/makedevs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c =
b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
> index 7471f3f..cba7681 100644
> --- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
> +++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
> @@ -360,7 +360,7 @@ static int interpret_table_entry(char *line)
> 	unsigned long mode =3D 0755, uid =3D 0, gid =3D 0, major =3D 0, =
minor =3D 0;
> 	unsigned long start =3D 0, increment =3D 1, count =3D 0;
>=20
> -	if (0 > sscanf(line, "%40s %c %lo %40s %40s %lu %lu %lu %lu =
%lu", path,
> +	if (0 > sscanf(line, "%4095s %c %lo %40s %40s %lu %lu %lu %lu =
%lu", path,
> 		    &type, &mode, usr_buf, grp_buf, &major, &minor, =
&start,
> 		    &increment, &count))
> 	{
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4C30AB8F-B204-49B7-A5B4-0404FE2425D8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfxb/YACgkQuwUzVZGdMxQIRgCgjiqoR/Sfn4wYqd9+l5zIIj9V
gbgAn05oDVNHjwjUm9WX3FzjBZoSkckD
=fyEJ
-----END PGP SIGNATURE-----

--Apple-Mail=_4C30AB8F-B204-49B7-A5B4-0404FE2425D8--
