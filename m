Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8930B75308;
	Thu, 10 May 2018 19:11:45 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id o4-v6so3051714wrm.0;
	Thu, 10 May 2018 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uop3B1QN+H0K02vh0LicDL5jZAxGOHYdhST2zbRRV2o=;
	b=rHTo8Bv5Tj2+4/5tCZUyxEuBr//U3M1gqhtJdtRoFbMGRzSjrJrXaRWFVRvsAp6H98
	jV22uRkGj6kyFVA17TBJ5ANKjnWw9iFe1eAFvBR7yGliVc8UCibctU3wUvjmvAFb4rFf
	dwtOmVdp6tBLqtAOtYscN6u1e2usPBprD1eP4xeZbAmtOnUdX9WTPUYkbaNyDX05zq9V
	h676ZfacEFVNm4hY4DQzuoE/L+c5fcXT1eSpkdvVkppXlYdg0GN7i4rUqLH3mMaMF+uB
	FqJeKF7y3nq8oakq+E6oQvbxfe5xkWGK0RqRqsXtznfG3QkcgMUtSf45hiZ1PVEV9PbH
	Y+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uop3B1QN+H0K02vh0LicDL5jZAxGOHYdhST2zbRRV2o=;
	b=eSF8ql07QcSOg5GyE/mKgJuuJGhmlWfNASMWY0IpiRI2saT0IAWUz41vNB5NRvYAbV
	hlKAzkiJQjR/bWG3+SEN7w1ovvCieM5Sj3aZ6pzOYU/GXnflXzG0o/XZ3q58JQzK7TwT
	th3m0oJhOEToN3wm2V0pA7GK0LRhj4QPrq5x7mwyQrUwwHGC2d87wG5YPkqp17KZbOL+
	0Mc7DF3Z+YXkRHH1uHSs87O+uDvAlG2KNPONuTjplFXWNPW9WAvnNuxTjVkpc7YAcBPU
	M/OhGEhVanTviQLbFOxByzXSJtkkZn0D1S7U9lqxbFC1dUYefDN7YQXseYz6wPCzbinp
	ydBA==
X-Gm-Message-State: ALKqPweAi9dFGnFwejc7q1O2djI1kPCYq48kBK5JwQvrhu+P/uBDKpRF
	jlQOF2FWfXe5RCuRKWn8lcI=
X-Google-Smtp-Source: AB8JxZrWiIo98i/442djN4BfVaKNynn9t6Fz2Hng5IMwk21Kxd0ej7IWsyXj+sGHHAsdo8vMYWw2WQ==
X-Received: by 2002:adf:b509:: with SMTP id
	a9-v6mr2237651wrd.191.1525979505939; 
	Thu, 10 May 2018 12:11:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm1854175wri.78.2018.05.10.12.11.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 12:11:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 May 2018 21:11:45 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180510191145.GA1954@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 19:11:46 -0000
X-Groupsio-MsgNum: 111231
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote:
> Hi Martin
>=20
> Thanks for testing and reporting back
>=20
> On 5/9/18 2:38 AM, Martin Jansa wrote:
> > My initial tests show couple issues, but usually caused by other change=
s=20
> > in that branch, not the gcc-8 itself.
> >=20
> > 1) strace-4.22 from=20
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/=
gcc-8&id=3Daf33a8b721cc9caebd3f5226b4c5903f666ab654
> > fails to build with ptest enabled (it builds with 4.20 version if I=20
> > revert this change)
> > ../../strace-4.22/tests/inject-nf.c: In function 'main':
> > ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used in=
=20
> > asm here
> >  =A0}
> >  =A0^
>=20
> are you targeting thumb1 ? how can I reproduce it ?

I'm trying to find out what's different in the builds where it was
failing, will provide more info later.

