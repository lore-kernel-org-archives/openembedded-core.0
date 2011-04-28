Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QFZLg-0003hF-TO
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 00:06:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Apr 2011 15:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,283,1301900400"; d="scan'208";a="427409726"
Received: from unknown (HELO [10.255.13.18]) ([10.255.13.18])
	by azsmga001.ch.intel.com with ESMTP; 28 Apr 2011 15:03:38 -0700
Message-ID: <4DB9E439.5020009@linux.intel.com>
Date: Thu, 28 Apr 2011 15:03:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>	<B7450533-1402-4465-A3C8-6CFF10BF4A82@dominion.thruhere.net>
	<BANLkTikjpjVK40B4OO6a4BqB3ys_7hxbmA@mail.gmail.com>
In-Reply-To: <BANLkTikjpjVK40B4OO6a4BqB3ys_7hxbmA@mail.gmail.com>
Subject: Re: eglibc 2.13 upgrade
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
X-List-Received-Date: Thu, 28 Apr 2011 22:06:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2011 01:13 PM, Khem Raj wrote:
> On Wed, Apr 27, 2011 at 9:44 AM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>> Why not move those srcrevs into the recipe? IIRC these ones aren't affected by RPs concerns
>
> I am ok doing that but here
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-April/001536.html
>
> it seems we still need to investigate it before we start moving
> SRCREVs to recipes.
>
We are days away from having this implemented (early next week is the 
plan right now). Once you see the big pull that moves SRCREVs, then you 
can go ahead with your upgrade.

Also creating a new recipe instead of moving the old one will cause a 
lose of history in git, we would prefer moves or create new / delete.

Sau!

>>
>> Op 27 apr. 2011 om 18:21 heeft Khem Raj<raj.khem@gmail.com>  het volgende geschreven:
>>
>>> Hi
>>>
>>> I have eglibc 2.13 upgrade done locally and has been building fine for
>>> all architectures. I have added 2.13 recipes and not
>>> deleted the 2.12, This works ok except when setting the SRCREV. Since
>>> we have a single file called
>>> conf/distro/include/poky-default-revisions.inc to store this
>>> information there can not be two SRCREV for two versions of same
>>> package unless we move them to
>>> recipes which is under work but not yet done. Thats one reason to hold
>>> these patches. I can propose them if we are ok with
>>> removing 2.12 recipes then it becomes straight forward
>>>
>>> Opinions ?
>>>
>>> -Khem
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


