Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E975C6AE73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:54:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0EFsktl014268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:54:46 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 07:54:46 -0800
Message-ID: <52D55DC5.1030509@windriver.com>
Date: Tue, 14 Jan 2014 09:54:45 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <7166127.YkfX3aIoNI@helios> <20140114121347.GB3717@jama>
In-Reply-To: <20140114121347.GB3717@jama>
Subject: Re: [oe] Public TSC / OE Workgroup meeting today
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
X-List-Received-Date: Tue, 14 Jan 2014 15:54:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/14, 6:13 AM, Martin Jansa wrote:
> On Tue, Jan 14, 2014 at 10:08:35AM +0000, Paul Eggleton wrote:
>> Hi all,
>>
>> There will be a public OpenEmbedded TSC/workgroup meeting today - there
>> wouldn't normally be one scheduled but there was quite a lot of discussion
>> last time (which is a good thing!). If you're interested in discussing long-
>> term technical efforts around the OpenEmbedded project please join us on
>> irc.freenode.net in channel #oe at
>> 17:00 GMT (9am PST, 11am CST, 12 EST, 18:00 CET) today.
>>
>> Topics we covered last meeting:
>>
>> * Qt 4 / 5 recipes in OE-Core
>> * Rising bug count in Bugzilla and what we can do about it
>> * (briefly) Patch review/merging process
>> * Absentee layer maintainers
>>
>> Issues we didn't get to last time (that weren't resolved on the mailing list):
>> - janitorial day/week?
>> - "bitbake world" failures scrub
>> - initrdscripts/init-live needs work
>> - lava evaluation
>> - website and other infrastructure issues
>> - next release
>>
>> New issues for discussion are also welcome.
>
> Not sure if it's worth new item on agenda, but maybe we should move
> meta/classes/image-prelink.bbclass functionality to package.bbclass,
> maybe we have more cases like this where image build is changing files
> which are provided by normal packages (such cases are lost after
> upgrading on device with packagemanager).

We can discuss this, but prelink has to run on the filesystem image -- it can't 
run prior to packaging as the files installed into the image affect the results 
of the prelinking.

For the prelink case, on target updates should be triggering the prelink system 
after the update.  This is the responsibility of the field-upgrade software -- 
whatever is deployed on the device itself.

(Also when using the prelinker, on many devices it makes sense to strip the 
un-prelink information for space savings.  This won't prevent prelink from being 
run a second time -- it just prevents validation of the original not-prelinked 
binary.)

--Mark

> Cheers,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


