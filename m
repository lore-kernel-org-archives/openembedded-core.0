Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF016D091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 18:31:56 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kp14so7884016pab.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=xvHNAtjGXJ/vAwJV4krsdZ+LylwVFsXmWswaRVEJgPA=;
	b=JtXiT7Ee3ntlPcNvmBzAqftTMbPu8RZiHD8w3P1WgRQD2sjW6O2m58fDbZ6+G8aTM+
	YocwPRbyKg7BvGj3NUCaUlWGDAy4lNnjDyyYWEMu89WeSqKlOoSUtk+rpRe7Y6nKbeEb
	LBtjfyM85za1QidAHE8THbfNU50BEZMfHIukENAu9cdwgo58PIbFksRKuj4QiBm2rA6I
	P9Cg4I9HTtiwqiXpSpPcvh89/pmwT50H1f3VzHnY290aSETvtNLwTdJioLKQ3AGWM8oR
	+FbvOKdUbpRrzuyzgd+0JHGQWYCDEHxdGF9CvcYaoJ+Ynl9Zgsu3pINhaQ30al4GgY4k
	vFGg==
X-Received: by 10.68.254.105 with SMTP id ah9mr37555795pbd.87.1381775518046;
	Mon, 14 Oct 2013 11:31:58 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	xn12sm93037911pac.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 11:31:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <52581A4C.20500@emagii.com>
Date: Mon, 14 Oct 2013 11:31:55 -0700
Message-Id: <816000B3-7089-4028-B30A-6BB7E9CDF1BB@gmail.com>
References: <52580C02.2070507@emagii.com>
	<BB75BD69-4EA8-475A-91A6-7C16557A0765@dominion.thruhere.net>
	<52581A4C.20500@emagii.com>
To: Ulf Samuelsson <angstrom-dev@emagii.com>
X-Mailer: Apple Mail (2.1510)
Cc: Koen Kooi <koen@dominion.thruhere.net>, Angstrom-distro-devel@linuxtogo.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems when building Angstrom master & 1.3 & 1.4 for Beagleboard Black
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
X-List-Received-Date: Mon, 14 Oct 2013 18:31:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Oct 11, 2013, at 8:33 AM, Ulf Samuelsson <angstrom-dev@emagii.com> =
wrote:

> On 2013-10-11 16:58, Koen Kooi wrote:
>> Op 11 okt. 2013, om 16:32 heeft Ulf Samuelsson =
<angstrom-dev@emagii.com> het volgende geschreven:
>>=20
>>> Have tried out building Angstrom for Beaglebone Black on a Quad-Core =
i7/Ubuntu 12.04 i386 with:
>> I strongly recommend ditching ubuntu and installing linux instead. I =
don't know what causes it, but switching to debian, arch, gentoo, =
fedora, opensuse or anything else not ubuntu based gets rid off all =
problems with builds not working, not booting, etc.
>=20
> OK,  after installing 12.04LTS I have to
>=20
> 1. left-click (hold)
> 2. alt (hold)
> 3. right click
>=20
> just to add an item to the panel,
>=20
> I guess they are trying to prove that Ubuntu One is superior to gnome,
> by making gnome successively worse.
>=20
> so I am quite pissed of with Ubuntu
>=20
> Getting a dual Xeon 6-core next week, so I'll wait until then,
> but that is not going to be exposed to Ubuntu ever=85


What is your default shell ? I would recomment to use bash.

