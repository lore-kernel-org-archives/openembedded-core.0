Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC8976536
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 14:30:52 +0000 (UTC)
Received: by ykfw127 with SMTP id w127so5285678ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=J3PnPdfh3k88kgjH/8MGzV5iieK8r+xc4D0N4lHSrfg=;
	b=SeOQl4botjJjW7JKD5bpalG7Dh7r4hH7V7dzsHpBulMFWZkCUr9RcUOnsvEe7OC7XS
	MEuPuak/aLFu/E177uxxgc+VOni+/kKqn0NJM1/iKsp05zt9LvpFhbYeOaRtPn7jjyh4
	E0MdO/+Ds5WNnceyRU4AXQrX6ou6aXKX5krmi0UyTBoh/ycTswJzM9UlQwDCyRCJZPRr
	V8M5DwXU8YNngs8fYBgJW7wThTYy7boIguffPy0lerzhWXm/m4HyLc9Lf5kyy+lVpiad
	Ud7Mx9Gjap0Ke0luLMofvX4lQc6Sx+WwyxtWIASgGZjHnOylJZBTU5g0GTHhXPqLWqxP
	vmgQ==
MIME-Version: 1.0
X-Received: by 10.13.245.135 with SMTP id e129mr16395336ywf.13.1440945052999; 
	Sun, 30 Aug 2015 07:30:52 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Sun, 30 Aug 2015 07:30:52 -0700 (PDT)
In-Reply-To: <1440943034.32588.70.camel@linuxfoundation.org>
References: <cover.1440642427.git.bruce.ashfield@windriver.com>
	<a31e3e1e7be69c7cdfeb2f5ce4913c9dc6256acf.1440642427.git.bruce.ashfield@windriver.com>
	<1440943034.32588.70.camel@linuxfoundation.org>
Date: Sun, 30 Aug 2015 10:30:52 -0400
Message-ID: <CADkTA4NBF4q4hzKvSPvrhd6XT6e9gPpA6Au3qW0dom8=Nk+nig@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] linux-yocto/3.14: cleanups and gcc5 ARM build fixes
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
X-List-Received-Date: Sun, 30 Aug 2015 14:30:57 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 30, 2015 at 9:57 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2015-08-26 at 22:31 -0400, Bruce Ashfield wrote:
>> Updating the 3.14 SRCREVs to match the latest kernel meta data updates
>> and also to merge four patches Richard Purdie located that fix the
>> gcc 5.x ARM build (we still have boot issues, but building is the
>> first step).
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
>>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
>>  3 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
>> index 0bd94f0c600d..d59f06b81c04 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
>> @@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
>>
>>  require recipes-kernel/linux/linux-yocto.inc
>>
>> -SRCREV_machine ?= "863ba0912f559ba9d64ab94bf04f0226fdf0cb49"
>> -SRCREV_machine_qemuppc ?= "9d464d6696a0fc755c65a2cf75ad7a4656ac6e1e"
>> -SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
>> +SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
>> +SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
>> +SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
>>
>
> I can't find e4847afbb42583fa05e6a94c8d0c8f8e37ed5622 on the
> standard/qemuppc branch? Did you miss a push?
>
> I merged this to master not realising this issue and the autobuilder is
> now unhappy so need to get this resolved one way or another ASAP :/.

I'm out until tomorrow morning. So a revert is the only way to fix it quickly.

As I mentioned in my pull request, I had to update all my scripts that do the
SRCREV updates for the meta branch split out .. so I warned that something
unexpected may have happened (with three kernel versions, and 3 types of
kernels across 8 boards ..).

Bruce

>
> Cheers,
>
> Richard
>
>
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

