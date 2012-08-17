Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T2RKv-0005Zf-Ji
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 20:31:57 +0200
Received: from mail179-co1-R.bigfish.com (10.243.78.228) by
	CO1EHSOBE014.bigfish.com (10.243.66.77) with Microsoft SMTP Server id
	14.1.225.23; Fri, 17 Aug 2012 18:19:57 +0000
Received: from mail179-co1 (localhost [127.0.0.1])	by
	mail179-co1-R.bigfish.com (Postfix) with ESMTP id A5F85DC00F3;
	Fri, 17 Aug 2012 18:19:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI1432I4015Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail179-co1 (localhost.localdomain [127.0.0.1]) by mail179-co1
	(MessageSwitch) id 1345227595204342_18900;
	Fri, 17 Aug 2012 18:19:55 +0000 (UTC)
Received: from CO1EHSMHS020.bigfish.com (unknown [10.243.78.248])	by
	mail179-co1.bigfish.com (Postfix) with ESMTP id 2433DAC004B;
	Fri, 17 Aug 2012 18:19:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS020.bigfish.com
	(10.243.66.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 17 Aug 2012 18:19:54 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Fri, 17 Aug 2012 13:19:53 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Paul Gortmaker
	<paul.gortmaker@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libproxy: add dependency on glib-2.0
Thread-Index: AQHNfKTln6snkLYvK0uWxkSMHffH3Q==
Date: Fri, 17 Aug 2012 18:19:53 +0000
Message-ID: <CAEsOVNfevSm0bDvLGUEc8D6u2jTwkO5bvqNZj3W-XE+7+hUHHg@mail.gmail.com>
References: <1344897787-27726-1-git-send-email-paul.gortmaker@windriver.com>
	<1345222636.27428.20.camel@ted> <502E886E.30002@windriver.com>
In-Reply-To: <502E886E.30002@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] libproxy: add dependency on glib-2.0
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
X-List-Received-Date: Fri, 17 Aug 2012 18:31:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <87337E002E2825479A58D81CA0344205@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 1:07 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On 12-08-17 12:57 PM, Richard Purdie wrote:
>> On Mon, 2012-08-13 at 18:43 -0400, Paul Gortmaker wrote:
>>> Without this, you will get occasional build failures if libproxy
>>> tries to build before the glib headers are placed in the sysroot.
>>>
>>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>>
>>> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/rec=
ipes-support/libproxy/libproxy_0.4.7.bb
>>> index 7e3cf27..a39e3a8 100644
>>> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>>> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1+"
>>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7d7044444a7b1b116e8783edcdb=
44ff4 \
>>>                      file://utils/proxy.c;beginline=3D1;endline=3D18;md=
5=3D55152a1006d7dafbef32baf9c30a99c0"
>>>
>>> -DEPENDS =3D "gconf"
>>> +DEPENDS =3D "gconf glib-2.0"
>>>
>>
>> We've gone around in circles on this and had issues over circular
>> dependencies. The bottom line is that we don't need glib-2.0 here, we
>> want to disable the glib-2.0 using components of libproxy. I don't know
>
> Fair enough.
>
> Can we _finally_ fix the mailing lists to not override the To/Cc lines
> with crap Reply-To: lines?  Once again I almost missed seeing this reply,
> since I was no longer on the To/Cc.

PLEASE ;)

-M

>
> AFAICT, all were in agreement that it was broken, but it never got fixed.
>
> Thanks,
> Paul.
> --
>
>> cmake well enough to know how to configure it to do this though (instead
>> of autodetecting)
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