>=20
> BR
> Ulf
>=20
>>> PARALLEL_MAKE     =3D "-j8"
>>> BB_NUMBER_THREADS =3D "8"
>>>=20
>>> I bitbake "cloud9-gnome-image"
>>>=20
>>> RESULTS:
>>> * remotes/origin/angstrom-v2013.06-yocto1.4    commit =
246357a1cc4977683ada564d38218e837ac615e3
>>>=20
>>>    image builds but does not boot.
>>>=20
>>> * remotes/origin/angstrom-v2012.12-yocto1.3    commit =
01984cc460acfe5e7d5bab4feeb0888d5c6fe77f
>>>=20
>>>    image builds but does not boot.
>>>=20
>>> * origin/master commit 7a3b004f7bfa24ea54b0da78bd80e4dd7839321d
>>>=20
>>>    Build fails on two issues.
>>>=20
>>>    1.    libxklavier compile fails.
>>>            | xklavier.c: In function 'xkl_engine_class_init':
>>>            | xklavier.c:846:8: error: 'XKL_TYPE_ENGINE_FEATURES' =
undeclared (first use in this function)
>>>            ...
>>>            Summary: 1 task failed:
>>> =
/home/ulf/projects/ICU/Angstrom/setup-scripts/sources/meta-openembedded/me=
ta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb,
>>>            do_compile
>>>=20
>>>            Did "bitbake -c cleansstate libxklavier" and restarted, =
and then it continued without problem,
>>>            so there seem to be a dependency problem.
>>>=20
>>>    2.    nodejs compiles fails with error:
>>>           |   arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 =
--sysroot=3D/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstr=
om_v2012_12-eglibc/sysroots/beaglebone '-D_LARGEFILE_SOURCE' =
'-D_FILE_OFFSET_BITS=3D64' '-DL_ENDIAN' '-DOPENSSL_THREADS' '-DPURIFY' =
'-D_REENTRANT' '-DOPENSSL_NO_DTLS1' '-DOPENSSL_NO_SOCK' =
'-DOPENSSL_NO_DGRAM' '-DOPENSSL_NO_GOST' '-DOPENSSL_NO_HW_PADLOCK' =
'-DOPENSSL_NO_ASM' '-DENGINESDIR=3D"/dev/null"' =
'-DOPENSSLDIR=3D"/etc/ssl"' '-DTERMIOS' -I../deps/openssl =
-I../deps/openssl/openssl -I../deps/openssl/openssl/crypto =
-I../deps/openssl/openssl/crypto/asn1 =
-I../deps/openssl/openssl/crypto/evp =
-I../deps/openssl/openssl/crypto/store -I../deps/openssl/openssl/include =
-I../deps/openssl/config/android -Wall -pthread -O2 -fno-strict-aliasing =
-fno-tree-vrp  -MMD -MF =
/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-=
eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/node
> =
js-0.8.22-r0/node-v0.8.22/out/Release/.deps//home/ulf/projects/ICU/Angstro=
m/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-an=
gstrom-linux-gnueabi/nodejs-0.8.22-r0/node-v0.8.22/out/Release/obj.target/=
openssl/deps/openssl/openssl/crypto/whrlpool/wp_block.o.d.raw -O2 -pipe =
-g -feliminate-unused-debug-types -c -o =
/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-=
eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/nodejs-0.8.22-r0/node-v=
0.8.22/out/Release/obj.target/openssl/deps/openssl/openssl/crypto/whrlpool=
/wp_block.o ../deps/openssl/openssl/crypto/whrlpool/wp_block.c
>>> | make[1]: execvp: printf: Argument list too long
>>>=20
>>>    I get the second problem when I run from: =
"/home/ulf/projects/ICU/Angstrom/setup-scripts/"
>>>    When I install Angstrom in "/home/icu/v2012.12" I do not see the =
problem.
>>>=20
>>> ---------------------------
>>>    Have tried recompiling my kernel changing include/linux/binfmts.h
>>>=20
>>> <# define MAX_ARG_PAGES    32
>>>> # define MAX_ARG_PAGES    64
>>>    based on something I found on Internet, to no avail.
>>>=20
>>> Checking a little bit more, I see it looks like:
>>> #ifdef CONFIG_MMU
>>>    ...
>>> #else
>>> # define MAX_ARG_PAGES    64
>>>    struct page *page[MAX_ARG_PAGES];
>>> #endif
>>>    CONFIG_MMU is set,  so the change is in part of the code which is =
not used
>>>=20
>>>    Maybe there should be some kind of warning about how deep in the =
directory structure Angstrom can be.
>>>=20
>>> ---------------------------
>>>    The resulting kernel/filesystem will run on the Beagleboard =
Black.
>>>=20
>>>    Anyone knows what to change to increase the argument area on =
linux-3.2.x?
>>>=20
>>> BR
>>> Ulf Samuelsson
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


