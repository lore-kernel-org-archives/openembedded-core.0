Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 91A5C7C9C5;
	Thu, 25 Jul 2019 12:52:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id p13so50632963wru.10;
	Thu, 25 Jul 2019 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:mime-version:subject:message-id:date:cc:to;
	bh=3kn1OBIewWGyiydI27F6msyIVpIKw/6P27Nlzhd+uQk=;
	b=mH7RvhXZXXqxYbdAR2WFCRW3v3cH9VLuuBDVTsj7NT6mzX+LEC6ESbV7rnfsbgGXPu
	1tkPySvGyNSaXZ1qgbnk7a8xDhSa6k8gk/CBF8iYgY8jsnr9C2w7TiDKm86G2gh0SPHP
	wo6BLAte3aK3QybUdVpgfRoTKVgPFvJ4S8ZiABbiw/gsUfIfUW/QkcBVwaiEyviN0zwk
	/Wb9ZfpDFk3DRFUetoAO8aeqXk6Ny9e12IrmOpYC9hNCYaPtmiYthYcUzfuQs4LgblF1
	GMkoS084qt8vJwJ8fZbGsv8llPWdKFZ+5d+91IPewRgNykkAYlzCp1Z0ztBqMysrs91M
	rBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:mime-version:subject:message-id:date
	:cc:to;
	bh=3kn1OBIewWGyiydI27F6msyIVpIKw/6P27Nlzhd+uQk=;
	b=PjcPAu/uXw02KRbPFW68jD3kdX+5/nDa4/gvaH4dr/Qq06eoP+Jig94PWn+27q1U8H
	cSOU99XPLdFAtLebpmruSTjUXldrZHqZCMHvrGEiTwkV/Oi2014EPxjToHFyLDLGOpFC
	el/LGRp5DamNo/gx0UhMxRq0knQYfvytclSL3MrvsfBzJkpLDMkKTU2eBsnbTHo2SLGg
	0v4zhyDN6UyR0HKvu/CVJgIOKYW4LmwAOZmGm1x1cpqMFQSVCJAiGxzsMxmSwjF8ee/X
	5W/IiRezhCJy7+JUV5ihIlDojo6+7FHwKViUjIWsQsMJBcQAjDM253kn1+JNmco3pI5+
	VYgw==
X-Gm-Message-State: APjAAAWFhop9z8UTei0TQ/SBmPC3obwLAOS7+K3u8vmt6rp3nBsRAF8j
	r2FN6fMeMndqLkerNznH0HU=
X-Google-Smtp-Source: APXvYqyymWye5Nd1a8r7QOwTyWgkCvlcWjiXOHSbmF8VpXSuZMINvJHfutc+5CiJ0aBW1WEce0C6aA==
X-Received: by 2002:adf:e790:: with SMTP id n16mr78127625wrm.120.1564059137069;
	Thu, 25 Jul 2019 05:52:17 -0700 (PDT)
Received: from [10.42.8.217] (p4FE9398A.dip0.t-ipconnect.de. [79.233.57.138])
	by smtp.gmail.com with ESMTPSA id
	i18sm65363754wrp.91.2019.07.25.05.52.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jul 2019 05:52:15 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <A3D1BC0A-704E-4F87-9D63-86C8DBCBA1E7@netbsd.org>
Date: Thu, 25 Jul 2019 14:52:14 +0200
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Tim Orling <ticotimo@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	=?utf-8?B?QWxiZXJ0byBTaW3DtWVzIPCfkKo=?= <ambs@zbr.pt>,
	Leon Timmermans <fawaka@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: Ingmar Gebhardt <ige@ivu.de>, openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Perl5 build issues (meta-cpan only?)
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
X-List-Received-Date: Thu, 25 Jul 2019 12:52:17 -0000
X-Groupsio-MsgNum: 127167
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D92B0113-8B24-472B-8C48-27A4B2D3137E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_D92B0113-8B24-472B-8C48-27A4B2D3137E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

please apologize that I didn't act earlier after Alexanders update of =
perl. Too many weddings ... you know very well.

