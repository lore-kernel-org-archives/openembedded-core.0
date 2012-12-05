Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TgJS4-0007ro-3E
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:12:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2012 09:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,223,1355126400"; d="scan'208";a="257737815"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 09:57:42 -0800
Message-ID: <50BF8B16.2060309@linux.intel.com>
Date: Wed, 05 Dec 2012 09:57:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1354724029-9230-1-git-send-email-sgw@linux.intel.com>
	<50BF87A1.2050404@windriver.com>
	<20121205174756.GE3396@jama.jama.net>
	<50BF8A73.7050509@windriver.com>
In-Reply-To: <50BF8A73.7050509@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-smartpm: Fix build error
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
X-List-Received-Date: Wed, 05 Dec 2012 18:12:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2012 09:54 AM, Mark Hatle wrote:
> On 12/5/12 11:47 AM, Martin Jansa wrote:
>> On Wed, Dec 05, 2012 at 11:42:57AM -0600, Mark Hatle wrote:
>>> On 12/5/12 10:13 AM, Saul Wold wrote:
>>>> datadir is normally /usr/share so we don't need to add /share to it.
>>>>
>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>> ---
>>>>    meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
>>>> b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
>>>> index 254318c..3617fde 100644
>>>> --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
>>>> +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
>>>> @@ -44,7 +44,7 @@ inherit distutils
>>>>
>>>>    do_install_append() {
>>>>       # Cleanup unused item...
>>>> -   rmdir ${D}${datadir}/share
>>>> +   rmdir ${D}${datadir}
>>>
>>> I believe this is wrong.  There are things in /usr/share that we want
>>> from smart.
>>>
>>> There are docs and locales and associated files...
>>>
>>> I believe that was there because an errant "/usr/share/share"
>>> directory was
>>> generated and that caused problems.
>>
>> It really was in /usr/share/share and I've moved this fix to
>> distutils.bbclass in
>> http://git.openembedded.org/openembedded-core/commit/?id=10457e343b27e63b35e0278b00e9c25106b0cc1b
>>
>>
>> So rmdir in python-smartpm should be dropped completely... I've fix for
>> that too, but still testing it together with other changes, but will
>> submit that pull-request today.
>
> Ahh, I see.. So yes, the rmdir is simply not needed then and can be
> removed.
>
Ok, great, so I guess a patch from Martin shortly will resolved this, I 
want to get a clean build with MUT for RP to pull this stuff.

Thanks
	Sau!

> --Mark
>
>> Cheers,
>>
>>>
>>>>
>>>>       # We don't support the following items
>>>>       rm -rf ${D}${libdir}/python*/site-packages/smart/backends/slack
>>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


