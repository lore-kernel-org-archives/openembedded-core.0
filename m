Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Jan 2020 15:56:53 UTC
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF176B06C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2201; q=dns/txt; s=iport;
	t=1579276616; x=1580486216;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=xXO4aVdgXTE92F/zBWxTJhs4Sv8eiWiohZET8HL4XpY=;
	b=RNLx0PWnOrRBn5UE4ykBEozO5Jh2TZ5gOkf1ZiPGOB7QhvH95xjZSpyo
	jV9a/oQGA9x7YHobg6P5jS/iVZ9/YLA72HxiyKvHv1W4lLRbzkH20191k
	oGJEqkPpMgAY6jwhj9JjNv2XBbloqUI7lFRKO1kphZkmtfHl++wNoXYTt A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CABQDi1iFe/xbLJq1lHQEBAQkBEQU?=
	=?us-ascii?q?FAYF7gxV1EiqEEYkDiBybNwkBAQEMAQEnCAEBhEACgi44EwIDDQEBBAEBAQI?=
	=?us-ascii?q?BBQRthTcMhV4BAQEBAgEjFUEQCxgCAiYCAlcGDQYCAQGDIgGCWyAPqzN1gTK?=
	=?us-ascii?q?FSoMjgTgGgQ4ojC6BQT+BOII3NT6CSxkEGoRXgl4ElzCXJnaCQ4c9jm0GG45?=
	=?us-ascii?q?qjAiOXIhhkiQCBAsCFYFpIoFYMxoIGxWDJ1AYDYg5iE+BZYNcPwMwAgmNXAE?=
	=?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.70,330,1574121600"; d="scan'208";a="21943227"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	17 Jan 2020 15:49:42 +0000
Received: from [10.63.15.146] ([10.63.15.146]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id 00HFneTh030848
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jan 2020 15:49:42 GMT
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"Hongzhi, Song" <hongzhi.song@windriver.com>
References: <20190904014322.96351-1-hongzhi.song@windriver.com>
	<CADkTA4NipOoQ6qWThig_-hRS5W-QwXNv4Vc9=VSv2yA9sCWxmQ@mail.gmail.com>
	<b92e2a4e-1f37-1c89-4316-80c91ddc1b0f@windriver.com>
	<CADkTA4PLrV7w-4muqS6nh4OBdRsqXfg3sJud+L6taQPkmT8NFA@mail.gmail.com>
	<ee438438-7885-2b12-666d-0b026166b97d@windriver.com>
	<7754de2c-b4c8-f9c8-8574-f6112e6b1cd8@windriver.com>
	<CADkTA4N8y=C--kAD0OD3Lr7+N31XhOhTsE0R_kFiJAoCvUqvVA@mail.gmail.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <b7d4cf83-c7a9-2d69-7ef5-357f88641372@cisco.com>
Date: Fri, 17 Jan 2020 17:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4N8y=C--kAD0OD3Lr7+N31XhOhTsE0R_kFiJAoCvUqvVA@mail.gmail.com>
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.146, [10.63.15.146]
X-Outbound-Node: aer-core-2.cisco.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: copy mmiowb.h and modpost from ${B} of kernel
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
X-List-Received-Date: Fri, 17 Jan 2020 15:56:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/11/19 2:36 PM, Bruce Ashfield wrote:
> On Wed, Sep 11, 2019 at 5:10 AM Hongzhi, Song
> <hongzhi.song@windriver.com> wrote:
>>
>>
>> On 9/6/19 11:10 AM, Hongzhi, Song wrote:
>>>
>>> On 9/4/19 8:34 PM, Bruce Ashfield wrote:
>>>> On Wed, Sep 4, 2019 at 6:07 AM Hongzhi, Song
>>>> <hongzhi.song@windriver.com> wrote:
>>>>>
>>>>> On 9/4/19 11:55 AM, Bruce Ashfield wrote:
>>>>>> On Tue, Sep 3, 2019 at 9:43 PM Hongzhi.Song
>>>>>> <hongzhi.song@windriver.com> wrote:
>>>>>>> There are two errors when compile an out of tree kernel module
>>>>>>> using sdk:
>>>>>>>
>>>>>> This is not universally true. Can you expand on what kernel version
>>>>>> and architectures you are building ? I'm able to build kernel modules
>>>>>> across all the arches I'm currently testing, so I'd like to capture
>>>>>> your exact config in the long log. Neither is the autobuilder showing
>>>>>> any errors.
>>>>> Hi Bruce,
>>>>>
>>>>>
>>>>> kernel version: 5.0.19

I met the same issue with modpost recently. This is because kernel 5.0
commit 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60df1aee2aecb53efb4218b4dfdf7d6c80a5a3de
moved modpost out of 'scripts' target.

>> Hi Bruce,
>>
>> I found 2.7 and 2.6 doc all use "make scripts". And now "make scripts"
>> doesn't work.
>>
>> Should the doc be change to "make scripts prepare" ?
> 
> Yes they should be. We need to open a bug and get ScottR to look into it.
> 
> We've (Richard, myself, and others) have been using make scripts
> prepare as a requirement for on kernel building for quite some time
> now. The docs should reflect this.
> 

Looking at kernel sources, there is better alternative for "make scripts
prepare" requirement: "modules_prepare". It's a special Linux Kernel
target to prepare building external modules.
What it does is actually "scripts+prepare" for older kernels (like 3.10)
and "prepare" (which has "scripts" as indirect dependency) in recent
kernels (v5.4 for example)

So instead of custom "make scripts prepare" lets change it in the doc to
official "modules_prepare" target for modules building preparations.

Any objections?

Thanks,
Ruslan


























