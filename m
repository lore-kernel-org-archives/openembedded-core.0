Return-Path: <trini@konsulko.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 474547D597
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 02:38:02 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id s3so3645612itk.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 19:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4pCqbgTdHYumu6FxX0PMj627IemyPc4glO6buXFqdWI=;
	b=IpTMaeJOZORGS/5e6WE2zQBEsiiuVY1iAAwVIWFCvWtl3fuItvPZQTfW0iv4/x3zKQ
	GUcx/wgGWs7PKqcu26ZRpf70/86EuTYB5IvVvBI1hrG2I2jNyNWq9SZfKzMj9jnls7iZ
	i0ZgIR2ptheu7lOJHvO0yAaKBSUxYTNA4RN2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4pCqbgTdHYumu6FxX0PMj627IemyPc4glO6buXFqdWI=;
	b=ErfIAyn2KyhPgVRro5FHRxp/3jNPKJEnFweoo779X9R9lfm3ANjTlRZpZ4N9Ze3dPm
	p0w+IXdqhRztyJ4TDJeFqMc3SDJpdGb3quJFtw0Wdo42UPMt8f//yPWmkIR4R3TE1gWl
	8hXUTPB7RV+RhpGtD4WbUcgegqOYnF2UMxjkhTI0w4NUZt67ySGid6rQ85MDcnOnPYEC
	3dOpbTrCSOkpXzzKVTp+Tn8XQ0pN9rbLnEIYrWJYbj64AWk9UT53j4mCX8n0/mB58DIu
	vPQdvKjCFTMFhjmcjo9605oR7vdy5+27TxywnTEjZcVlZjOfpvfill61zs7dGQh3+zBC
	V7jw==
X-Gm-Message-State: APjAAAXm17z9dcGKL7iH4OV5NkjJE1LvOdtv4upjbGz8qhxekc88NY3h
	vs1fHiBH/Fqi+UfsJh5wmXq0eA==
X-Google-Smtp-Source: APXvYqy2nJmUbbw8WpzOLMiAH6JuP+zEIzH6hvU6Hv7AQCYCqni7X0A4ia82mSttBAQHLEJrHNDzNw==
X-Received: by 2002:a24:d545:: with SMTP id a66mr10750292itg.127.1557974283182;
	Wed, 15 May 2019 19:38:03 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id l3sm1246872iom.7.2019.05.15.19.38.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 19:38:01 -0700 (PDT)
Date: Wed, 15 May 2019 22:37:59 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>
Message-ID: <20190516023759.GP22232@bill-the-cat>
References: <F8C782DB-A692-407F-A6DF-AFAC51D14854@intel.com>
MIME-Version: 1.0
In-Reply-To: <F8C782DB-A692-407F-A6DF-AFAC51D14854@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] add wic based image installer
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
X-List-Received-Date: Thu, 16 May 2019 02:38:02 -0000
X-Groupsio-MsgNum: 124497
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SfgfV7onya2wNU+g"
Content-Disposition: inline

--SfgfV7onya2wNU+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 02:23:05AM +0000, Lee, Chee Yang wrote:
> Hi Tom,=20
>=20
> Would you mind to share with me how you make the installer image using wi=
c?=20

I ended up using sdimage-bootpart.wks and IMAGE_BOOT_FILES to populate
the partition as needed.  I can't paste the exact image as it was done
for a customer.

>=20
>     -------- Forwarded Message --------
>     From: Tom Rini <trini@konsulko.com>
>     To: chee.yang.lee@intel.com
>     Cc: openembedded-core@lists.openembedded.org
>     Subject: Re: [OE-core] [PATCH 0/4] add wic based image installer
>     Date: Wed, 15 May 2019 11:33:43 -0400
>    =20
>     On Wed, May 08, 2019 at 02:40:58PM +0800, chee.yang.lee@intel.com
>     wrote:
>    =20
>     > From: Chee Yang Lee <chee.yang.lee@intel.com>
>     >=20
>     > Existing installable image (hddimg/ISO) has limit of 4GB size, so to
>     > build larger installable image, we can build it in wic based image.
>     >=20
>     > 2 partition needed for installable image
>     >  - first partition build using source plugin bootimg-efi and
>     > configure to run install
>     >  - second partition build with root.img, systemd-boot and kernel to
>     > be install on target machine (this partition build using new source
>     > plugin installer-partition)
>     >=20
>     > These patches:
>     >  - add new source plugin for second partition
>     >  - add new .wks
>     >  - add new wic dependency and set default value for required variab=
le
>     >  - allow source plugin bootimg-efi to configure to install
>     >=20
>     >=20
>     > To build the image, set WKS_FILE=3D"wic-installer.wks.in" in
>     > local.conf.
>    =20
>     I'm confused as to why we need most of these changes to support the e=
nd
>     goal.  The enhancement to bootimg-efi makes conceptual sense.  I don't
>     see why we need a new plugin to do the rest, however.  What's being
>     done
>     here that we don't already do today?  I say this having made installer
>     images for EFI machines using wic (in sumo, even).  Thanks!
>    =20
>     --=20
>     Tom
>     --=20
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>    =20
>    =20
>=20

--=20
Tom

--SfgfV7onya2wNU+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc3M0HAAoJEIf59jXTHXZSit4P/iKjMi1ROB+Vl9J+Y8qQGOrv
ZAXk2JHTUbXWFrqkVlXBcXVS/Jg/XagMklfxNwpwNg7ZPKepAGxN/zaig6/yNyeA
htQxf5KlK3PtyxHtfDWFPHX6S8xg9oq4+/9pR2lvg05bsD0khwlVkMmhAiW0Pc9E
CQYY4R7wg5foEGdfew0DrpRCBMY5TL+VdiOX9HB20VZaL60OFG44CA/4q7oo8hJK
umCQv34mRRpj6N+hCysin1Yc0e0LB3ccvADg2D5oAO9RNwaF/9Q3wQH1eofEE/X9
Fwl5Xo3CaTfo1LKhEkkBJcc6dzSSiqoH/ANlzTSwqql3yN8uh6HnvEOBlC5DAgOX
ib6nz5gBSxhERTOrjAaSBaBSLHN5Esu0pqV3o8bltS+MjkS06SOiwn922t3rs5H9
cRNYztYSYPB3Y4wZa3snlsApc+xVTTygVLWcELQJbifXPSebGUa8UQlHYw76dv9l
DrNMaTXFJ9jtJbhPRO9WOWK7hQfmOfSo0hSD+TIy8G6juPaX/BLrlgDFPIN15Hjo
kq1rSv9G6vKDrQ7HlXOC71YgKKlHc9nigB0qrqAKVejYfBWQFRGM0PB3IY0jRyev
ye8xSavvr46PFUmdOSAHK+szswfoixh+9TQTz2jREFpVEgrBFThm/KWJDmtVfNZd
ABOPGm7YAMxm0VUfkror
=11Cs
-----END PGP SIGNATURE-----

--SfgfV7onya2wNU+g--
