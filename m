Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 88B2D78FCB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:02:21 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h10-v6so16667799wre.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=94QTxzIPjNiTH2hqK5BcSjKbMnG10trTI27A5tIS1ts=;
	b=n1Aa01mTrLRKQzzUq3/xGSlYFeVH3qLOFDWj7gJrXIJAlaEmTYAyU5nr5VrHTtg3pX
	zKnFifrbulb5chprPd2xeS3r+hvhuMajF2vkobj9LWlVDvAWgU++j4J3GqVZp4pftc+u
	U7unlrke1dinbxvk4ooa3whH5xxEUIQbECYYzUwSCwVUQM0SGbWWkB2j8XkpboQyHnmF
	Kay/Cl2toBkgslSRoyA1mHDTiTuNjHzVhAd2/f7WSbuBF8WJGgwnPYExQoG3c1hVKddr
	rS7VmcgJ8u+z5NILF0IQv5qDueUQXFs+GGb5/6c+0eZ6IWHEuOeTQh3zo3ddcMl/0uMt
	QJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=94QTxzIPjNiTH2hqK5BcSjKbMnG10trTI27A5tIS1ts=;
	b=Utk9LlPUjnFJNK2EVzR6LWc5+FjObMvBWq7JoRuMUiEQvWvalD2lxDX46xQ2qP5A1/
	TU1abE+qohtyVyKwgpsWZlB2ZqdXXx13Pq69ny9sjFBL/ykqtrGwca6af45IeaZDWhPR
	quf1c/EHoX/sVf70zUK9BYr6QnQmQKwTEgpIL5ihekudgt5oeknNQVxAzmoEsBiaIydj
	RT4mFtPAB8yaKlVksdawNN/ei7BQkLYn1eqdLYFo8nM9qMB6+WIJxC8H6en9ypXLAV/6
	xPDuo4OvfPEqome9dk77+8l7f1XiYqG6H5FHRmMjH2r90WudpY/afz8tm94MBOwyPwQz
	W/+Q==
X-Gm-Message-State: AOUpUlFozxCAuptEiL+teefHhnhWvSm2EHLkJL+Xok88xjslg+M8n+Ir
	oAUbcBx9hgjS+XUF4A7FjrU=
X-Google-Smtp-Source: AA+uWPwJMwu1TRQA/ZJno+SuQiQ1XqP0gvD2usi1wTeZ8aiSjYOL2Qkk/XrEWRpZ/h5e4ha/9YG3Kg==
X-Received: by 2002:adf:ef8c:: with SMTP id
	d12-v6mr13091059wro.195.1534240942266; 
	Tue, 14 Aug 2018 03:02:22 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	h83-v6sm11318561wmf.46.2018.08.14.03.02.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 03:02:21 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <731A6113-251A-4CDB-9296-97E8BAF9619D@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Tue, 14 Aug 2018 12:02:19 +0200
In-Reply-To: <CAJTo0Lam_z0M4oPwOoyPZMa=ZkWBj9qXKz8T1uMKFSiLS93Fgg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <C4F20EE9-9435-4061-B634-871DE7DF369C@gmail.com>
	<CAJTo0Lam_z0M4oPwOoyPZMa=ZkWBj9qXKz8T1uMKFSiLS93Fgg@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cpan.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Tue, 14 Aug 2018 10:02:21 -0000
X-Groupsio-MsgNum: 114683
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2F10C424-4DDA-4285-8777-CEEB8C52E489";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_2F10C424-4DDA-4285-8777-CEEB8C52E489
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A5C6CED5-CBF8-4026-8854-55617C318B48"

--Apple-Mail=_A5C6CED5-CBF8-4026-8854-55617C318B48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Ross,

I did on August, 8th - but I don't see it in master-next or any issue =
reported on that...
Did it arrive?

Cheers,
Jens

