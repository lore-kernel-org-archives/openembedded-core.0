Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D540D7713F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:07:24 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id 128so119840955wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 06:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=66CBpi4nToNCVQgNFd+0kvtn7WVSK3hdbtYhVQc4RIQ=;
	b=Ua+12k9uAX7BTG48OTXWRYse0YJGukJ6E5TAqf643yNXyRFtSnjpZJPkjyEYoTmW7W
	UGRjsKBtDiaNr40Yln6ju+gD7/Go8pk6EDuY3H84fSGFQQ3oTvIOaJmTQc52VhUy5jtd
	Kam+o+sb42gcWKIu13gqvqFBJuXSY28ih7O8bAlDvv6HNB4YLu1qwCskrm9TWh+jtWTQ
	JMMVm7/CXcF+99pGnYthi770auvs3LngkwOgE/xGL3wWu0hYgIx4rU/w00+TrBbtFvDw
	cCWFg5Ys7CnVIFvu6UmVyvr5XffuYL8nmYJGorLahAe3myM6HF2SxfyF4DOeWZjjW6W5
	PnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=66CBpi4nToNCVQgNFd+0kvtn7WVSK3hdbtYhVQc4RIQ=;
	b=KUihADejTmQFgFgmvQMyAAuhgMDvMvefEAsO7DPCxgrF7JfjsWvEeE7MMFveaz8brO
	uNiQPp+6lbmkAZ8YMlGGh/Cwr1pizo7u3pmbDv5jlVZlbS1q8woljfu7bDbydc0vDgnB
	/Z6NVj2Lbxdr2xOdrFJTqtSlLYaoaYqQJrZuXLc/zZlEPHvTLNeXMDSTi1wAhRbINLsX
	BnkkESm4rWoDL9yMmkONFL2GsJ8CNsl7psooEY522pv5rAgasHgbgXOUhDw5TRRLtss3
	0vpMiDTJfYhCS2nCpNSBckRUaBxWHoKkYdD7oqep55K8r/7mXdqK39LgOEE37C8sBzvg
	CRJw==
X-Gm-Message-State: AG10YORUrpcJx10qPubaOecaps0cRbGnwCWHBE6r7Ns1lPHA4Zm5aR5H4f1OStQJLd9/TA==
X-Received: by 10.194.242.67 with SMTP id wo3mr27994349wjc.180.1454422045067; 
	Tue, 02 Feb 2016 06:07:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	f205sm3102605wme.4.2016.02.02.06.07.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Feb 2016 06:07:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Feb 2016 15:10:18 +0100
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20160202141018.GB2607@jama>
References: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
	<1454419635-10822-4-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1454419635-10822-4-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] python3: set INSANE_SKIP as libpython3.so is a trampoline library
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
X-List-Received-Date: Tue, 02 Feb 2016 14:07:25 -0000
X-Groupsio-MsgNum: 77280
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline

--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 01:27:14PM +0000, Ross Burton wrote:
> (From OE-Core rev: b7059f16fa4eb8795a4bec3f86d4ea309beaf485)

This points to master-next branch and will probably became invalid next
time master-next is rebased.

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/python/python3_3.5.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes=
-devtools/python/python3_3.5.1.bb
> index 0d9a4cc..54007d3 100644
> --- a/meta/recipes-devtools/python/python3_3.5.1.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.1.bb
> @@ -211,6 +211,7 @@ FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MA=
JMIN} ${bindir}/pyvenv"
>  PACKAGES =3D+ "libpython3 libpython3-staticdev"
>  FILES_libpython3 =3D "${libdir}/libpython*.so.*"
>  FILES_libpython3-staticdev +=3D "${libdir}/python${PYTHON_MAJMIN}/config=
-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
> +INSANE_SKIP_${PN}-dev +=3D "dev-elf"
> =20
>  # catch all the rest (unsorted)
>  PACKAGES +=3D "${PN}-misc"
> --=20
> 2.6.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlawuMkACgkQN1Ujt2V2gBx6QACcCiRXDhjk0VgdXXljeBRrG36m
E6sAoIpLRgs3db+xc1gbu6APwW9UTBbZ
=qgiQ
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
