Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TJmQw-0007N0-9d
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 16:29:51 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q94E6C2B004658;
	Thu, 4 Oct 2012 09:06:12 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q94E6CIn028752;
	Thu, 4 Oct 2012 09:06:12 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 4 Oct 2012 09:06:11 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libtool: Add missing DEPENDS on libtool-cross
Thread-Index: AQHNohGpIKsqLuL3q0uUHVwyg/BmXZepFSuQgABaWID//6x+sIAAD41w
Date: Thu, 4 Oct 2012 14:06:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015924332D@DLEE12.ent.ti.com>
References: <1349213439-14199-1-git-send-email-Chase.Maupin@ti.com>
	<1349342479.18301.68.camel@ted>
	<7D46E86EC0A8354091174257B2FED10159242C29@DLEE12.ent.ti.com>
	<1349355495.18301.93.camel@ted>
	<7D46E86EC0A8354091174257B2FED10159242E7C@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159242E7C@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: AEuU CB1d DuL2 Dy41 D3ho Kcu6 Kjf6 KkNF LYCM NCKM ODPo
	ObhS OfZT QrlP SOWt S599; 2;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA7AHIAaQBjAGgAYQByAGQALgBwAHUAcgBkAGkAZQBAAGwAaQBuAHUAeABmAG8AdQBuAGQAYQB0AGkAbwBuAC4AbwByAGcA;
	Sosha1_v1; 7; {DFC57731-9F7D-4ED5-A50D-AC04699D72C1};
	YwBoAGEAcwBlAC4AbQBhAHUAcABpAG4AQAB0AGkALgBjAG8AbQA=; Thu,
	04 Oct 2012 14:06:08 GMT;
	UgBFADoAIABbAE8ARQAtAGMAbwByAGUAXQAgAFsAUABBAFQAQwBIAF0AIABsAGkAYgB0AG8AbwBsADoAIABBAGQAZAAgAG0AaQBzAHMAaQBuAGcAIABEAEUAUABFAE4ARABTACAAbwBuACAAbABpAGIAdABvAG8AbAAtAGMAcgBvAHMAcwA=
x-cr-puzzleid: {DFC57731-9F7D-4ED5-A50D-AC04699D72C1}
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Add missing DEPENDS on libtool-cross
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 14:29:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of Maupin, Chase
> Sent: Thursday, October 04, 2012 8:02 AM
> To: Richard Purdie
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] libtool: Add missing DEPENDS on
> libtool-cross
>=20
> > -----Original Message-----
> > From: Richard Purdie
> [mailto:richard.purdie@linuxfoundation.org]
> > Sent: Thursday, October 04, 2012 7:58 AM
> > To: Maupin, Chase
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: RE: [OE-core] [PATCH] libtool: Add missing DEPENDS on
> > libtool-cross
> >
> > On Thu, 2012-10-04 at 12:39 +0000, Maupin, Chase wrote:
> > > I was able to reproduce this consistently on my build server
> > which has
> > > 24 cores running at 3.5 GHz.  I was using:
> > >
> > > BB_NUMBER_THREADS =3D "24"
> > >
> > > And
> > >
> > > PARALLEL_MAKE =3D "-j 24"
> > >
> > > I can try a build reducing the number of threads and see if
> the
> > issue
> > > goes away as this might be a difference between our builds.
> > Can you
> > > tell me what you are using?
> >
> > I tested this with 48/48 in master.
> >
> > > It seemed like a race condition because after I got the error
> I
> > was
> > > able to do a -c cleanall of libtool and kick off the build
> > again once
> > > libtool-cross was built and it would pass.  Likewise I did:
> > >
> > > bitbake libtool-cross
> > > bitbake libtool
> > >
> > > and that would work but just
> > >
> > > bitbake libtool
> > >
> > > would fail.
> >
> > "bitbake libtool" works here quite consistently. I therefore
> > don't want
> > to add this dependency until we figure out exactly what is
> racing
> > against what or have a better understanding of why this is
> > failing.
> > Something doesn't seem right as if your premise of a missing
> > dependency
> > is correct, the above wouldn't work.
>=20
> Understood.  Let me look closer.  My build setup is an Ubuntu
> 10.04 system and I'm using an external Arago toolchain as well.
> On my setup I can consistently cause this to fail even with a
> lower number of threads.  So perhaps the issue is not the
> libtool-cross dependency, but that libtool-cross itself forces
> something else to be built first.  Thanks for the information on
> your setup and confirmation that you do not see this issue.