> Am 06.08.2018 um 14:00 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> Hi Jens,
>=20
> Can you use git-send-email, as the patch gets corrupted by Apple Mail.
>=20
> Ross
>=20
> On 2 August 2018 at 09:20, Jens Rehsack <rehsack@gmail.com> wrote:
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
>> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
>> index 8e079e0d55..926c6358a6 100644
>> --- a/meta/classes/cpan.bbclass
>> +++ b/meta/classes/cpan.bbclass
>> @@ -16,8 +16,7 @@ export PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
>> export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
>>=20
>> cpan_do_configure () {
>> -       export PERL5LIB=3D"${PERL_ARCHLIB}"
>> -       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL =
INSTALLDIRS=3Dvendor ${EXTRA_CPANFLAGS}
>> +       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL =
INSTALLDIRS=3Dvendor NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 ${EXTRA_CPANFLAGS}
>>=20
>>        # Makefile.PLs can exit with success without generating a
>>        # Makefile, e.g. in cases of missing configure time
>> --
>> 2.17.1
>>=20
>>=20
>> --
>> Jens Rehsack - rehsack@gmail.com
>>=20
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_A5C6CED5-CBF8-4026-8854-55617C318B48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Ross,<div class=3D""><br class=3D""></div><div class=3D"">I did on =
August, 8th - but I don't see it in master-next or any issue reported on =
that...</div><div class=3D"">Did it arrive?<br class=3D""><div><br =
class=3D""></div><div>Cheers,</div><div>Jens</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Am =
06.08.2018 um 14:00 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi =
Jens,<br class=3D""><br class=3D"">Can you use git-send-email, as the =
patch gets corrupted by Apple Mail.<br class=3D""><br class=3D"">Ross<br =
class=3D""><br class=3D"">On 2 August 2018 at 09:20, Jens Rehsack &lt;<a =
href=3D"mailto:rehsack@gmail.com" class=3D"">rehsack@gmail.com</a>&gt; =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">The modern the =
time, the improvements in ExtUtils::MakeMaker.<br class=3D""><br =
class=3D"">Nowadays, .packlist and perllocal.pod aren't touched anymore =
when appropriate<br class=3D"">flags set during configure stage. =
Controlling the flags globally avoids<br class=3D"">dual-life recipes =
need share patching.<br class=3D""><br class=3D"">Further: remove =
prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong (search<br =
class=3D"">order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} =
contains core<br class=3D"">libpath only ...<br class=3D""><br =
class=3D"">Signed-off-by: Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt;<br =
class=3D"">---<br class=3D""> meta/classes/cpan.bbclass | 3 +--<br =
class=3D""> 1 file changed, 1 insertion(+), 2 deletions(-)<br =
class=3D""><br class=3D"">diff --git a/meta/classes/cpan.bbclass =
b/meta/classes/cpan.bbclass<br class=3D"">index 8e079e0d55..926c6358a6 =
100644<br class=3D"">--- a/meta/classes/cpan.bbclass<br class=3D"">+++ =
b/meta/classes/cpan.bbclass<br class=3D"">@@ -16,8 +16,7 @@ export =
PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version<br class=3D""> =
export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"<br =
class=3D""><br class=3D""> cpan_do_configure () {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;export PERL5LIB=3D"${PERL_ARCHLIB}"<br=
 class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yes '' | perl =
${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
${EXTRA_CPANFLAGS}<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yes '' | perl ${EXTRA_PERLFLAGS} =
Makefile.PL INSTALLDIRS=3Dvendor NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 =
${EXTRA_CPANFLAGS}<br class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Makefile.PLs can exit with =
success without generating a<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Makefile, e.g. in cases of =
missing configure time<br class=3D"">--<br class=3D"">2.17.1<br =
class=3D""><br class=3D""><br class=3D"">--<br class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" class=3D"">rehsack@gmail.com</a><br =
class=3D""><br class=3D""><br class=3D"">--<br =
class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""><br =
class=3D""></blockquote></div></div></blockquote></div><br class=3D""><div=
 class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_A5C6CED5-CBF8-4026-8854-55617C318B48--

--Apple-Mail=_2F10C424-4DDA-4285-8777-CEEB8C52E489
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAltyqKsACgkQRJmWrtzl
Cp2EDBAAnctzQhgzr8PoL5EizN88aK9h0Fzn+mxilmwhx3l49g2dynHN8uJjciCD
NQvCXZ2LvlGZYe4MiqVO/5UPdzwXImCSwrPt/uoUX+sskU9w0Tr9KUwFDWDfm/ju
GeH4UqIFpIGq32y6CNMobGwXKU4WTfaP95yTvWl/nRwYJFAuI1Kh7wht8TlsWNHX
0N7J9WrT0/t2gbXoONdQ542DFa5m3yNV+SFMTb8LMeTF8FQkH3CdExe5xZR/XUYl
PS3vepK7RMrNxh2ta4b5sNOCMFGVA+QUecP+y0bgtZGybuJUFBxpwz+MKl+hNUca
fuHStc1uS1FT/fpN5xOVeqfHM5a2ug0vWwiDETsUhW53/62EdQR8iuNOZeiwrwdN
yTRCY/DnhytvSyWhQnS+PFtTWH7UOKf5X0I7XLrh0UiRydQ+aH3CflYWf3hGgeZU
DlSiGL/CDpJIzPBq/uI2veYwUkNIkYVDCgDhwgzW4/OmyCxJiH6iEyLreEdEyhVG
SXhy7Wk+Bw8pvo4kRv/xsR0adKNDg/MPYtw/41YTAD6S8vENt7IJmfQWSa2sP7LV
9enaP0txCzYRAljYU+nuXgAlVLKwtjayeFE2hF7YNpNT25F1eZm9frQN33TSmdx/
+xCsMsKSUeWNR9Z7iolPaoa4dGTOuclw38au0EpTATrb9MlrXyA=
=ZGIj
-----END PGP SIGNATURE-----

--Apple-Mail=_2F10C424-4DDA-4285-8777-CEEB8C52E489--
