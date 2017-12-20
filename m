Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A1687785B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 11:34:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 03:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,431,1508828400"; d="scan'208";a="17576819"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2017 03:34:35 -0800
To: California Sullivan <california.l.sullivan@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6c55c79f-e43d-7d81-2df5-0658603e2bd1@linux.intel.com>
Date: Wed, 20 Dec 2017 13:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: Re: [PATCH RFC 00/18] EFI boot partition improvements
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
X-List-Received-Date: Wed, 20 Dec 2017 11:34:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/20/2017 12:58 AM, California Sullivan wrote:
> Currently, the boot partition of an EFI system is entirely controlled by
> image creation. Either done entirely through wic, or one of the
> bootloader bbclasses. This is rather bad since it makes it very
> difficult to add additional items to the boot partition, such as
> alternative kernels, bootloaders, or other utilities, and since its not
> package controlled its hard to update.

How are you planning to have this documented? You probably need to 
review the yocto manuals and see what needs to be changed or newly written.

Alex