I tried the following to help narrow this down.  Please let me know if ther=
e is something else I could try to help narrow the issue.  I ran:

bitbake -c cleanall libtool
bitbake libtool

Each time it failed I would get a list of the contents of the work director=
y and the stamps directory.  My goal here was to be able to find what chang=
ed between a pass and a fail.  I kept running the test above until I had a =
consistent failure, and there were no new packages being added into my work=
 directory and no new stamps being created.  Basically this told me that al=
l the packages that were going to be built from doing "bitbake libtool" wer=
e built and that the only package being built was libtool itself.

I then changed my build steps to do:

bitbake -c cleanall libtool
bitbake libtool-cross
bitbake libtool

This passed on the first run.  I captured the same work directory contents =
and stamps contents and then did a diff to see what had changed between the=
se builds.  The diffs were:

For Stamps diff libtool-failed-stamps libtool-passed-stamps
-----------------------------------------------------------
/arago-tmp-eglibc/stamps$ diff -burpN libtool-failed-stamps libtool-passed-=
stamps=20
--- libtool-failed-stamps	2012-10-04 09:11:27.909881710 -0500
+++ libtool-passed-stamps	2012-10-04 09:14:33.997328844 -0500
@@ -23,18 +23,56 @@ external-arago-toolchain-1.0-r2.do_popul
 external-arago-toolchain-1.0-r2.do_populate_sysroot.sigdata.bccac35b2b6fec=
d3cbec49ccc208c6a9
 external-arago-toolchain-1.0-r2.do_unpack
 external-arago-toolchain-1.0-r2.do_unpack.sigdata.14d8090b51a447ceb4ccf449=
41781e47
+libtool-2.4.2-r3.0.do_build
 libtool-2.4.2-r3.0.do_cleansstate
 libtool-2.4.2-r3.0.do_cleansstate.sigdata.e2a5d5c89e3be41823e835c18b50dfa3
+libtool-2.4.2-r3.0.do_compile
+libtool-2.4.2-r3.0.do_compile.sigdata.ea5125c6ecc524aed598dba3b731d92d
+libtool-2.4.2-r3.0.do_configure
+libtool-2.4.2-r3.0.do_configure.sigdata.2e462cacc7c699c75bce74bb7dcf55f4
 libtool-2.4.2-r3.0.do_create_srcipk
 libtool-2.4.2-r3.0.do_create_srcipk.sigdata.caa56f6b8b195ff4e6a063f1288c5f=
86
 libtool-2.4.2-r3.0.do_fetch
 libtool-2.4.2-r3.0.do_fetch.sigdata.0ccdbfe0aace02237038ae0203de9060
+libtool-2.4.2-r3.0.do_install
+libtool-2.4.2-r3.0.do_install.sigdata.9ad203ae762fe0556e7a991ab8a7707c
+libtool-2.4.2-r3.0.do_package.am335x-evm
+libtool-2.4.2-r3.0.do_package.sigdata.ffb4b811e7643d5f37afbcffef84f5e8
+libtool-2.4.2-r3.0.do_package_write
+libtool-2.4.2-r3.0.do_package_write_ipk
+libtool-2.4.2-r3.0.do_package_write_ipk.sigdata.eb16601f7f4f1afbfabc8542fe=
a3af30
 libtool-2.4.2-r3.0.do_patch
 libtool-2.4.2-r3.0.do_patch.sigdata.7d028f6dc6a1bdf32aadc29a6444bebc
 libtool-2.4.2-r3.0.do_populate_lic
 libtool-2.4.2-r3.0.do_populate_lic.sigdata.ebd50cceb0903e1b277ad6f53305537=
