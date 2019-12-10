Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BC74A7D2FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 10:39:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Dec 2019 02:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="225109685"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2019 02:39:49 -0800
To: =?UTF-8?B?5bGx5qC55aSn5YW4?= <yamane07ynct@gmail.com>
References: <1575627191-12947-1-git-send-email-yamane07ynct@gmail.com>
	<cf16a85c-f7e7-57e8-c6c2-9ffec81e8af7@intel.com>
	<CAHZ3=rpH=C1FXieMV2n-7oDveSoHdfprH8YSwxstN2YscWEPVw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1a341964-16a0-e6b7-123e-51f06e2657c2@intel.com>
Date: Tue, 10 Dec 2019 10:39:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHZ3=rpH=C1FXieMV2n-7oDveSoHdfprH8YSwxstN2YscWEPVw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot-fw-utils: Add capability of building from out-of-tree
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
X-List-Received-Date: Tue, 10 Dec 2019 10:39:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 10/12/2019 06:09, 山根大典 wrote:
> 2019年12月9日(月) 19:43 Ross Burton <ross.burton@intel.com>:
>>
>> On 06/12/2019 10:13, Daisuke Yamane wrote:
>>> This patch also helps to build with EXTERNALSRC.
>>
>> As this doesn't actually set B, will you be sending a follow-up patch to
>> set B so out-of-tree builds actually work?
> As there is EXTERNALSRC_BUILD in externalsrc.bbclass, I don't think
> the follow-up patch is necessary.

I mean in the general case, not specifically externalsrc.

Out-of-tree builds are fundamentally better than in-tree.

Ross

