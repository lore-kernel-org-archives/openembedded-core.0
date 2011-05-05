Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QHmoP-0000ol-AS
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 02:53:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2011 17:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,317,1301900400"; d="scan'208";a="742542563"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.142])
	([10.238.154.142])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2011 17:50:18 -0700
Message-ID: <4DC1F44A.3020708@intel.com>
Date: Thu, 05 May 2011 08:50:18 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304515719.git.ke.yu@intel.com>	<1304518043.21461.154.camel@rex>
	<BANLkTinduv4VofN2=adDN2-HZozYTO45ew@mail.gmail.com>
In-Reply-To: <BANLkTinduv4VofN2=adDN2-HZozYTO45ew@mail.gmail.com>
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Thu, 05 May 2011 00:53:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-5-4 22:24, Frans Meulenbroeks wrote:
> 2011/5/4 Richard Purdie<richard.purdie@linuxfoundation.org>
>
>> On Wed, 2011-05-04 at 22:05 +0800, Yu Ke wrote:
>>> From: Yu Ke<ke.yu@intel.com>
>>>
>>> move the SRCREV from poky-default-revisions.inc to its corresponding
>> recipe,
>>> in this case, those non poky distro can also use its SRCREV.
>>>
>>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>>    Branch: kyu3/srcrev-recipe
>>>    Browse:
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/srcrev-recipe
>>>
>>> Thanks,
>>>      Yu Ke<ke.yu@intel.com>
>>> ---
>>>
>>>
>>> Yu Ke (1):
>>>    poky-default-revisions: move the SRCREV to recipe file
>>
>> Merged to master, thanks for resolving this issue! :)
>>
>> Cheers,
>>
>> Richard
>>
>> I would have preferred a more standardised placement of SRCREV.
> Most of the time the SRCREV is before the PV, but not always (and sometimes
> separated with an empty line and sometimes not).
>
> Also there is at least one error introduced:
>
> diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bbb/meta/recipes-devtools/yaffs2/
> yaffs2-utils_cvs.bb
> index 6171fe5..c729c7c 100644
> --- a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb<http://git.pokylinux.org/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb?h=kyu3/srcrev-recipe&id=d2e078aa046ae6c4f169695f546cf229db5be1f7>
> +++ b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb<http://git.pokylinux.org/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb?h=kyu3/srcrev-recipe&id=c75b49ff5cfd10f5187af2b66a0a8d5513460374>
> @@ -1,3 +1,4 @@
> require yaffs2-utils.inc
> PR = "r1"
> +SRCDAT = "20071107"
>
> That should be SRCDATE. There might be more of these, my eye just fell on
> this one.

Thanks for pointing it out. For unknown reason, my proxy does not work 
in cvs fetcher , so this recipe is untested. I should take more care on 
this. A patch is just sent out to fix it.

Regards
Ke

>
> Frans
>
> PS: speaking of yaffs2 utils: it could be considered to move to a somewhat
> newer version (not that I care as I do not use yaffs2)
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