3
+libtool-2.4.2-r3.0.do_populate_sysroot.am335x-evm
+libtool-2.4.2-r3.0.do_populate_sysroot.sigdata.43f8d1df81e38dacd301eed5599=
094f1
 libtool-2.4.2-r3.0.do_unpack
 libtool-2.4.2-r3.0.do_unpack.sigdata.f97c2643ec8f5752b2537f305a45ca7e
+libtool-cross-2.4.2-r3.1.do_build
+libtool-cross-2.4.2-r3.1.do_compile
+libtool-cross-2.4.2-r3.1.do_compile.sigdata.c04f058e41aabe9001f0b82764d51d=
24
+libtool-cross-2.4.2-r3.1.do_configure
+libtool-cross-2.4.2-r3.1.do_configure.sigdata.b37940faf1adfcc783e7a66eff35=
1d4b
+libtool-cross-2.4.2-r3.1.do_create_srcipk
+libtool-cross-2.4.2-r3.1.do_create_srcipk.sigdata.37082cdfd6eb100923aab805=
101fe221
+libtool-cross-2.4.2-r3.1.do_fetch
+libtool-cross-2.4.2-r3.1.do_fetch.sigdata.79da02e9de369c7964c9b54e291088d5
+libtool-cross-2.4.2-r3.1.do_install
+libtool-cross-2.4.2-r3.1.do_install.sigdata.607177b917d48c411c6c2fbaf47586=
7b
+libtool-cross-2.4.2-r3.1.do_package.am335x-evm
+libtool-cross-2.4.2-r3.1.do_package.sigdata.4f0eb910d74ff36b564968e09a8e15=
f2
+libtool-cross-2.4.2-r3.1.do_package_write
+libtool-cross-2.4.2-r3.1.do_package_write_ipk
+libtool-cross-2.4.2-r3.1.do_package_write_ipk.sigdata.0cc36358a4c5dee1f612=
fe3a90c60b1a
+libtool-cross-2.4.2-r3.1.do_patch
+libtool-cross-2.4.2-r3.1.do_patch.sigdata.a319c3ae77229a7558409abc179ea99d
+libtool-cross-2.4.2-r3.1.do_populate_lic
+libtool-cross-2.4.2-r3.1.do_populate_lic.sigdata.82a19386b4380a0077d2b55f8=
934851a
+libtool-cross-2.4.2-r3.1.do_populate_sysroot.am335x-evm
+libtool-cross-2.4.2-r3.1.do_populate_sysroot.sigdata.8c61b5566945f9a439faa=
916d70a9fd0
+libtool-cross-2.4.2-r3.1.do_unpack
+libtool-cross-2.4.2-r3.1.do_unpack.sigdata.322a15e21f6df957f5ba116da19d558=
5
 linux-libc-headers-3.2-r1.do_compile
 linux-libc-headers-3.2-r1.do_compile.sigdata.6047c862356fa8f3a56269daf2cde=
26b
 linux-libc-headers-3.2-r1.do_configure

Notice that the only stamps for steps done between a passing and failing bu=
ild are for the libtool-cross, as well as the steps after the do_configure =
step of libtool since it passed this time.

The work directory difference was
-----------------------------------
--- libtool-failed-work	2012-10-04 09:17:50.137609986 -0500
+++ libtool-passed-work	2012-10-04 09:17:50.137609986 -0500
@@ -39,4 +39,5 @@ unifdef-native-2.6.18+git-r0
 zlib-native-1.2.6-r1
 external-arago-toolchain-1.0-r2
 libtool-2.4.2-r3.0
+libtool-cross-2.4.2-r3.1
 linux-libc-headers-3.2-r1

So the only new package I saw show-up in my work directory was libtool-cros=
s.

Does anyone have any other suggestions of what to look at since my testing =
is showing that adding libtool-cross into the build before libtool allows t=
he build to pass.  I'll try going back to the internal toolchain instead of=
 my external toolchain as another test to run but any other ideas would be =
appreciated.  Is my approach above even valid?

>=20
> >
> > Cheers,
> >
> > Richard
> >
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core


