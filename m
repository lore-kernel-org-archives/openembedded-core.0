Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 680FD6B7A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:27:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2KER6Do000717;
	Thu, 20 Mar 2014 09:27:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2KER68F012829;
	Thu, 20 Mar 2014 09:27:06 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 20 Mar 2014 09:27:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power management
	test utils
Thread-Index: AQHPQ9WxYj1gx/Tt70SiikaU8EtTG5rp5PjggABkOQD//7/Q8A==
Date: Thu, 20 Mar 2014 14:27:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF441AC@DLEE11.ent.ti.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
	<1395147366.3808.70.camel@ted>
	<CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
	<532A36F3.2090800@mlbassoc.com>
	<CAMKF1spcWtVah6-F6AQaSs72Cmyrke-5+JrdmR5s7AA6QCuDJA@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015CF4380F@DLEE11.ent.ti.com>
	<CAP9ODKpVgwgr1gS6=u0dWbxgsvCiMd3b20h=thqiYBQ9d4DtKQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpVgwgr1gS6=u0dWbxgsvCiMd3b20h=thqiYBQ9d4DtKQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Gary Thomas <gary@mlbassoc.com>
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Thu, 20 Mar 2014 14:27:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com]
>On Behalf Of Otavio Salvador
>Sent: Thursday, March 20, 2014 8:16 AM
>To: Maupin, Chase
>Cc: Khem Raj; Gary Thomas; Patches and discussions about the oe-
>core layer
>Subject: Re: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power
>management test utils
>
>On Thu, Mar 20, 2014 at 9:23 AM, Maupin, Chase
><chase.maupin@ti.com> wrote:
>>>-----Original Message-----
>>>From: openembedded-core-bounces@lists.openembedded.org
>>>[mailto:openembedded-core-bounces@lists.openembedded.org] On
>>>Behalf Of Khem Raj
>>>Sent: Wednesday, March 19, 2014 7:46 PM
>>>To: Gary Thomas
>>>Cc: Patches and discussions about the oe-core layer
>>>Subject: Re: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power
>>>management test utils
>>>
>>>On Wed, Mar 19, 2014 at 5:31 PM, Gary Thomas <gary@mlbassoc.com>
>>>wrote:
>>>>
>>>> What are you afraid of?  Putting this in OE-core _may_ make
>>>sense
>>>> if it serves a larger community, but having it there will not
>be
>>>> destabilizing, so why not?
>>>
>>>We should always strive towards making OE-Core leaner, therefore
>>>we
>>>should evaluate the real common usecase. which means there must
>be
>>>a
>>>good justification to add it there
>>
>> So are there other people that have an interest in these
>utilities for testing power management features of the kernel?  It
>sounds like that is the question you have in order to help decide
>whether this is a common use case or not.
>>
>> Koen,
>>
>> Do you know, or perhaps the Linaro QA team would know, how many
>people are using these utilities?
>
>I do; and I appreciate it being add. My point is start in meta-oe
>and
>we move it here when needed.

OK.  I'll make a patch for meta-oe.  Any issues with the second patch in th=
e series adding mmc-utils?

>
>
>--
>Otavio Salvador                             O.S. Systems
>http://www.ossystems.com.br        http://code.ossystems.com.br
>Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

