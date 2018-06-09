Return-Path: <rehsack@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 41FDF76009
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 14:09:40 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id d2-v6so15995542wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2018 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=Hy78vsF+NzXPaq5+o/bn5KnBPML75FAXM6eUlWgim/U=;
	b=lb/iqPD/n4/JbntSb2o/STRW7ju8zmmofedOzRX0y0jGlXcpq/oAcGhBpBu+hpJ5MW
	bU61AFznxxTbzghODfSkh1NB7mkMzmEMyRFoY6UfI3eEM7Uz/gNYkQBGZaBaVx9CenBM
	Mzl81ZJsX1xhyv88zoY2ERYeNnCFwz8zMruPL72Gd9qQiXA3CJaeVaI5rjSwobXE8anO
	cpwTKlPo42y0hrgcjNm9VXtvOj0SVq7G7zXHu4rkyXWFs2eGHmuF9Uf4nAjvw0NlHKSy
	X2iD8B2dGwljNyaXXq0r9bybZxDLfwqiUdh3MIZOjjdmvuc7Wg+HimsuvF8wbR4hzwKy
	XEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=Hy78vsF+NzXPaq5+o/bn5KnBPML75FAXM6eUlWgim/U=;
	b=Qxbd7mnCYVg9zJ9NHePz8eAjJtOa3k/hL2IMke0RETkQ/W39+7aEJU6v6bpdn2u3La
	VdrNa3ujbYuQdanEAsojaVtsiuZYGHUnCv74jRajSu835NH57ySAridlYvTgyojfMdO+
	tsrQVU/yIGIveIHq9rZov3wnLtBCMUwxtSpcRGiqi9LBekkEfUJfW5ba4mBzF4ouHlcz
	gncT7xBTGS6AjRsjET4Gt54Tt8sNRaQlmw4olRbU2L90WEWpr2XshM86HCD8fNhorNUr
	jOX5FXa0wHtZSRDBHrHt77UU8wnR1O6ScW073QtXWnG6Mg/31lbz/EJBsSx4CprVknFM
	DS4Q==
X-Gm-Message-State: APt69E218jkJItIx+70FErGdCEYayH9qPyZr5nY5M+2C1a6+OVp2WQuZ
	RF68EJe2GKen38d1mvAIkHA=
X-Google-Smtp-Source: ADUXVKIZktJVaEyfISdL2FwEWXDRMXTn0OugwxIOniaUbDrAvvP3wMaptu8bk8xpaoQGUPSn63Ieuw==
X-Received: by 2002:adf:f546:: with SMTP id
	j6-v6mr7576281wrp.241.1528553380813; 
	Sat, 09 Jun 2018 07:09:40 -0700 (PDT)
Received: from [10.42.8.249] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	e14-v6sm3019653wmh.17.2018.06.09.07.09.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 07:09:39 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <76EDCC39-697B-4817-9268-7426ECFD73B8@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.4 \(3445.8.2\))
Date: Sat, 9 Jun 2018 16:09:37 +0200
In-Reply-To: <98977A30-5D64-4CDB-9AEA-040AB7A647DC@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <98DF6614-20AE-41EB-BC2C-D20A477F63C3@gmail.com>
	<61a0d69463b0b86d2de917653f0c7a989c699971.camel@linuxfoundation.org>
	<98977A30-5D64-4CDB-9AEA-040AB7A647DC@gmail.com>
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
X-List-Received-Date: Sat, 09 Jun 2018 14:09:40 -0000
X-Groupsio-MsgNum: 112368
Content-Type: multipart/signed;
	boundary="Apple-Mail=_53502237-72EA-408A-A10B-2030E1B548BA";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_53502237-72EA-408A-A10B-2030E1B548BA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 05.06.2018 um 14:37 schrieb Jens Rehsack <rehsack@gmail.com>:
