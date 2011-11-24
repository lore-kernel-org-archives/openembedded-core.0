Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RTQBz-0005uA-6K
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 04:41:43 +0100
Received: from mail23-db3-R.bigfish.com (10.3.81.249) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.22; Thu, 24 Nov 2011 03:34:26 +0000
Received: from mail23-db3 (localhost [127.0.0.1])	by mail23-db3-R.bigfish.com
	(Postfix) with ESMTP id 21DE5603AB	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:34:01 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VS-17(zz9371Kdf9M1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail23-db3 (localhost.localdomain [127.0.0.1]) by mail23-db3
	(MessageSwitch) id 1322105640954459_16515;
	Thu, 24 Nov 2011 03:34:00 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.254])	by
	mail23-db3.bigfish.com (Postfix) with ESMTP id DBFC540043	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:34:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS005.bigfish.com
	(10.3.87.105) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 24 Nov 2011 03:34:25 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Wed, 23 Nov 2011 21:35:06 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
Thread-Index: AQHMqloOvCtx6Pv4A0Kv3YkijylUDw==
Date: Thu, 24 Nov 2011 03:35:05 +0000
Message-ID: <CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
In-Reply-To: <CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Thu, 24 Nov 2011 03:41:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FD39E0372C97A245BADF2E2F53DBEED9@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 9:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Nov 23, 2011 at 1:40 AM, Matthew McClintock <msm@freescale.com> w=
rote:
>> Without some sort of dependency on the HOST arch this "fake"
>> target package will be reused on a 32bit system even if it was
>> built on a 64bit system.
>>
>> This new dependecy should prevent that from occuring.
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> Comments? I still this this is VERY BAD since it will trigger
>> all TARGET cache to be rebuilt just because we changed ARCH.
>> However, it should generate working sstate-cache. Might
>> address this issue:
>>
>> | checking for /home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-=
fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.=
i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/home/liut/poky/build_p4080ds_rel=
ease/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r=
10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/ -m32 -mhard-flo=
at =A0-mcpu=3De500mc -isystem/home/liut/poky/build_p4080ds_release/tmp/sysr=
oots/p4080ds/usr/include -B/home/liut/poky/build_p4080ds_release/tmp/sysroo=
ts/i686-linux/usr/powerpc-fsl-linux/bin/ -B/home/liut/poky/build_p4080ds_re=
lease/tmp/sysroots/i686-linux/usr/powerpc-fsl-linux/lib/ -isystem /home/liu=
t/poky/build_p4080ds_release/tmp/sysroots/i686-linux/usr/powerpc-fsl-linux/=
include -isystem /home/liut/poky/build_p4080ds_release/tmp/sysroots/i686-li=
nux/usr/powerpc-fsl-linux/sys-include --sysroot=3D/home/liut/poky/build_p40=
80ds_release/tmp/sysroots/p4080ds-tcbootstrap =A0 option to accept ISO C89.=
.. none needed
>> | checking how to run the C preprocessor... /home/liut/poky/build_p4080d=
s_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175=
454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/hom=
e/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-in=
termediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl=
-linux/./gcc/ -E
>> | configure: error: in `/home/liut/poky/build_p4080ds_release/tmp/work/p=
pce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-bran=
ch/build.i686-linux.powerpc-fsl-linux/powerpc-fsl-linux/libgcc':
>> | configure: error: C preprocessor "/home/liut/poky/build_p4080ds_releas=
e/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/=
gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/home/liut/p=
oky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermedia=
te-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/.=
/gcc/ -E" fails sanity check
>> | See `config.log' for more details.
>> | make[1]: *** [configure-target-libgcc] Error 1
>> | make[1]: Leaving directory `/home/liut/poky/build_p4080ds_release/tmp/=
work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_=
6-branch/build.i686-linux.powerpc-fsl-linux'
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
>> | ERROR: Function 'do_compile' failed (see /home/liut/poky/build_p4080ds=
_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr1754=
54-r10/temp/log.do_compile.27393 for further information)
>>
>> =A0meta/recipes-devtools/gcc/gcc-4.6.inc =A0 | =A0 =A02 +-
>> =A0meta/recipes-devtools/gcc/gcc-cross.inc | =A0 11 +++++++++++
>> =A02 files changed, 12 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtoo=
ls/gcc/gcc-4.6.inc
>> index f7bcf30..ee42fa7 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>> @@ -1,6 +1,6 @@
>> =A0require gcc-common.inc
>>
>> -PR =3D "r10"
>> +PR =3D "r11"
>>
>> =A0# Third digit in PV should be incremented after a minor release
>> =A0# happens from this branch on gcc e.g. currently its 4.6.0
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devt=
ools/gcc/gcc-cross.inc
>> index 5a796bc..9f6d6ad 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>> @@ -10,3 +10,14 @@ do_compile () {
>> =A0 =A0 =A0 =A0oe_runmake all-host all-target-libgcc
>> =A0}
>>
>> +# gcc-cross is special since it builds a HOST binary on
>> +# as a TARGET recipe. This is a hack to pull in the
>> +# BUILD_ARCH to the recipe so the sstate-cache is
>> +# different if the HOST ARCH has changed. By expanding
>> +# right now we assure it's going to be in the sig
>> +BUILD_ARCH_EXPANDED :=3D "${BUILD_ARCH}"
>> +
>> +# we also add this to the PV so its clear in filenames
>> +# that this is arch specific even though it's labeled as
>> +# a target package
>> +PV .=3D "+${BUILD_ARCH_EXPANDED}"
>> --
>> 1.7.6.1
>>
>
> isnt BUILD_ARCH in signature

This is a TARGET recipe, so it should *not* be right? By doing what is
above I've added it. Although I habe not  extensively tested this
modification...

-M=



