Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB17785B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 14:57:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jan 2018 06:57:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,318,1511856000"; 
   d="scan'208";a="8347356"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 05 Jan 2018 06:57:27 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
Date: Fri, 5 Jan 2018 16:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Jan 2018 14:57:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/05/2018 01:47 PM, Burton, Ross wrote:
> Do we even need gnomebase-meson with this?  I can see a future where 
> GNOME is entirely Meson and then we could just switch the default 
> GNOMEBASEBUILDCLASS from autotools to meson.
> 
> (prior art being the tarball compression type)


I'm fine with this. Just so everyone else knows: RP has actually made 
the change already, and merged everything to master, so the YP supports 
meson as a first class citizen now.

Alex

