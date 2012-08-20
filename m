Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3UpK-0003Db-US
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 18:27:43 +0200
Received: from mail111-co1-R.bigfish.com (10.243.78.244) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Mon, 20 Aug 2012 16:15:39 +0000
Received: from mail111-co1 (localhost [127.0.0.1])	by
	mail111-co1-R.bigfish.com (Postfix) with ESMTP id 717991400E1;
	Mon, 20 Aug 2012 16:15:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail111-co1 (localhost.localdomain [127.0.0.1]) by mail111-co1
	(MessageSwitch) id 1345479337477192_30744;
	Mon, 20 Aug 2012 16:15:37 +0000 (UTC)
Received: from CO1EHSMHS031.bigfish.com (unknown [10.243.78.232])	by
	mail111-co1.bigfish.com (Postfix) with ESMTP id 68AF9CC004C;
	Mon, 20 Aug 2012 16:15:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS031.bigfish.com
	(10.243.66.41) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 20 Aug 2012 16:15:36 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Mon, 20 Aug 2012 11:15:35 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Thread-Topic: [OE-core] [PATCH] libproxy: add dependency on glib-2.0
Thread-Index: AQHNfu8Hn6snkLYvK0uWxkSMHffH3Q==
Date: Mon, 20 Aug 2012 16:15:34 +0000
Message-ID: <CAEsOVNfCuBV_Wii1nRdo4kk2HMXVd9afv=KEbD-0+C45ra+chg@mail.gmail.com>
References: <1344897787-27726-1-git-send-email-paul.gortmaker@windriver.com>
	<1345222636.27428.20.camel@ted> <502E886E.30002@windriver.com>
	<1345239717.27428.22.camel@ted> <503240C3.1060508@windriver.com>
In-Reply-To: <503240C3.1060508@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches, discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libproxy: add dependency on glib-2.0
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
X-List-Received-Date: Mon, 20 Aug 2012 16:27:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <56D71F5FD4D53840A2000053DB9B141D@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2012 at 8:50 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On 12-08-17 05:41 PM, Richard Purdie wrote:
>> On Fri, 2012-08-17 at 14:07 -0400, Paul Gortmaker wrote:
>>> On 12-08-17 12:57 PM, Richard Purdie wrote:
>>>> On Mon, 2012-08-13 at 18:43 -0400, Paul Gortmaker wrote:
>>>>> Without this, you will get occasional build failures if libproxy
>>>>> tries to build before the glib headers are placed in the sysroot.
>>>>>
>>>>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>>>>
>>>>> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/r=
ecipes-support/libproxy/libproxy_0.4.7.bb
>>>>> index 7e3cf27..a39e3a8 100644
>>>>> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>>>>> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>>>>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1+"
>>>>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7d7044444a7b1b116e8783edc=
db44ff4 \
>>>>>                      file://utils/proxy.c;beginline=3D1;endline=3D18;=
md5=3D55152a1006d7dafbef32baf9c30a99c0"
>>>>>
>>>>> -DEPENDS =3D "gconf"
>>>>> +DEPENDS =3D "gconf glib-2.0"
>>>>>
>>>>
>>>> We've gone around in circles on this and had issues over circular
>>>> dependencies. The bottom line is that we don't need glib-2.0 here, we
>>>> want to disable the glib-2.0 using components of libproxy. I don't kno=
w
>>>
>>> Fair enough.
>>>
>>> Can we _finally_ fix the mailing lists to not override the To/Cc lines
>>> with crap Reply-To: lines?  Once again I almost missed seeing this repl=
y,
>>> since I was no longer on the To/Cc.
>>>
>>> AFAICT, all were in agreement that it was broken, but it never got fixe=
d.
>>
>> There were a few things causing problems here such as lost admin access.
>> Those have been resolved and I just changed the setting that I think was
>> causing the problems. Let me know if there are still issues...
>
> Looks good now, thanks a lot. Much appreciated by many, I'm sure.

Awesome, looks to be working for me too. Did you do oe-devel as well?

-M=



