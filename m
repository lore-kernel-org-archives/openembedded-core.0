Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ab765489-b1e6-686a-7465-a1bed8c96392@gmail.com>
Date: Wed, 15 Jun 2022 13:09:42 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 1/3] insane.bbclass: Make do_qa_staging check shebangs
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <66A02BB7-DFB2-4BB0-819C-E0F18BA82628@arm.com>
 <13D51D5A-188C-45B9-94E6-32B0F1BECC8E@arm.com>
From: "Paulo Neves" <ptsneves@gmail.com>
In-Reply-To: <13D51D5A-188C-45B9-94E6-32B0F1BECC8E@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

:)

The function should probably be refactored so it does not imply it is 
only useful for packaging.

Paulo Neves

On 6/15/22 13:08, Ross Burton wrote:
> Never mind, can’t read :)
>
>> On 15 Jun 2022, at 12:07, Ross Burton <Ross.Burton@arm.com> wrote:
>>
>>> +            if not skip_shebang_size:
>>> +                errors = {}
>>> +                package_qa_check_shebang_size(path, "", d, None, errors)
>>> +                for e in errors:
>>> +                    oe.qa.handle_error(e, errors[e], d)
>> Where is package_qa_check_shebang_size() defined?
>>
>> Ross
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

