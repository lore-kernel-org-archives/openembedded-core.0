Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TgJPQ-0004l6-8d
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:09:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB5Hsxge017840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2012 09:54:59 -0800 (PST)
Received: from msp-dhcp50.wrs.com (172.25.34.50) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 5 Dec 2012 09:54:58 -0800
Message-ID: <50BF8A73.7050509@windriver.com>
Date: Wed, 5 Dec 2012 11:54:59 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1354724029-9230-1-git-send-email-sgw@linux.intel.com>
	<50BF87A1.2050404@windriver.com>
	<20121205174756.GE3396@jama.jama.net>
In-Reply-To: <20121205174756.GE3396@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 05 Dec 2012 18:09:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/12 11:47 AM, Martin Jansa wrote:
> On Wed, Dec 05, 2012 at 11:42:57AM -0600, Mark Hatle wrote:
>> On 12/5/12 10:13 AM, Saul Wold wrote:
>>> datadir is normally /usr/share so we don't need to add /share to it.
>>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>>    meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
>>> index 254318c..3617fde 100644
>>> --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
>>> +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
>>> @@ -44,7 +44,7 @@ inherit distutils
>>>
>>>    do_install_append() {
>>>       # Cleanup unused item...
>>> -   rmdir ${D}${datadir}/share
>>> +   rmdir ${D}${datadir}
>>
>> I believe this is wrong.  There are things in /usr/share that we want from smart.
>>
>> There are docs and locales and associated files...
>>
>> I believe that was there because an errant "/usr/share/share" directory was
>> generated and that caused problems.
>
> It really was in /usr/share/share and I've moved this fix to
> distutils.bbclass in
> http://git.openembedded.org/openembedded-core/commit/?id=10457e343b27e63b35e0278b00e9c25106b0cc1b
>
> So rmdir in python-smartpm should be dropped completely... I've fix for
> that too, but still testing it together with other changes, but will
> submit that pull-request today.

Ahh, I see.. So yes, the rmdir is simply not needed then and can be removed.

--Mark

> Cheers,
>
>>
>>>
>>>       # We don't support the following items
>>>       rm -rf ${D}${libdir}/python*/site-packages/smart/backends/slack
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



