Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 30FE37F36C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 20:27:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Sep 2019 13:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="180554367"
Received: from abloeckn-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.38.226])
	by orsmga008.jf.intel.com with ESMTP; 16 Sep 2019 13:27:26 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190916124144.28576-1-ross.burton@intel.com>
	<CADkTA4NPu1wUZL7Qri=CXS8QjoFv-KpTCk08-yXRkYLAgaUN=w@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <6379bdb4-31f1-7c95-e883-b585899da45d@intel.com>
Date: Mon, 16 Sep 2019 21:27:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NPu1wUZL7Qri=CXS8QjoFv-KpTCk08-yXRkYLAgaUN=w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: do verbose builds
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
X-List-Received-Date: Mon, 16 Sep 2019 20:27:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 16/09/2019 14:18, Bruce Ashfield wrote:
> On Mon, Sep 16, 2019 at 8:41 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Pass V=1 to kernel builds so that the compile log is more useful if it all goes
>> wrong.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>   meta/classes/kernel.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index ebcb79a5286..9d2e1e476d4 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -324,7 +324,7 @@ kernel_do_compile() {
>>          fi
>>          cc_extra=$(get_cc_option)
>>          for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
>> -               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>> +               oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} V=1 $use_alternate_initrd
> 
> Personally, I wouldn't want this on all the time. Most of what V=1
> provides, I never use for debugging and it just clutters the logs.
> 
> Can't this be triggered off a packageconfig-like setting for those
> that want it ?

If you object then I guess it's easy enough to add it to 
KERNEL_EXTRA_ARGS or something when required.  I only did this because I 
was chasing that build paths thing and needed the full build log, and 
typically we enable the full build log so it's there if required.

Ross

