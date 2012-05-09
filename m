Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SSEOi-0002rM-Ng
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 23:26:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49LGIiN015103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 14:16:18 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 14:16:17 -0700
Message-ID: <4FAADE9F.2090604@windriver.com>
Date: Wed, 9 May 2012 16:16:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336593352.git.mark.hatle@windriver.com>
	<583198c49fc63d31fd0f15484983032b50b2ce8a.1336593352.git.mark.hatle@windriver.com>
	<CD60D4EF-5A88-48AE-90CB-50B97B9FCDF9@dominion.thruhere.net>
In-Reply-To: <CD60D4EF-5A88-48AE-90CB-50B97B9FCDF9@dominion.thruhere.net>
Subject: Re: [PATCH 2/2 v2] blacklist.bbclass: Refactor, use PNBLACKLIST[pn]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 21:26:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/12 3:45 PM, Koen Kooi wrote:
>
> Op 9 mei 2012, om 22:00 heeft Mark Hatle het volgende geschreven:
>
>> Revise the handling from ANGSTROM_BLACKLIST to PNBLACKLIST[pn].
>>
>> Refactor the code to eliminate references to the distribution and recipe
>> name in the message.
>>
>> Change the skipPackage message message from:
>>
>> ERROR:<recipe>  was skipped:<distro>  DOES NOT support<recipe>  because<reason>
>>
>> to:
>>
>> ERROR:<recipe>  was skipped: Recipe is blacklisted:<reason>
>>
>> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>> ---
>> meta/classes/blacklist.bbclass |   22 +++++++++++-----------
>> 1 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
>> index 7bf4a73..75abd99 100644
>> --- a/meta/classes/blacklist.bbclass
>> +++ b/meta/classes/blacklist.bbclass
>> @@ -1,20 +1,20 @@
>> -# anonymous support class from angstrom
>> +# anonymous support class from originally from angstrom
>> #
>> +# To use the blacklist, a distribution should include this
>> +# class in the INHERIT_DISTRO
>
> INHERIT works just fine as well

Happy to change the comment, but my intention was that a blacklist is specified 
by a distribution, thus the inherit_distro comment.

--Mark

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



