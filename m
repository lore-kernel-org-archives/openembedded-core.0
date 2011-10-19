Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGZYS-0006Zo-4j
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 19:03:48 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Oct 2011 09:57:55 -0700
Received: by wyg24 with SMTP id 24so1927348wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 09:57:54 -0700 (PDT)
Received: by 10.227.54.194 with SMTP id r2mr2914819wbg.17.1319043474063;
	Wed, 19 Oct 2011 09:57:54 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117]) by mx.google.com with ESMTPS id
	ei16sm10875379wbb.21.2011.10.19.09.57.51
	(version=SSLv3 cipher=OTHER); Wed, 19 Oct 2011 09:57:52 -0700 (PDT)
Message-ID: <4E9F018D.7030703@intel.com>
Date: Wed, 19 Oct 2011 09:57:49 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319012721.git.sgw@linux.intel.com>
	<436a9b443962036ff35a5ffd86d80ad44350d5f2.1319012721.git.sgw@linux.intel.com>
	<758B37BA-B417-4B39-BF1C-0CEC613F067D@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
	<E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop>
In-Reply-To: <1319042998.22985.257.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking:	update	data for some toolchain recipes
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
X-List-Received-Date: Wed, 19 Oct 2011 17:03:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 09:49 AM, Phil Blundell wrote:
> On Wed, 2011-10-19 at 18:37 +0200, Koen Kooi wrote:
>> Op 19 okt. 2011, om 18:24 heeft Kamble, Nitin A het volgende geschreven:
>>> It will be too many recipes to list on one line, shall I split the commit into multiple one for each recipe whose data is changed?
>>
>> Or per group, but saying "some toolchain recipes" is way too vague.
>
> Why do we have this distro tracking data in oe-core git anyway?  I'm not
> entirely clear on what it's used by.
>
Phil:

It's used by the tools that build http://packages.yoctoproject.org and 
to help recipe manage maintainer-ship and track what needs updating.

Many upstreams we can't track if updates are required automagically, so 
we need a place to record when the last manual check was, also possible 
reasons why we should not update to newer versions, ...

Sau!


> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



