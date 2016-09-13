Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAF3771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8D8dQbP002587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Sep 2016 01:39:26 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 01:39:25 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, oe-core
	<openembedded-core@lists.openembedded.org>
References: <7df73b67-6880-ee6c-a18a-1e2a6ac9e5b7@windriver.com>
	<1473755695.7207.26.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <590ad776-563b-498d-957b-a24c02817e20@windriver.com>
Date: Tue, 13 Sep 2016 16:39:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473755695.7207.26.camel@linuxfoundation.org>
Cc: "LOCK, JOSHUA" <joshua.g.lock@intel.com>
Subject: Re: About runqemu's use cases
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
X-List-Received-Date: Tue, 13 Sep 2016 08:39:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/13/2016 04:34 PM, Richard Purdie wrote:
> On Tue, 2016-09-13 at 10:53 +0800, Robert Yang wrote:
>> Hello,
>>
>> We have a new oe-core/scripts/runqemu now, and I'd like to add
>> something
>> like "runqemu test" in the future to avoid regressions. It would help
>> a
>> lot if you can provide the info about how do you use runqemu. There
>> is
>> a bug tracking this:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10249
>>
>> You can reply here or reply in the bug.
>
> Wouldn't this be a case for "oe-selftest -r runqemu" and create a
> runqemu test suite within oe-selftest like we do for other components?

Sounds good, thanks.

// Robert

>
> Cheers,
>
> Richard
>
>
>

