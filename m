Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E02460017
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 22:22:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 28 May 2016 15:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,380,1459839600"; d="scan'208";a="990724697"
Received: from riturkis-mobl1.amr.corp.intel.com (HELO
	tzanussi-mobl.amr.corp.intel.com) ([10.252.207.19])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2016 15:22:10 -0700
Message-ID: <574A1A12.4090700@linux.intel.com>
Date: Sat, 28 May 2016 17:22:10 -0500
From: Tom Zanussi <tom.zanussi@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1464450270.git.tom.zanussi@linux.intel.com>	<2d425e7e0f2020c64240c74a78b65c67d8ad97f0.1464450270.git.tom.zanussi@linux.intel.com>
	<CADkTA4NQ8TKiQtJSNx8v=mEu0dGOkZahrkFB=+G=oxoGJPd=CQ@mail.gmail.com>
In-Reply-To: <CADkTA4NQ8TKiQtJSNx8v=mEu0dGOkZahrkFB=+G=oxoGJPd=CQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto-rt/4.4: Update KBRANCH
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
X-List-Received-Date: Sat, 28 May 2016 22:22:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 05/28/2016 05:14 PM, Bruce Ashfield wrote:
> On Sat, May 28, 2016 at 3:27 PM, Tom Zanussi <tom.zanussi@linux.intel.com>
> wrote:
> 
>> standard/preempt-rt was replaced by standard/preempt-rt/base in
>> linux-yocto-4.4.git, so KBRANCH needs to be updated accordingly.
>>
>> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> index 5e39374..beff921 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> @@ -1,4 +1,4 @@
>> -KBRANCH ?= "standard/preempt-rt"
>> +KBRANCH ?= "standard/preempt-rt/base"
>>
> 
> This is missing the krogoth tag in the patch, right ?  since for master,
> this was in my series
> under commit [linux-yocto: create intel branches].
> 

Yeah, I had [krogoth] in the cover letter, but forgot to add it to the
patch subject, so yeah, should be [PATCH 1/1][krogoth] ;-)

Tom

> Bruce
> 
> 
> 
>>
>>  require recipes-kernel/linux/linux-yocto.inc
>>
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> 
> 
> 


