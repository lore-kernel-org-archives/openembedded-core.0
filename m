Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs94w-0007t1-RV
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 09:28:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jan 2012 00:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112334912"
Received: from unknown (HELO [10.255.14.89]) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2012 00:20:42 -0800
Message-ID: <4F27A45A.4050106@linux.intel.com>
Date: Tue, 31 Jan 2012 00:20:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
	<d7e2e04d416b8ea8339b1bcc40af3043feb908b7.1327638861.git.raj.khem@gmail.com>
	<4F275CE2.4090801@linux.intel.com>
	<CAMKF1so+zagwZL5e4cSLu9XPaPDng4X9UnzSBVggnz656y3amA@mail.gmail.com>
	<1327987091.24970.38.camel@elmorro>
	<CAMKF1sp5UkNp_7fFmnUx-mBzbn7S5D_UHxQMR7DfcYQge2YVLw@mail.gmail.com>
In-Reply-To: <CAMKF1sp5UkNp_7fFmnUx-mBzbn7S5D_UHxQMR7DfcYQge2YVLw@mail.gmail.com>
Subject: Re: [PATCH 2/5] task-core-tools: Divide it into 3 recipes
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
X-List-Received-Date: Tue, 31 Jan 2012 08:28:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 11:26 PM, Khem Raj wrote:
> On Mon, Jan 30, 2012 at 9:18 PM, Tom Zanussi<tom.zanussi@intel.com>  wrote:
>> On Mon, 2012-01-30 at 20:19 -0800, Khem Raj wrote:
>>> On Mon, Jan 30, 2012 at 7:15 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>>>> This patch is going to require some coordination with meta-yocto and
>>>> possibly other layers that currently have .bbappends on the task-core-tools.
>>>>
>>>> It may be as simple as moving the dependency into this new -profile.bb task
>>>> file.
>>>>
>>>> I am going to hold this one for now.
>>>
>>> Are there other layers than meta-intel and meta-yocto that needs it.
>>> Please speak up. Can I request meta-yocto and meta-intel maintainers to please
>>> coordinate fixing the respective layers. Fix is that if you have been appending
>>
>> I've created a meta-intel branch ready to be pulled in when this is:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/log/?h=tzanussi/task-core-tools-rename
>
> thanks Tom. meta-yocto maintainer needs to fix
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/recipes-core/tasks/task-core-tools.bbappend
>
I will take care of this tomorrow, just wanted to make sure any other 
places that needed it got the attention.

Sau!

>>
>> Tom
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
>