The problem with the conflicts with the dual-life modules we should =
perhaps discuss separately - as far as I know, there were more =
fundamental problems with -native. Then we might not only need a =
technical solution for ... I try to come to Lyon.

Maybe one or the other has already seen the following message in =
connection with modules::Build-based Perl modules:
ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa: QA Issue: No GNU_HASH =
in the ELF binary =
/home/sno/gpw-community-bsp/gpw-yocto-platform/tmp/work/cortexa8hf-neon-po=
ky-linux-gnueabi/hash-fieldhash-perl/0.15-r0/packages-split/hash-fieldhash=
-perl/usr/lib/perl5/vendor_perl/5.30.0/arm-linux/auto/Hash/FieldHash/Field=
Hash.so, didn't pass LDFLAGS? [ldflags]
ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa: QA run found fatal =
errors. Please consider fixing them.
ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa:
ERROR: hash-fieldhash-perl-0.15-r0 do_package_qa: Function failed: =
do_package_qa
ERROR: Logfile of failure stored in: =
/home/sno/gpw-community-bsp/gpw-yocto-platform/tmp/work/cortexa8hf-neon-po=
ky-linux-gnueabi/hash-fieldhash-perl/0.15-r0/temp/log.do_package_qa.12168
ERROR: Task =
(/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-devel/hash-fieldhas=
h-perl/hash-fieldhash-perl_0.15.bb:do_package_qa) failed with exit code =
'1'

I think the reason is in =
https://metacpan.org/source/AMBS/ExtUtils-CBuilder-0.280231/lib/ExtUtils/C=
Builder/Base.pm#L319 where the arguments from ldflags are thrown away.

When those issues came up somewhere else than in meta-cpan, please let =
me know (only open-source ^^). We should develop a fix like =
https://github.com/meta-cpan/meta-cpan/commit/52ded0759daa3bff909bf5fac6d3=
1c6bc52d713e then ...

For now - I think Alberto should receive a patch to use ldflags, too.

I cannot decide how critic and important that is to make it into =
perl-5.30.1 ...
When ExtUtils::CBuilder is properly fixed, no changed are required to =
cpan_build.bbclass, aren't they?

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_D92B0113-8B24-472B-8C48-27A4B2D3137E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl05pf4ACgkQRJmWrtzl
Cp2ZLg//e9GtM//ak3qldzbf3C0IuxKaDVlPqaX2TZCmI1ueX4/Zdn/isWmFcVB/
E3ocaIlCe+9lCqfRWrmfsSaul/q2DV6t0lkuJ2tt8RBdcukoOSzExbenJuUpa8x6
jAfA/9xHWGcwgw1rc2FNqfxEr2hVxg9Y2A7kOqbNAILVjvwPaUgBCYzoUmKgL4Ts
P+L3FzOrGZN+XaZZLZvebpIh76F/xRdCvuTFHnywN9hlJsC7EAfl7HGcMQyokx3z
MO5jQlqu/pQeXksFJizp0ACkUabZM8KJAxrjFRk+CzSAgbwrMAYQrHjs/UtXe7kf
5L+iSEjd49V0JU5W6i5Nyh/CNY7S93O2FGiLHqlQwAnNqzrzQD5PiFzIDaDkLQXf
qJAes3QRAgz/Qvm4Gkv7msupbXzmIwvL4WeLnD2Zz31oxutEvl7r5KAhi5NO+gvc
+lQjz9ZRJPIec8/YKPn4rsi2LGuRQF+hU8C0IshUgrInPK0WficMGbVbiM1IFylQ
lhxDTmygur2Hyte8pqyQBQ039TZwOgI+OUDqtkGCW+jjSeu1rAENqM065S/sufoN
6PPAgWj8j9QsnZPumn6CthPVIcaBgFxatcmXqi0bDT5+m2Gkfjrs6VRFPpmuFoG8
eSq4O7BUePP/zajFNocswbU4ORMPdn8W9nAY7jxw+Xv1jEpArgo=
=bsjD
-----END PGP SIGNATURE-----

--Apple-Mail=_D92B0113-8B24-472B-8C48-27A4B2D3137E--
