Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E08AF65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 03:25:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y134so24154369pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 20:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=BnNDlUsVtXO5aX9Ola33Yz71x6e3cBdbqocaJBrRJwc=;
	b=zZHh7H9t+i9fHHVElR9Ixhfr01dxko99c1gpr+q2eiVXhi4IVBHE41RZg3281PudQZ
	X25P8e06ZH6FniYSZyNoDNQvNWRL6Ljure6wbcpCWS/1LVAUpDDbn0uLn9MBXOywYXwE
	SXsPektB5EsX5K1p4fn2sVgU4t0Jx7qR/on/fxeT39umda9lYnBnr8VBRLKy1kSLsQ80
	29pqug1aobFYJxBpNMdniApqB1XXE9HKlwPkJKr9EFO8mHPY6LLvunLO3HfAlU8lsTI7
	daloMeJdQ9eo4DT1InuxxCv5vASDnnALhgnpznRik+LTXNMInwrGZwM3unylf9J7sfQI
	ILwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BnNDlUsVtXO5aX9Ola33Yz71x6e3cBdbqocaJBrRJwc=;
	b=TM0U8ahBRXRfNJp7t22bU7lh6kwzEPgDZguqTroRLyCCkbN5LNXWVbZjcwrZbLzzjf
	1mo32nCtF1VSc8g351EpAavq8vGjSC61gVhGGDLRRZQAVAVsiSjyWBwQ+RKkwQTx1oI3
	PsFnpeRKd8NCzaFgic9OmWzfq12DM5KXJKQ5g8THYs0j0tWUy2s5uxIl2W9si/VDJ0mt
	w1XepFHbnJF8kuT41Sm2O5LHotvbOrK/FfF0rhJdrx0d4zRuRqlw5nF5zD41rJrGtgG/
	FrYKlkKfvTWZm9uTRDDPtoT8wnG0W7HfCtn6uTuvdoQSi0Dvta6PPAU8M9BdfTWOILE1
	4jjA==
X-Gm-Message-State: AEkoouuN20u6DWVTdZhx4A4Qe72ctF/bvLNXHOt5cN45UGDd9KtfypQrk1nB+YRhc1QvyA==
X-Received: by 10.98.71.91 with SMTP id u88mr159056478pfa.145.1470626735479;
	Sun, 07 Aug 2016 20:25:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:80f2:581:7ee3:fd31?
	([2601:646:8882:b8c:80f2:581:7ee3:fd31])
	by smtp.gmail.com with ESMTPSA id
	j21sm43413878pfj.75.2016.08.07.20.25.34
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Aug 2016 20:25:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160808013058.8636-1-stefan@agner.ch>
Date: Sun, 7 Aug 2016 20:26:02 -0700
Message-Id: <739DEE3D-E55E-4F24-98B3-393D609C7C3E@gmail.com>
References: <20160808013058.8636-1-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Fix busybox-init on non-tty consoles
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
X-List-Received-Date: Mon, 08 Aug 2016 03:25:37 -0000
X-Groupsio-MsgNum: 85416
Content-Type: multipart/signed;
	boundary="Apple-Mail=_28D9592C-FC25-4410-9C05-0160685BBDFF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_28D9592C-FC25-4410-9C05-0160685BBDFF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 7, 2016, at 6:30 PM, Stefan Agner <stefan@agner.ch> wrote:
>=20
> When using non-tty consoles (e.g. VirtIO console /dev/hvc0) the
> current init system fails with:
> process '/sbin/getty 115200 hvc0' (pid 545) exited. Scheduling for =
restart.
> can't open /dev/ttyhvc0: No such file or directory
>=20
> The first field needs to be a valid device. The BusyBox inittab =
example
> explains as follows:
> "<id>: WARNING: This field has a non-traditional meaning for BusyBox =
init!
>=20
> The id field is used by BusyBox init to specify the controlling tty =
for
> the specified process to run on.  The contents of this field are
> appended to "/dev/" and used as-is."
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> meta/recipes-core/busybox/busybox.inc | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc =
b/meta/recipes-core/busybox/busybox.inc
> index 5e91a26..4765c28 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -286,8 +286,8 @@ do_install () {
>                         for i in $tmp
>                         do
>                                 j=3D`echo ${i} | sed s/\;/\ /g`
> -                                label=3D`echo ${i} | sed -e 's/tty//' =
-e 's/^.*;//' -e 's/;.*//'`
> -                                echo =
"tty$label::respawn:${base_sbindir}/getty ${j}" >> =
${D}${sysconfdir}/inittab
> +                                id=3D`echo ${i} | -e 's/^.*;//' -e =
's/;.*//=E2=80=98`

what cmd is this piping it to now ?

> +                                echo =
"$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
>                         done
>                 fi
>         fi
> --
> 2.9.0
>=20


--Apple-Mail=_28D9592C-FC25-4410-9C05-0160685BBDFF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlen+88ACgkQuwUzVZGdMxSX6QCaAwYT0mut3i7aQL4F/7TO45Ly
RA0AnRtssSlXQbpjJENhanHRRJ9iTLQa
=QW5d
-----END PGP SIGNATURE-----

--Apple-Mail=_28D9592C-FC25-4410-9C05-0160685BBDFF--
