Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3tuV-0005Jg-9k
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:14:43 +0200
Received: from mail196-va3-R.bigfish.com (10.7.14.250) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 18:47:34 +0000
Received: from mail196-va3 (localhost [127.0.0.1])	by
	mail196-va3-R.bigfish.com (Postfix) with ESMTP id DFFEE300083;
	Tue, 21 Aug 2012 18:47:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail196-va3 (localhost.localdomain [127.0.0.1]) by mail196-va3
	(MessageSwitch) id 1345574853468858_28352;
	Tue, 21 Aug 2012 18:47:33 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.238])	by
	mail196-va3.bigfish.com (Postfix) with ESMTP id 5B0C3180192;
	Tue, 21 Aug 2012 18:47:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 18:47:28 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 21 Aug 2012 13:47:27 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] kmod-native_git.bb: fix builds for hosts
	with older libc
Thread-Index: AQHNf8YH40JdCKhtsEicym6VlWG4D5dk4bEAgAAB8wCAAADlAIAABdkAgAAEm4A=
Date: Tue, 21 Aug 2012 18:47:27 +0000
Message-ID: <CAEsOVNdFLhWft6kK-vY47DC7YHRxc1CUdgNgo-9LkdR2fEcvHw@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
	<CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
In-Reply-To: <CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2012 19:14:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <46C29AFA11617D4281F136D83D7F2AE6@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 1:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 21, 2012 at 11:10 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Tue, Aug 21, 2012 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
>>> <B29882@freescale.com> wrote:
>>>> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock <msm@freescale.co=
m> wrote:
>>>>>> +
>>>>>> +do_configure_prepend (){
>>>>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; th=
en
>>>>>> +               export CFLAGS=3D"$CFLAGS -D O_CLOEXEC=3D0"
>>>>>> +       fi
>>>>>> +}
>>>>>
>>>>>
>>>>> IMO It would be safer to create a patch for kmod itself where you
>>>>> define O_CLOEXEC if it
>>>>> was not defined before. The above seems a bit risky
>>>>
>>>> Why is it risky? I only wanted to do this for affected systems. There
>>>> is not an easy way to do this with a patch, unless of course I apply
>>>> the patch manually.
>>>
>>> manually gripping at the host installation and then if O_CLOEXEC might
>>> be in comments
>>
>> How about grep define.*O_CLOEXEC -r ${includedir_native}/bits/fcntl.h
>>
>>> and furthermore it if it comes from fcntl.h which is not where you are
>>> looking for
>>
>> I am grepping this file though?
>
> I would go into the specific file where its asking for O_CLOEXEC
>
> and add
>
> #ifndef O_CLOEXEC
> # define O_CLOEXEC 0
> #endif
>
> and be done with it

Well this is seemingly the same way of doing it, just looks like you
always want it applied? I don't think it should always be applied.

If this was it takes to get the build fix in, then I will do it...
please confirm what will be accepted.

-M

>
>>
>>> there are few variables like that where its impacting more than
>>> affected systems.
>>
>> I don't follow...
>>
>> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



