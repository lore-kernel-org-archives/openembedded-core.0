Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T4E6f-0001kS-MV
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:48:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7MGaWBr021819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:36:32 -0700 (PDT)
Received: from msp-dhcp13.wrs.com (172.25.34.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 22 Aug 2012 09:36:31 -0700
Message-ID: <50350A8E.9060405@windriver.com>
Date: Wed, 22 Aug 2012 11:36:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1345632209-4188-1-git-send-email-radu.moisan@intel.com>
	<CABcZANn8tSTrfwbOCi6WoiURVRcG3w_dF5-nnwMC+7Pz=aK01w@mail.gmail.com>
	<5034EBB3.3010906@intel.com>
	<2C58EEEE-174C-4E2B-8A9F-1148A009E26D@gmail.com>
	<CABcZANkvEXuKWGSaDzJLdgBMGzgZHSGfH2yiRB+8PcKcZ_zeWw@mail.gmail.com>
In-Reply-To: <CABcZANkvEXuKWGSaDzJLdgBMGzgZHSGfH2yiRB+8PcKcZ_zeWw@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2012 16:48:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/12 9:30 AM, Chris Larson wrote:
> On Wed, Aug 22, 2012 at 7:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>>>>> new file mode 100644
>>>>> index 0000000..e32f612
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>>>>> @@ -0,0 +1,21 @@
>>>>> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>> +Upstream status: pending
>>>>> +
>>>>> +The new version of coreutils, adds use of canonicalize_file_name() function defined in canonicalize.h
>>>>> +The problem: the function is redefined to rpl_canonicalize_file_name by means of a macro,which gives
>>>>> +an undefined reference error at compile time. Macro definition depends in the end on
>>>>> +gl_cv_func_realpath_works but assumed true only when set to "yes"
>>>>> +
>>>>> +Index: coreutils-8.17/m4/canonicalize.m4
>>>>> +===================================================================
>>>>> +--- coreutils-8.17.orig/m4/canonicalize.m4     2012-05-08 12:05:23.000000000 +0300
>>>>> ++++ coreutils-8.17/m4/canonicalize.m4  2012-08-17 14:20:22.000000000 +0300
>>>>> +@@ -95,7 +95,7 @@
>>>>> +      [gl_cv_func_realpath_works=no],
>>>>> +      [case "$host_os" in
>>>>> +                 # Guess yes on glibc systems.
>>>>> +-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
>>>>> ++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
>>>>> +                 # If we don't know, assume the worst.
>>>>> +         *)      gl_cv_func_realpath_works="guessing no" ;;
>>>>> +       esac
>>>> Wouldn't it be better to provide a cached test result in the site
>>>> files for this test, rather than relying on a host_os based guess?
>>> I really don't know the answer to your question. The patch was intended to provide minimally invasive change to the original file. If you elaborate more on your proposal, I would gladly take into consideration a future patch to address this issue.
>>
>>
>> Add CACHED_CONFIGUREVARS in the recipe search in metadata for existing examples
>
> That's a good route, but only if we know realpath works in 100% of
> cases. Which, admittedly, one would certainly hope is the case :)
>

As far as I know realpath has worked well, for at least the last 6 years (likely 
much longer).

--Mark


