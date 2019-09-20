Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F079C7FA4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:59:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Sep 2019 04:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; d="scan'208";a="362830439"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by orsmga005.jf.intel.com with ESMTP; 20 Sep 2019 04:59:26 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190920111602.27927-1-ross.burton@intel.com>
	<20190920112649.GA6059@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <9f88c909-9c21-7b3b-58f4-3a4e4b8cae67@intel.com>
Date: Fri, 20 Sep 2019 12:59:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920112649.GA6059@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] json-c: use GitHub for upstream release checking
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
X-List-Received-Date: Fri, 20 Sep 2019 11:59:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/09/2019 12:26, Adrian Bunk wrote:
> Upstream tag names are appending the date to the version,
> making "devtool check-upgrade-status" with this patch result in
> INFO: json-c                    0.13.1          UNKNOWN_BROKEN  Yi Zhao <yi.zhao@windriver.com>

I totally tested this and it worked, somehow.  Obviously my tool is broken!

V2 incoming...

Ross

