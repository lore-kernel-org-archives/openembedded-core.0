Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3u6V-0007gT-Vp
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:27:08 +0200
Received: from mail44-ch1-R.bigfish.com (10.43.68.237) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 19:15:03 +0000
Received: from mail44-ch1 (localhost [127.0.0.1])	by mail44-ch1-R.bigfish.com
	(Postfix) with ESMTP id 7BD5A3403C4;
	Tue, 21 Aug 2012 19:15:03 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail44-ch1 (localhost.localdomain [127.0.0.1]) by mail44-ch1
	(MessageSwitch) id 1345576501552401_30146;
	Tue, 21 Aug 2012 19:15:01 +0000 (UTC)
Received: from CH1EHSMHS013.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail44-ch1.bigfish.com (Postfix) with ESMTP id
	84DFD240080;	Tue, 21 Aug 2012 19:15:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS013.bigfish.com
	(10.43.70.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 19:15:01 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Tue, 21 Aug 2012 14:15:00 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Chris Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] [PATCH v2] kmod-native_git.bb: fix builds for hosts
	with older libc
Thread-Index: AQHNf8YH40JdCKhtsEicym6VlWG4D5dk4bEAgAAB8wCAAADlAIAABdkAgAAEm4CAAAdIgIAAAGoA
Date: Tue, 21 Aug 2012 19:15:00 +0000
Message-ID: <CAEsOVNcD=fDKo1Oc6u-qkshhfUcB0yA=8kS6xbzrRR59Fn8xPA@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
	<CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
	<CAEsOVNdFLhWft6kK-vY47DC7YHRxc1CUdgNgo-9LkdR2fEcvHw@mail.gmail.com>
	<CABcZANkRkduAEgBmG-nooaw=XEsuw_-eLbJVfgFKyiusxjwT0A@mail.gmail.com>
In-Reply-To: <CABcZANkRkduAEgBmG-nooaw=XEsuw_-eLbJVfgFKyiusxjwT0A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
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
X-List-Received-Date: Tue, 21 Aug 2012 19:27:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D43F067E6A96094E9FC01F07B5898E15@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 2:13 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Aug 21, 2012 at 11:47 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>> #ifndef O_CLOEXEC
>>> # define O_CLOEXEC 0
>>> #endif
>>>
>>> and be done with it
>>
>> Well this is seemingly the same way of doing it, just looks like you
>> always want it applied? I don't think it should always be applied.
>>
>> If this was it takes to get the build fix in, then I will do it...
>> please confirm what will be accepted.
>
> No, on newer systems O_CLOEXEC will be defined, so that #ifndef block
> will never be entered, and there'll be no change.

Right, I was not thinking...

-M=



