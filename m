Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 026E571A9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 11:22:43 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Sep 2017 04:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,392,1500966000"; d="scan'208";a="151774731"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2017 04:22:44 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20170912155906.29716-1-ross.burton@intel.com>
	<fd5d461b-2217-ef1e-9aa4-690d7508d806@windriver.com>
	<CAJTo0LYKz5w7fNe=m_5kA+iXpfRvJ9FsxR75_c+=bz4zHTVVWg@mail.gmail.com>
	<3925ff6f-d39b-df5a-5ac0-cad5d5b72d9e@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <19ccc7a4-5812-dae4-6ad8-2892cc7550c6@linux.intel.com>
Date: Thu, 14 Sep 2017 14:18:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <3925ff6f-d39b-df5a-5ac0-cad5d5b72d9e@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] allarch: don't reset baselib
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
X-List-Received-Date: Thu, 14 Sep 2017 11:22:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/12/2017 08:31 PM, Mark Hatle wrote:

>> Also its interesting that nobody else noticed this: multilib images that
>> installed fonts were segfaulting in rootfs...
> 
> If the segfault is causing the postinst to exit w/ an error (non-0) then it's
> likely re-running on the target itself (and thus working).  If not, ugh.

I still believe sweeping genuine postinst errors under the carpet like 
this is wrong, and I maintain a patchset to address it:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/dnf-rpm4-postinst-fix

Will re-submit after 2.4 is out.


Alex

