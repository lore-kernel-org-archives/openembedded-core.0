Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8387197A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:39:43 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r16so13624423pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=6qkDZ6K/OufPPz8dFI7Zlcy3ImqUHs/5Y2Pf28/UDic=;
	b=vc+YnTBhReMq1fIwp0SXskl1MbBrSkjDmPzIJmWj38T8nr35sQThjoM73DWR0FPUoD
	XWLPV4FJlY66+ROZXwPORDXVddC80Zux/dXtiWABGddHYmYemF3BC0zUB2bXMWjhuYxk
	ilR3/zfncifKdS7UEFViPL7AWJ40ljMwQyrxOHch5aGqvO1KC/6X3zy+RrIFint07b/+
	2uoM0QsROQpDdNgtnL1yBlISrN5CS4PsOQnBWl9AOxqmMNlFV2VcxKHutr6LYP2aemj1
	jBkUDtvB9qAdp2Qd5jtmlzxR3d/wQzP777mMutnaBoXzYI7RprXJpHLcUF0K7iza3WbY
	k8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6qkDZ6K/OufPPz8dFI7Zlcy3ImqUHs/5Y2Pf28/UDic=;
	b=J3NbxxHi0siJpg5Xt/SN4lHyLrqVP0i3YRmj8jCjrh1STxcRpZu2U9rvKpTAhTfGAe
	6rx1NEy7Hoq3rPmphqV7QWaZL07tdbLzfyr8ytZbCHIo54dHYMJA+IxBL4TY4XRdwfX1
	BcGPBtMb7ijNMrMPYok3c2GVUxShF7l4y5DgD4Hv62IW3WIYAzTcPIDgQppcrYzm8C5q
	JG6J/Uzo/PAhS48bNGFl28qJBdSBNNOEYS75mC0swPEZ31i2SC0pipjvxpFa4zTjeaaB
	6pxdgIgk/9FKKkqOBG8C3VunVp84CFHyaTEJJAUdpKlcPeWyaKhK9xP5CkU3IOVvRvu5
	3ZDQ==
X-Gm-Message-State: AA6/9RkmmxUd2J5udQPPLjAinKyx1FyhKGpMSWEDAVkmKW9ZAQTQ+VvYdrMP9mEMemfC3g==
X-Received: by 10.99.229.17 with SMTP id r17mr37613pgh.97.1476747585319;
	Mon, 17 Oct 2016 16:39:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ec00:906:f8cb:31c1?
	([2601:646:8882:b8c:ec00:906:f8cb:31c1])
	by smtp.gmail.com with ESMTPSA id
	s64sm50542756pfk.81.2016.10.17.16.39.44
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:39:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476203492-34253-1-git-send-email-juro.bystricky@intel.com>
Date: Mon, 17 Oct 2016 16:39:43 -0700
Message-Id: <F6C44CA5-B615-4B5E-9878-A3BE33E35822@gmail.com>
References: <1476203492-34253-1-git-send-email-juro.bystricky@intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-arch.bbclass: Add xtensa and arc into valid_archs table
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
X-List-Received-Date: Mon, 17 Oct 2016 23:39:44 -0000
X-Groupsio-MsgNum: 88294
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A1839F49-F3FC-4E4C-90E5-E74985D607E4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A1839F49-F3FC-4E4C-90E5-E74985D607E4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 11, 2016, at 9:31 AM, Juro Bystricky <juro.bystricky@intel.com> =
wrote:
>=20
> Both "arc" and "xtensa" are valid Linux architectures, add
> them into valid_archs table.
>=20
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
> meta/classes/kernel-arch.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel-arch.bbclass =
b/meta/classes/kernel-arch.bbclass
> index 8a4bef1..ea976c6 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -14,7 +14,7 @@ valid_archs =3D "alpha cris ia64 \
>                parisc s390  v850 \
>                avr32 blackfin \
>                microblaze \
> -               nios2"
> +               nios2 arc xtensa=E2=80=9D

there parisc etc as well so in essence patch is ok but I wonder if we =
should
remove the arches we dont actively support in OE or extended OE =
ecosystem.

>=20
> def map_kernel_arch(a, d):
>     import re
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A1839F49-F3FC-4E4C-90E5-E74985D607E4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgFYT8ACgkQuwUzVZGdMxSA2wCdEDUIDcHvVCGjQUFko1ESs38q
9bsAn1ZkzAfpnyFYxr3eCDVsnpbYi86J
=WjM9
-----END PGP SIGNATURE-----

--Apple-Mail=_A1839F49-F3FC-4E4C-90E5-E74985D607E4--
