Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 284F060667
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 00:35:22 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id n5so187835230pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 17:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ufaeDIR6bUNSFagxK1CPCl9/wcxTKIbuyimRVlCNJmA=;
	b=WaKiI7ZbtPm6E4K5QrsYuz03gZmzb8e78AK8rwvqb0l2jOCaw2xUYt2NCuzPkZoRmJ
	oQ9M1DAB+T+1f7SWmwE+ZXIr7/lKMkLXPJYwnDVcjc6uQJCBImuxB9/FtQ+dYgHkNUNl
	/OI4lNK9d/UHQMw4Xoh5+J8HPA2qJEjDRcRjEKOvuWk+aMHbd/99flevb9n+iGCUfVUQ
	KR94gT4mZZG5T3ZV+p6JuHRoZU1p6FDaewxzZ8Z62Qjj0nZ3VmXTEyvAt5HREvf5qi97
	xljpxF6RmgabjYx61pgNqmdYL4rTgN+Z6lwvC1F+5Zh19OQgO4gQfiQ+krHjrp+FA9Pg
	mKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ufaeDIR6bUNSFagxK1CPCl9/wcxTKIbuyimRVlCNJmA=;
	b=C9oA1LSQ/DZvYRgFuRqCHYGFqsLLc2ez6fgrGtKoRiKY9cgRHN3zNATg4yn5iwN2L2
	4w7bfDvliN3ncjBkQlrgDkqKT1/HDFbR58oe2FzQh4H0wL9GI2qGghfK85eW7bm+rr9G
	wzznmSJnOLotmWnW4Yb+l3w7LA+5hZUHU2CtaPt6f0s7Tg/dtBmXNJmghWDR6GQ4pl5/
	WpjmulN8s12UcKcvoGvPdBJfao6ChMk/kxeJm03QCJ4iRK70kl6JbfH57MhYpvgCNZeu
	GEMWR4W+rvn89n/xnwlRQaZPh/jL5zFdUSchMqvrCLZ79YVmnsLrizqDatO7uCbOoyd4
	fHOg==
X-Gm-Message-State: AD7BkJJZfsmhEv+wVrxT1CrOT1h59Wo4gia6iNOxNjgKoYKgzUj8CRFagVgxKGr4XZziAQ==
X-Received: by 10.98.14.149 with SMTP id 21mr27625497pfo.79.1458347722724;
	Fri, 18 Mar 2016 17:35:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:79ad:121d:e03f:5232?
	([2601:646:8800:5a9a:79ad:121d:e03f:5232])
	by smtp.gmail.com with ESMTPSA id
	n19sm23579575pfi.53.2016.03.18.17.35.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2016 17:35:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1457352632-4609-1-git-send-email-awais_belal@mentor.com>
Date: Fri, 18 Mar 2016 17:35:17 -0700
Message-Id: <53D8DD3F-C83D-4179-9974-28EE2960F85A@gmail.com>
References: <1457352632-4609-1-git-send-email-awais_belal@mentor.com>
To: Awais Belal <awais_belal@mentor.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][RFC] systemd-serialgetty: allow baud rate overriding
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
X-List-Received-Date: Sat, 19 Mar 2016 00:35:23 -0000
X-Groupsio-MsgNum: 79825
Content-Type: multipart/signed;
	boundary="Apple-Mail=_422F325A-70AB-4936-ABC6-946F834ADC14";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_422F325A-70AB-4936-ABC6-946F834ADC14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 7, 2016, at 4:10 AM, Awais Belal <awais_belal@mentor.com> =
wrote:
>=20
> In case a getty is required on a UART which is not being
> used as the kernel console, the current agetty invocation
> fails to obey the baud rate configured through the
> SERIAL_CONSOLES variable because it uses --keep-baud.
>=20
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
> meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service | =
2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git =
a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service =
b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> index 182167b..e8b027e 100644
> --- =
a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> +++ =
b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> @@ -21,7 +21,7 @@ IgnoreOnIsolate=3Dyes
>=20
> [Service]
> Environment=3D"TERM=3Dxterm"
> -ExecStart=3D-/sbin/agetty -8 -L --keep-baud %I @BAUDRATE@ $TERM
> +ExecStart=3D-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM

this looks good.

> Type=3Didle
> Restart=3Dalways
> RestartSec=3D0
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_422F325A-70AB-4936-ABC6-946F834ADC14
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbsnskACgkQuwUzVZGdMxRrggCdGGbHUf0v4h2fDEbc7l4dT2li
h6EAn27nA0sPwlXWhMSpY6eUiHm3SjOk
=UPea
-----END PGP SIGNATURE-----

--Apple-Mail=_422F325A-70AB-4936-ABC6-946F834ADC14--
