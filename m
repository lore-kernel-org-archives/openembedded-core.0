Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3u2z-0005XK-G5
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:23:29 +0200
Received: from mail192-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 19:11:24 +0000
Received: from mail192-ch1 (localhost [127.0.0.1])	by
	mail192-ch1-R.bigfish.com (Postfix) with ESMTP id CE921400C8;
	Tue, 21 Aug 2012 19:11:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail192-ch1 (localhost.localdomain [127.0.0.1]) by mail192-ch1
	(MessageSwitch) id 1345576283115853_6599;
	Tue, 21 Aug 2012 19:11:23 +0000 (UTC)
Received: from CH1EHSMHS015.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail192-ch1.bigfish.com (Postfix) with ESMTP id
	10920440066;	Tue, 21 Aug 2012 19:11:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS015.bigfish.com
	(10.43.70.15) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 19:11:22 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 21 Aug 2012 14:11:21 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Chris Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] [PATCH v2] kmod-native_git.bb: fix builds for hosts
	with older libc
Thread-Index: AQHNf8YH40JdCKhtsEicym6VlWG4D5dk4bEAgAAB8wCAAADlAIAABdkAgAADHACAAAHDAIAABCAAgAACSYA=
Date: Tue, 21 Aug 2012 19:11:21 +0000
Message-ID: <CAEsOVNddnJ=4g8oPfy5ORB8573336+7mKbWn1_qNyC0ncd3T2A@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
	<CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
	<5033D668.3070909@linux.intel.com>
	<CAMKF1spHrm52LmxO=b7G4i_DmSY+eNVR_2=LUX2bqKUGTyxgaQ@mail.gmail.com>
	<CABcZANkC-w4r59-7NXK4TufF6dms2cdRAzD+pFYSvcYrOWX1WQ@mail.gmail.com>
In-Reply-To: <CABcZANkC-w4r59-7NXK4TufF6dms2cdRAzD+pFYSvcYrOWX1WQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2012 19:23:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F9E487CBA1EB6B43AD66BEA0F59B8B9E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 2:02 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Aug 21, 2012 at 11:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Aug 21, 2012 at 11:41 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 08/21/2012 11:30 AM, Khem Raj wrote:
>>>>
>>>> On Tue, Aug 21, 2012 at 11:10 AM, McClintock Matthew-B29882
>>>> <B29882@freescale.com> wrote:
>>>>>
>>>>> On Tue, Aug 21, 2012 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>
>>>>>> On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
>>>>>> <B29882@freescale.com> wrote:
>>>>>>>
>>>>>>> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wro=
te:
>>>>>>>>
>>>>>>>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock
>>>>>>>> <msm@freescale.com> wrote:
>>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +do_configure_prepend (){
>>>>>>>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h;
>>>>>>>>> then
>>>>>>>>> +               export CFLAGS=3D"$CFLAGS -D O_CLOEXEC=3D0"
>>>>>>>>> +       fi
>>>>>>>>> +}
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> IMO It would be safer to create a patch for kmod itself where you
>>>>>>>> define O_CLOEXEC if it
>>>>>>>> was not defined before. The above seems a bit risky
>>>>>>>
>>>>>>>
>>>>>>> Why is it risky? I only wanted to do this for affected systems. The=
re
>>>>>>> is not an easy way to do this with a patch, unless of course I appl=
y
>>>>>>> the patch manually.
>>>>>>
>>>>>>
>>>>>> manually gripping at the host installation and then if O_CLOEXEC mig=
ht
>>>>>> be in comments
>>>>>
>>>>>
>>>>> How about grep define.*O_CLOEXEC -r ${includedir_native}/bits/fcntl.h
>>>>>
>>>>>> and furthermore it if it comes from fcntl.h which is not where you a=
re
>>>>>> looking for
>>>>>
>>>>>
>>>>> I am grepping this file though?
>>>>
>>>>
>>>> I would go into the specific file where its asking for O_CLOEXEC
>>>>
>>>> and add
>>>>
>>>> #ifndef O_CLOEXEC
>>>> # define O_CLOEXEC 0
>>>> #endif
>>>>
>>>> and be done with it
>
> This does seem like a nicer approach.

OK - 2v1 ;) I'll respin as a patch.

-M=