> > Makefile:6313: recipe for target 'inject-nf.o' failed
> > make: *** [inject-nf.o] Error 1
> > make: Leaving directory 'strace/4.22-r0/build/tests'
> >=20
> > 2) glibc with obsolete rpc disabled from:=20
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/=
gcc-8&id=3D0cd820424d4bdb5cc68e7503e09a0359fd21150a
> > causes busybox's mount applet to fail building:
> > util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file or dire=
ctory
> >  =A0# include <rpc/rpc.h>
> >  =A0 =A0 =A0 =A0 =A0 =A0^~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [util-linux/mount.o] Error 1
> > make: *** [util-linux] Error 2
>=20
> I think you sent a patch already for this so discussion for fix are on=20
> going.
>=20
> >=20
> > 3) grub and grub-efi fails to build with gcc8:
> > In file included from ../grub-2.02/grub-core/partmap/gpt.c:26:
> > ../grub-2.02/include/grub/gpt_partition.h:79:1: error: alignment 1 of=
=20
> > 'struct grub_gpt_partentry' is less than 8 [-Werror=3Dpacked-not-aligne=
d]
> >  =A0} GRUB_PACKED;
> >  =A0^
> > In file included from ../grub-2.02/grub-core/disk/ldm.c:26:
> > ../grub-2.02/include/grub/gpt_partition.h:79:1: error: alignment 1 of=
=20
> > 'struct grub_gpt_partentry' is less than 8 [-Werror=3Dpacked-not-aligne=
d]
> >  =A0} GRUB_PACKED;
> >  =A0^
> > ..
> > ../grub-2.02/grub-core/fs/btrfs.c:186:1: error: alignment 1 of 'struct=
=20
> > grub_btrfs_inode' is less than 4 [-Werror=3Dpacked-not-aligned]
> >  =A0} GRUB_PACKED;
> >  =A0^
> >=20
>=20
> I think we need to align end of these structs here, can you try
> https://src.fedoraproject.org/rpms/grub2/raw/master/f/0198-align-struct-e=
fi_variable-better.patch

I've sent fix as well:
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150587.h=
tml
it's in master-next already.

> > 4) iotivity fails to build with gcc8:
> > service/resource-encapsulation/src/common/primitiveResource/unittests/P=
rimitiveResourceTest.cpp:=20
> > In lambda function:
> > service/resource-encapsulation/src/common/primitiveResource/unittests/P=
rimitiveResourceTest.cpp:164:30:=20
> > error: 'value' is not captured
> >  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ocRep[KEY] =3D value;
> >  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^~~~~
> >=20
>=20
> this needs more investigation. May be move
> https://github.com/iotivity/iotivity/blob/master/service/resource-encapsu=
lation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp#L160
>=20
> just above
> https://github.com/iotivity/iotivity/blob/master/service/resource-encapsu=
lation/src/common/primitiveResource/unittests/PrimitiveResourceTest.cpp#L165

There are more issues in iotivity:
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1647:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'rap=
idjson::GenericValue<rapidjson::UTF8<> >::Member' {aka 'struct rapidjson::G=
enericMember<rapidjson::UTF8<>, rapidjs
on::MemoryPoolAllocator<> >'} with no trivial copy-assignment; use copy-ass=
ignment instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1635:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'cla=
ss rapidjson::GenericValue<rapidjson::UTF8<> >' with no trivial copy-assign=
ment; use copy-assignment or copy-initi
alization instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1647:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'rap=
idjson::GenericValue<rapidjson::UTF8<> >::Member' {aka 'struct rapidjson::G=
enericMember<rapidjson::UTF8<>, rapidjs
on::MemoryPoolAllocator<> >'} with no trivial copy-assignment; use copy-ass=
ignment instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1635:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'cla=
ss rapidjson::GenericValue<rapidjson::UTF8<> >' with no trivial copy-assign=
ment; use copy-assignment or copy-initi
alization instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1647:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'rap=
idjson::GenericValue<rapidjson::UTF8<> >::Member' {aka 'struct rapidjson::G=
enericMember<rapidjson::UTF8<>, rapidjs
on::MemoryPoolAllocator<> >'} with no trivial copy-assignment; use copy-ass=
ignment instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1635:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'cla=
ss rapidjson::GenericValue<rapidjson::UTF8<> >' with no trivial copy-assign=
ment; use copy-assignment or copy-initi
alization instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1647:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'rap=
idjson::GenericValue<rapidjson::UTF8<> >::Member' {aka 'struct rapidjson::G=
enericMember<rapidjson::UTF8<>, rapidjs
on::MemoryPoolAllocator<> >'} with no trivial copy-assignment; use copy-ass=
ignment instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1635:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'cla=
ss rapidjson::GenericValue<rapidjson::UTF8<> >' with no trivial copy-assign=
ment; use copy-assignment or copy-initi
alization instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1647:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'rap=
idjson::GenericValue<rapidjson::UTF8<> >::Member' {aka 'struct rapidjson::G=
enericMember<rapidjson::UTF8<>, rapidjs
on::MemoryPoolAllocator<> >'} with no trivial copy-assignment; use copy-ass=
ignment instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1635:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'cla=
ss rapidjson::GenericValue<rapidjson::UTF8<> >' with no trivial copy-assign=
ment; use copy-assignment or copy-initi
alization instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1647:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'rap=
idjson::GenericValue<rapidjson::UTF8<> >::Member' {aka 'struct rapidjson::G=
enericMember<rapidjson::UTF8<>, rapidjs
on::MemoryPoolAllocator<> >'} with no trivial copy-assignment; use copy-ass=
ignment instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1635:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'cla=
ss rapidjson::GenericValue<rapidjson::UTF8<> >' with no trivial copy-assign=
ment; use copy-assignment or copy-initi
alization instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1647:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'rap=
idjson::GenericValue<rapidjson::UTF8<> >::Member' {aka 'struct rapidjson::G=
enericMember<rapidjson::UTF8<>, rapidjs
on::MemoryPoolAllocator<> >'} with no trivial copy-assignment; use copy-ass=
ignment instead [-Werror=3Dclass-memaccess]
+extlibs/rapidjson/rapidjson/include/rapidjson/document.h:1635:24: error: '=
void* memcpy(void*, const void*, size_t)' writing to an object of type 'cla=
ss rapidjson::GenericValue<rapidjson::UTF8<> >' with no trivial copy-assign=
ment; use copy-assignment or copy-initi
alization instead [-Werror=3Dclass-memaccess]
+
+service/resource-encapsulation/unittests/ResourceClientTest.cpp:243:67: er=
ror: 'VALUE' is not captured
+extlibs/hippomocks/hippomocks/HippoMocks/hippomocks.h:1609:15: error: void=
 value not ignored as it ought to be

