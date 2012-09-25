Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGaV0-0005I6-H0
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 21:08:50 +0200
Received: from mail223-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 25 Sep 2012 18:56:00 +0000
Received: from mail223-tx2 (localhost [127.0.0.1])	by
	mail223-tx2-R.bigfish.com (Postfix) with ESMTP id 743E8680134;
	Tue, 25 Sep 2012 18:56:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail223-tx2 (localhost.localdomain [127.0.0.1]) by mail223-tx2
	(MessageSwitch) id 134859935848701_6359;
	Tue, 25 Sep 2012 18:55:58 +0000 (UTC)
Received: from TX2EHSMHS025.bigfish.com (unknown [10.9.14.254])	by
	mail223-tx2.bigfish.com (Postfix) with ESMTP id 086B25400E6;
	Tue, 25 Sep 2012 18:55:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS025.bigfish.com
	(10.9.99.125) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 25 Sep 2012 18:55:55 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Tue, 25 Sep 2012 13:55:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] libx11: fix nativesdk build on older
	distros
Thread-Index: AQHNmwD5+brGPjerY06d7Y9qKwsk7g==
Date: Tue, 25 Sep 2012 18:55:54 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A7790@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<CAJTo0LYe6LuFQJS_36PYVsjwnp=N9J-XuiFVMntBi76qt+i4aw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A6CE2@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LZ7LrDg8JfOH6bVDV2PK6mnpqUsdHPwnvmUm1uen8uzMQ@mail.gmail.com>
	<CAEsOVNfCLUhhpM91OBLC_paOXzsoS6PMeVXdp2xSnajqGuBcyg@mail.gmail.com>
In-Reply-To: <CAEsOVNfCLUhhpM91OBLC_paOXzsoS6PMeVXdp2xSnajqGuBcyg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
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
X-List-Received-Date: Tue, 25 Sep 2012 19:08:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BD35AF6D4FCF914D913C22D4B45B57D3@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2012 at 12:38 PM, Matthew McClintock <msm@freescale.com> wr=
ote:
> On Tue, Sep 25, 2012 at 11:48 AM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>> Whoops, I dropped oe-core.
>>
>> On 25 September 2012 16:38, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>>>> Older libc do not have this defined, we can use the -D_GNU_SOURCE
>>>>> to the compiler to prevent generating calls to this function and
>>>>> make linking work
>>>>
>>>> Why isn't this from configure.ac working?
>>>>
>>>> # Set common system defines for POSIX extensions, such as _GNU_SOURCE
>>>> # Must be called before any macros that run the compiler (like AC_PROG=
_LIBTOOL)
>>>> # to avoid autoconf errors.
>>>> AC_USE_SYSTEM_EXTENSIONS
>>>
>>> Do these make it to CC_FOR_BUILD? Here is what it looks like before:
>>
>> AC_USE_SYSTEM_EXTENSIONS sets _GNU_SOURCE (and more) using AC_DEFINE,
>> so they end up in config.h... which isn't being included in
>> makekeys.c.
>>
>> So the correct and upstreamable fix is to include config.h from makekeys=
.c.
>
> I read somewhere (very informative - I know - but I've forgot where)
> that you are not supposed to include config.h for CC_FOR_BUILD
> targets? I'm not expert and just double checking on this bit as the
> correct solution.

Found it: http://sources.redhat.com/autobook/autobook/autobook_270.html

-M=



