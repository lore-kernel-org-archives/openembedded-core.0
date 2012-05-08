Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRuKZ-0000J7-Ev
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:00:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2012 16:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138414233"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2012 16:50:08 -0700
Message-ID: <4FA9B12F.4040209@linux.intel.com>
Date: Tue, 08 May 2012 16:50:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
	<4FA998F8.8060306@linux.intel.com>
	<CAMKF1srhrwcEks0rGssCXQdyEFa9wYX6zVp14qAKns7wLHeJVA@mail.gmail.com>
	<CAMKF1sr_KgMb+5fsrWhjvGh-BmKHyjMF4+25yBR0szeijLF9aQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr_KgMb+5fsrWhjvGh-BmKHyjMF4+25yBR0szeijLF9aQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Wed, 09 May 2012 00:00:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2012 03:18 PM, Khem Raj wrote:
> On Tue, May 8, 2012 at 3:09 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>> On Tue, May 8, 2012 at 3:06 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>>>>
>>> Khem,
>>>
>>> Not sure what I am doing differently, but I am not getting the xserver to
>>> start on at least ppc and mips (two that I tried just now).
>>>
>>> Are you build a Yocto sato image or oe-core sato image?
>>>
>>> I get the following on a ppc:
>>>
>>> Fatal server error:
>>> no screens found
>>> xinit: giving up
>>> xinit: unable to connect to X server: No such file or directory
>>> xinit: server error
>>>
>>
>> hmmm I have booted core-image-sato but I have bare OE-Core
>> Do you have
>>
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/qemu-xserver-xorg&id=8a60dabb7902b7be42d06cb735e96248e2e67dba
>>
>> is some layer on top changing it in some way ?
>
> hmmm another think I have is this patch
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=955dee621361e01627ebfde152f25873070cf301
>
> which deletes kdrive recipes. I did not propose it for inclusion yet
> but I wonder if there is any mix and match happening when these
> recipes are not deleted.
> You can cherry-pick it and see if that helps.
>
So I found that task-core-x11.bb also sets XSERVER

XSERVER ?= "xserver-kdrive-fbdev"

And this was being picked up it seems when I did the build.

I commented that line out and it worked correctly.

That seems wrong, since I thought the ??= should not allow the ?= to 
override, or do I have it backwards?

Sau!




>


