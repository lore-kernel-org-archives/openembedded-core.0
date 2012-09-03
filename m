Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T8SXV-0005O0-J6
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 11:01:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Sep 2012 01:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="188309380"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 03 Sep 2012 01:49:27 -0700
Message-ID: <50446FBB.3030306@intel.com>
Date: Mon, 03 Sep 2012 11:52:11 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1345632209-4188-1-git-send-email-radu.moisan@intel.com>
	<CABcZANn8tSTrfwbOCi6WoiURVRcG3w_dF5-nnwMC+7Pz=aK01w@mail.gmail.com>
	<5034EBB3.3010906@intel.com>
	<2C58EEEE-174C-4E2B-8A9F-1148A009E26D@gmail.com>
	<CABcZANkvEXuKWGSaDzJLdgBMGzgZHSGfH2yiRB+8PcKcZ_zeWw@mail.gmail.com>
	<50350A8E.9060405@windriver.com>
In-Reply-To: <50350A8E.9060405@windriver.com>
Subject: Re: [PATCH] coreutils: Upgrade to upstream version 8.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 09:01:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/22/2012 07:36 PM, Mark Hatle wrote:
> On 8/22/12 9:30 AM, Chris Larson wrote:
>> On Wed, Aug 22, 2012 at 7:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>> diff --git 
>>>>>> a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch 
>>>>>> b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch 
>>>>>>
>>>>>> new file mode 100644
>>>>>> index 0000000..e32f612
>>>>>> --- /dev/null
>>>>>> +++ 
>>>>>> b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch 
>>>>>>
>>>>>> @@ -0,0 +1,21 @@
>>>>>> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>>> +Upstream status: pending
>>>>>> +
>>>>>> +The new version of coreutils, adds use of 
>>>>>> canonicalize_file_name() function defined in canonicalize.h
>>>>>> +The problem: the function is redefined to 
>>>>>> rpl_canonicalize_file_name by means of a macro,which gives
>>>>>> +an undefined reference error at compile time. Macro definition 
>>>>>> depends in the end on
>>>>>> +gl_cv_func_realpath_works but assumed true only when set to "yes"
>>>>>> +
>>>>>> +Index: coreutils-8.17/m4/canonicalize.m4
>>>>>> +===================================================================
>>>>>> +--- coreutils-8.17.orig/m4/canonicalize.m4 2012-05-08 
>>>>>> 12:05:23.000000000 +0300
>>>>>> ++++ coreutils-8.17/m4/canonicalize.m4  2012-08-17 
>>>>>> 14:20:22.000000000 +0300
>>>>>> +@@ -95,7 +95,7 @@
>>>>>> +      [gl_cv_func_realpath_works=no],
>>>>>> +      [case "$host_os" in
>>>>>> +                 # Guess yes on glibc systems.
>>>>>> +-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
>>>>>> ++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
>>>>>> +                 # If we don't know, assume the worst.
>>>>>> +         *)      gl_cv_func_realpath_works="guessing no" ;;
>>>>>> +       esac
>>>>> Wouldn't it be better to provide a cached test result in the site
>>>>> files for this test, rather than relying on a host_os based guess?
>>>> I really don't know the answer to your question. The patch was 
>>>> intended to provide minimally invasive change to the original file. 
>>>> If you elaborate more on your proposal, I would gladly take into 
>>>> consideration a future patch to address this issue.
>>>
>>>
>>> Add CACHED_CONFIGUREVARS in the recipe search in metadata for 
>>> existing examples
>>
>> That's a good route, but only if we know realpath works in 100% of
>> cases. Which, admittedly, one would certainly hope is the case :)
>>
>
> As far as I know realpath has worked well, for at least the last 6 
> years (likely much longer).
>
> --Mark
>
What's the status here? Is it going to be merged?

radu


