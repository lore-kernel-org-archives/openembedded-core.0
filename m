Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBWqn-0006gI-JV
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:09:53 +0200
Received: from mail2-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 19:04:18 +0000
Received: from mail2-ch1 (localhost.localdomain [127.0.0.1])	by
	mail2-ch1-R.bigfish.com (Postfix) with ESMTP id 430D019B8270	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 19:04:18 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail2-ch1 (localhost.localdomain [127.0.0.1]) by mail2-ch1
	(MessageSwitch) id 1317841458110759_12288;
	Wed,  5 Oct 2011 19:04:18 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail2-ch1.bigfish.com (Postfix) with ESMTP id
	1515BBF804D for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 19:04:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 19:04:17 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 14:04:17 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/6] Fix perl for powerpc64 build
Thread-Index: AQHMg5GU8cOir1liD0yhm0P6URX2wQ==
Date: Wed, 5 Oct 2011 19:04:16 +0000
Message-ID: <CAEsOVNdUTaVc1NR0hDH7PU1gVCXotJWEJquiz=EMQXQ231GmzA@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-2-git-send-email-msm@freescale.com>
	<1317815212.14671.142.camel@ted>
In-Reply-To: <1317815212.14671.142.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 2/6] Fix perl for powerpc64 build
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
X-List-Received-Date: Wed, 05 Oct 2011 19:09:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A780C0E8186CB44F90CA01D63828F1D7@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 6:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> --- a/meta/recipes-devtools/perl/perl_5.12.3.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbd=
ee469f02565f253d81a \
>> =A0# We need gnugrep (for -I)
>> =A0DEPENDS =3D "virtual/db grep-native"
>> =A0DEPENDS +=3D "gdbm zlib"
>> -PR =3D "r5"
>> +PR =3D "r6"
>>
>> =A0# 5.10.1 has Module::Build built-in
>> =A0PROVIDES +=3D "libmodule-build-perl"
>> @@ -95,6 +95,8 @@ export LDDLFLAGS =3D "${LDFLAGS} -shared"
>> =A0# We're almost Debian, aren't we?
>> =A0CFLAGS +=3D "-DDEBIAN"
>>
>> +export ARCH_powerpc64 =3D "powerpc64"
>> +
>
> I'm finding it really hard to believe this makes any difference. I just
> tried a powerpc64 build here and perl built fine. I can't find any
> evidence for any part of the perl build using an ARCH variable
> (TARGET_ARCH is used but that isn't ARCH).
>
> Can you give some further information about how/where this is used?

I'm trying to reproduce this again on 'edison' as well and it does not
appear to be occurring anymore! The problem before had to do with a
configuration script error:

config.sh-powerpc64-linux

This script was getting invoked as 'config.sh-powerpc-linux' on the
64bit build, then the file did not exist and the configure step failed
out. Not sure if this was somehow fixed in a different manner.

Please drop this patch for now. I'll bring it up again if I see issues.

-M=



