Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THRdz-00075g-Vf
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 05:53:40 +0200
Received: from mail95-ch1-R.bigfish.com (10.43.68.239) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 03:40:46 +0000
Received: from mail95-ch1 (localhost [127.0.0.1])	by mail95-ch1-R.bigfish.com
	(Postfix) with ESMTP id BD05848009A;
	Fri, 28 Sep 2012 03:40:46 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz98dI9371I1432Id6f1izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail95-ch1 (localhost.localdomain [127.0.0.1]) by mail95-ch1
	(MessageSwitch) id 1348803644842555_4172;
	Fri, 28 Sep 2012 03:40:44 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail95-ch1.bigfish.com (Postfix) with ESMTP id
	BFB9A4E0052;	Fri, 28 Sep 2012 03:40:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 03:40:44 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Thu, 27 Sep 2012 22:40:43 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] perl install error
Thread-Index: AQHNnSsJbPfdUfkH6UeNb9LQuJLCBQ==
Date: Fri, 28 Sep 2012 03:40:42 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
	<E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
In-Reply-To: <E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: perl install error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 03:53:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E5A562B735D0454589D176D4CE6260FA@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Khem,

I'm just not looking at a similiar issue. Do this:

cat tmp/sstate-control/manifest-* | grep usr/lib/perl5

And see which recipe is making this folder. It should be the perl
recipe, first not some other recipe...

Side question are you using FSL layers?

-M

On Thu, Sep 27, 2012 at 10:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sep 27, 2012, at 8:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Hi
>>
>> On ppc64 I am getting
>>
>> | Warning: perl appears in your path in the following locations beyond w=
here
>> | we just installed it:
>> |     /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/perl-nati=
ve/perl
>> |
>> | make[1]: Nothing to be done for `install.man'.
>> | make[1]: Leaving directory `/work/yocto/poky/build/tmp/work/ppc64e5500=
-poky-linux/perl-5.14.2-r10/perl-5.14.2'
>> | ln: failed to create symbolic link `/work/yocto/poky/build/tmp/work/pp=
c64e5500-poky-linux/perl-5.14.2-r10/image//usr/lib64/perl5': No such file o=
r directory
>> | ERROR: Function failed: do_install (see /work/yocto/poky/build/tmp/wor=
k/ppc64e5500-poky-linux/perl-5.14.2-r10/temp/log.do_install.6656 for furthe=
r information)
>> ERROR: Task 1679 (/work/yocto/poky/meta/recipes-devtools/perl/perl_5.14.=
2.bb, do_install) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 4082 tasks of which 4057 didn't need to b=
e rerun and 1 failed.
>>
>>
>> It was working fine yesterday
>> anyone else seeing it ?
>
>
> If I revert
>
> perl: Fix nativesdk install path
> Commit 38234f2e276356b1d77a87ceabc486107e336d19 tried to fix the sed
> expressions by anchoring the left side of the search regexp to prevent
> $prefix$prefix type expression in the perl config. For nativesdk this is
> not enough. Adding anchors on both side fixes this.
>
> Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
>
> It works again
>
> Thanks
> -Khem
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



