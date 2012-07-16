Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SqdBV-0007ZN-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 06:45:25 +0200
Received: from mail168-co1-R.bigfish.com (10.243.78.230) by
	CO1EHSOBE016.bigfish.com (10.243.66.79) with Microsoft SMTP Server id
	14.1.225.23; Mon, 16 Jul 2012 04:34:06 +0000
Received: from mail168-co1 (localhost [127.0.0.1])	by
	mail168-co1-R.bigfish.com (Postfix) with ESMTP id 38077180203;
	Mon, 16 Jul 2012 04:34:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -14
X-BigFish: VS-14(zz98dI9371I1443I1432I14e3M11f6Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail168-co1 (localhost.localdomain [127.0.0.1]) by mail168-co1
	(MessageSwitch) id 1342413244304717_19139;
	Mon, 16 Jul 2012 04:34:04 +0000 (UTC)
Received: from CO1EHSMHS010.bigfish.com (unknown [10.243.78.253])	by
	mail168-co1.bigfish.com (Postfix) with ESMTP id 3EE48C8009B;
	Mon, 16 Jul 2012 04:34:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS010.bigfish.com
	(10.243.66.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 16 Jul 2012 04:34:04 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Sun, 15 Jul 2012 23:34:03 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Bincy K Philip <bincy_k_philip@yahoo.co.in>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Error in rpm bitbake
Thread-Index: AQHNYQO9ZmW3yY65BUipm5vODNsTspcqqlkAgAD/y4A=
Date: Mon, 16 Jul 2012 04:34:02 +0000
Message-ID: <CAEsOVNcruG7TTqQukCd32FVfXOPbPPxj59uQfrKEA8ySQmzCEQ@mail.gmail.com>
References: <1342182619.93150.YahooMailNeo@web192606.mail.sg3.yahoo.com>
	<CAEsOVNdaBGNy2rDbqfA8ym+S7uMd3DA9FRAGunX0-MLRpuzcqg@mail.gmail.com>
	<1342200594.69949.YahooMailNeo@web192606.mail.sg3.yahoo.com>
	<CAEsOVNf1JGCiztMALddGMpV2qkhe_0LemrLA0yKvqyV9Nv07BQ@mail.gmail.com>
	<1342283369.62528.YahooMailNeo@web192604.mail.sg3.yahoo.com>
	<CAEsOVNftXUBgAh=FCa0a5qihWkzrAO+_vMbkOrcjQz60vqHoMQ@mail.gmail.com>
	<1342291749.27854.YahooMailNeo@web192604.mail.sg3.yahoo.com>
	<CAEsOVNeLasnMNMHp3fbFhjpMe1sULHDS5OydYeECXgUeXYE-Jw@mail.gmail.com>
	<1342358290.15023.YahooMailNeo@web192605.mail.sg3.yahoo.com>
In-Reply-To: <1342358290.15023.YahooMailNeo@web192605.mail.sg3.yahoo.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Error in rpm bitbake
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
X-List-Received-Date: Mon, 16 Jul 2012 04:45:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1E8C71F7B75BB744A055C0AE867D60D8@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 15, 2012 at 8:18 AM, Bincy K Philip
<bincy_k_philip@yahoo.co.in> wrote:
>
> Hi,  after applying the patch, I got the error message as follows.
>
>  patching file meta/recipes-devtools/rpm/rpm/dbconvert.patch
>> patching file meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> Hunk #1 FAILED at 43.
>> Hunk #2 FAILED at 75.
>
> My rpm_5.4.9.rej is attached.
>
> Please look into this

Bincy,

This is a trivial patch to fix to apply cleanly. Give it a shot.
Google around for more help with patches and resolving patches.

-M

>
> Regards
> Bincy
> From: McClintock Matthew-B29882 <B29882@freescale.com>
>
> To: Bincy K Philip <bincy_k_philip@yahoo.co.in>; Patches and discussions
> about the oe-core layer <openembedded-core@lists.openembedded.org>
> Sent: Sunday, 15 July 2012 2:23 AM
>
> Subject: Re: [OE-core] Error in rpm bitbake
>
> On Sat, Jul 14, 2012 at 1:49 PM, Bincy K Philip
> <bincy_k_philip@yahoo.co.in> wrote:
>>
>> Could you please explain a little more on this.
>> Thank you
>
> My patch is not applying to your tree - can you show the conflicts?
> Show us the output of git diff after running the patch command.
>
> -M
>
>
>> From: McClintock Matthew-B29882 <B29882@freescale.com>
>> To: Bincy K Philip <bincy_k_philip@yahoo.co.in>
>> Cc: McClintock Matthew-B29882 <B29882@freescale.com>
>> Sent: Saturday, 14 July 2012 10:58 PM
>>
>> Subject: Re: [OE-core] Error in rpm bitbake
>>
>> You need to send all your replies to the list. And it's from an older
>> libc version. That patch should apply with a little bit of work.
>>
>> -M
>>
>> On Sat, Jul 14, 2012 at 11:29 AM, Bincy K Philip
>> <bincy_k_philip@yahoo.co.in> wrote:
>>> Hi Mathew,
>>>
>>> Is this problem specific to OS or kernel version..?
>>> |T|hanks for the help.
>>>
>>> Regards
>>> Bincy
>>>
>>> From: McClintock Matthew-B29882 <B29882@freescale.com>
>>> To: Bincy K Philip <bincy_k_philip@yahoo.co.in>
>>> Cc: McClintock Matthew-B29882 <B29882@freescale.com>
>>> Sent: Saturday, 14 July 2012 12:12 AM
>>> Subject: Re: [OE-core] Error in rpm bitbake
>>>
>>> On Fri, Jul 13, 2012 at 12:29 PM, Bincy K Philip
>>> <bincy_k_philip@yahoo.co.in> wrote:
>>>> Hi Mathew,
>>>>
>>>> Thank you very much for the reply.
>>>>
>>>> I have tried out following steps.
>>>>
>>>> 1.Copied the patch contents into one file called dbconvert.patch
>>>> 2.Copied the dbconvert.patch in tmp/layers/openembeddedcore
>>>> 3.Gave the command patch -p1< dbconvert.patch
>>>> 4.I got following error mesage
>>>>
>>>>
>>>> patching file meta/recipes-devtools/rpm/rpm/dbconvert.patch
>>>> patching file meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>>> Hunk #1 FAILED at 43.
>>>> Hunk #2 FAILED at 75.
>>>> I am not able to sortout this issue.Can you please suggest on this.
>>>>
>>>> Also in my bitbake I am getting this error.
>>>>
>>>> Summary: 1 task failed:
>>>>
>>>>
>>>>
>>>> virtual:native:/local/jenkins/build_project/mvldir_ggg/tmp/layers/open=
embedded-core-030712/openembedded-core-030712//meta/recipes-devtools/rpm/rp=
m_5.4.9.bb,
>>>> do_patch
>>>
>>> My patch did not apply cleanly to the version of poky you are using -
>>> this needs to be fixed.
>>>
>>> -M
>>>
>>>>
>>>> Could you please guide me.
>>>> Thank you
>>>> From: McClintock Matthew-B29882 <B29882@freescale.com>
>>>> To: Bincy K Philip <bincy_k_philip@yahoo.co.in>; Patches and discussio=
ns
>>>> about the oe-core layer <openembedded-core@lists.openembedded.org>
>>>> Sent: Friday, 13 July 2012 7:58 PM
>>>> Subject: Re: [OE-core] Error in rpm bitbake
>>>>
>>>> On Fri, Jul 13, 2012 at 7:30 AM, Bincy K Philip
>>>> <bincy_k_philip@yahoo.co.in> wrote:
>>>>> Dear all,
>>>>>
>>>>> I have started to work with open embedded only 3 months back.
>>>>>
>>>>> I got attached error log while trying for " bitbake rpm". This rpm
>>>>> failure
>>>>> causes my bitbake core-image-minimal to fail.
>>>>>
>>>>>
>>>>> I have gone through some Google posts and understood dbconver.c cause=
s
>>>>> this
>>>>> error & need to exclude this file from compiling.I am not aware of ho=
w
>>>>> to
>>>>> do
>>>>> that.Can anyone answer this?
>>>>>
>>>>> Also I have seen that there is one dbconvert.patch work in progress.
>>>>> But
>>>>> couldn't find out this file in open embedded git repository.
>>>>>
>>>>> Please help me to sort out this issue.This is really blocking me.
>>>>>
>>>>> Thanks in advance...
>>>>
>>>> Bincy,
>>>>
>>>> I submitted a patch for this a few days ago. Waiting for it to be
>>>> applied or for feedback:
>>>>
>>>>
>>>>
>>>>
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmat=
tsm/master&id=3D9cd3f21ab41c039ddcc6bbff521f9d7b284813ae
>>>>
>>>> -M
>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=



