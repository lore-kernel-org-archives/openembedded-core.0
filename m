Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DB2B476004
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:37:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j15-v6so4846640wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=ii4BDPBxEuojatwOB1BCBbuMuOWBdXbA+kd+D/17c64=;
	b=Pia4V7t6tkGincokBfWgwg3u+DC1wO1qXxy90qhbwYtMgTAc2JZ/i/dYMzk+6v4sIA
	/XmUvaeqKuzLazRh5eTTaRbSEtOjDSnueDIgOV+CwP9ew6FKf7mf+gwOLv8gqpJ377mW
	YefyvnhZeg8qxAKkC0wn87bcPpkgZTgxtYyCtVscI2YjPRXYiP8//UYW7YE9C5Wyu8Kw
	bOWnCxIBvgySHBt+z6xHs7F7XmfsV60z2/o5elvJ7LkBIAVd7nRDr2FqEX8LheCFlOwZ
	zsnTjYz/CN6IcjBwrPdN04rrc2uRLB6tC7iPrJWd5wSj+8yW/PgS0B+pkzoN8P3ATQbI
	liMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=ii4BDPBxEuojatwOB1BCBbuMuOWBdXbA+kd+D/17c64=;
	b=anLKKg71cE0K/wsooN5UviGNgANcaqfaepWNWnm7XtNQ5KE+gYa+Z7K+M08put7ey3
	Udvw1ydx8yjnZJUrSvZm+eJ7MCX6WpO2gfUZzOc0hTh8asyz87q8r/vWc+rlSDGvpT0m
	VYXq3a8ktisSYRq6PjYL+xilh1SDDpI2lThjSxCUA3JohZ+57iGTz4AKcSvSvWu9ukTx
	1UCmsFrW7pBatpkXu1Vsn3ki/hzn3UjrhaymrsmXdPcmCUVeh4W2gXME6WviEIipYe0g
	rC3TxOSIn1Cj1BrX20+BMc2Sp4ASUEZwbP5HBzDM9JVM9TaSZN4h8dVHT4Epg0sHGN8f
	oBBQ==
X-Gm-Message-State: ALKqPwcPFHwUtioyrjFPkbkXKRtMHWk7vHnrIyYkoBaW8YhnnHomY0Mi
	L9wgKQHRIOCvMb7cRCbOxLM=
X-Google-Smtp-Source: ADUXVKLZ9U3F+Om3Uq8ULRqLATMpz0zYMX+tJ6DPUReEr7/PYKQxYClP+7GrThuJalFPWiBeu4BCbw==
X-Received: by 2002:a1c:130c:: with SMTP id
	12-v6mr10406401wmt.127.1528202262627; 
	Tue, 05 Jun 2018 05:37:42 -0700 (PDT)
Received: from [10.42.8.249] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	p3-v6sm33661138wrn.31.2018.06.05.05.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 05:37:41 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <98977A30-5D64-4CDB-9AEA-040AB7A647DC@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.4 \(3445.8.2\))
Date: Tue, 5 Jun 2018 14:37:39 +0200
In-Reply-To: <61a0d69463b0b86d2de917653f0c7a989c699971.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <98DF6614-20AE-41EB-BC2C-D20A477F63C3@gmail.com>
	<61a0d69463b0b86d2de917653f0c7a989c699971.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] cpan_build.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Tue, 05 Jun 2018 12:37:42 -0000
