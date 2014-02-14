Return-Path: <sanjay_dorairaj@cable.comcast.com>
Received: from cable.comcast.com (copdcavout01.cable.comcast.com
	[76.96.32.253])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0606DEDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 15:53:10 +0000 (UTC)
Received: from ([24.40.56.115])
	by copdcavout01.cable.comcast.com with ESMTP  id C7WM3M1.117196093;
	Fri, 14 Feb 2014 08:53:07 -0700
Received: from PACDCEXMB12.cable.comcast.com ([169.254.6.149]) by
	PACDCEXHUB02.cable.comcast.com ([fe80::492e:3fa1:c2ad:e04e%13]) with
	mapi id 14.03.0158.001; Fri, 14 Feb 2014 10:53:07 -0500
From: "Dorairaj, Sanjay" <Sanjay_Dorairaj@cable.comcast.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] LXC - linux container support in OE
Thread-Index: AQHPKOgkifFHtEZ8pkyY1m/JVFN005q0kgQAgAAjk4A=
Date: Fri, 14 Feb 2014 15:53:06 +0000
Message-ID: <CF237B21.468CA%Sanjay_Dorairaj@cable.comcast.com>
In-Reply-To: <CAMKF1soewX7=PUH1Wn=D__TqhgDrPYjOVwuhWvsUC2e2BT8_nw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.3.4.130416
x-originating-ip: [68.87.16.246]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: LXC - linux container support in OE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2014 15:53:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <75EA9B9833B4DA44B193A3619454DBE3@cable.comcast.com>
Content-Transfer-Encoding: quoted-printable

Khem/Bruce,

Thanks for the input!

We are not looking at using more than a handful of containers. Just need
to secure a few of the more critical applications running on our set-tops,
so, hopefully, this should not be a problem. I will keep the group posted
on our progress and report on any issues we find.

Regards,

Sanjay Dorairaj
Comcast





On 2/13/14 9:45 PM, "Khem Raj" <raj.khem@gmail.com> wrote:

>Hi Sanjay
>
>On Thu, Feb 13, 2014 at 10:22 AM, Dorairaj, Sanjay
><Sanjay_Dorairaj@cable.comcast.com> wrote:
>> Hi Folks,
>>
>> Can someone let me know the current state of OE support for LXC
>>containers?
>> Is the current implementation of LXC support stable enough to be used
>>in a
>> fielded product? Has anyone implemented this in their products and if
>>so,
>> are there any lessons-learnt or case studies that could be shared?
>>
>> I see that there are recipes in place for this -
>>=20
>>http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipe
>>s-containers/lxc/lxc_0.9.0.bb?h=3Dmaster
>>
>> Appreciate the help!
>
>I have deployed containers from yocto however it was using a different
>kernel version. We ran into issues when number of containers grew to
>be
>large, e.g. file sytem accesses on base kernel took the CPU, we also
>experienced severe degradation in network traffic when containers grew
>larger
>than 1000, we were using 1Gig link and there were plans to use 10Gig
>interfaces.
>
>We experimented first with containers made out of ubuntu system which
>were quite large in size and the problems  with file systems showed
>very easly
>however the yocto containers were very small in size approx 20M in
>size compared to 300M ubuntu containers, and we could launch 1000
>containers
>so the size of the container seemed to matter.
>
>The base system running the container was ubuntu system so we do not
>know if systemd could have helped us with resource allocation.
>
>The box underneath was with 16G of RAM with Haswell CPU.
>
>
>
>>
>> Regards,
>>
>> Sanjay Dorairaj
>> Comcast
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


