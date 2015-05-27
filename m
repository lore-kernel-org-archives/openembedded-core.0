Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id C187365D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 02:30:50 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so62736404pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 19:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=K7/NpYNbi24l4+K20ugpWIMk2Y7Hcfk39wzsH/yKEIg=;
	b=D/0EQVDNBeiX+n46zBzDImBpFinqeNpwpb9dFVLgc9t/6q+ZuzglpLwHGXsDRTzP8c
	yej09at1e/YDQhY4WMafhM6znLJ7QmzOKR2DHWWWyDm7Iq+UAU5+Shw+tJST0So6PSsU
	j+P1k9Q/+WWCS/1Iz3RZlP1g57mWeY442m0vNtafZe1GauecJ8rHhnRoFK6IHp5y6iJC
	K45ZEnrGMuDRlu+1hPD+qkNTdNGoAQpDmo2KUj4npTNIuPgUcPNO9fMaPwv9VXtiFgUn
	Q4vEC1Y/Cr+eiMpwVy6CxTvlB1h+Od66PuQW+CTc5CjIGlolnFg38V1WpRw/MwpLt3tW
	nRsA==
X-Received: by 10.70.35.6 with SMTP id d6mr53644755pdj.166.1432693852013;
	Tue, 26 May 2015 19:30:52 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:2892:8d7f:ac11:7992?
	([2601:9:3580:84c:2892:8d7f:ac11:7992])
	by mx.google.com with ESMTPSA id
	eu5sm14358622pbb.44.2015.05.26.19.30.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 May 2015 19:30:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=VJpjNd6so51mM=CmS17O-AWtppX8sK=_4+eEotfxrZhA@mail.gmail.com>
Date: Tue, 26 May 2015 19:30:46 -0700
Message-Id: <D9E6C91D-6878-4BA9-9CB1-FFAB0BCE8C68@gmail.com>
References: <1432253466-9933-1-git-send-email-armccurdy@gmail.com>
	<55636AA6.5030800@linux.intel.com>
	<CAJ86T=VJpjNd6so51mM=CmS17O-AWtppX8sK=_4+eEotfxrZhA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnutls: remove --with-libz-prefix configure option
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
X-List-Received-Date: Wed, 27 May 2015 02:30:53 -0000
X-Groupsio-MsgNum: 66035
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E4CB8EE3-DF59-47F9-9BCD-556DAD904397";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E4CB8EE3-DF59-47F9-9BCD-556DAD904397
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 26, 2015, at 7:28 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Mon, May 25, 2015 at 11:32 AM, An=C3=ADbal Lim=C3=B3n
> <anibal.limon@linux.intel.com> wrote:
>> Hi Andre,
>=20
> Hi An=C3=ADbal,
>=20
>> This patch broke gnutls build on multilib,
>>=20
>> ERROR: QA Issue: gnutls: The compile log indicates that host include =
and/or
>> library paths were used.
>>         Please check the log
>> =
'/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/temp/log.do_compile'
>> for more information. [compile-host-path]
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in:
>> =
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/temp/log.do_package_qa.25738
>> ERROR: Task 2411
>> =
(/home/alimon/repos/poky/meta/recipes-support/gnutls/gnutls_3.3.14.bb,
>> do_package_qa) failed with exit code '1
>=20
> I'm not able to reproduce your error, but based on some googling it
> seems that issues cross compiling gnutls are not uncommon. Buildroot
> added the --with-libz-prefix configure option specifically to fix
> issues with configure finding the host's libz [1]. Chromium has a more
> complete fix, which patches configure.ac to find libz using
> PKG_CHECK_MODULES instead of AC_LIB_HAVE_LINKFLAGS [2].
>=20
> Since the original issue (absolute paths in gnutls.pc Libs.private) is
> fairly benign, I think the best solution right now is to revert back
> to using the --with-libz-prefix configure option in OE.

I would encourage you to see if [2] can be ported into OE.

>=20
> [1] =
http://lists.busybox.net/pipermail/buildroot/2014-February/088307.html
> [2] =
https://chromium-review.googlesource.com/#/c/271661/2/net-libs/gnutls/file=
s/gnutls-2.12.23-cross-compile.patch
>=20
>=20
>> Kind regards,
>>    alimon
>>=20
>>=20
>> On 21/05/15 19:11, Andre McCurdy wrote:
>>>=20
>>> The default search path in sysroot is sufficient to find zlib, so =
the
>>> --with-libz-prefix configure option seems to be unnecessary.
>>>=20
>>> For target builds, relying on sysroot also prevents an absolute path
>>> from being hardcoded in the gnutls.pc pkg-config file.
>>>=20
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/recipes-support/gnutls/gnutls.inc | 1 -
>>>  1 file changed, 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-support/gnutls/gnutls.inc
>>> b/meta/recipes-support/gnutls/gnutls.inc
>>> index 45fb529..87f275a 100644
>>> --- a/meta/recipes-support/gnutls/gnutls.inc
>>> +++ b/meta/recipes-support/gnutls/gnutls.inc
>>> @@ -23,7 +23,6 @@ EXTRA_OECONF=3D"--disable-rpath \
>>>                --with-included-libtasn1 \
>>>                --enable-local-libopts \
>>>                --with-libpthread-prefix=3D${STAGING_DIR_HOST}${prefix}=
 \
>>> -              --with-libz-prefix=3D${STAGING_DIR_HOST}${prefix} \
>>>                --disable-guile \
>>>                --disable-crywrap \
>>>                --without-p11-kit \
>>=20
>>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_E4CB8EE3-DF59-47F9-9BCD-556DAD904397
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVlLFoACgkQuwUzVZGdMxQ2bQCdGg26RbRjKbbSurfNICXc85UJ
S4gAn3ZNdnXYRteCqlTYVAl5HfouN74T
=P14/
-----END PGP SIGNATURE-----

--Apple-Mail=_E4CB8EE3-DF59-47F9-9BCD-556DAD904397--