X-Groupsio-MsgNum: 112197
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E29A5B07-1126-4A07-8DC8-6DA17F7E805F";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_E29A5B07-1126-4A07-8DC8-6DA17F7E805F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 05.06.2018 um 10:43 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> On Mon, 2018-05-28 at 20:55 +0200, Jens Rehsack wrote:
>> The modern the time, the improvements in ExtUtils::MakeMaker.
>>=20
>> Nowadays, .packlist and perllocal.pod aren't touched anymore when =
appropriate
>> flags set during configure stage. Controlling the flags globally =
avoids
>> dual-life recipes need share patching.
>>=20
>> Further: remove prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong =
(search
>> order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} contains =
core
>> libpath only ...
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/classes/cpan.bbclass | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
> I put this in for testing but I see:
>=20
> $ SDKMACHINE=3D"i686" bitbake nativesdk-libxml-parser-perl
> [...]
> ERROR: nativesdk-libxml-parser-perl-2.44-r0 do_package: =
nativesdk-libxml-parser-perl: chrpath command failed with exit code 7:
> =
b'/media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux/nativ=
esdk-libxml-parser-perl/2.44-r0/package/opt/poky/2.5+snapshot/sysroots/i68=
6-pokysdk-linux/usr/lib/perl/vendor_perl/5.24.1/auto/XML/Parser/Expat/Expa=
t.so: =
RPATH=3D/media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux=
/nativesdk-libxml-parser-perl/2.44-r0/recipe-sysroot/opt/poky/2.5+snapshot=
/sysroots/i686-pokysdk-linux/usr/lib\n'b"new rpath =
'$ORIGIN/../../../../../../../../../../../../../../media/build1/poky/build=
/tmp-222/work/i686-nativesdk-pokysdk-linux/nativesdk-libxml-parser-perl/2.=
44-r0/recipe-sysroot/opt/poky/2.5+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib' too large; maximum length 176\n"
> ERROR: nativesdk-libxml-parser-perl-2.44-r0 do_package: Function =
failed: perform_packagecopy
> ERROR: Logfile of failure stored in: =
/media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux/natives=
dk-libxml-parser-perl/2.44-r0/temp/log.do_package.23783
> ERROR: Task =
(virtual:nativesdk:/media/build1/poky/meta/recipes-devtools/perl/libxml-pa=
rser-perl_2.44.bb:do_package) failed with exit code '1'
>=20
> which seems to reproduce fairly readily both locally and on the
> autobuilders. Reverting this patch resolves it.

Without having tested that - this seems to come from

-	export PERL5LIB=3D"${PERL_ARCHLIB}"

which is, when do not causing above build failure, kind-of bug-using :)

Always prepending ${PERL_ARCHLIB} causes for cross-building the attempt
of loading sdk-modules, which is evil.

I'll try to have a detailed look later today or tomorrow.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_E29A5B07-1126-4A07-8DC8-6DA17F7E805F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsWhBMACgkQRJmWrtzl
Cp1GVg/+Isu6Zd4xR8pTUnbGqgMatYAFuQ12IOysF/SAj7xZ4wKonPrIP+zKNBcJ
w9ZtYZWO+cAGDUONBn3Jvrit3rGd4CR1TQ10/sA6LVDuHVWrxYEkdnQTH2kzfhZk
Dx2RyYljd1uH54x2DC7IJrxuGfQIg6ALyjJP5JFypkWOOO1XtnahtM5K+9FJyHDz
CMGPXKlxz7hfMSX5dSl2wm0mYeh97jR//1aHZlUofoWLhXmpog2h0Dxnl1xBFREx
Xfm2pet65hmDl/ClTgDiKMsRAlqw2wBWKAMCR2ER0CcY6plJh/YJn7VyUOK2VuGj
R02OAwzoEVw+OrkyEpENNl/vZBv50VNAofSY4Dt1Lsf6PCplqloyhRlKVCAtaFec
EwpnSuQN7uj6YX16C8xTcdGlIWKCA85L4VnWdwHih3IuZnIQCDflnrkBF++aSFaK
zZ/IiDzJCqQf/gUvwYtMLdcP7q6pjTnKFrN7swsaP3frioeaCK240djCCHqlrdsl
pzXKY9CKBbJrGjlWq2SfB2Xtbuf5SnOTSOxHwF2t8nFLMt/O3ysSHbvZHyeKwr5h
SYx9o6Fpb9qxVZGGQCZPVFKZ4zcRBlymx0IrSxLzOyU0EUghG0X+XVBm6l0l8ilr
K+Q9DZ8SN5M+DOU4sMeFfYeVFJd2DXXbNO91zIpX2cpknO6uymI=
=D9+S
-----END PGP SIGNATURE-----

--Apple-Mail=_E29A5B07-1126-4A07-8DC8-6DA17F7E805F--
