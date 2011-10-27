Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=VA3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJHmr-0000KE-1M
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 06:41:54 +0200
Received: from mail150-va3-R.bigfish.com (10.7.14.237) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Oct 2011 04:20:38 +0000
Received: from mail150-va3 (localhost.localdomain [127.0.0.1])	by
	mail150-va3-R.bigfish.com (Postfix) with ESMTP id CFA5D9F8060	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 04:20:41 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VS-17(zz9371K542M1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail150-va3 (localhost.localdomain [127.0.0.1]) by mail150-va3
	(MessageSwitch) id 1319689241330289_19434;
	Thu, 27 Oct 2011 04:20:41 +0000 (UTC)
Received: from VA3EHSMHS003.bigfish.com (unknown [10.7.14.239])	by
	mail150-va3.bigfish.com (Postfix) with ESMTP id 4150A1328050	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 04:20:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS003.bigfish.com
	(10.7.99.13) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 27 Oct 2011 04:20:37 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Wed, 26 Oct 2011 23:20:40 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] Fix libgcc nativesdk to install libgcc.a in
	good location for tools
Thread-Index: AQHMlF/IAAToIflzD0ytAU6VwP27+w==
Date: Thu, 27 Oct 2011 04:20:39 +0000
Message-ID: <CAEsOVNe0UdXEvaJuxT67wsdbK8ZVwEsgLJShoVneLDpNf+T0rQ@mail.gmail.com>
References: <1312980634.6733.62.camel@phil-desktop>
	<1319684838-24527-1-git-send-email-msm@freescale.com>
	<840A81C1B782724A8EB52725BD519EFF1AA850@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1AA850@MBX20.4emm.local>
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
X-List-Received-Date: Thu, 27 Oct 2011 04:41:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4B1476617950A947B5984E0D4C7B93DF@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2011 at 10:40 PM, James Limbouris
<james@digitalmatter.com.au> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Matthew McClintock
>> Sent: Thursday, 27 October 2011 11:07 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [RFC] Fix libgcc nativesdk to install libgcc.a in goo=
d location
>> for tools
>>
>> This fixes an issue where we cannot find -lgcc when linking. We
>> update the path to libgcc.a so the library can be installed
>> correctly
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> I really doubt this is the correct fix and I'm no expert but it's
>> here for comments. This fixes a real u-boot cross compile build
>> issue
>>
>> The previous mv command was failing as the files did not exist
>> and I also rejiggered the packages since I was not sure if
>> gdb-cross-canadian-powerpc-dev was included in my tarball of
>> the toolchain
>>
>> =A0meta/recipes-devtools/gcc/libgcc_4.6.bb | =A0 =A06 +++---
>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-
>> devtools/gcc/libgcc_4.6.bb
>> index 63a46ec..7f3ac55 100644
>> --- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
>> +++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
>> @@ -8,9 +8,8 @@ PACKAGES =3D "\
>> =A0 =A0${PN}-dev \
>> =A0 =A0"
>>
>> -FILES_${PN} =3D "${base_libdir}/libgcc*.so.*"
>> +FILES_${PN} =3D "${base_libdir}/libgcc*"
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
>> + =A0 =A0 =A0 =A0 =A0 =A0 cp ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc*
>> ${D}${base_libdir}
>> =A0 =A0 =A0 fi
>>
>> +
>> =A0 =A0 =A0 chown -R root:root ${D}
>> =A0 =A0 =A0 chmod +x ${D}${base_libdir}/libgcc_s.so.*
>> =A0}
>> --
>> 1.7.6.1
>>
>
> Is this perhaps related to the following issue: http://lists.linuxtogo.or=
g/pipermail/openembedded-core/2011-October/011556.html ?
> Some builds had trouble finding libgcc due to a sysroot misconfiguration,=
 which has since been fixed in master.

I  applied this patch first. It did not fix my toolchain.

The recipe above still is looking for this file
'${D}${libdir}/libgcc*' before my patch - when that folder does not
even exist and it's actually
'${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc*'. It's worth noting that
FILES_${PN} is referencing the path where a file actually exists,
which makes me wonder why they are different, esp. since these two
lines were added in the same patch.

-M

-M=



