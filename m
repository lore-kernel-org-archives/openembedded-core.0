Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QK2Cu-0006Yo-Dx
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 07:43:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2011 22:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="434091811"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 22:39:43 -0700
Message-ID: <4DCA2127.7090006@linux.intel.com>
Date: Tue, 10 May 2011 22:39:51 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>	<4DC8CA7E.4020302@linux.intel.com>	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>	<4DC97D27.9080602@linux.intel.com>
	<BANLkTikrvH3Z2R3u+tBFL_O=C=Cg8nqFew@mail.gmail.com>
In-Reply-To: <BANLkTikrvH3Z2R3u+tBFL_O=C=Cg8nqFew@mail.gmail.com>
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Wed, 11 May 2011 05:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/10/2011 11:20 AM, Otavio Salvador wrote:
> On Tue, May 10, 2011 at 15:00, Saul Wold <sgw@linux.intel.com> wrote:
>> Is there a reason you can't use the oe-core-contrib repo and create a branch
>> there?  Can the script be modified to support github also?
> 
> Not a hard one but I prefer to have it into our repository since
> people can fork it there and follow it.

I use the script for multiple repositories (poky, oe-core, meta-intel,
and various other layers). A configurable remote URL would be a
reasonable thing to add to the script. Perhaps leveraging something from
the current .git/config ? I haven't really looked into it, but if
someone else wants to I am not opposed to discussing it.

--
Darren

> 
>> It creates get another remote that we need to fetch from.
> 
> Or it creates another remote I need to push to.
> 
> To merge you don't need to add a remote but pull from the git URL
> included into the pull command line.
> 
> ...
>>> On the patch itself? Any doc describing an example of it?
>>>
>> Mark Hatle has (or will have shortly) a proposal out to the OE community for
>> commit and patch message guidelines, as a starting point, you can look at
>> the wiki:
>>
>> https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
> 
> I have pushed it already. It is available on the mailing list, please
> take a look.
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


