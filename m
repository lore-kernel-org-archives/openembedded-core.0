Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2926FFCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:33:36 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 1288468A01C; Fri, 24 Feb 2017 14:33:37 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9C94868A019;
	Fri, 24 Feb 2017 14:33:36 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 54B6A67400BB;
	Fri, 24 Feb 2017 15:33:36 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
	<26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
	<1487946072.10512.9.camel@intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <d20dc7dc-c3d0-ab79-948e-2caab91d3caf@mlbassoc.com>
Date: Fri, 24 Feb 2017 15:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487946072.10512.9.camel@intel.com>
Subject: Re: Patchwork not picking changes from the ML
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
X-List-Received-Date: Fri, 24 Feb 2017 14:33:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-24 15:21, Patrick Ohly wrote:
> On Wed, 2017-02-22 at 15:56 -0600, Jose Lamego wrote:
>>
>> On 02/22/2017 02:55 PM, Michael Halstead wrote:
>>> I've seen several issues with hooks. I was working on them yesterday and
>>> will continue today.
>>>
>>> These are currently managed by hand but we are moving them into
>>> configuration management which should help keep them working consistently.
>>
>> Michael: one syntax error in patchwork code was pulled into production
>> yesterday. This is the cause for missing patches. The error is fixed in
>> the Yocto repo now, please perform a server code update ASAP.
>>
>> Martin: I will look at the UI issue you are describing and file a bug if
>> needed.
>
> Would it perhaps make sense to reply to the original author with an
> email confirming that his patch is now in Patchwork? It should include a
> link to the patch series, too.
>
> This could have several advantages:
>       * submitters not aware of Patchwork or whether their target
>         currently uses it learn about it and then can follow the
>         progress of their patch
>       * everyone gets a confirmation that the submission made it through
>         the various mail servers and Patchwork itself
>
> It still relies on the original submitter to watch out for breakages in
> the processes, but I guess that can't be avoided with an asynchronous,
> mail-based process.
>

I would love to see this added to the process - +1 :-)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

