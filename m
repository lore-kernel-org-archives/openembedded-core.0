Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0A275D22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 05:35:32 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so111117534pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 21:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eN+PyxzJYJMEdCTie3jRiLMX+l07GQPwmK6rC4DgCX0=;
	b=KEy0VF23y5xjVwh+BOrva5jAF1aruUxUyuyZJIT+cMrXEUwzwiPJxVQggD5LClHKbR
	CT7Cs2CwNx4tdv/FFHzlTLBOtJObHDaX2j8dvkU0F6aXITTmU9t+/q4ZHP3N8MkN9Txa
	tRA8AS4KAILrWMoCMJWUgksq+5w4HOHdu3KEJcsFODgQyZpsmu+2eNcL0bF+Ozvxh+mf
	E0l9exo9wy6pN7p0BCtrVcvUiLZyzv4SbqP7bU67zZgP1IwQk+jNLliKF3/EHvzU7JSh
	V7lyI5fHcodZz7DEQKXDi5fHvb+Y1t4pqG0yfiBrIj4NNfFatFzQa0jRywsXvtmCEqgG
	o0zw==
X-Received: by 10.66.97.8 with SMTP id dw8mr14576994pab.113.1446788132880;
	Thu, 05 Nov 2015 21:35:32 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:5da7:4982:a6ad:7113?
	([2601:646:8601:4580:5da7:4982:a6ad:7113])
	by smtp.gmail.com with ESMTPSA id
	sb4sm2908014pbb.55.2015.11.05.21.35.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Nov 2015 21:35:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <563B5D05.9060609@windriver.com>
Date: Thu, 5 Nov 2015 21:35:28 -0800
Message-Id: <4A9C77E9-8365-46DD-99A4-AE711940E3A3@gmail.com>
References: <cover.1446711613.git.liezhi.yang@windriver.com>
	<88477fa50093b85e65b17c746a637c7259b87018.1446711613.git.liezhi.yang@windriver.com>
	<563B5D05.9060609@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3106)
Cc: Richard Purdie <richard.purdie@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gcc-multilib-config: make aarch64 support multilib
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
X-List-Received-Date: Fri, 06 Nov 2015 05:35:34 -0000
X-Groupsio-MsgNum: 72951
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0B88EEC3-4DE7-4C7B-B543-5405D1115FED";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0B88EEC3-4DE7-4C7B-B543-5405D1115FED
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Nov 5, 2015, at 5:43 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 11/5/15 2:20 AM, Robert Yang wrote:
>> Fixed:
>> MACHINE =3D qemuarm64
>> require conf/multilib.conf
>> MULTILIBS =3D "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 =3D "armv7at-neon"
>>=20
>> $ bitbake core-image-minimal -cpopulate_sdk
>>=20
>> WARNING: gcc multilib setup is not supported for TARGET_ARCH=3Daarch64
>> WARNING: gcc multilib setup is not supported for TARGET_ARCH=3Daarch64
>>=20
>> [YOCTO #8638]
>>=20
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> meta/recipes-devtools/gcc/gcc-multilib-config.inc |    7 +++++++
>> 1 file changed, 7 insertions(+)
>>=20
>> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc =
b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
>> index 1c0a45a..a0a2ac0 100644
>> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
>> @@ -29,6 +29,9 @@ python gcc_multilib_setup() {
>>     bb.utils.remove(build_conf_dir, True)
>>     ml_globs =3D ('%s/*/t-linux64' % src_conf_dir,
>>                 '%s/*/linux64.h' % src_conf_dir,
>> +                '%s/aarch64/t-aarch64' % src_conf_dir,
>> +                '%s/aarch64/aarch64.h' % src_conf_dir,
>> +                '%s/aarch64/aarch64-cores.def' % src_conf_dir,
>>                 '%s/*/linux.h' % src_conf_dir,
>>                 '%s/linux.h' % src_conf_dir)
>>=20
>> @@ -130,6 +133,8 @@ python gcc_multilib_setup() {
>>         'mips64'    : ['gcc/config/mips/t-linux64'],
>>         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
>>         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
>> +        'aarch64'   : ['gcc/config/aarch64/t-aarch64'],
>> +        'arm'       : ['gcc/config/aarch64/t-aarch64'],
>>     }
>>=20
>>     gcc_header_config_files =3D {
>> @@ -140,6 +145,8 @@ python gcc_multilib_setup() {
>>         'mips64'    : ['gcc/config/mips/linux.h', =
'gcc/config/mips/linux64.h'],
>>         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
>>         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
>> +        'aarch64'   : ['gcc/config/aarch64/aarch64.h'],
>> +        'arm'       : ['gcc/config/aarch64/aarch64.h'],
>>     }
>=20
> I'm not sure the above is correct in this case.  As I believe GCC =
treats aarch64
> and arm as different architectures unlike MIPS, Power and IA32.
>=20
> In this case, I would expect two specific cross compilers to be =
generated, one
> for armv7 and one for aarch64, instead of a combination single =
compiler that
> understand both.
>=20

Well not entirely so, gcc can support ilp32 as a mutlilib variant for =
aarch64
so this patch is fine although if we should support ilp32 as a variant =
is another
question, which folks can chime in and provide feedback if they have use =
of it.
but nevertheless this patch should be ok

> So in this case, it might be better to have an exception to the =
warning
> message...  (unless I'm wrong, in which case this IS likely a correct =
fix....)
>=20
> Hopefully Khem and/or Richard will be able to comment as they are more =
familiar
> with this code path.
>=20
>>=20
>>     libdir32 =3D 'SYSTEMLIBS_DIR'
>>=20
>=20


--Apple-Mail=_0B88EEC3-4DE7-4C7B-B543-5405D1115FED
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY8PCQACgkQuwUzVZGdMxSUrACfRJxlepxyN6n414jAxpA1eCjN
pDoAnR3iUCVfXkzMNjGX1obvWJwiMOX5
=n0LZ
-----END PGP SIGNATURE-----

--Apple-Mail=_0B88EEC3-4DE7-4C7B-B543-5405D1115FED--
