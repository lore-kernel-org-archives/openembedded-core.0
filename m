Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF9AF60646
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 22:11:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so20365072wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 14:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fOvKxogj3xG3Ryst5fXBJLeWbvLtTJ86atJcaBGKZU8=;
	b=hpf5zFtub/qvnUzcG7W1jk7OhxMEYc4eSWy6gmCrfg0rGQqkAn769BOhUWSVlqJVX9
	VUYwJ7+80mx8jxJKZiNu+Fuavptze0fmmBDStMxGuRWjme6Q0hPcRPgePTsY1PcQKP8b
	vRwHxdbIkXeGhCBvIBnPVw2N1dhjxjVMxj4gcRatOlqKLwxtgqQcKPho0n7yIpnbGCKS
	QUfLJoB5Q8RnUPDUMf04k76IZIgOqsAHOVJlK5nxuiPyZyUeufPMPafc4ps2gDtKbG/C
	Az0aEOBDnDvmEqbNW3OJb4wBvy8qHD3IMp9H1Ozw3meKBRD+rbEoiL2td44pVndMrfCT
	HLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fOvKxogj3xG3Ryst5fXBJLeWbvLtTJ86atJcaBGKZU8=;
	b=S/hHI1hnZJfi8t9qkd0l2PhYpyScFZUUYk6FsT/p6Y/G9aysQQEWVU4mTZKrGLCxPP
	Zjove0vJtm+ZKlqyPfYL9sBqYZjrZjCSPBWD80SsEbUBG7fdTwEojZcdQ5fDcJj9FgGW
	nWI9Wqm/DKu4tJsAq68ma2J2KRuV/AWZWdjCkSMY6m+dcGMa9sx41z0/rIF3Uw7XZU0x
	GXUtiFv9t37QQSVvFYg//Cg0RM2i7p2IUqRCLLDAS97NKb2CJbmgs1bp/11xfm+rgqyM
	CER7fXC/czaH2RZBByz1ZbGNO+GDHuFwUv/aqLkuGzJowKy1ngo2AvN4HzUL0VY+RDj5
	M+tA==
X-Gm-Message-State: APjAAAVtBCQw6qYY5yZJMeKGtTgPKYKQq2ebpGQKEmF1Z9iyhwM2coCM
	oMaieKA+XcMVN7Pw3qRPen8=
X-Google-Smtp-Source: APXvYqzgBFNxhJuX+dAxBBZavQiNPU/jVHfH9y7o7K+Qx7s7YR9+tgP/3BuRAQ3OIqODEAe+YUkL4A==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr17654598wrq.412.1580767903657; 
	Mon, 03 Feb 2020 14:11:43 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	h17sm27987494wrs.18.2020.02.03.14.11.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 14:11:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Feb 2020 23:11:42 +0100
To: bruce.ashfield@gmail.com
Message-ID: <20200203221142.7jljrrrjxic3qtau@jama>
References: <20200203212641.57611-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200203212641.57611-1-bruce.ashfield@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kern-tools: tweak symbol_why to be python safe
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
X-List-Received-Date: Mon, 03 Feb 2020 22:11:44 -0000
X-Groupsio-MsgNum: 134470
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="myjafk3ybbhltpbg"
Content-Disposition: inline

--myjafk3ybbhltpbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 04:26:41PM -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Updating the SRCREV to pickup tweaks to symbol_why.py to be
> python3 safe:
>=20
>   - we explicitly call /usr/bin/env python3
>   - we full specifiy our symbols
>   - do not assume that 'None' can be converted to a string
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>=20
> I didn't realized the v5.4 series had gone in, or I would have
> send this sooner. This should resolve the errors that are thrown
> when symbol_why is run to detect missing symbol dependencies.
>=20
> Bruce
>=20
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/me=
ta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index a4c0b6fb8a..57ec1abc6d 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=3D5=
;endline=3D9;md5=3D9c30e971d435
> =20
>  DEPENDS =3D "git-native"
> =20
> -SRCREV =3D "7465c8497893ef8f6503c918aeede969f7e9753b"
> +SRCREV =3D "5358eb293399867db05fd73d04ce908d69a03bed"
>  PR =3D "r12"
>  PV =3D "0.2+git${SRCPV}"

This needs a bit more cleanup for python3.

DEBUG: Executing python function do_kernel_configcheck
Traceback (most recent call last):
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _expand=
_macro
    res +=3D args[int(new_args[0])]
ValueError: invalid literal for int() with base 10: 'error-if'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/symbol_why.py", line 295, in <module>
    conf =3D kconfiglib.Kconfig( kconf, show_errors, show_errors )
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 947, in __init__
    self._init(filename, warn, warn_to_stderr, encoding)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 1085, in _init
    self._parse_block(None, self.top_node, self.top_node).next =3D None
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2982, in _parse_=
block
    prev =3D self._parse_block(None, parent, prev)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2907, in _parse_=
block
    while self._next_line():
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2234, in _next_l=
ine
    self._tokens =3D self._tokenize(line)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2364, in _tokeni=
ze
    self._parse_assignment(s)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2604, in _parse_=
assignment
    s, i =3D self._expand_macro(s, i, ())
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2780, in _expand=
_macro
    res +=3D self._fn_val(new_args)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2843, in _fn_val
    return py_fn(self, *args)
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 6769, in _error_=
if_fn
    kconf.filename, kconf.linenr, msg))
kconfiglib.KconfigError: scripts/Kconfig.include:39:  gold linker 'x86_64-o=
e-linux-ld --sysroot=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux=
/linux-yocto/5.4.15-r0/recipe-sysroot  ' not supported
Traceback (most recent call last):
  File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _expand=
_macro
    res +=3D args[int(new_args[0])]
ValueError: invalid literal for int() with base 10: 'error-if'

During handling of the above exception, another exception occurred:

and the log is full of this (the warnings at the end look the same as befor=
e)

# wc -l /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/temp/log.do_kernel_configcheck.28364
11804 /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.=
15-r0/temp/log.do_kernel_configcheck.28364

Maybe kernel_configcheck now needs KERNEL_LD exported as well? See:
https://patchwork.openembedded.org/patch/169702/
which fixed do_configure with 5.4.

--myjafk3ybbhltpbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjianQAKCRA3VSO3ZXaA
HAgmAJ9AXro7GIutSzupo7bV1Lsl+9TT7wCguNXaoF+GO//T9NF4N8h4LRrCJZU=
=yzZu
-----END PGP SIGNATURE-----

--myjafk3ybbhltpbg--
