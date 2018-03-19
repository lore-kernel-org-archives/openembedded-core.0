Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 184667893E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 08:57:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 01:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,329,1517904000"; d="scan'208";a="36178516"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 01:57:25 -0700
To: Marek Vasut <marek.vasut@gmail.com>
References: <20180316092125.64DD7440071@auh.yoctoproject.org>
	<8f7b8f66-1a17-6051-e626-fc4a3d26c5af@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <caedac22-09fe-1ee3-34c7-8e285743f352@linux.intel.com>
Date: Mon, 19 Mar 2018 10:50:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <8f7b8f66-1a17-6051-e626-fc4a3d26c5af@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.03 FAILED
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
X-List-Received-Date: Mon, 19 Mar 2018 08:57:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/17/2018 06:27 PM, Marek Vasut wrote:

>> You are receiving this email because you are the maintainer
>> of *u-boot-mkimage* recipe and this is to let you know that the automatic attempt
>> to upgrade the recipe to *2018.03* has Failed(do_compile).
>>
>> Detailed error information:
>>
>> do_compile failed
> 
> It seems this only bumped some of the U-Boot recipes to 2018.03 while it
> left some at 2018.01, so it's not really surprising it failed. Maybe
> this is an auto-update bug ?

The problem is that AUH is using qemu machines to determine what needs 
to be updated, and to attempt building new versions. u-boot is not 
enabled in qemu at all, and so it's skipped:

ERROR: Nothing PROVIDES 'u-boot'
u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in 
the qemux86 machine configuration.

I'm not sure how to solve it - perhaps you can simply take the email as 
a reminder to update the whole set on your machine manually?


Alex

