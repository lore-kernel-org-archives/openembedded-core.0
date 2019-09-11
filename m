Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01BE77DE74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 18:01:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8BI12pT026374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Sep 2019 11:01:25 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 11 Sep 2019 11:01:01 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
	<20190910214136.22971-4-Randy.MacLeod@windriver.com>
	<20190911123258.GA27961@localhost>
	<f87d660d-9c05-dfdd-ced2-88cfc9a38a4f@windriver.com>
	<20190911140016.GB27961@localhost>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d2af200a-7865-1c18-fa3d-2842032450a5@windriver.com>
Date: Wed, 11 Sep 2019 14:01:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911140016.GB27961@localhost>
X-Originating-IP: [172.25.44.5]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2 4/4] valgrind: disable 256 ptests for aarch64
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
X-List-Received-Date: Wed, 11 Sep 2019 18:01:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/11/19 10:00 AM, Adrian Bunk wrote:
> On Wed, Sep 11, 2019 at 09:38:53AM -0400, Randy MacLeod wrote:
>> On 9/11/19 8:32 AM, Adrian Bunk wrote:
>>> On Tue, Sep 10, 2019 at 05:41:36PM -0400, Randy MacLeod wrote:
>>>> On qemuarm64 systems, about half of the valgrind tests fail and
>>>> often result in defunct processes, eg:
>>>>      root       819   818 25 00:12 pts/0    00:01:52 /usr/bin/valgrind --command-line-only=yes --memcheck:leak-check=no --tool=memcheck -q --track-origins=
>>>>      root       861   420  0 00:13 pts/0    00:00:00 [sh] <defunct>
>>>> Eventually these processes use so much memory that the
>>>> out of memory killer runs.
>>>>
>>>> Hide the tests that fail as a horrid work-around until the
>>>> root cause has been resolved since this at least allows the
>>>> ptest run to complete.
>>>> ...
>>>
>>> I can reproduce this on hardware,
>>
>> Ah good, I was wondering if it was just happening on qemu.
>>
>>> and I have the bad feeling that no one
>>> will work on resolving the root cause if this is work-arounded in ptest.
>>>
>>> IMHO this should instead be listed as M3 blocker,
>>> similar to "strace ptest timeout".
>>
>> Well, I've enabled 100s of tests that were not being run before
>> and most of them pass for qemux86-64 so I don't think it
>> should be an M3 blocker like strace since it isn't a regression.
> 
> I just tried to reproduce in warrior and it did,
> so it doesn't seem to be a regression.
> 
>> I did start to debug valgrind but it's a bit of a complicated
>> program and will take time so this work-around makes sense to
>> me. If no one else gets to it before me, I'll come back to
>> debugging this issue but likely not before early 3.1.
> 
> It would be good if you could also open a bug, so that people can see
> that there is a problem with this package on an important architecture.

Done:

many valgrind tests fail for arm64
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13520

../Randy

> 
>> Thanks,
>> ../Randy
> 
> Thanks
> Adrian
> 


-- 
# Randy MacLeod
# Wind River Linux

