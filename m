Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBE671CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 18:00:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so1849180pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=zLcrtv22GrHlb0AaLYo9S5Di+Mu2dToza6KJp62VOFM=;
	b=e0H4y9+IdBwQxgxSZL+j7j6r81/Xbzs7ap1atu6lowuBiugZaWjWsSqcPaZfVfb2vV
	9QYTSRXq23i9Pvpi0dpSPFPByBK6FWMRSerum/HjJHa9eJjQxb6lwzA4XE9ccDNk1DFC
	ls6NpWFTfgrFlPVxAv8zNYLsyDdUhkGWZK3l5FTcUBRVq0n5iBHGIizdFvcxBtSYkwmG
	k8V8mPVJMDj4wNyJOblUshz76vFAsNmeTk4S1S4tCAVTu0tb9wpmA6Us3rpN87v+2Fyu
	vfxDHTR040y3fiXe4IQrAhCp+PSX8E73TfZB/MKV7UeftplKJUPJGWG2yrsz4+IUQhdF
	7C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=zLcrtv22GrHlb0AaLYo9S5Di+Mu2dToza6KJp62VOFM=;
	b=JlyxQ2vD+710oPJs8bQbC/8PXBsyeEmGE/xZkRz4ZyEshYxB+wy5Ne6xXARFmpCw1c
	1bpZ+HGRHJRCi0ahYVSDSIrA6mfgiG2qGUROLImVRmoW+vl/WYicnnD78+KiwoWrh7VR
	1kVQ5DrrjvtmLu+0Y9XlkJgspnacGrS6iIwdwVgssD/O6rXtQcIEySuuCG83PE8EernN
	jKXLrp1CiirP6E3+GdHTVycjUK/D9FGMMD2j2adWF0hu0fz7KTUlMcQeCHf9chJYH9g6
	RRJuQGEZJq3FOQUADNUJsm4cd1nl7ltP0uV5tqPtVyxV/igwEGGb3fsD2FPE0tXdfJ2C
	OWBg==
X-Gm-Message-State: ABUngvfcjEAb4uSbdPr1YQMOteBqxuIrT4YWF5AQp2KSCs7mhRrkJ4i6OZm5Wprj20XAFg==
X-Received: by 10.99.0.196 with SMTP id 187mr22093104pga.78.1477677622933;
	Fri, 28 Oct 2016 11:00:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:3551:a82d:200e:cc39?
	([2601:646:8882:b8c:3551:a82d:200e:cc39])
	by smtp.gmail.com with ESMTPSA id s3sm8118111pfe.27.2016.10.28.11.00.20
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 11:00:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20161028143627.15891-1-linus.wallgren@scypho.com>
Date: Fri, 28 Oct 2016 11:00:20 -0700
Message-Id: <D2F9E708-19E4-4967-AAF5-5D9C1D9941EA@gmail.com>
References: <20161028143627.15891-1-linus.wallgren@scypho.com>
To: Linus Wallgren <linus.wallgren@scypho.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Reload configuration on package install
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
X-List-Received-Date: Fri, 28 Oct 2016 18:00:21 -0000
X-Groupsio-MsgNum: 88741
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D5B89E80-1865-49BF-B14D-02CE0D108459";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D5B89E80-1865-49BF-B14D-02CE0D108459
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 28, 2016, at 7:36 AM, Linus Wallgren =
<linus.wallgren@scypho.com> wrote:
>=20
> When a systemd service file has changed it is required to reload
> systemd's configuration. Otherwise changes to a service file will not =
be
> picked up during package upgrade.

while this seems reasonable. Does that happen on other distros using =
systemd
too ?

> ---
> meta/classes/systemd.bbclass | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/systemd.bbclass =
b/meta/classes/systemd.bbclass
> index d56c760..7e51ed6 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -29,6 +29,10 @@ if [ -n "$D" ]; then
> fi
>=20
> if type systemctl >/dev/null 2>/dev/null; then
> +	if [ -z "$D" ]; then
> +		systemctl daemon-reload
> +	fi
> +
> 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>=20
> 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
> --
> 2.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_D5B89E80-1865-49BF-B14D-02CE0D108459
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgTkjQACgkQuwUzVZGdMxT8egCeNRWUVAZ6R8Fse/NbvvF+F8tQ
ttIAnR6hPUHdv3RDoOwJDuhPCqgLnc7V
=F/qg
-----END PGP SIGNATURE-----

--Apple-Mail=_D5B89E80-1865-49BF-B14D-02CE0D108459--
