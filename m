Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJrGp-0007z0-4D
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 20:02:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2011 11:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; d="scan'208";a="640771477"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 11:00:08 -0700
Message-ID: <4DC97D27.9080602@linux.intel.com>
Date: Tue, 10 May 2011 11:00:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
In-Reply-To: <BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 10 May 2011 18:02:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2011 05:53 AM, Otavio Salvador wrote:
> On Tue, May 10, 2011 at 02:17, Saul Wold<sgw@linux.intel.com>  wrote:
>> Next time, please use the create-pull-request script, which will generate a
>> set of patch emails so that we can review this information via email. I will
>> make a couple of additional comments below associated with each patch.
>
> It has a problem to me since it depends on using the contrib repo and
> I am using github.
> ...
Is there a reason you can't use the oe-core-contrib repo and create a 
branch there?  Can the script be modified to support github also?

It creates get another remote that we need to fetch from.

>>>        insane.bbclass: skip license checksum if LICENSE is "CLOSED"
>>
>> I assume you are adding this for layers and commercial work, we should never
>> have CLOSED in any open layer.
>
> Sure. I fully agree but I also think it is insane to have to provide a
> fake license file to workaround it in every repository I am using
> internally.
>
We agree, thanks for this change.

>>>        cmake: add support for oe qt4 tools names
>>
>> Please add a comment to the patch explaining it's purpose and origin, and
>> include a Signed-off-by: if appropriate. Any patches that you have modified
>> or added should include the above info.
>
> On the patch itself? Any doc describing an example of it?
>
Mark Hatle has (or will have shortly) a proposal out to the OE community 
for commit and patch message guidelines, as a starting point, you can 
look at the wiki:

https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide

This will be updated in the next 24 hours or so.

Sau!

> I am waiting for Richard and Koen replies about my questions and will
> provide updated patches for the unmerged ones.
>
> Cheers,
>


