Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F12736BC8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 10:58:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2014 03:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,654,1389772800"; d="scan'208";a="491867480"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2014 03:58:15 -0700
Message-ID: <5322E0B7.7030107@intel.com>
Date: Fri, 14 Mar 2014 12:57:59 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Saul Wold <sgw@linux.intel.com>
References: <1394710133-18659-1-git-send-email-valentin.popa@intel.com>
	<5322B25F.7040301@linux.intel.com>
	<CAMKF1sp_HEF+er0z-S5DPgYKirmxGgP5m0vrsvZC9UuaYL-3-A@mail.gmail.com>
In-Reply-To: <CAMKF1sp_HEF+er0z-S5DPgYKirmxGgP5m0vrsvZC9UuaYL-3-A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set ac_cv_sizeof_ssize_t
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
X-List-Received-Date: Fri, 14 Mar 2014 10:58:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2014 12:10 PM, Khem Raj wrote:
> On Fri, Mar 14, 2014 at 12:40 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 03/13/2014 04:28 AM, Valentin Popa wrote:
>>> Set ac_cv_sizeof_ssize_t for mips64;
>>> mips-common will not overwrite it.
>>>
>> This really needed a little more about "why" this change is needed.
>>
> ssize_t is a posix define which is architecture specific whose value
> is signed size_t, glibc/uclibc for mips64/n64 linux platform defines
> it to be equivalent of 'long' and long here is 8bytes because
> mips64/n64 follows LP64 model. In OpenEmbedded our default ABI for
> mips64 platforms is N64, having said that autoconf decides to poke at
> the platform for finding these kind of sizes which fails when you are
> doing cross compiling hence we have to cache it.
     Thanks for the explanation Khem!
>
>> Sau!
>>
>>
>>> [YOCTO #5935]
>>>
>>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>>> ---
>>>    meta/site/mips64-linux | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
>>> index 4449c96..ed0fbbe 100644
>>> --- a/meta/site/mips64-linux
>>> +++ b/meta/site/mips64-linux
>>> @@ -35,6 +35,7 @@
>>> glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
>>>    ac_cv_alignof_guint32=4
>>>    ac_cv_alignof_guint64=8
>>>    ac_cv_alignof_unsigned_long=8
>>> +ac_cv_sizeof_ssize_t=8
>>>
>>>    # libpcap
>>>    ac_cv_linux_vers=${ac_cv_linux_vers=2}
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


