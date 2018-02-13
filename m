Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id E572E78417
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 07:04:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 23:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,506,1511856000"; d="scan'208";a="18010828"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 23:04:13 -0800
To: Chaitanya Cherukuri <ccherukuri.chaitanya@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <CAGix03zhY3ZEhKLUyzU3HDmMD3t2MmOwkM2TffZVUdByk+cA+A@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <68bad37c-fb4f-bfe1-2e51-7f191edca215@linux.intel.com>
Date: Tue, 13 Feb 2018 08:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAGix03zhY3ZEhKLUyzU3HDmMD3t2MmOwkM2TffZVUdByk+cA+A@mail.gmail.com>
Subject: Re: Regarding Patch ID: 132816
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
X-List-Received-Date: Tue, 13 Feb 2018 07:04:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/12/2018 11:06 PM, Chaitanya Cherukuri wrote:
> I'm new to this forum and didn't know to where to report an issue. I'm 
> contacting you regarding the patch ID 132816 ( cmake: improve 
> CMAKE_SYSTEM_PROCESSOR assignment in nativesdk).
> 
> If SDKTARGETSYSROOT is "/sysroots/cortexa9hf-neon-poky-linux-gnueabi" 
> this patch sets the CMAKE_SYSTEM_PROCESSOR as  "cortexa9hf-neon-poky"  
> instead of
> "cortexa9hf-neon".
> 
> This patch works if SDKTARGETSYSROOT is "/sysroots/core2-32-poky-linux".

I guess this one is for Otavio Salvador, the cmake recipe maintainer?

Alex

