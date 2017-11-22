Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 42B9F7870E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:30:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 05:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; 
   d="scan'208";a="8263160"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2017 05:30:52 -0800
To: Kristian Amlie <kristian.amlie@northern.tech>,
	openembedded-core@lists.openembedded.org
References: <6a525f12-f5ea-d079-83d8-46e6394be8ff@linux.intel.com>
	<1511356419-32334-1-git-send-email-kristian.amlie@northern.tech>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
Date: Wed, 22 Nov 2017 15:31:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511356419-32334-1-git-send-email-kristian.amlie@northern.tech>
Subject: Re: [PATCH v6] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 22 Nov 2017 13:30:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/22/2017 03:13 PM, Kristian Amlie wrote:

>> Bear with the pre-release freeze period please; once rocko is out
>> patches will start flowing to master again.
> 
> So now that rocko has been out for a while, can we get this in please?
> Already reviewed, and rebased patch is included.

Please do pay attention to what the recent Yocto Project Status emails 
say. Specifically:

" Until we resolve these issues patches will continue to be slow to 
merge, if at all. This also blocks several core developers from doing 
any feature work at this point in time (e.g. layer setup tool is on 
hold, again).

·        We can only continue to stress that unless others step up and 
help to try and root cause these issues, things will stall with the 
project."

The way things are with the project now, contributors are many, 
maintainers are few. If you can balance things out a little bit, that 
would be much appreciated.

Alex

