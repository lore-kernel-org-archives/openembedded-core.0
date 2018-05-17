Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0147F74916
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 14:01:20 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id o80-v6so1481587ybc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JZuQaKy0/yOsjz2KJVp0MnAaA+x4atyXnFmexRff2JA=;
	b=GZvL5qYzyhYq2JAOX/RV/LGsU+rXSxFcqVVw4yNI63ZraUf+/3Riw6XMc5p2myehp9
	uUCD/uIdk99xbAL++ZtUpFQUv+ebxUAypppuQSCsx7I0uYpOsKQpCjzASJI1mgf18l0m
	G99oXMBVBNKZtKxRcgyU3LnjcALLSRWJx4/TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JZuQaKy0/yOsjz2KJVp0MnAaA+x4atyXnFmexRff2JA=;
	b=iJMmu8k7A/y7LOxQprgv/JCZjnz7ptiOMZhCMMa6aBYuKZc/s52tX9Ft61e0Ldg8D5
	4z2azfTysDCP7If/5iKnGKNhZv8mnS9h6SHsKhqTTceE020qDX6WKanSIP5Dvz7D2FJO
	acZdqLvrvHFxxl9oxHlHQMYCAYTwrLfbqn7yLCDTurpfROjZXBCX67RqkiDnOMOfe03F
	B4Bf/y+HxnzIkwMGLFpp+dn49/5eksiU3w6SKurxz71ZgPLVY30c28MqdkQIRR0sS+mi
	MT9olvE08DE6L8YAvwvvMrlRyTYi0JB42K+cOudrdiqxRnj3DI867cHfu1+2xuPOLVAq
	R4ug==
X-Gm-Message-State: ALKqPwfKGpJiiDSKEGcVu6wRpGRah6LBfdSEorvslPUE9LxFRLpj2Qvo
	JAFwMHSgkPAjADBBZhD4neARGw==
X-Google-Smtp-Source: AB8JxZrAhLKN1Y+sBjzrxHtZY1f4x7aUmjwf9vZ/b+F3Ol35JfmhXiRuLVxTE5//tp/UQX3sWJmKzg==
X-Received: by 2002:a25:6084:: with SMTP id
	u126-v6mr2232177ybb.288.1526565677820; 
	Thu, 17 May 2018 07:01:17 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	z143-v6sm1956493ywa.85.2018.05.17.07.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 07:01:16 -0700 (PDT)
Date: Thu, 17 May 2018 10:01:14 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <20180517140114.GD9871@bill-the-cat.ec.rr.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
	<CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
	<3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
	<8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: auh@auh.yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Thu, 17 May 2018 14:01:21 -0000
X-Groupsio-MsgNum: 111478
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xm/fll+QQv+hsKip"
Content-Disposition: inline

--Xm/fll+QQv+hsKip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 12:33:24PM +0200, Marek Vasut wrote:
> On 05/17/2018 11:53 AM, Alexander Kanavin wrote:
> > On 05/17/2018 12:56 PM, Burton, Ross wrote:
> >> Looks like AUH runs as a x86 machine, which is why it doesn't catch
> >> u-boot.
> >=20
> > Also we have already discussed this 2 month ago. Marek, as the u-boot
> > maintainer, can you look into enabling u-boot on qemu please?
>=20
> Wouldn't it make more sense to fix the AUH so it handles U-Boot and
> similar packages correctly even without the qemu dependency ?

Note that in U-Boot we run (and run test.py on) qemu-x86 and qemux86-64
so there's no reason these days to mask U-Boot out.

--=20
Tom

--Xm/fll+QQv+hsKip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa/YsqAAoJEIf59jXTHXZSk+AP/34UT5fAvBD+YF9EG2EBU9GP
xEns3Y+t3H45MDxXu5R67gJROYxEbI3r3GafuZgpr8zI/Fs3jV+PoSqlOLwB5IrA
fmWa3K1nbyjIq5KU6oO4jEPR++DXZGf5XY5Kl38yq+BKEN/C3KVpHC4L9lfnBLuz
/xjBUtEhnRfyPt8Lkg3HvqvU7sBQ4q3uvraedBRxmCkM2GRkZcpiW0qINmUKZqX6
VlttQZ5/xF66gMUkke8PXlHJ0QECaFeKKcLIe3sd2KVDLR9PXPDiCHqXC+p+LeFn
HG9WkgxZ0/hao1Z6aOZAz/QcOCra09uZrOPUUJH+XYZ9heGzDVd/L6uWiQxyEtHw
KIt+W7ltKY/8upMdPN6NBjGRZAUv2kF+GD6eSzqoaU0P1ZC5h+pQFL3Y9xjkfHCF
I8CfPLBy1pn/iC2kQTHRT8YBFigMz4lAldNiM+6LPBr6WD6NS7HnAyTwnLHlp/A7
d6asEtjroRFJv3gu88laFLUxURHPbwAVuBMP1PTsCFjox9KFUntsKnsdIkWpQW76
RRLHMOa12gTUS0YouEK6yp9o3ue5kJ0oG5ND4ag5C8lhI9BVjt0RmSQ/Pe5kYOWy
acDb2KGCq9OwYaJJ7wp4ISyF5Zzmr/fLqfm7258upm22jyCcfmeGGilq+pRechJ4
T3IhFv4333+myQxZ2qqf
=liW2
-----END PGP SIGNATURE-----

--Xm/fll+QQv+hsKip--