>=20
>=20
>=20
>> Am 05.06.2018 um 10:43 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>>=20
>> On Mon, 2018-05-28 at 20:55 +0200, Jens Rehsack wrote:
>>> The modern the time, the improvements in ExtUtils::MakeMaker.
>>>=20
>>> Nowadays, .packlist and perllocal.pod aren't touched anymore when =
appropriate
>>> flags set during configure stage. Controlling the flags globally =
avoids
>>> dual-life recipes need share patching.
>>>=20
>>> Further: remove prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong =
(search
>>> order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} contains =
core
>>> libpath only ...
>>>=20
>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>> ---
>>> meta/classes/cpan.bbclass | 3 +--
>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>>=20
>> I put this in for testing but I see:
>>=20
>> $ SDKMACHINE=3D"i686" bitbake nativesdk-libxml-parser-perl
>> [...]
>> ERROR: nativesdk-libxml-parser-perl-2.44-r0 do_package: =
nativesdk-libxml-parser-perl: chrpath command failed with exit code 7:
>> =
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
>> ERROR: nativesdk-libxml-parser-perl-2.44-r0 do_package: Function =
failed: perform_packagecopy
>> ERROR: Logfile of failure stored in: =
/media/build1/poky/build/tmp-222/work/i686-nativesdk-pokysdk-linux/natives=
dk-libxml-parser-perl/2.44-r0/temp/log.do_package.23783
>> ERROR: Task =
(virtual:nativesdk:/media/build1/poky/meta/recipes-devtools/perl/libxml-pa=
rser-perl_2.44.bb:do_package) failed with exit code '1'
>>=20
>> which seems to reproduce fairly readily both locally and on the
>> autobuilders. Reverting this patch resolves it.
>=20
> Without having tested that - this seems to come from
>=20
> -	export PERL5LIB=3D"${PERL_ARCHLIB}"
>=20
> which is, when do not causing above build failure, kind-of bug-using =
:)

Indeed ...

I could debug the error message

> b"new rpath =
'$ORIGIN/../../../../../../../../../../../../../../media/build1/poky/build=
/tmp-222/work/i686-nativesdk-pokysdk-linux/nativesdk-libxml-parser-perl/2.=
44-r0/recipe-sysroot/opt/poky/2.5+snapshot/sysroots/i686-pokysdk-linux/usr=
/lib' too large; maximum length 176\n"

down to perform_packagecopy(d)
 -> rpath_replace (d.getVar('PKGD'), d)
 -> process_dir (d.getVar('PKGD'), d.getVar('PKGD') + bindir, d)
 -> process_file_linux(d.expand('${CHRPATH_BIN}'), =
'...usr/lib/perl/vendor_perl/5.24.1/auto/XML/Parser/Expat/Expat.so', =
d.getVar('PKGD'), d.getVar('PKGD') + bindir, =
os.path.normpath(d.getVar('TMPDIR', False)), d) # with d.getVar('PKGD') =
as rootdir and d.getVar('PKGD') + bindir as baseprefix
 -> new_rpaths.append("$ORIGIN/" + os.path.relpath(rpath, =
os.path.dirname(fpath.replace(rootdir, "/"))))

I think, that overflow of RPATH is now detected but could happen =
(depending on configuration even with a shortened PERL5LIB to =
PERL_ARCHLIB -- so it should be fixed by computing a better relpath for =
$ORIGIN instead of hiding the bug again.

> Always prepending ${PERL_ARCHLIB} causes for cross-building the =
attempt
> of loading sdk-modules, which is evil.
>=20
> I'll try to have a detailed look later today or tomorrow.

Sorry for being a bit late - hope it helps to figure out the root cause.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_53502237-72EA-408A-A10B-2030E1B548BA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsb36EACgkQRJmWrtzl
Cp3a8xAAmG9TTTq/hBbsKUypEiMMi3NWrGNQlu8pRZ6q1jF3tm0J2i1z6lG9008A
54GvHlQgYxjXC8O49W8ZAWYpobu5XUqt09KZwC2T7QX3kQ30KWKm9aD7A9jTKXUO
mQHOb0GrJmTQD3MzPKjU8BNqPgga88vKos+uRDp3TCgkLJLT2qwO6VzzaOb/NkF4
RjPHMKgp0zAQnWabvjiAR8aiO9fLqZwjTJ9buci88/EcOV1fM6+e0JU3UvWoUPXa
CQSXXCtzUbJHKYyNuQLDHJnnBwdkjcpR2q5J98HBPzWkXViNasumA6OhpQL7/OWq
QlSmz/GYzFRongZOfx+1P10mEAVoe5oFJZl0e8SOF/qAphV/a+E65PyUUsAojMPH
SpeyBOvnB/5BuR9ebsbOVkhAd48ZhnSuJ2P5M1SdtPCSGo9+4ISGxJ8FO46+d3FJ
sQ5KMNUARilBCsAZ97y7s8hGhpYSvt54qzSVlEZxVg2jQV5vE3OPLkAccrfsgREd
C/09iGRjWbU2KrqFey0U/rTmzG5BQWOctA6IHgLGu4VCfzGLDif2f6KH3QLLOZ9h
c5CJL8M+f4aSlt+eAIEwtBOa2MDZXbGU7Y0SP0ouLqzJ9rVxTtc6sDuwdBJYuYm9
bKIZeUWvjn6gvvbC4MeX/IaRWNhqRJWVIv7xMhCVxa+x9sLBV40=
=4Yjz
-----END PGP SIGNATURE-----

--Apple-Mail=_53502237-72EA-408A-A10B-2030E1B548BA--
