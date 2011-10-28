Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJsJN-0003MD-Om
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 21:41:55 +0200
Received: from mail44-ch1-R.bigfish.com (10.43.68.249) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.22; Fri, 28 Oct 2011 19:35:42 +0000
Received: from mail44-ch1 (localhost.localdomain [127.0.0.1])	by
	mail44-ch1-R.bigfish.com (Postfix) with ESMTP id 0C2F01238082	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 19:35:47 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K936eK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail44-ch1 (localhost.localdomain [127.0.0.1]) by mail44-ch1
	(MessageSwitch) id 1319830544796754_14164;
	Fri, 28 Oct 2011 19:35:44 +0000 (UTC)
Received: from CH1EHSMHS020.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail44-ch1.bigfish.com (Postfix) with ESMTP id
	BDCF71570046	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 19:35:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS020.bigfish.com
	(10.43.70.20) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 28 Oct 2011 19:35:47 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Fri, 28 Oct 2011 14:35:46 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] Fix libgcc nativesdk to install libgcc.a in
	good location for tools
Thread-Index: AQHMlajKAAToIflzD0ytAU6VwP27+w==
Date: Fri, 28 Oct 2011 19:35:46 +0000
Message-ID: <CAEsOVNdrd3THky7JzPB_r-GqZT6iVQdnySvzvUryWj=0bNs3cw@mail.gmail.com>
References: <1312980634.6733.62.camel@phil-desktop>
	<1319684838-24527-1-git-send-email-msm@freescale.com>
	<1319792621.22423.7.camel@ted>
In-Reply-To: <1319792621.22423.7.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [RFC] Fix libgcc nativesdk to install libgcc.a in good location for tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 28 Oct 2011 19:41:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B7918D9DC5F5C84B87EA90662F4ECA77@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2011 at 4:03 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-10-26 at 22:07 -0500, Matthew McClintock wrote:
>> This fixes an issue where we cannot find -lgcc when linking. We
>> update the path to libgcc.a so the library can be installed
>> correctly
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> I really doubt this is the correct fix and I'm no expert but it's
>> here for comments. This fixes a real u-boot cross compile build
>> issue
>
> This patch looks very very confused to me. Firstly your subject summary
> talks about libgcc-nativesdk. This is the compiler used to generate
> binaries for SDKMACHINE so I seriously doubt you're using nativesdk to
> build uboot.
>
>> The previous mv command was failing as the files did not exist
>> and I also rejiggered the packages since I was not sure if
>> gdb-cross-canadian-powerpc-dev was included in my tarball of
>> the toolchain
>>
>> =A0meta/recipes-devtools/gcc/libgcc_4.6.bb | =A0 =A06 +++---
>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devt=
ools/gcc/libgcc_4.6.bb
>> index 63a46ec..7f3ac55 100644
>> --- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
>> +++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
>> @@ -8,9 +8,8 @@ PACKAGES =3D "\
>> =A0 =A0${PN}-dev \
>> =A0 =A0"
>>
>> -FILES_${PN} =3D "${base_libdir}/libgcc*.so.*"
>> +FILES_${PN} =3D "${base_libdir}/libgcc*"
>
> This is changing the packging of libgcc too, not just libgcc-nativesdk.
> It is not correct to be putting the dynamic linking symlinks in anything
> but the -dev package so the above and the line below are therefore wrong
> too.
>
>> =A0FILES_${PN}-dev =3D " \
>> - =A0${base_libdir}/libgcc*.so \
>> =A0 =A0${libdir}/${TARGET_SYS}/${BINV}/crt* \
>> =A0 =A0${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
>>
>> @@ -29,9 +28,10 @@ do_install () {
>> =A0 =A0 =A0 if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv ${D}${libdir}/nof/libgcc* ${D}${base_libd=
ir}
>> =A0 =A0 =A0 else
>> - =A0 =A0 =A0 =A0 =A0 =A0 mv ${D}${libdir}/libgcc* ${D}${base_libdir} ||=
 true
>> + =A0 =A0 =A0 =A0 =A0 =A0 cp ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc*=
 ${D}${base_libdir}
>> =A0 =A0 =A0 fi
>
> Equally, you're moving a static library from the -dev package into the
> main package which is wrong, you only need that if you're doing
> development.
>
> Are you sure your problem is not that you didn't have the libgcc-dev
> package installed?

Yes, it turns out I was having some build issues with my environment.
I changed branches in the middle of a build inadvertently and it
screwed everything up.

After a clean build, the toolchain finds libgcc.a if I apply this
patch to the edison branch:

commit f8b94b106f93d33d6ca1a87ac14d710772d77c67
Author: Khem Raj <raj.khem@gmail.com>
Date:   Thu Oct 20 22:28:42 2011 -0700

    gcc-configure-sdk: Point sysroot to correct location

    (From OE-Core rev: c9883733fed9267b1a936c08500a4caf8dc52d3d)

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Sorry for the noise. Please ignore this.

-M=



