Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T3LFe-0006cK-Ll
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 08:14:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Aug 2012 23:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="182967251"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 19 Aug 2012 23:02:10 -0700
Message-ID: <5031D36D.7040107@intel.com>
Date: Mon, 20 Aug 2012 09:04:29 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345208727-3029-1-git-send-email-radu.moisan@intel.com>
	<502E696C.8050304@linux.intel.com>
In-Reply-To: <502E696C.8050304@linux.intel.com>
Subject: Re: [PATCH][RFC] coreutils: Upgrade to upstream version 8.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 06:14:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/17/2012 06:55 PM, Saul Wold wrote:
> On 08/17/2012 06:05 AM, Radu Moisan wrote:
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>   .../coreutils-8.17/realpath-works-yes.patch        |   13 
>> +++++++++++++
>>   .../remove-gets.patch                              |   20 
>> +++++++++++---------
>>   .../remove-usr-local-lib-from-m4.patch             |    0
>>   .../{coreutils_8.14.bb => coreutils_8.17.bb}       |    9 +++++----
>>   4 files changed, 29 insertions(+), 13 deletions(-)
>>   create mode 100644 
>> meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>>   rename meta/recipes-core/coreutils/{coreutils-8.14 => 
>> coreutils-8.17}/remove-gets.patch (47%)
>>   rename meta/recipes-core/coreutils/{coreutils-8.14 => 
>> coreutils-8.17}/remove-usr-local-lib-from-m4.patch (100%)
>>   rename meta/recipes-core/coreutils/{coreutils_8.14.bb => 
>> coreutils_8.17.bb} (91%)
>>
>> diff --git 
>> a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch 
>> b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>> new file mode 100644
>> index 0000000..6bbe7ee
>> --- /dev/null
>> +++ 
>> b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>
> Your new patch needs a header, explaining why, and adding 
> Upstream-Status and Signed-off-by tags.
>
I meant this only as an RFC, to get feedback for my patch, from a 
functional point of view, it is not intended to be the final patch.
I have a Signed-off-by tag, are you referring to something else?
Can you give me more details about Upstream-Status? I've google'd this 
problem for a bit but could not find an existing patch for it, nor a bug 
filled for this matter. Since I don't know yet if what I'm fixing it's 
really a bug (or a misconfiguration on my side) I send this RFC to get a 
hold of whether I'm on the good track here or not. If this patch turns 
out to be valid, I'll get in touch with the guys from coreutils' mailing 
lists, and try to push it upstream.

radu


