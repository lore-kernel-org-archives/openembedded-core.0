Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UBVch-0000o6-7B
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 20:28:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Mar 2013 11:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="207857395"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Mar 2013 11:11:37 -0800
Message-ID: <5130FD69.1020804@linux.intel.com>
Date: Fri, 01 Mar 2013 11:11:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<1362141704.1055.56.camel@ted>
In-Reply-To: <1362141704.1055.56.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] btrfs-tools: added PV to git package recipe
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
X-List-Received-Date: Fri, 01 Mar 2013 19:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2013 04:41 AM, Richard Purdie wrote:
> On Fri, 2013-03-01 at 14:19 +0200, Emilia Ciobanu wrote:
>> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
>> ---
>>   .../btrfs-tools/btrfs-tools_git.bb                 |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> index e963a74..df216b1 100644
>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> @@ -17,6 +17,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;p
>>
>>   S = "${WORKDIR}/git"
>>
>> +PV = "0.20-rc1+git${SRCPV}"
>> +
>>   PR = "r6"
>
> Sadly this won't allow an upgrade path to 0.20 when its released.
>
> We'd either need to use 0.20~rc1 or 0.19+0.20-rc1 as the string.

I would suggest the 0.20~rc1 variation since the Git Rev we are at is 
already beyong 0.20-rc1 tag.

Sau!

>
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
>


