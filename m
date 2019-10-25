Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 304B47FA3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:44:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9PFiFx3013860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2019 08:44:15 -0700 (PDT)
Received: from [128.224.56.205] (128.224.56.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 25 Oct 2019 08:44:15 -0700
To: Trevor Woerner <twoerner@gmail.com>, akuster808 <akuster808@gmail.com>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3> <20191025134458.GA22739@linux-uys3>
	<1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
	<20191025151610.GA12316@linux-uys3>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <7e7622dd-84b5-6cb3-ba66-ee207f0b0f85@windriver.com>
Date: Fri, 25 Oct 2019 11:44:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025151610.GA12316@linux-uys3>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 15:44:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/25/19 11:16 AM, Trevor Woerner wrote:
> On Fri 2019-10-25 @ 07:37:34 AM, akuster808 wrote:
>>
>> On 10/25/19 6:44 AM, Trevor Woerner wrote:
>>> On Fri 2019-10-25 @ 09:22:04 AM, Trevor Woerner wrote:
>>>> On Thu 2019-10-24 @ 04:05:10 PM, Khem Raj wrote:
>>>>> perhaps you need to add -pthread to LDFLAGS
>>>> I'll set up a test build.
>>> Yes, adding the following line fixes it:
>>>
>>> 	LDFLAGS_append_class-native = " -lpthread"
>>>
>>> (unless there's a distro-override way of doing it...?)
>> is someone going to send a patch?
> Does this break on hosts where it had previously worked?
> Is there a better (host-specific) way of doing this?
Doesn't affect my (successful) Fedora build. Would also be interested to 
know.

