Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A79AB6AE6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:42:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2013 05:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="376548477"
Received: from adinu-vostro-460.rb.intel.com (HELO [10.237.105.146])
	([10.237.105.146])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2013 05:42:16 -0700
Message-ID: <51F26ECC.3060202@intel.com>
Date: Fri, 26 Jul 2013 15:42:52 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <51F26B86.5020309@intel.com> <2661953.CXEvbvU0xy@helios>
In-Reply-To: <2661953.CXEvbvU0xy@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is there a variable where the kernel version is stored?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jul 2013 12:42:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2013 03:39 PM, Paul Eggleton wrote:
> Hi Andrei,
>
> On Friday 26 July 2013 15:28:54 Andrei Dinu wrote:
>> I'm having a problem trying to run Bastille. Seems like the kernel
>> version has changed from 3.8.11 to 3.8.13 and
>> in order to run Bastille, i need to patch a file used by the tool to
>> check the version of the system. It was previously
>> patched with linux-yocto-3.8.11 version, but now it has changed to
>> linux-yocto-3.8.13 and the tool doesn't work
>> because it doesn't identify the right version of the kernel.
>>
>> Is there a way to find out the kernel version at build time so i can
>> replace it dynamically in that specific file?
> Hmm, so if you add a DEPENDS on virtual/kernel you should be able to rely on
> the contents of ${STAGING_KERNEL_DIR}/kernel-abiversion - have a look at what
> meta/classes/module.bbclass does with this.
Thanks!
>
> Cheers,
> Paul
>


