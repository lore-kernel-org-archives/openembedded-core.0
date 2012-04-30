Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOsZf-0000b0-43
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:31:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 08:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138305044"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 08:21:52 -0700
Message-ID: <4F9EAE10.6090901@linux.intel.com>
Date: Mon, 30 Apr 2012 08:21:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
	<baa0f344e516b3474cf5f1a5e8afcbc392be16de.1335600691.git.dongxiao.xu@intel.com>
	<20120429084538.GA350@jama.jama.net>
In-Reply-To: <20120429084538.GA350@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 6/8] ofono: upgrade to version 1.6
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
X-List-Received-Date: Mon, 30 Apr 2012 15:31:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2012 01:45 AM, Martin Jansa wrote:
> On Sat, Apr 28, 2012 at 04:12:30PM +0800, Dongxiao Xu wrote:
>> Signed-off-by: Dongxiao Xu<dongxiao.xu@intel.com>
>> ---
>>   .../ofono/{ofono_1.5.bb =>  ofono_1.6.bb}           |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>   rename meta/recipes-connectivity/ofono/{ofono_1.5.bb =>  ofono_1.6.bb} (97%)
>>
>> diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb b/meta/recipes-connectivity/ofono/ofono_1.6.bb
>> similarity index 97%
>> rename from meta/recipes-connectivity/ofono/ofono_1.5.bb
>> rename to meta/recipes-connectivity/ofono/ofono_1.6.bb
>> index dad813f..d0f273b 100644
>> --- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
>> +++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
>> @@ -1,6 +1,6 @@
>>   require ofono.inc
>>
>> -PR = "r1"
>> +PR = "r0"
>
> without checksum change it will fail, right?
>
> I'll send patch I have for ofono upgrade in my branch.
>
This seems to have uncovered a problem with the Fetcher, it happily 
pulls the upstream tarball, raises a BBFetchException, and writes the 
checksum failure to the log file, but it seems to still mark the fetch 
complete with a .done file and continues to build.

I will file a bug.

Sau!

>>
>>   SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
>>   	          file://ofono"
>> --
>> 1.7.4.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


