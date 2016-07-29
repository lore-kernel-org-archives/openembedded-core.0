Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 390986E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 18:56:39 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h186so5846001pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=pGPFyQ7k7Ht734iiD0zHjD7szRFnOSa67edNTF5kn+I=;
	b=mr9kZ7ClFcPBo3Iz2WhsGuSICoSUKKWHAlpb0wqzQjqIEi6SHGLsc/KVuPiFK744KC
	rg3yNstn7gEf4x/7oxvHCnIzK503fAARo+znyN6gP+fHWu0VWj7fetOWSYPO6RW2d7cY
	4hd0v2p8BfyyHFW1M6HdC4SSRX1h11jYRe0/dFlKBgQWYHOh+57DtArE2I8qZu5F8dP0
	deeG9AafP7OgGZ/R3MH6dNB1CFl66W7/hxRrsP+QGrdlWbXTnqQifwXdBx1dj4j6BoaD
	SUcgW3jKz9kE3ZZlCxnCq/hRK3svazncpbP6eyi0T1AS9KJSx0LWrouq59er8QJtn/0K
	6ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=pGPFyQ7k7Ht734iiD0zHjD7szRFnOSa67edNTF5kn+I=;
	b=O7L3FsP4jBXFPv+CN6hoTFaUTUUJ+L800x+cfiDomnYEJ0RcK4zWp5natAjUhdvy4/
	URr7Y00TGdfTEkpaYQGxnxooLQPbpBi7jwO4Mc6ai479utqB6GfovcsDvo39S9cr4Y4L
	owe1KhF/xt5YamAKeqwnWtACNnOmdbClQ8Q+A4pwf8JadvQ8nHtTXsAvvc/bs4DfRiSV
	ZQ1W8bcQBV1Qh6OICeqJK5fBC7OIEAzGwhp6cMd9qevHWhAa0wx2THxsR7nAyaeTq/dp
	evpbKs3GF/JxoG9gcERdRJuUAqcPebr9JV/sh+/2NkVy9mwAgm+yKsOl3RA72WB/SzxH
	y7YA==
X-Gm-Message-State: AEkoouvwCZW4BaLaX0yq8Fj5+boVEE2c3faj1OMVIqI0PUuLxcF3rr6d1nQ997NsA6oyNg==
X-Received: by 10.98.73.131 with SMTP id r3mr71297612pfi.112.1469818599530;
	Fri, 29 Jul 2016 11:56:39 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99bc:2711:d44c:7b33?
	([2601:647:4c00:3edf:99bc:2711:d44c:7b33])
	by smtp.gmail.com with ESMTPSA id
	15sm26799274pfz.36.2016.07.29.11.56.38
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 11:56:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469787760-19159-1-git-send-email-awais_belal@mentor.com>
Date: Fri, 29 Jul 2016 11:56:37 -0700
Message-Id: <327FC3F5-417C-46EE-B26C-237C938D26CA@gmail.com>
References: <1469787760-19159-1-git-send-email-awais_belal@mentor.com>
To: Awais Belal <awais_belal@mentor.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [][PATCH v2] init-install*: /etc/mtab make a link rather than a copy
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
X-List-Received-Date: Fri, 29 Jul 2016 18:56:39 -0000
X-Groupsio-MsgNum: 85136
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8E27B1B4-85A5-4E3E-B69B-DCCDE1D035BF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8E27B1B4-85A5-4E3E-B69B-DCCDE1D035BF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 29, 2016, at 3:22 AM, Awais Belal <awais_belal@mentor.com> =
wrote:
>=20
> Using a copy would only make management of devices erroneous
> and makes the system unstable in some scenarios as tools will
> have to manipulate both files separately. A link ensures that
> both files /proc/mounts and /etc/mtab will have the same
> information at all times and this is how it is handled
> on newer systems where there is such a need. Same is
> suggested by busybox.
>=20
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
> meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-
> meta/recipes-core/initrdscripts/files/init-install.sh     | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh =
b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> index f564f4e..8b996ca 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> @@ -123,7 +123,7 @@ mkdir -p /tmp
>=20
> # Create /etc/mtab if not present
> if [ ! -e /etc/mtab ]; then
> -    cat /proc/mounts > /etc/mtab
> +    ln -sf /proc/mounts /etc/mtab
> fi
>=20
> disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | =
cut -d" " -f 3 | sed -e "s/MB//")
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh =
b/meta/recipes-core/initrdscripts/files/init-install.sh
> index 72ce92b..2362c53 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -119,7 +119,7 @@ fi
>=20
> mkdir -p /tmp
> if [ ! -L /etc/mtab ]; then

also check if /proc/mounts exists as well here.

> -    cat /proc/mounts > /etc/mtab
> +    ln -sf /proc/mounts /etc/mtab
> fi
>=20
> disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | =
cut -d" " -f 3 | sed -e "s/MB//")
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_8E27B1B4-85A5-4E3E-B69B-DCCDE1D035BF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlebpuUACgkQuwUzVZGdMxSY+gCeLxFCfHTGeTCUm4nPOTwNrJ4S
040AniOgv5S4rruIGFb8nidT7HkVZaxZ
=KeGl
-----END PGP SIGNATURE-----

--Apple-Mail=_8E27B1B4-85A5-4E3E-B69B-DCCDE1D035BF--