e.g. rapidjson one is tracked upstream:
https://github.com/Tencent/rapidjson/issues/1205

for other issues I have a work around, but not good enough to submit for me=
ta-oic.

>=20
> > 5) nativesdk-libxcrypt fails to build (not sure which change caused=20
> > this, it build OK with sumo since the=A0-std=3Dgnu99 addition.
> > ../git/crypt-sunmd5.c:189:13: error: 'snprintf' output may be truncated=
=20
> > before the last format character [-Werror=3Dformat-truncation=3D]
> >  =A0 =A0 =A0 =A0 =A0 =A0 =A0"$" CRYPT_ALGNAME "," ROUNDS "%u$%s$",
> >  =A0 =A0 =A0 =A0 =A0 =A0 =A0^~~
> >=20
>=20
> something new, I will look into reproducing this.
>=20
> > 6) couple internal components which usually fail to build with gcc8,=20
> > because of more strict warnings + Werror.
>=20
> OK, feel free to send out question if you get stuck
>=20
> >=20
> > I didn't get very far in testing, because our old kernel fails to build=
=20
> > with gcc8 and there are some other issues caused by other master=20
> > changes. But it doesn't look too bad (in my small test, lets see what=
=20
> > bitbake world will show), thanks a lot for new gcc.
> >=20
>=20
> yes, older kernel needs fixes, especially to disable new warnings.
> the mips/ppc fixes that I put out there might be helpful to cook up=20
> fixes for older kernels if running into same issues.

In this case it fails with Error: .err encountered for many drivers. It's n=
ot the same case as in:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/325615.=
html
nor arm version of this change, both are already applied in our
4.4.3 based kernel.

I've tried to reproduce with vanilla 4.4.143 and it doesn't fail like this,=
 vanilla 4.4.3 doesn't
fail, so it's caused by one of our 10000 commits on top of 4.4.3 or the con=
fig, need to dig a bit more.

> > Cheers,
> >=20
> >=20
> >=20
> >=20
> >=20
> > On Sat, May 5, 2018 at 2:26 AM, Khem Raj <raj.khem@gmail.com=20
> > <mailto:raj.khem@gmail.com>> wrote:
> >=20
> >     Hi All
> >=20
> >     As you might have noticed that gcc 8.1 was released this week, I am
> >     calling out for some testing help on testing branch so we can weed =
out
> >     issues you might see in your setups. so if you have your
> >     builders idling over weekend, then you know what they can do this
> >     weekend :)
> >=20
> >     Highlighted changes are
> >=20
> >     https://gcc.gnu.org/gcc-8/changes.html
> >     <https://gcc.gnu.org/gcc-8/changes.html>
> >=20
> >     and porting doc is
> >=20
> >     https://gcc.gnu.org/gcc-8/porting_to.html
> >     <https://gcc.gnu.org/gcc-8/porting_to.html>
> >=20
> >     The branch is here
> >=20
> >     http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj=
/gcc-8
> >     <http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkra=
j/gcc-8>
> >=20
> >     Its uptodate on top of current master oe-core
> >=20
> >     May fourth be with you !!
> >=20
> >     Cheers!
> >=20
> >     -Khem
> >     --=20
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> >=20
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvSZbQAKCRA3VSO3ZXaA
HNcQAKCconFMQyzW4Ns+UWNtySR2H+SvsACgjZKkdEx1TWlbDthKPd3oNcV5x50=
=rzbh
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
