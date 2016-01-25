Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE958605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:14:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0PGENuW017683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jan 2016 08:14:23 -0800 (PST)
Received: from server.local (128.224.22.131) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jan 2016 08:14:23 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1453734454.25948.13.camel@linuxfoundation.org>
	<56A64385.1020804@windriver.com>
	<1453737176.25948.18.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56A649DE.8080608@windriver.com>
Date: Mon, 25 Jan 2016 11:14:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453737176.25948.18.camel@linuxfoundation.org>
Subject: Re: [PATCH] kernel: Clean DEPLOYDIR before do_deploy runs
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
X-List-Received-Date: Mon, 25 Jan 2016 16:14:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-01-25 10:52 AM, Richard Purdie wrote:
> On Mon, 2016-01-25 at 10:47 -0500, Bruce Ashfield wrote:
>> On 2016-01-25 10:07 AM, Richard Purdie wrote:
>>> If we don't do this, the deploy sstate object contains an every
>>> increasing number of modules tarballs and kernel images, one per
>>> execution of "-c deploy -f".
>>>
>>
>> Stupid question, since my sstate/deploy foo is weak at times.
>> Does this mean that only a single set of modules + kernel images
>> will be in tmp/deploy ? Or is it only sstate that is being
>> cleaned ?
>
> One side effect is that it will remove the older copies. The older
> copies were being built into each new sstate object which was growing
> huge.
>
>> I sometimes need multiple copies around for debug purposes, so
>> I'm wondering if that is still possible with this change ?
>
> You'd need to archive them before running another build since this
> effectively cleans up the older copies now. This is due to the system
> removing the old sstate "object", then installing a new one to replace
> it. You can't keep the old ones around easily as they're named to
> conflict (and hence replace each other).

Ack'd. I'll have to remember to copy out what I need! :)

Bruce

>
> Cheers,
>
> Richard
>


