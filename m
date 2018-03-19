Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAFA78932
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:04:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 03:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,330,1517904000"; d="scan'208";a="36195801"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 03:04:36 -0700
To: Marek Vasut <marek.vasut@gmail.com>
References: <20180316092125.64DD7440071@auh.yoctoproject.org>
	<8f7b8f66-1a17-6051-e626-fc4a3d26c5af@gmail.com>
	<caedac22-09fe-1ee3-34c7-8e285743f352@linux.intel.com>
	<c7ca8437-1517-e449-57b4-bdc39633b9e6@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <eebfb544-851e-6e67-9056-a997bc8863d1@linux.intel.com>
Date: Mon, 19 Mar 2018 11:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <c7ca8437-1517-e449-57b4-bdc39633b9e6@gmail.com>
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
X-List-Received-Date: Mon, 19 Mar 2018 10:04:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 11:55 AM, Marek Vasut wrote:

>> I'm not sure how to solve it - perhaps you can simply take the email as
>> a reminder to update the whole set on your machine manually?
> 
> I was hoping the tool will take care of that, now that I've finally
> plucked all the extra patches out.

You can automate most of the upgrade by running 'devtool upgrade u-boot' 
though. Extra patches are not a problem for automatic updates. If U-BOOT 
and qemu can be made friends, that's even better.

Alex

