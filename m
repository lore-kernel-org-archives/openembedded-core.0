Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SpP73-0005eJ-Ar
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 21:31:45 +0200
Received: from mail66-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jul 2012 19:20:29 +0000
Received: from mail66-ch1 (localhost [127.0.0.1])	by mail66-ch1-R.bigfish.com
	(Postfix) with ESMTP id 2D6E526029E	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 19:20:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371Ic89bh936eI1432Izz1202hzz8275ch8275dhz2dh2a8h668h839h8e2h8e3h946hf0ah107ahbe9i)
Received: from mail66-ch1 (localhost.localdomain [127.0.0.1]) by mail66-ch1
	(MessageSwitch) id 1342120828196189_16275;
	Thu, 12 Jul 2012 19:20:28 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail66-ch1.bigfish.com (Postfix) with ESMTP id
	2493A380049 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 19:20:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jul 2012 19:20:27 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Thu, 12 Jul 2012 14:20:29 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/3] Fix xz compression command and optimize
	compression time
Thread-Index: AQHNYGNlcCRCWByl1Uu4uAcAGrHhQw==
Date: Thu, 12 Jul 2012 19:20:28 +0000
Message-ID: <CAEsOVNdmS9eFrdRbx4_9+RqEzr6=CAWmAwPo_4wNLYAEvyekVg@mail.gmail.com>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
In-Reply-To: <8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
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
X-List-Received-Date: Thu, 12 Jul 2012 19:31:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <40F26EFDC221EC439496ACD9B032ED25@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 1:58 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Any volunteers to test this on a system with >4 real cores?

How do you get the memory usage bit?

-M

>
> Op 12 jul. 2012, om 20:13 heeft Andrei Gherzan het volgende geschreven:
>
>> Koen suggested to add -T to xz commands. We have this option implemented=
 in our current version .1alpha.
>>
>> -T threads, --threads=3Dthreads
>>              Specify the number of worker threads to use.  Setting threa=
ds to
>>              a special value 0 makes xz use as many threads as there are=
  CPU
>>              cores  on  the system.  The actual number of threads can be=
 less
>>              than threads if the input file is not big enough  for  thre=
ading
>>              with  the  given  settings or if using more threads would e=
xceed
>>              the memory usage limit.
>>
>> -------------------
>>
>> Memory: 7.8 GiB
>> Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4
>>
>> File to compress: 1.9G
>>
>> xz -f -k -e -9 --check=3Dcrc32 (current configuration)
>> Memory: 673Mb
>> real    6m37.170s
>> user    6m35.389s
>> sys     0m0.884s
>> Compressed file size: 3.4Mb
>>
>> xz -f -k -e -9 -T 4 --check=3Dcrc32
>> Memory: Cannot allocate memory
>>
>> xz -f -k -e -8 -T 4 --check=3Dcrc32
>> Memory: 1.8G
>> real    3m24.462s
>> user    12m8.502s
>> sys     0m2.180s
>> Compressed file size: 3.4Mb
>>
>> xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
>> Memory: 471Mb
>> real    1m9.265s
>> user    4m8.972s
>> sys     0m0.944s
>> Compressed file size: 3.4Mb
>>
>> So my conclusion would be to use the default -e -6 with -T 0.
>>
>> The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02=
669:
>>
>>  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>>
>> are available in the git repository at:
>>
>>  git://git.yoctoproject.org/poky-contrib ag/xz
>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dag/xz
>>
>> Andrei Gherzan (3):
>>  image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
>>    data to file
>>  image_types.bbclass: Add XZ variable to set number of threads to be
>>    used while compressing
>>  image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
>>
>> meta/classes/image_types.bbclass |    5 +++--
>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> --
>> 1.7.9.5
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



