Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rl1QO-0001b5-DO
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 17:53:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2012 08:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111145570"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2012 08:45:49 -0800
Message-ID: <4F0DBCBC.2070007@linux.intel.com>
Date: Wed, 11 Jan 2012 08:45:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326267271.git.sgw@linux.intel.com>
	<1326278405.23315.16.camel@ted>
In-Reply-To: <1326278405.23315.16.camel@ted>
Subject: Re: [CONSOLIDATED PULL 0/5] final items for M2 RC1
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
X-List-Received-Date: Wed, 11 Jan 2012 16:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 02:40 AM, Richard Purdie wrote:
> On Tue, 2012-01-10 at 23:36 -0800, Saul Wold wrote:
>> Richard,
>>
>> Here are the final items we discussed yesterday, a succesful
>> build finished, and we seem to be in good shape, please pull
>> these early in your day and fire up AB Master is you can.
>>
>>
>> Thanks
>> 	Sau!
>>
>>
>> The following changes since commit 9b944ae2f0e4dbac5a8f1f235f60730e56b26516:
>>
>>    Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-01-10 18:32:16 +0000)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>>
>> Lianhao Lu (2):
>>    meta/PRService: Added export/import fuctions.
>>    package.bbclass: per recipe PRSERV_HOST support
>>
>> Robert Yang (2):
>>    Incremental rpm image generation
>>    Incremental rpm image generation(Add config sample)
>
> I merged these, thanks.
>
>> Shane Wang (1):
>>    hdparm: upgrade to 9.37
>
> This one needs to be split up as Paul points out...
>
Ok, but one question about bisect-ability, if they are split and the 
hdparm is in one side of a bisect without the new stat package, doesn't 
that break the bisect ability "rule"?

Sau!

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


