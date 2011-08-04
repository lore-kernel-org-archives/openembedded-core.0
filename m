Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qp7Uc-0008S3-43
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 01:38:22 +0200
Received: by yib18 with SMTP id 18so1471395yib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=sy6K5Qow9y/uAsKOs6M8pXl3JsQ0HpwYbD4o8nJVuAM=;
	b=qGiBMmpI3UYuuKW7Lp6WlkzHfgAAAKXrvaHZSSswTidnTLIQsG1ThKHxkeMjT4nf7t
	NZG/yWRAC1hIxSNBZJGmlDaFAk2Oy9HzdH/3BBFPPceNjf7e9WtckhfaXkX+CJrWmxwp
	rHPZ878nxmP0esuhTEqszkomj5aGqz8Et1Mpo=
Received: by 10.42.177.129 with SMTP id bi1mr892702icb.156.1312500837467;
	Thu, 04 Aug 2011 16:33:57 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 3sm1565918ibm.10.2011.08.04.16.33.56
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 16:33:57 -0700 (PDT)
Message-ID: <4E3B2C62.70406@gmail.com>
Date: Thu, 04 Aug 2011 16:33:54 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
	<1312495815.3169.9.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F563@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F563@orsmsx504.amr.corp.intel.com>
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Thu, 04 Aug 2011 23:38:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 03:47 PM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Phil Blundell
>> Sent: Thursday, August 04, 2011 3:10 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
>> support for glibc recipes
>>
>> On Thu, 2011-08-04 at 15:04 -0700, Kamble, Nitin A wrote:
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of
>>>> Phil Blundell
>>>> Sent: Thursday, August 04, 2011 2:51 PM
>>>> To: Patches and discussions about the oe-core layer
>>>> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
>>>> support for glibc recipes
>>>>
>>>> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
>>>>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>>>
>>>>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>>
>>>> This commit message is very terse.  Why is this change necessary?
>>>
>>> Because meta-x32 layer has glibc, which needs these support files. I
>> will update the commit message in the tree.
>>
>> Can't the tclibc-glibc file go in meta-x32 as well, then?
>>
> It can go in the meta-x32 layer, but I think better place for this support file is in the meta layer. It would help avoid duplication of the code in multiple layers.
>

oe-core does not need it. It could be deleted.

>> p.
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



