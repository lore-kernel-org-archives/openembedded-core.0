Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U0iIW-0001H2-Qv
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 01:46:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jan 2013 16:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,572,1355126400"; d="scan'208";a="284417379"
Received: from unknown (HELO envy.home) ([10.255.12.120])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2013 16:30:50 -0800
Message-ID: <5109BB3A.1060008@linux.intel.com>
Date: Wed, 30 Jan 2013 16:30:50 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1359587149-27928-1-git-send-email-sgw@linux.intel.com>
	<5109B4BD.3000307@linux.intel.com>
	<5109B893.2070906@linux.intel.com>
In-Reply-To: <5109B893.2070906@linux.intel.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] module.bbclass: Allow for modules to be packaged seperate from ${PN}
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
X-List-Received-Date: Thu, 31 Jan 2013 00:46:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/30/2013 04:19 PM, Saul Wold wrote:
> On 01/30/2013 04:03 PM, Darren Hart wrote:
>> On 01/30/2013 03:05 PM, Saul Wold wrote:
>>> This patch will allow recipes that provide kernel modules to package
>>> the module or modules in specific packages. That list is contained in
>>> MODULE_PACKAGES, this defaults to  to preserve the current behavior.
>>
>> s/to to preserve/to preserving/
>>
> Fixed in my MUT branch
> 
>>> The package can also define MODULE_FILES to specify files.
>>
>> So, for example, the hello-mod recipe in meta-skeleton can remain unchanged?
> Correct, the default for MODULE_PACKAGES is "${PN}" so no changes are 
> required.
> 
>> It will then get /lib/modules/*/hello.ko in FILES_hello-mod and
>> MODULE_PACKAGES will be set to hello-mod. If I wanted to, hello-mod
>> could create to modules, and package them separately by specifying two
>> values in MODULE_PACKAGES and creating the appropriate
>> MODULE_FILES_foo|bar entries?
>>
> Correct, 2 packages would be created and the files specified would be 
> packaged into foo and bar.
> 
>> Right, seems to make sense to me. What testing has this seen? Have you
>> verified it with hello-mod?
>>
> I verified it with lttng-module and added MODULE_PACKAGES = 
> "module-test" and MODULE_FILES_module-test = "/etc" and then verified 
> packages and variables.
> 
> Sau!
> 
>> --
>> Darren
>>
>>>
>>> [YOCTO #3803]
>>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

Thanks Saul!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


