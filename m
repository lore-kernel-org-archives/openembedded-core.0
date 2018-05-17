Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E4DEE60053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 10:00:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 03:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,409,1520924400"; d="scan'208";a="56049791"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2018 03:00:32 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Marek Vasut <marek.vasut@gmail.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
	<CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
Date: Thu, 17 May 2018 12:53:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
Cc: auh@auh.yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Thu, 17 May 2018 10:00:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/17/2018 12:56 PM, Burton, Ross wrote:
> Looks like AUH runs as a x86 machine, which is why it doesn't catch u-boot.

Also we have already discussed this 2 month ago. Marek, as the u-boot 
maintainer, can you look into enabling u-boot on qemu please?

Alex

