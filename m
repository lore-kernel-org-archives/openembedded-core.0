Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 872AB78255
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 15:46:46 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Nov 2017 08:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,339,1505804400"; d="scan'208";a="171151159"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.19.154])
	by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2017 08:46:32 -0700
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20171103091147.20243-1-joshua.g.lock@intel.com>
	<a547af4c-6ae8-b0f2-446f-e19350b984b6@gmail.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <1dcf524a-2db1-032b-8282-6855b21b4625@linux.intel.com>
Date: Fri, 3 Nov 2017 15:46:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <a547af4c-6ae8-b0f2-446f-e19350b984b6@gmail.com>
Subject: Re: [PATCH] scripts/runqemu: when qemu fails to start with kvm retry with kvm disabled
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
X-List-Received-Date: Fri, 03 Nov 2017 15:46:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 03/11/17 15:18, akuster808 wrote:
> Joshua,
> 
> 
> On 11/03/2017 02:11 AM, Joshua Lock wrote:
>> On the Yocto Project Autobuilder we occasionally see qemu fail to start,
>> most frequently on Fedora 25, because kvm fails to allocate memory. See:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12058
>>
>> This patch introduces a fallback path where if the inital qemu command fails
>> and kvm is enabled we retry running qemu with the kvm related options
>> removed from the qemu command line.
> 
> I will backport once this lands in master.
> thanks,

I don't think it will make it. It complicates the code for a relatively 
rare edge case.

To avoid this on Yocto Autobuilder we're going to drop Fedora 25 from 
the clusters.

Joshua

