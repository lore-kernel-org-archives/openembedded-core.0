Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 347726FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 09:02:44 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 30 Oct 2017 02:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,319,1505804400"; d="scan'208";a="169435066"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2017 02:02:44 -0700
To: Dengke Du <dengke.du@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <63a935be-505f-c2e9-8ccf-ea5079123098@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <73eff1cd-110d-78bb-f1da-3c670c4082b7@linux.intel.com>
Date: Mon, 30 Oct 2017 11:02:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <63a935be-505f-c2e9-8ccf-ea5079123098@windriver.com>
Subject: Re: avahi 0.7 : should we need to package /run directory or delete it?
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
X-List-Received-Date: Mon, 30 Oct 2017 09:02:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/30/2017 09:21 AM, Dengke Du wrote:

> The new version of avahi 0.7 use /run directory to place some run-time 
> variable data,
> 
> not /var/run, should we need to package it or delete it?

Can you provide details please? What is being placed there and at which 
point?

Alex

