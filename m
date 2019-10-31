Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 36C5C7FA88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:01:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Oct 2019 11:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,252,1569308400"; d="scan'208";a="211616407"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2019 11:01:03 -0700
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20191031150605.14643-1-open.source@oleksandr-kravchuk.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5e5ece5f-a79c-77f0-4b69-d15c03f83ebf@intel.com>
Date: Thu, 31 Oct 2019 18:01:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031150605.14643-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] ofono: update to 1.31
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
X-List-Received-Date: Thu, 31 Oct 2019 18:01:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 31/10/2019 15:06, Oleksandr Kravchuk wrote:> Changelog:
 > - Fix issue with handling CID 0 context identifier
 > - Fix issue with handling detach state and running LTE
 > - Fix issue with handling SIM states and Quectel modems

A patch just landed in master to clean up the recipe, can you rebase on 
top of that please?

Ross

