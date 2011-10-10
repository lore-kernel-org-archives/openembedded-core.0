Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDIGR-0002wV-9q
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 17:59:39 +0200
Received: by ggnq1 with SMTP id q1so4624306ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 08:53:57 -0700 (PDT)
Received: by 10.223.65.68 with SMTP id h4mr32516557fai.24.1318262032073;
	Mon, 10 Oct 2011 08:53:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f25sm32286462faf.7.2011.10.10.08.53.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 08:53:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318261226.23801.49.camel@ted>
Date: Mon, 10 Oct 2011 17:53:45 +0200
Message-Id: <694CEF86-6C03-49B8-BB8A-9C03E0E30D03@dominion.thruhere.net>
References: <1318255623.23801.31.camel@ted>
	<1FEC2574-7F52-460C-A837-4A66C9DF1834@dominion.thruhere.net>
	<1318261226.23801.49.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] bitbake.conf: Exclude MACHINE from OVERRIDES variable dependency list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2011 15:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2011, om 17:40 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-10-10 at 17:02 +0200, Koen Kooi wrote:
>> Op 10 okt. 2011, om 16:06 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index a1420cf..11d76b8 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -669,6 +669,7 @@ AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
>>> OVERRIDES =3D =
"${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES=
}:${DISTROOVERRIDES}:forcevariable"
>>> DISTROOVERRIDES ?=3D "${DISTRO}"
>>> MACHINEOVERRIDES ?=3D "${MACHINE}"
>>> +OVERRIDES[vardepsexclude] =3D "MACHINE"
>>>=20
>>> CPU_FEATURES ?=3D ""
>>> CPU_FEATURES_arm ?=3D "vfp"
>>=20
>>=20
>> MACHINE=3Domap4430-panda bitbake bash -c cleansstate
>> MACHINE=3Dbeagleboard bitbake bash
>> MACHINE=3Domap4430-panda bitbake bash
>>=20
>> It fully built bash in both case, the diffsig sleuthing I was able to =
do:
>>=20
>> =
koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-=
angstrom-linux-gnueabi$ ls | grep bash | grep sigdata | sort
>> bash-4.1-r2.do_cleansstate.sigdata.dade34525ff3d7567b7e86b24a36307b
>> bash-4.1-r2.do_fetch.sigdata.15f6bc3de53f1de78303e73688c4f340
>> bash-4.1-r2.do_unpack.sigdata.980bf1d8267fee1ac36b68c96c4f268c
>> bash-4.1-r2.do_patch.sigdata.0185f3c332733ffa162bc38244f2f0b4
>> bash-4.1-r2.do_configure.sigdata.4527bef6d2e22f73a51628c2ac5e7d4e
>> bash-4.1-r2.do_compile.sigdata.d5cb0399ec5f76911c78cfc99a05663a
>> bash-4.1-r2.do_install.sigdata.b1781f7a0718ba9922a970820d565455
>> bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f
>> bash-4.1-r2.do_package.sigdata.4c4f326e3ba2029d207aca186c9ea332
>> =
bash-4.1-r2.do_package_write_ipk.sigdata.191dbf64100c3b552a86c361a07e134f
>> =
bash-4.1-r2.do_populate_sysroot.sigdata.1643e8bfc8905ff3f269b8ca40d16d17
>> bash-4.1-r2.do_rm_work_all.sigdata.25cbc1786f8d193c1569e77497d098af
>> bash-4.1-r2.do_rm_work_all.sigdata.d019b1e392601856aa407615da0c54af
>> bash-4.1-r2.do_rm_work.sigdata.1453d491285d51b9a88a913bcc6cc72c
>> bash-4.1-r2.do_rm_work.sigdata.b8f0f9e26355b721638b66069ad83e4e
>> bash-4.1-r2.do_populate_lic.sigdata.c7c785ae2f366e5a0d8bea4e144e43d0
>>=20
>> =
koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-=
angstrom-linux-gnueabi$ bitbake-diffsigs =
bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f =
bash-4.1-r2.do_package.sigdata.4c4f326e3ba2029d207aca186c9ea332
>> basehash changed from da302dbd386f214d39fbd6fb01267c8d to =
1b439cf1d8c12894e96e96b299a27c12
>> Variable MACHINE value changed from beagleboard to omap4430-panda
>=20
> So this tells us what changed but it doesn't tell us why its being
> depended upon. Could you share the output of:
>=20
> =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-angstrom-linux=
-gnueabi$ bitbake-diffsigs =
bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f=20
>=20
> please so we can see why bash is depending on MACHINE?

More than 2500 lines:

http://dominion.thruhere.net/koen/angstrom/diffsigs.txt

Some grepping shows:

List of dependencies for variable OVERRIDES is =
set(['OVERRIDE_INTERWORK', 'OVERRIDE_THUMB', 'DISTROOVERRIDES', =
'TARGET_ARCH', 'BUILD_OS', 'PN', 'TARGET_OS', 'MACHINEOVERRIDES'])
List of dependencies for variable MACHINE is set([])
List of dependencies for variable MACHINEOVERRIDES is set(['MACHINE', =
'SOC_FAMILY', 'FEED_ARCH'])
Variable OVERRIDES value is =
${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}${TARGET_OS}:${TARGET_ARCH}:build-${=
BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable${@=
bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", =
d)}${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", =
":thumb-interwork", "", d)}:libc-glibc:libc-glibc
Variable MACHINE value is omap4430-panda
Variable MACHINEOVERRIDES value is =
${MACHINE}:${@bb.data.getVar('FEED_ARCH', =
d,1).replace('all','noarch')}:${SOC_FAMILY}

So does MACHINEOVERRIDES need to get whitelisted as well?=


