Return-Path: <raj.khem@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id A6685770FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:10:11 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id v14so229359339ykd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 22:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=w2bsNdxwaxMbaQqIJx1i0MhnDcuI8aVD43T7DD5ngqM=;
	b=Ad0311Bj/whaDimCRAWfUglSt2h/p2IlXY/STm1XS+Z2mCdBn49BHgABREIwZsNY1z
	5CfyFsXC3F1Q55xcUfL8AL3hxkiAe/0+Wn8EtgrNNQJmbMEV9PRF2bcu18G7J93AzO1+
	1weoswiOsD12CmlY3fzFQmnpy2szxB52hP8y6WrBd5JpOZHySTrpxIunNNVto94e2Nv4
	4YlT3gJm1/g9Zq+BIQGUNRml8IMJxhdoGjAW8oOB1OMyzCQ0+mxYMpETslFmLJbSf1y6
	Iu3H4TZJgF/r8kG0Zjr3CO+39pJ4oXE52HClRpDKNEGhY6zAO699ERHshPd5dmjuQOpI
	XzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=w2bsNdxwaxMbaQqIJx1i0MhnDcuI8aVD43T7DD5ngqM=;
	b=l1okEClEk9bktNFEtaB6Knvmu6CCb/c+hUPdQqdw2TrV1gmon7NeurpWvpqaBkrY0h
	I3AFBVb4d5ebXXVs/dsogFz5Pi5JA47hTfo/GDtHzCiJpK20pxz70zZOVa3W41qqzU4W
	qMQshjZY012boWQDOR5DLk8jU320HDIxMlVbBFgoZ3JGdMIwOLnV32LITBUwb4i0xhJQ
	ts8mC+eKcg8ocpjmkJ8l6n9KhM7tsbwuQq67QSMg8eddCELeswS79S6FJthY1IfacTpY
	DcP5U1CcN6dhIjWT7X3rJhsPOB5pUlk3Newir7FzWEjZZnjpweCJeshxCjYv6bSXULTU
	4EnA==
X-Gm-Message-State: AG10YOR18XLMQTH6ABo7NERvHhwOvKpzN6x+APXI9gLrgGg6JiU8VMP7cUtAQ8bArTYNDw==
X-Received: by 10.13.192.130 with SMTP id b124mr15287162ywd.218.1453875011907; 
	Tue, 26 Jan 2016 22:10:11 -0800 (PST)
Received: from ?IPv6:2600:1002:b014:c92e:ed2f:4d62:56d8:d791?
	([2600:1002:b014:c92e:ed2f:4d62:56d8:d791])
	by smtp.gmail.com with ESMTPSA id
	m188sm3799554ywe.46.2016.01.26.22.10.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 22:10:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453835784-14884-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 27 Jan 2016 01:10:11 -0500
Message-Id: <5B5381E3-FF63-46B5-A4DC-46EAE87DB5C3@gmail.com>
References: <1453835784-14884-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: fix stop -vs- start typo in rcS script
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
X-List-Received-Date: Wed, 27 Jan 2016 06:10:11 -0000
X-Groupsio-MsgNum: 76947
Content-Type: multipart/signed;
	boundary="Apple-Mail=_22B3C498-6993-4727-BF56-42640EAE3FC6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_22B3C498-6993-4727-BF56-42640EAE3FC6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 26, 2016, at 2:16 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Also make the rcS and rcK comments match the code.
>=20

thanks looks ok.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-core/busybox/files/rcK | 5 +++--
> meta/recipes-core/busybox/files/rcS | 7 ++++---
> 2 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/files/rcK =
b/meta/recipes-core/busybox/files/rcK
> index 050086e..f8a63e1 100644
> --- a/meta/recipes-core/busybox/files/rcK
> +++ b/meta/recipes-core/busybox/files/rcK
> @@ -1,9 +1,10 @@
> #!/bin/sh
>=20
> -# Stop all init scripts in /etc/init.d
> -# executing them in reversed numerical order.
> +# Stop all init scripts in /etc/rc6.d
> +# executing them in numerical order.
> #
> for i in /etc/rc6.d/K??*; do
> +
>      # Ignore dangling symlinks (if any).
>      [ ! -f "$i" ] && continue
>=20
> diff --git a/meta/recipes-core/busybox/files/rcS =
b/meta/recipes-core/busybox/files/rcS
> index d18c26b..bb03eb6 100644
> --- a/meta/recipes-core/busybox/files/rcS
> +++ b/meta/recipes-core/busybox/files/rcS
> @@ -1,10 +1,11 @@
> #!/bin/sh
>=20
> -# Stop all init scripts in /etc/init.d
> -# executing them in reversed numerical order.
> +# Start all init scripts in /etc/rcS.d and /etc/rc5.d
> +# executing them in numerical order.
> #
>=20
> for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do
> +
>      # Ignore dangling symlinks (if any).
>      [ ! -f "$i" ] && continue
>=20
> @@ -13,7 +14,7 @@ for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do
> 	    # Source shell script for speed.
> 	    (
> 		trap - INT QUIT TSTP
> -		set stop
> +		set start
> 		. $i
> 	    )
> 	    ;;
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_22B3C498-6993-4727-BF56-42640EAE3FC6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaoX0MACgkQuwUzVZGdMxQeDACfaE4QZA5PcYMDOE94bHtmDck/
zE8AnAtXM+2ztEllqivY1o6HAqVPjTN1
=DqUj
-----END PGP SIGNATURE-----

--Apple-Mail=_22B3C498-6993-4727-BF56-42640EAE3FC6--
