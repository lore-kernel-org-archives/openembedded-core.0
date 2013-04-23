Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UUePb-0004aq-3u
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 16:41:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Apr 2013 07:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,533,1363158000"; d="scan'208";a="230846153"
Received: from unknown (HELO envy2.home) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Apr 2013 07:23:55 -0700
Message-ID: <5176997B.8060308@linux.intel.com>
Date: Tue, 23 Apr 2013 07:23:55 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <509f81736f95919be413293c2286c739da1de06f.1366673258.git.dvhart@linux.intel.com>
	<CAP9ODKoKMQZwLFPKUkNLu_7UmvHFeXd0siuMxbFntMdznLgi3g@mail.gmail.com>
In-Reply-To: <CAP9ODKoKMQZwLFPKUkNLu_7UmvHFeXd0siuMxbFntMdznLgi3g@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: Look for RTL license in the right directory
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
X-List-Received-Date: Tue, 23 Apr 2013 14:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/23/2013 04:51 AM, Otavio Salvador wrote:
> On Mon, Apr 22, 2013 at 8:27 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> The rtl-license package FILES was pointing to the wrong directory as it
>> was removed from there in commit:
>>
>> acd3735 linux-firmware: Remove duplicaed license from rtlwifi subdir
>>
>> This resulted in a do_rootfs failure for core-image-sato-sdk for fri2
>> with ipk when the linux-firmware-dev package tried to install
>> linux-firmware-rtl-license which wasn't created as it was empty.
>>
>> Tested on core-image-sato-sdk build for fri2 on dylan commit:
>> 789b2b7e0cca404ff8ba8ed5ba823d215e6ba5b4
>>
>> Cc: Saul Wold <sgw@linux.intel.com>
>> Cc: Beth Flanagan <elizabeth.flanagan@intel.com>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> 
> I don't know how the install failure did not happen here but this is
> indeed a fix.

You would need to build something like SDK which includes the dev
package and I believe you would also need the following patch which
landed after yours:

9fb13a3 linux-firmware: make the main package depend on all sub-packages


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


