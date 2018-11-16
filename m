Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0573F6B07F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 04:19:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAG4J0RG013963
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Nov 2018 20:19:00 -0800 (PST)
Received: from server.local (128.224.22.203) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 15 Nov 2018 20:19:00 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1534647044-14420-1-git-send-email-bruce.ashfield@windriver.com>
	<2245203.9ONnnPL5vZ@localhost.localdomain>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <7e373026-fbb1-b896-e02e-8cdc576d7512@windriver.com>
Date: Thu, 15 Nov 2018 23:18:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <2245203.9ONnnPL5vZ@localhost.localdomain>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 16 Nov 2018 04:19:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-11-15 9:15 p.m., Paul Eggleton wrote:
> Hi Bruce
> 
> I just came across this the other day and I had one question:
> 
> On Sunday, 19 August 2018 2:50:44 PM NZDT Bruce Ashfield wrote:
>> The existing kernel-devsrc package starts with a full copy of the kernel
>> source and then starts to strip out elements that are not required.
>>
>> This results in extra time (I/O) and extra space being taken up in the
>> final package. The main purpose of the kernel-devsrc package has been to
>> build modules against the running kernel, not to include a full copy of
>> the source code for re-building the kernel. The end result was a
>> 600M kernel-devsrc package.
>>
>> This restructuring of the package uses an approach similar to other
>> distros, where the kernel-devsrc package is for building against the
>> running kernel and uses a curated set of copied infrastructure, versus
>> a mass copy of the entire kernel.
>> ...
>>   - There is also a symlink from /lib/modules/<version>/source -> build
>>     to reserve a spot for a new package that is simply the kernel
>>     source. That package is not part of this update.
> 
> Did you manage to get to this or is it still planned?

We did get to it, and it is in the 2.6 release.

Bruce

> 
> Thanks,
> Paul
> 


