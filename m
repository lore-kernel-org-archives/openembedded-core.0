Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8D75E7DE5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 21:23:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h7so15543444wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 14:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=35ergjjmvCQzHL04+I8VN6UkPDrPB4MyxebjsRytz64=;
	b=QW4P015Wup6TuoJEDjhGx0UMhuhSxv731otxzH6MU7V5XcXZ83uFQcKe5E1zycmikf
	OHwwX0ZEL6L669ER7/RhcnwuUlio0Vf74/lI+CayNZ/Dbrdta4dU+SdALpzLLmCuTtA2
	mzQXMKt30TUkXnHAWXmBLENIr37sbKPV2KEKzYUbehgHjSd3J2a+rkj4W1bP+KqFYji/
	S3/yoYfpGGSgXn+kBUu6HFmGkg0JIW52g5t9bntVBnxU65/OONyIIbGRMvxCJ7VhvQne
	gm1BP7tr0ZN+HUuGfxzYNHf3Ra2gC9sfGhptexqCF+mg4mmC47nz8G+It5kFotE/FaCg
	SFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=35ergjjmvCQzHL04+I8VN6UkPDrPB4MyxebjsRytz64=;
	b=lJiZHPD9/twYqVrhvQk++IyiUhfAAYA/cU5KA5Q+WT0Dpc1PLshgXdwqGW/Nkv2+nv
	cFyhsmAiNjDLM9aXL7XavKevsJbyQ+xPqVsUTy4yrMcFfSQyLINZdh14AJmO78DtluDE
	N00W2eXY9F/r769c1huBdWND0o8y9N+c9Vg/e9yuSgxXcJ70gU7cMwzS6OdswdFxsa5g
	ycWH6bEdnJnlyQslGgGdKahHYxDH1t/hL2WE6QqkpXjO0ztRjsao9lKmae/tQA2mMIJN
	ucyhoqXUpYrdy3Q35ZysQKMsVGmBFtvr4L2w/hodIJpfrnhtghMmcR6+63oEHizDXwFd
	6Juw==
X-Gm-Message-State: APjAAAW+aprmIwNfGPKOehANrNkhdyFyo9s2C099BvAzeeAUh/ofzNZq
	R+YlPGTYZ8gWCgBA96eombU=
X-Google-Smtp-Source: APXvYqwuffrFjpsn8N2steqtcTmjHygBBJeFK88gZx5t28rDYyMSYK375pxNqNQFVj3ZSXBjnw6FUg==
X-Received: by 2002:a5d:678d:: with SMTP id v13mr948147wru.133.1569273806018; 
	Mon, 23 Sep 2019 14:23:26 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	e17sm9646902wma.15.2019.09.23.14.23.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 14:23:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Sep 2019 23:23:27 +0200
To: shuagr@microsoft.com
Message-ID: <20190923212327.GA1808@jama>
References: <1569273251-128066-1-git-send-email-shuagr@microsoft.com>
MIME-Version: 1.0
In-Reply-To: <1569273251-128066-1-git-send-email-shuagr@microsoft.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFvigJ1PRS1jb3JlXVt0aHVkXVtQQVRDSOKAnV0gZWxmdXRpbHM6IENWRSBmaXggZm9yIGVsZnV0aWxz?=
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
X-List-Received-Date: Mon, 23 Sep 2019 21:23:25 -0000
X-Groupsio-MsgNum: 129317
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 09:14:11PM +0000, shuagr97@gmail.com wrote:
> From: Shubham Agrawal <shuagr@microsoft.com>

Drop the quotes in the e-mail subject.

>=20
> CVE: CVE-2019-7664.patch
> CVE: CVE-2019-7665.patch
>=20
> Sign off: Shubham Agrawal <shuagr@microsoft.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   2 +
>  .../elfutils/files/CVE-2019-7664.patch             |  65 +++++++++
>  .../elfutils/files/CVE-2019-7665.patch             | 154 +++++++++++++++=
++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7664.pa=
tch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7665.pa=
tch

=2E...

> +diff --git a/libelf/ChangeLog b/libelf/ChangeLog
> +index 68c4fbd..892e6e7 100644
> +--- a/libelf/ChangeLog
> ++++ b/libelf/ChangeLog
> +@@ -1,3 +1,16 @@
> ++<<<<<<< HEAD
> ++=3D=3D=3D=3D=3D=3D=3D
> ++2019-01-16  Mark Wielaard  <mark@klomp.org>
> ++
> ++	* note_xlate.h (elf_cvt_note): Check n_namesz and n_descsz don't
> ++	overflow note_len into note header.
> ++
> ++2018-11-17  Mark Wielaard  <mark@klomp.org>
> ++
> ++	* elf32_updatefile.c (updatemmap): Make sure to call convert
> ++	function on a properly aligned destination.
> ++
> ++>>>>>>> e65d91d... libelf: Correct overflow check in note_xlate.

You should resolve these conflicts (or drop the ChangeLog updates
completely from the backports as they will conflict with any other
backport as well.

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXYk3zgAKCRA3VSO3ZXaA
HPaOAJ9qAe9QQUxvU3QaNmwIrIO+pRNfXACgpbKKRKGEicMF5WVltaLskuNT+Ik=
=yQrP
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
