Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TkeMl-0008Ku-MG
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:20:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Dec 2012 09:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,303,1355126400"; d="scan'208";a="258426065"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.212])
	by orsmga002.jf.intel.com with ESMTP; 17 Dec 2012 09:05:53 -0800
Message-ID: <50CF50F1.3040102@linux.intel.com>
Date: Mon, 17 Dec 2012 09:05:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1355741287-8655-1-git-send-email-alexandru.damian@intel.com>
	<50CF38D4.8040701@windriver.com>
In-Reply-To: <50CF38D4.8040701@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Core image base ssh access and package management
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
X-List-Received-Date: Mon, 17 Dec 2012 17:20:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2012 07:23 AM, Mark Hatle wrote:
> On 12/17/12 4:48 AM, Alex DAMIAN wrote:
>> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>>
>> Since core-image-base is a default image that developers should
>> use for developing headless applications, it should have
>> package management and ssh access.
>
> I'm not sure I agree with that.
>
> 'base' should be a small system, similar to minimal, but with discrete
> executables.  If the user wants packaging and ssh they should be able to
> add it.
>
I agree with Mark on this one.

Sau!

> --Mark
>
>> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
>> ---
>>   meta/recipes-core/images/core-image-base.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/images/core-image-base.bb
>> b/meta/recipes-core/images/core-image-base.bb
>> index 8ef3376..a78417f 100644
>> --- a/meta/recipes-core/images/core-image-base.bb
>> +++ b/meta/recipes-core/images/core-image-base.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "A console-only image that fully supports the target
>> device \
>>   hardware."
>>
>> -IMAGE_FEATURES += "splash"
>> +IMAGE_FEATURES += "splash package-management ssh-server-dropbear"
>>
>>   LICENSE = "MIT"
>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


