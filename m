Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF90605BA;
	Thu, 28 Apr 2016 07:10:33 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id r5so29137027pag.1;
	Thu, 28 Apr 2016 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=eYY6dU3lrzQoYt2MZMZrdyRl3cJ7fI+IkmMCEqjrD0U=;
	b=qWPNkpgyl8/v72T8ztblOsOdtHZGtNX41gJNaHLFyunEUrPsx7wtFukc+a/bIXFGwU
	IpBM0svaC8UsWt6pE1IepjaqRX25rYP39cTLEwWmqV4NteJ+WUi5njKtssfa+VAM83r+
	JpH0LZdtCGEiLZ+HYIfmGOEUh4/EhTbXMZlffkheKujtDM56PRhB5vwSY0mN7UCoon/5
	SyTFIrDGt403rtGA2qwX46mGsJQ5EDoK1HBkEEHCXfs6X+DMY1QvUbi3DUh+4edB3Ccl
	slA1rvaHqKLthpCqPjNpl23R4svo5G8QVJL8lmSGuCo+cJaC7HhzMK3dqtb5/a1d0AKr
	wdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eYY6dU3lrzQoYt2MZMZrdyRl3cJ7fI+IkmMCEqjrD0U=;
	b=GNRAOqQ3tB1vjQz4XkG6HRxnj8n0oWozcYfNE2iGevNRXdfZDpODb/huPLUe3FKQDz
	5Pxj9y+vRPJXWRQpg6duWX5vVFPnlmHgMicInJqL36IsLIsss7C3ycMd+LqEifso1BnQ
	1NfKPtBA6+GK5aZ0ZdnknvqQOc7C6TxKaTQhalj4VfUHSSs5h08zJT/gxds+TjeQbq9+
	/s9yuNXA+zMjlQkzaC5SnojVKgRiFuuyt1MWyKyJM3jKbORjGnLVtbjo8oxw6t+AjFzl
	+rdsUTWBb1VQFWYBrgofGMuRtxZY6NC3JRSojmpildDn5EL3WHyZzTlqiAud0w66fY/g
	Qfuw==
X-Gm-Message-State: AOPr4FWU+/WzfN5lX1n77lNDldVhglUC16hsTz3prrZLUezlXiUxai2VE4+xFzO7RYRoSw==
X-Received: by 10.66.140.17 with SMTP id rc17mr3075858pab.129.1461827434721;
	Thu, 28 Apr 2016 00:10:34 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7c73:e571:eae0:530b?
	([2601:646:8800:5a9a:7c73:e571:eae0:530b])
	by smtp.gmail.com with ESMTPSA id e7sm5038954pfa.28.2016.04.28.00.10.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2016 00:10:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <246f9c39-736b-7ed6-b69a-69d8c4369236@windriver.com>
Date: Thu, 28 Apr 2016 00:10:32 -0700
Message-Id: <B59F2ADC-CB7F-44CF-9AD7-AD779FC2EEC9@gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<246f9c39-736b-7ed6-b69a-69d8c4369236@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: Yocto Project <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 07:10:34 -0000
X-Groupsio-MsgNum: 81345
Content-Type: multipart/signed;
	boundary="Apple-Mail=_48E3F51E-6CB1-41E8-ACCA-7DA3DE6B9C83";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_48E3F51E-6CB1-41E8-ACCA-7DA3DE6B9C83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Apr 27, 2016, at 11:06 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 4/27/16 12:53 PM, Khem Raj wrote:
>> thanks I think most of them come to these categories. So any help in
>> fixing them is welcome.
>>=20
>> 1. kernel older than 4.4, backport needed fixed into these branches =
or
>> move to newer kernels.
>> 2. uboot dont have gcc6 compiler header files, backport the needed =
fixes
>> 2. meta-qt4 needs to use gnu++98
>> 3. gcc6 providing its own stdlib.h in libstdc++
>> 4. gcc6 swtiching to gnu++14 for C++ as default.
>> 5. GPLv2-only versions of recipes are simply old will need fixing
>=20
> =46rom a -very- brief look, I suspect each of these fixes will be =
fairly simple.
> So as we move into the next oe-core phase, we should be able get =
through this
> pretty quickly.

I think yes, they are trivial, except the GPL-2.0 packages which might =
need patching


--Apple-Mail=_48E3F51E-6CB1-41E8-ACCA-7DA3DE6B9C83
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcht2kACgkQuwUzVZGdMxQTcACbBE4sxSG+TKbhvShbeyl8GbSd
5t4AnjieTP1KF3VDbFWSj1TMwcr6548s
=TCWD
-----END PGP SIGNATURE-----

--Apple-Mail=_48E3F51E-6CB1-41E8-ACCA-7DA3DE6B9C83--
