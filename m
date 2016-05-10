Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC426FEF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:33:18 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id xk12so78528258pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 17:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=EVVdytvDnpBdulPeKXYo9B4F5mBgvcMDQHhBvtHn1Rw=;
	b=Zyt/WkfAHA8LJq3OxGnE3QfsEN+ESw+aZxUZG6paxnrl9aQhwkD9VKw/3gkvZi4+kR
	Zm614y3BHDIm28e09iUTDTDvWB7PY6lJJSo4NDXr9x1QwCZOSTA3OE9rCEz7uIgGQoom
	WXUg8txzpimvVZ0BSQf4gp2QcpZxNXwemcgxFqBnn4i4PIef6ocArzkuSz3sRHPgw4RM
	xHM/Dw1+zXbGnrg33yoep6t95eanrbWqYABCJxMoHOpEz/PzshPAdoaV4DDvbYA64Eow
	PDdPvUkypvCN6qJCQgWmJ6SQIJxvHXpFO45wXn0BG4ZI37yNnqa+NeARrwIvqSqOpIM3
	4gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=EVVdytvDnpBdulPeKXYo9B4F5mBgvcMDQHhBvtHn1Rw=;
	b=NoWGknatX1+DbQ7ko0Ztwt5dGWchCmTKAn97NiolbyBkFQQ7Dvu8004gBAzMI8fVBp
	7p98DuxVLtfuITVUEpAEFjQMJwXrJRmgiwov9uNDN9XC7sygutAnrrXF+h/E+lM9KGn5
	xVIIWBfuvEEQQ78y/dhps6loEmgU1laFfPNkHH1bNoIVBvUMMThp3CQKqOyWDVb8z3xJ
	VmMh1XiWMaBlLQktzV5xLoPI8xt9dehjqTsbcSvw1Xmr/92Ojlh5ujAl4cvbRN8fubtg
	Hl/lEqlaYaaM6FmOaxcwO7yFukrMqm7eiwfhQB3h7hY/G853WNfQiqKEVTaP/2WkTtj6
	Cagg==
X-Gm-Message-State: AOPr4FU55wYbcxrbIlNAiaMB50oZlTq+iv160cGXx9uPqAxUMZdDzvdP3IZnpAfORkptig==
X-Received: by 10.66.164.165 with SMTP id yr5mr54093258pab.133.1462840399694; 
	Mon, 09 May 2016 17:33:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1462:b3e2:90da:dbff?
	([2601:646:8800:5a9a:1462:b3e2:90da:dbff])
	by smtp.gmail.com with ESMTPSA id 7sm43150017pfe.88.2016.05.09.17.33.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 17:33:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <35665d96131a41adc73cd9149f0d21d23e796714.1462768634.git.paul.eggleton@linux.intel.com>
Date: Mon, 9 May 2016 17:33:32 -0700
Message-Id: <E4E7BA0A-D1CB-4AB8-BA73-4787319A5100@gmail.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<cover.1462768634.git.paul.eggleton@linux.intel.com>
	<35665d96131a41adc73cd9149f0d21d23e796714.1462768634.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 5/6] classes/kernel: check OLDEST_KERNEL at configure time
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
X-List-Received-Date: Tue, 10 May 2016 00:33:19 -0000
X-Groupsio-MsgNum: 81779
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9C8D3F8B-16A6-412B-A61F-FDA9F124AF7C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9C8D3F8B-16A6-412B-A61F-FDA9F124AF7C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 8, 2016, at 9:43 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> If the kernel being built is older than OLDEST_KERNEL and we're =
building
> with glibc, then the C library we're building is probably not going to
> be compatible with the kernel and we should warn the user. (This is
> easier to do here rather than when building glibc, because we don't
> necessarily have the information we need to determine the kernel =
version
> there, whereas we do here.)
>=20
> Fixes [YOCTO #8653].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/kernel.bbclass | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index fa0864c..af88cc0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -330,6 +330,20 @@ sysroot_stage_all () {
>=20
> KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} O=3D${B} =
oldnoconfig || yes '' | oe_runmake -C ${S} O=3D${B} oldconfig"
>=20
> +python check_oldest_kernel() {
> +    oldest_kernel =3D d.getVar('OLDEST_KERNEL', True)
> +    kernel_version =3D d.getVar('KERNEL_VERSION', True)
> +    tclibc =3D d.getVar('TCLIBC', True)
> +    if tclibc =3D=3D 'glibc':
> +        kernel_version =3D kernel_version.split('-', 1)[0]
> +        if oldest_kernel and kernel_version:
> +            if bb.utils.vercmp_string(kernel_version, oldest_kernel) =
< 0:
> +                bb.warn('%s: OLDEST_KERNEL is "%s" but the version of =
the kernel you are building is "%s" - therefore %s as built may not be =
compatible with this kernel. Either set OLDEST_KERNEL to an older =
version, or build a newer kernel.' % (d.getVar('PN', True), =
oldest_kernel, kernel_version, tclibc))
> +}

this should be an error infact. system may not boot properly if someone =
ignored the warning.

> +
> +check_oldest_kernel[vardepsexclude] +=3D "OLDEST_KERNEL =
KERNEL_VERSION"
> +do_configure[prefuncs] +=3D "check_oldest_kernel"
> +
> kernel_do_configure() {
> 	# fixes extra + in /lib/modules/2.6.37+
> 	# $ scripts/setlocalversion . =3D> +
> --
> 2.5.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9C8D3F8B-16A6-412B-A61F-FDA9F124AF7C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcxLFwACgkQuwUzVZGdMxTVdgCfbY43u7G1fdInMcRHwmVynVqG
V+8Ani9JitiJxm1B0MVku02hO4RC4YRW
=qoYb
-----END PGP SIGNATURE-----

--Apple-Mail=_9C8D3F8B-16A6-412B-A61F-FDA9F124AF7C--
