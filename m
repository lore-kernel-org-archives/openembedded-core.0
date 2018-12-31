Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A0B666B51A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 19:56:31 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id wBVJuRtB015923
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 31 Dec 2018 20:56:28 +0100
Received: from [192.168.253.100] ([139.22.32.24])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id wBVJuQsT019870;
	Mon, 31 Dec 2018 20:56:27 +0100
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
	<31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
Date: Mon, 31 Dec 2018 20:56:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Mon, 31 Dec 2018 19:56:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Your previous solution is working for me, so I was not working on fixing
this. I thought, that You will just add missing packages, and that is.
I don't have setup for failing machine.

Is there any simple way to get all missing perl packages?

Regards,
Andrej

On 12/26/18 12:09 PM, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2018-12-26 at 09:39 +0100, Andrej Valek wrote:
>> Hello Richard
>>
>> Did you have some time to take a look on it?
>> What about just list all perl's deps and add these packages? Or is
>> there something more behind it?
> 
> I got this far with it but it then got placed on the "needs more work"
> pile and I got distracted by other problems.
> 
> I suspect a solution is comparatively close and it would be nice to get
> this one fixed...
> 
> Did you have a solution to the problem below in mind?
> 
> Cheers,
> 
> Richard
> 
>> Regards,
>> Andrej
>>
>> On 12/8/18 1:07 AM, Richard Purdie wrote:
>>> On Fri, 2018-12-07 at 12:06 +0000, Richard Purdie wrote:
>>>> opkg needs the replaces/conflicts/provides in order for this
>>>> package
>>>> to function as intended. When enabled, this code caused failures
>>>> for
>>>> core-image-sato -c populate_sdk.
>>>>
>>>> The reason is that nativesdk-autoconf has several perl
>>>> dependencies.
>>>> We
>>>> need to list more of the things which this package
>>>> provides/conflicts
>>>> with in order for it to function correctly. Therefore add the
>>>> missing
>>>> entries.
>>>>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>>>>>
>>>> ---
>>>>  meta/recipes-core/meta/dummy-sdk-package.inc  |  4 ++--
>>>>  .../meta/nativesdk-sdk-provides-dummy.bb      | 20
>>>> +++++++++++++++++++
>>>>  .../meta/target-sdk-provides-dummy.bb         |  3 +++
>>>>  3 files changed, 25 insertions(+), 2 deletions(-)
>>>
>>> Sadly this breaks the SDK on machines without libxml-parser-perl:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/68
>>>
>>> so a resolution will need to be found to that before it can merge.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
> 

