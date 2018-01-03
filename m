Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE556E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 09:37:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 01:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,500,1508828400"; 
   d="scan'208";a="7060416"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2018 01:37:32 -0800
To: Jibin Xu <jibin.xu@windriver.com>, openembedded-core@lists.openembedded.org
References: <20171228022126.219745-1-jibin.xu@windriver.com>
	<b3ad73b2-4406-aa24-9bd1-073674627670@linux.intel.com>
	<52ee158d-537a-a42e-0d42-43a197885971@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <aef61c07-32d5-17d0-f1e5-c328d3d8fffb@linux.intel.com>
Date: Wed, 3 Jan 2018 11:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <52ee158d-537a-a42e-0d42-43a197885971@windriver.com>
Subject: Re: [PATCH] fontcache : fix build warning when using quemu usermode
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
X-List-Received-Date: Wed, 03 Jan 2018 09:37:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/03/2018 05:27 AM, Jibin Xu wrote:
> 
> 
> On 2018年01月02日 20:00, Alexander Kanavin wrote:
>> On 12/28/2017 04:21 AM, Jibin Xu wrote:
>>> fontcache uses quemu usermode by default, but some architecture
>>> such as Intel skylake does not support qemu usermode, this can
>>> lead to a build warning as below:
>>> "WARNING: The postinstall intercept hook 'update_font_cache' failed".
>>>
>>> Add a judgement of qemu usermode to fix the build warning.
>>
>> You also need to fix this in pixbufcache.bbclass. Squash all changes 
>> into a single patch.
> Do you mean that change gio-module-cache.bbclass pixbufcache.bbclass and 
> fontcache.bbclass,
> then Squash all changes into a single patch?

I mean this, yes. I thought there were four places to fix this, but one 
of the postinsts does not actually call into qemu, and just runs the 
native binary for some reason.

Alex



