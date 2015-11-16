Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94E986E268;
	Mon, 16 Nov 2015 17:40:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAGHdo1V015817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Nov 2015 09:39:50 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 16 Nov 2015 09:39:49 -0800
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
	<20151113114617.GB2567@jama> <5649A542.8000307@linux.intel.com>
	<CAP9ODKpU_6sVy6iidiCem8Sb+EWAgNCVrvOPmOhr4_uMt174Hw@mail.gmail.com>
	<5649BCB9.4090708@linux.intel.com>
	<CAP9ODKqCbYMqfhHY2p8yPsu7Pp4Pb+U-DrG7SbjN2Xh4e=FA7Q@mail.gmail.com>
	<564A0E0C.4090208@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <564A14E4.1020606@windriver.com>
Date: Mon, 16 Nov 2015 11:39:48 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <564A0E0C.4090208@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 17:40:13 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/16/15 11:10 AM, akuster808 wrote:
> 
> 
> On 11/16/2015 03:24 AM, Otavio Salvador wrote:
>> On Mon, Nov 16, 2015 at 9:23 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>> On 11/16/2015 01:20 PM, Otavio Salvador wrote:
>>>
>>>>> Making a separate repository with this layer is even more disruptive, and
>>>>> complicates administration and maintenance. I'm not going to handle
>>>>> those.
>>>>> So I'll make a meta-qt4 layer under meta-oe, and it's fine if there is no
>>>>> official maintainer or ongoing build testing for it at least until
>>>>> someone
>>>>> volunteers to pick it up.
>>>>
>>>>
>>>> I will nack the patch to include it onto meta-oe; I also guess that
>>>> Martin will also nack it.
>>>>
>>>> Make it another layer as suggested, please.
>>>
>>>
>>> A separate layer under meta-openembedded or a separate repository with the
>>> layer? Please be clear.
>>
>> Another repository.
> 
> Agree with a separate repo. It clarifies our intention and implies nothing.

I'm fine with a separate repo as well.  Then whomever still needs it can work
with it as necessary.

--Mark

> 
>>


