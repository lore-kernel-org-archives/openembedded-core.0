Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95926606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 18:35:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7UIZiZC004247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 11:35:44 -0700 (PDT)
Received: from server.local (128.224.20.237) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 11:35:43 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1471281772.git.bruce@zedd.org>
	<ff62fe65ad3bae260ec0951caddf428632ef35de.1471281772.git.bruce@zedd.org>
	<1472547914.8449.25.camel@andred.net>
	<94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
	<1472566766.8449.29.camel@andred.net>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <78886c10-2951-9a57-31dd-0e1e78d19815@windriver.com>
Date: Tue, 30 Aug 2016 14:35:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472566766.8449.29.camel@andred.net>
Subject: Re: [PATCH 5/6] kernel-yocto: streamline patch, configuration and audit phases
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
X-List-Received-Date: Tue, 30 Aug 2016 18:35:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016-08-30 10:19 AM, André Draszik wrote:
> On Di, 2016-08-30 at 09:05 -0400, Bruce Ashfield wrote:
>> On 2016-08-30 05:05 AM, André Draszik wrote:
>>>
>>> My kmeta stuff is located directly inside two meta-* layers (i.e. not in
>>> an
>>> extra git repo), where the 2nd layer's kernel recipes .bbappends to the
>>> 1st
>>> one with additional kmeta things.
>>>
>>> This used to work fine, but since this commit it doesn't anymore as only
>>> the
>>> kmeta stuff from the 2nd layer is being copied into workdir.
>>>
>>> Have I been doing something that wasn't guaranteed / supposed to work in
>>> the
>>> first place? Or should that still work? Is it worth fixing or should I
>>> rethink my approach?
>>
>> That was complexity that I had tried to remove, but thinking on it a
>> bit, I think I can restore that without adding much complexity.
>>
>> I'm just finishing work on the 4.8 kernel today, and can look at this
>> tomorrow.
>
> Thank you Bruce!

Can you clarify for me if you are are using SRC_URI items tagged with
'kmeta', i.e. a directory of fragments, or are you just adding .cfg/.scc
items directly to the SRC_URI ?

Bruce

>
>> Do you have any public layers that I can reference to pull together a
>> test case ?
>
> Unfortunately not :-(
>
> But I'm happy to test and report back!
>
>
> Cheers,
> Andre'
>


