Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4322377DB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 17:14:28 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 81so18730102pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 10:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=fT4ExCzntheCVrE2qONUwr3EQyP0K9HOzJJnKAeXLgY=;
	b=gxmdfCBZts5BvjkKBSBQaL5fZZ01YJKs8AtsvYWQQoL2K/HHqgC0D1z6jRTLaqLA41
	ItqUr+yn2i7pcZSQ3xkCAm8yt9FaZxhsM4JqOIjn4eBAxyZNH/OG9XM2wUkM+/VYAnhS
	IdDdzMBx1rrUOswM14PYqJ0P57aeG2f6qlEdfSCNi/9uHPGFM2fvRbCWuSTaGRAaomoa
	QECr83y8cbTOP1DS7wNrftoKwPDFCx4SzmQGw1WO4skUrvRVtnN4ZmkHQAwBnAf2MhBF
	Fi0JArsr62s8y4kiMLkJ+8msm/xxb8pZciG0B0sejc/wxQJqZ8x3E+TUcTH0Io5uwQhU
	eMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=fT4ExCzntheCVrE2qONUwr3EQyP0K9HOzJJnKAeXLgY=;
	b=qjaS1NdKkUI/ubBblzuGfPG23MbzJl6Ue/AkckoeMbRxH1Vi8Mb3HszkPjP8SSaYhp
	+R+TmyBCksVxsubyO/MxflRcvlD+J9QmM+b4m2irvbWk7DaaTdMMsNpCPKA+7t+R0L1l
	Mlc8HG/eXnRxRYKLPOk8q/fZDHXOKZX0g65yhMDCxe0Wf1mT23T3J0a1PoGa/mjZsf5h
	HdvyF2zPXDFt5z0NFpAjkTex3nnuXeOo8d7Z6S0zd0x414fbAlxDWh6FbcyBC7ObilOn
	jxyZ1gZdB96veAnJa6ZRFfF+OyV/gfAIa9or307/0MNn0j41Xf1PbcHdtFtNrUgppQ1t
	Ky7g==
X-Gm-Message-State: AFeK/H0pq4L5z6DNvTPxGAgByy2Eqr0A/sb6F5Me7vvFFi1iZf9/VMjPATo2H1RHO5M5qg==
X-Received: by 10.99.206.5 with SMTP id y5mr4262693pgf.212.1490980469741;
	Fri, 31 Mar 2017 10:14:29 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:dd64:9ebc:182c:f6cf])
	by smtp.gmail.com with ESMTPSA id
	l29sm11686312pfb.118.2017.03.31.10.14.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 10:14:28 -0700 (PDT)
To: Daniel Schultz <d.schultz@phytec.de>,
	openembedded-core@lists.openembedded.org
References: <1490964707-38823-1-git-send-email-d.schultz@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <469f1f49-8d57-b43a-7aa9-950c4d6afebe@gmail.com>
Date: Fri, 31 Mar 2017 10:14:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490964707-38823-1-git-send-email-d.schultz@phytec.de>
Subject: Re: [PATCH morty v2] wic: partition: Run fsck on EXT file systems
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
X-List-Received-Date: Fri, 31 Mar 2017 17:14:28 -0000
X-Groupsio-MsgNum: 95643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="No3Ikut21QmVnWuvqrgB78AQFWKi10Bpw"

--No3Ikut21QmVnWuvqrgB78AQFWKi10Bpw
Content-Type: multipart/mixed; boundary="BrhxLKbtf3uKpELe47m5517E4wWqHCAhj";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Daniel Schultz <d.schultz@phytec.de>,
 openembedded-core@lists.openembedded.org
Message-ID: <469f1f49-8d57-b43a-7aa9-950c4d6afebe@gmail.com>
Subject: Re: [OE-core] [PATCH morty v2] wic: partition: Run fsck on EXT file
 systems
References: <1490964707-38823-1-git-send-email-d.schultz@phytec.de>
In-Reply-To: <1490964707-38823-1-git-send-email-d.schultz@phytec.de>

--BrhxLKbtf3uKpELe47m5517E4wWqHCAhj
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/31/17 5:51 AM, Daniel Schultz wrote:
> Mkfs may create EXT file systems which can only be optimized by fsck
> and not by itself, e.g. directory optimization (in Pass 3A).
>=20
> To prevent those optimizations during runtime, it will be performed aft=
er
> the creation of an EXT file system.
>=20
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  scripts/lib/wic/partition.py | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.p=
y
> index 3b3bd2d..152eb7b 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -239,6 +239,9 @@ class Partition():
>              (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_di=
r)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
> =20
> +        mkfs_cmd =3D "fsck.%s -pvfD %s" % (self.fstype, rootfs)
> +        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
> +

is this required on master too ? if yes I would suggest to propose it
for master and then do a backport.

>      def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
>                               native_sysroot, pseudo):
>          """
>=20


--BrhxLKbtf3uKpELe47m5517E4wWqHCAhj--

--No3Ikut21QmVnWuvqrgB78AQFWKi10Bpw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljejnMACgkQuwUzVZGdMxT9IQCeIGr+RRBbbbKErqnakWkRUe95
xikAn3GONFGXoF1mh+18fgo0fGeX6mRa
=HwKm
-----END PGP SIGNATURE-----

--No3Ikut21QmVnWuvqrgB78AQFWKi10Bpw--
