Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZPdY-0003ij-SV
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:46:41 +0200
Received: by pvf24 with SMTP id 24so620695pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=oRBGHdVbEYRaCNsqVEyyJmOoRWR8VOmVZW/EXkaGaUw=;
	b=I4Blaq/4pa7n480WgwUFQkb+YTJkfpOOK+pxXvXruGHejSfEHcsAea+ehM40gzwhIF
	Y6lxQ32CL+iop6cBywWHJgUI8pb9CDVWPtQVCmlBZfihD8bHa+rqx3T/5BWYj+hvwFBy
	ssaRMga2sWdL+Al+N+0dl0eCSePT0IBP1/VoQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=gh9LgLfDNNrDdpc4xTxs3VbQjC7XGOqT54f2J8x5WojzcSj00/SoBkzsoK1lC0uCl0
	KVZIr2kAGuczRJHM99xNx9Km1OASb/hS+oBLYxGhixZ0tXxemUj65PcZbj0KjHZIUn/o
	/onm8sGmucHC+N7qvYB4ppuiaKf38kBpB7tDo=
Received: by 10.143.159.21 with SMTP id l21mr169889wfo.314.1308757385619;
	Wed, 22 Jun 2011 08:43:05 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v6sm460958wfe.14.2011.06.22.08.43.04
	(version=SSLv3 cipher=OTHER); Wed, 22 Jun 2011 08:43:05 -0700 (PDT)
Message-ID: <4E020D88.5020308@gmail.com>
Date: Wed, 22 Jun 2011 08:43:04 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308732995.git.dongxiao.xu@intel.com>	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>	<4E01FFDA.3050905@gmail.com>	<1308754043.21613.88.camel@phil-desktop>
	<4E020779.7080107@windriver.com>
In-Reply-To: <4E020779.7080107@windriver.com>
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Wed, 22 Jun 2011 15:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2011 08:17 AM, Mark Hatle wrote:
> On 6/22/11 9:47 AM, Phil Blundell wrote:
>> On Wed, 2011-06-22 at 07:44 -0700, Khem Raj wrote:
>>> On 06/22/2011 02:01 AM, Dongxiao Xu wrote:
>>>> *libc's do_package will cost a lot of time due to the locale handing,
>>>> which may delay the other recipe's do_package task and affect the build
>>>> performance.
>>>
>>> you could also move the locale generation into a task of its own instead
>>> of new recipe
>>
>> It'd be hard to get the dependencies to work out right if you did that,
>> though.  I think a new recipe probably is the right answer.
>
> And in the case of libc, the locales need to be done -after- the
> populate_sysroot, or we don't get the parallelism improvement.

ofcourse thats why I was suggesting a new task.
>
> --Mark
>
>> p.
>>
>> [ .... 100000 quoted lines snipped ... ]
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



