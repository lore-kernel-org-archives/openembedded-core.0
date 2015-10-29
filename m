Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id AC59F755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 18:32:53 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so41984232pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=S1WlP+n3MoD+WsUPDQWkBAQ+0wPZoTQuKYS0Agac2Dk=;
	b=WaR96s+rtBG31OOwQF3Fjk0nVNsauCbN/8df7kAdTEKtmw5qTCt3rLH/9oU5/Ecur0
	r89JdL9Cp52nejne9WYxKTdTnAGlKsXkcmWB+R5Oz8Yok4PLkqElkjvLkQOOn71WpKfC
	p4hNCVa2gvYvmbh50GEfdrgSWi3y5yiHhkP5IZfxBUm/yoAHnQqiAfsxSNpf0gH1qLPl
	EBnvR/40GcFr7q4kPEgbcN3RFc03cr68j/3sw/se7JHB7JEoksYTWeyiZGKseL+ousls
	wznjqKXkB7SlngxTDinIta0QtTZ2SaKXSZxX759Yuzf4z66pq7JtGxy6TpO3TX3GRGZU
	cJ6w==
X-Received: by 10.66.142.106 with SMTP id rv10mr3533105pab.29.1446143573506;
	Thu, 29 Oct 2015 11:32:53 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:b5ec:9eea:4830:cc89?
	([2601:647:4c02:370d:b5ec:9eea:4830:cc89])
	by smtp.gmail.com with ESMTPSA id
	ey17sm3621887pac.26.2015.10.29.11.32.52
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 11:32:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <562E5AF1.3080807@windriver.com>
Date: Thu, 29 Oct 2015 11:32:51 -0700
Message-Id: <ED6C3F78-5E77-4942-9CD4-18A57F84CF42@gmail.com>
References: <562E3896.6080405@windriver.com>
	<1445875841.5251.107.camel@pbcl.net>
	<562E58BE.9060003@windriver.com>
	<1445878220.5251.110.camel@pbcl.net>
	<562E5AF1.3080807@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3096.5)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Prelink problems -- need help!
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
X-List-Received-Date: Thu, 29 Oct 2015 18:32:54 -0000
X-Groupsio-MsgNum: 72746
Content-Type: multipart/signed;
	boundary="Apple-Mail=_950482CC-E44E-48C3-8397-0D150C69ABC1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_950482CC-E44E-48C3-8397-0D150C69ABC1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 26, 2015, at 9:55 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 10/26/15 11:50 AM, Phil Blundell wrote:
>> On Mon, 2015-10-26 at 11:45 -0500, Mark Hatle wrote:
>>>=20
>>>=20
>>> While some of the modern hashing techniques and such do improve run
>>> -time dynamic
>>> link performance, there is still a hit that we must take.  For
>>> devices that need
>>> quick boot times, quick startup, or are memory constrained, the
>>> prelinker can
>>> still help.  (Memory usage on very small systems is a good example.
>>> Memory
>>> usage can be reduced in larger applications by reducing the number =
of
>>> Copy-on-write pages required to handle the relocation information.)
>>=20
>> Do you have any concrete data on how much of a boot time speedup,
>> and/or what reduction in dirty pages, you see on a modern image with
>> prelink versus the same image without?
>=20
> -last- time I got concrete numbers on a complex boot process.  It was =
on the
> order of 1-5% boot time.. and a fairly large number of pages saved.. =
(which
> reduced fragmentation as well as saved memory.)

How is fragmentation getting better ? if dynamic linker was improving =
the page
locality then it would be possible but that does not seem to be the case =
here.

>=20
> We're not talking huge numbers for each, there is a statistics mode in =
glibc
> that can be enabled to show the number of relocations and some of the =
costs
> involved.  Once this is working again, I will be able to run that and =
give more
> concrete numbers.
>=20
> --Mark
>=20
>> p.
>>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_950482CC-E44E-48C3-8397-0D150C69ABC1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYyZlMACgkQuwUzVZGdMxSRAwCfeR9BxrCdcimv8MPnDInWYQoL
NU8An0K06oYpDRz9eIGPNNRuBIpVBNw8
=bNOL
-----END PGP SIGNATURE-----

--Apple-Mail=_950482CC-E44E-48C3-8397-0D150C69ABC1--
