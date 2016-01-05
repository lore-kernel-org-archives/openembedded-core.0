Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 60ED373180;
	Tue,  5 Jan 2016 21:08:30 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id uo6so201780975pac.1;
	Tue, 05 Jan 2016 13:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PZZwuJdKP0FzJdrnTqSoyz2aQ5xx96uBr/RpPuzC8no=;
	b=JK9mIV1ylrEtGK7nI/+swPiaCn5na4tYJ1xMwjTWM/tlbnrN+SpE3zeH3c0dlya56+
	fBiEFuhFAj1oPj9Sn1gkZ1MNyY8pN/6hjdHF513cQiD6dejiEJNIxHkekE3DC5UIOZ1a
	AUkSwPQl0aYye+GvS9HZ+Qt9BmteoQtZsc4s5e3WXVeY4MoOiopEbl/zSzrLdWCYDmdF
	qJvYav3OZgVnKpx3yMM0anJ9cm9Rc8ZKZOLG+36FuNV60L2kGKP1lCspt6O6gZtxLNxl
	3+05RDeg4H2sji2rg0DOYz2i96/4/SohDI0VNxT0xM9OmpOz+SUSS4hlEvyqfo/uwVYy
	Pm5A==
X-Received: by 10.66.252.6 with SMTP id zo6mr70206644pac.154.1452028111676;
	Tue, 05 Jan 2016 13:08:31 -0800 (PST)
Received: from ?IPv6:2601:647:4c01:b37d:41f6:2669:fdf0:2010?
	([2601:647:4c01:b37d:41f6:2669:fdf0:2010])
	by smtp.gmail.com with ESMTPSA id
	g68sm93249721pfd.55.2016.01.05.13.08.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 13:08:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
Date: Tue, 5 Jan 2016 13:08:31 -0800
Message-Id: <A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFT] glibc 2.23
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
X-List-Received-Date: Tue, 05 Jan 2016 21:08:33 -0000
X-Groupsio-MsgNum: 75477
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1D168DAA-6405-47C7-9367-3C176EAFD116";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1D168DAA-6405-47C7-9367-3C176EAFD116
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Jan 5, 2016, at 8:17 AM, Burton, Ross <ross.burton@intel.com> wrote:
> 
> On 4 January 2016 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:
> 
>> I have done OE-Core only clean world builds for all Qemu machines
>> without a single build failure and
>> runtime boot tested.
>> 
> 
> I threw this at the autobuilder and glibc failed to build on one of the
> runs:
> 
> http://errors.yoctoproject.org/Errors/Details/26057/


Thanks Ross, what MACHINE did you build for ?

rtld.c:1:0: error: SSE instruction set disabled, using 387 arithmetics

I think I have an idea whats going on. It was fixed in glibc 2.23 but maybe
not in all cases. I will take a look at it later today.

> 
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_1D168DAA-6405-47C7-9367-3C176EAFD116
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaMMM8ACgkQuwUzVZGdMxQGNwCfXlr124fO27XmEKneui5UF6mg
Uk4AoJG7r5rqzT5d2LZUbakQSgwFEdbh
=PQtd
-----END PGP SIGNATURE-----

--Apple-Mail=_1D168DAA-6405-47C7-9367-3C176EAFD116--
