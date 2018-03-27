Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id E6E0960190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 10:44:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2018 03:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,367,1517904000"; d="scan'208";a="215036155"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2018 03:44:10 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	Zhang Xiao <xiao.zhang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
	<a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
	<dcc91a62-07a3-9374-5f5c-41fae23fb682@linux.intel.com>
	<cc14195a-81df-190f-23fa-9c914e21e6d9@windriver.com>
	<4813fff9-6e19-4c8d-e22e-2ab6ce5e8989@linux.intel.com>
	<ae9c1af4-ee4d-99f4-7485-968b17bb6811@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <88e3e4f3-e431-8629-192e-e5ddfc0f45bc@linux.intel.com>
Date: Tue, 27 Mar 2018 13:37:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <ae9c1af4-ee4d-99f4-7485-968b17bb6811@windriver.com>
Subject: Re: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Tue, 27 Mar 2018 10:44:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/26/2018 06:28 PM, Mark Hatle wrote:
> I want a multilib_exec that can be used to generate a wrapper.  The recipe will
> have to pass in the name of what is being wrapped, and how to determine the
> correct 'default'.  The scripting should handle everything else.   Like
> multilib_header it needs to generate an identical script no matter when multilib
> it's called with, avoiding any potential file conflict during install -- and
> then an automatic rename of the underlying 'executable'... using the same logic
> as multilib_header.

Thanks. This does look like a project that Wind River should be driving, 
possibly even as a separate layer (initially). Would be good to have a 
proven solution merged, rather than something half-baked with newly 
discovered issues popping up down the road.

Alex

