Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DF6A9780E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 10:27:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 10 Aug 2017 03:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,352,1498546800"; d="scan'208";a="888510724"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2017 03:27:05 -0700
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	openembedded-core@lists.openembedded.org
References: <cb7a3cf4-4167-bc42-ab9b-72f67bc996cd@pseudoterminal.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1f8d6ec9-bc90-87d9-a774-746d2888d67c@linux.intel.com>
Date: Thu, 10 Aug 2017 13:23:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cb7a3cf4-4167-bc42-ab9b-72f67bc996cd@pseudoterminal.org>
Subject: Re: Stricter fuzz factor when patching?
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
X-List-Received-Date: Thu, 10 Aug 2017 10:27:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/10/2017 12:57 PM, Carlos Rafael Giani wrote:
> I was surprised that Yocto does not use fuzz factor 0 by default. The 
> case above demonstrates how this can lead to confusing errors. Or worse, 
> recipes might even build but then cause subtle runtime errors...
> 
> Is there a reason why the default fuzz factor isn't 0? Is it just 
> because of the large amount of work required to fix all these patches 
> that won't apply without a fuzz factor?

You have to ask the author of the patch tool, a certain Larry Wall, why 
he set the default fuzz to 2. Yocto didn't do this intentionally, it was 
just never really noticed that the default is like this, and can lead to 
incorrectly applied patches.

We have a couple of bugs to fix it, you are welcome to voice your 
concern there:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
blocked by
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8325

Alex

