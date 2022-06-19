Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <02baea2a-8242-0e3e-632b-50d51d84565e@gmail.com>
Date: Sun, 19 Jun 2022 21:03:06 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper util.
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
 <20220614151105.1890454-6-ptsneves@gmail.com>
 <282753D0-6BC9-4B2F-B73C-313D10232BF0@arm.com>
 <a166fa72b7434e498cb4ef4f395045e1@axis.com>
 <635fe97c-6a4f-1e8c-35c8-337fbe8e7b38@gmail.com>
 <56b00048627840569c7c5fc5ca567443@axis.com>
From: "Paulo Neves" <ptsneves@gmail.com>
In-Reply-To: <56b00048627840569c7c5fc5ca567443@axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

You are right never mind.

Paulo Neves

On 6/16/22 00:16, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Paulo Neves <ptsneves@gmail.com>
>> Sent: den 15 juni 2022 15:51
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Ross Burton
>> <ross.burton@arm.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper
>> util.
>>
>> On 6/15/22 15:11, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core@lists.openembedded.org <openembedded-
>>>> core@lists.openembedded.org> On Behalf Of Ross Burton
>>>> Sent: den 15 juni 2022 12:52
>>>> To: ptsneves@gmail.com
>>>> Cc: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH v5 6/7] utils: Add
>> cmdline_shebang_wrapper
>>>> util.
>>>>
>>>> On 14 Jun 2022, at 16:11, Paulo Neves via lists.openembedded.org
>>>> <ptsneves=gmail.com@lists.openembedded.org> wrote:
>>>>> +create_cmdline_shebang_wrapper () {
>>>> The indentation in this function is a mix of tabs and spaces, please
>>>> unify.
>>>>
>>>>> +  argument="$(basename "$(head -n1 $cmd | sed -e 's|#![ ]*||g' )”)”
>>>> [ ]* seems overly, complex, no need for the brackets. I’d anchor to the
>>>> beginning of the line, and remove the g as there’s only one expected.
>>> This should work:
>>>
>>> argument=$(basename "$(sed -ne 's/^#! *//p;q')" $cmd)
>>>
>>> However, if the first line is something like "#!/usr/bin/env python3", then
>>> $argument will be "env python3" and somehow I assume that is not exactly
>>> what the rest of the code expects.
>> The use case is that whatever is in shebang should be extracted and ran
>> verbatim, so truncating like your suggestion can work but has slightly
>> different semantic.
> Umm, my suggested line above should give exactly the same output as yours,
> only with fewer commands...
>
>>>> Might also be wise to assert that you found something here, so running
>>>> this on an ELF fails with an obvious error.
>>>>
>>>> Ross
>>> //Peter
>>>
>> Paulo Neves
> //Peter
>

