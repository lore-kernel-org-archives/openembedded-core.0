Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F405C78A51
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:33:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 09:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,427,1515484800"; d="scan'208";a="23083721"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 05 Mar 2018 09:33:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: akuster808 <akuster808@gmail.com>, Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180305172046.21729-1-ross.burton@intel.com>
	<20180305172046.21729-2-ross.burton@intel.com>
	<30b5b54b-c330-5bdf-9f3c-454ddde92353@gmail.com>
	<593a77b8-c31f-5f58-5214-a526d73f2749@linux.intel.com>
Message-ID: <d71cf595-a1d7-40a0-d486-902975862685@linux.intel.com>
Date: Mon, 5 Mar 2018 19:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <593a77b8-c31f-5f58-5214-a526d73f2749@linux.intel.com>
Subject: Re: [PATCH 02/29] dbus-glib: refresh patch
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
X-List-Received-Date: Mon, 05 Mar 2018 17:33:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/05/2018 07:26 PM, Alexander Kanavin wrote:
> On 03/05/2018 07:24 PM, akuster808 wrote:
>> Why do this patches need to be refreshed?
> 
> Long story:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> 
> Short story:
> 
> we'll soon start warning users if patches are applied with fuzz (e.g. 
> context lines in a patch are ignored in order to apply the patch 
> somehow, somewhere). This patch series fixes up oe-core patches, so that 
> none of oe-core produces these warnings. This is the commit that will 
> follow the fixup patches and introduces the warning:
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143760.html 

Oh, and once most layers catch up, fuzz will be rejected outright:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/fix-patch-fuzz&id=827172d096dd62648506c0341d0207bd6353203d


Alex

