Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Pzkfz-00069U-7S
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 07:57:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2011 23:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,193,1299484800"; d="scan'208";a="667768826"
Received: from unknown (HELO [10.255.12.146]) ([10.255.12.146])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2011 23:56:03 -0700
Message-ID: <4D805EF3.2080705@linux.intel.com>
Date: Tue, 15 Mar 2011 23:55:47 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20110316015133.GA7694@sakrah.homelinux.org>
	<4D801C0B.1040809@windriver.com>
In-Reply-To: <4D801C0B.1040809@windriver.com>
Subject: Re: User repos on openemebdded-core-contrib
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
X-List-Received-Date: Wed, 16 Mar 2011 06:57:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 03/15/2011 07:10 PM, Mark Hatle wrote:
> On 3/15/11 8:51 PM, Khem Raj wrote:
>> Hi
>>
>> The policies on openembedded-core-contrib repo right now does not allow
>> me to either delete or do a git push -f on the branches I have pushed
>> for pull requests.
>>
>> The problem becomes suppose when you have feedback on a pull request
>> and you do version 2 of the patch and subsequent versions then with
>> current policies we will have to create separate branches for each
>> request. I thought it would be better if one could delete/rewrite his
>> own branches on the contrib repo.
>>
>> How does yocto manage the contrib repo in this regard?
>
> The yocto project allows push -f's for the contrib repository.

including:

git push :remote/branch/to/delete

It's necessary to avoid a horrible mess of stagnant contrib branches.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


