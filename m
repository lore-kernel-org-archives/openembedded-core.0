Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA7B278093
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 11:35:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 03:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; 
   d="scan'208";a="9939042"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 11 Jan 2018 03:35:32 -0800
To: Martin Kelly <mkelly@xevo.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
	<0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
	<64c07649-f0df-9acc-fbf3-e8f6a52db9f1@xevo.com>
	<1515610131.29722.112.camel@linuxfoundation.org>
	<9a261bf7-62c9-2aa9-9fa2-d27bb6ff7653@xevo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <83efbf54-dde5-2a84-00a0-6db5fc9e7ee5@linux.intel.com>
Date: Thu, 11 Jan 2018 13:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <9a261bf7-62c9-2aa9-9fa2-d27bb6ff7653@xevo.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Thu, 11 Jan 2018 11:35:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/10/2018 09:11 PM, Martin Kelly wrote:
> Yes, to be clear, I'm not griping, as I'm very happy meson landed in 
> OE-core, and I'm working on SDK support now. I have an OE-core thread 
> going with meson upstream to get the issue fixed.
> 
> To be clear though, I'm not sure it even regressed. AFAICT, it never 
> quite worked.
> 
> Where would I add SDK tests for this?

meta/lib/oeqa/selftest/cases is the place. Not sure what existing SDK 
tests are already there.


Alex


