Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CC4127F7EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 11:26:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Dec 2019 03:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="209273470"
Received: from kdobros-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.194])
	by orsmga008.jf.intel.com with ESMTP; 16 Dec 2019 03:26:49 -0800
To: openembedded-core@lists.openembedded.org
References: <20191215183756.GB14038@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <b2f4e687-fed9-529a-ddda-21931125dbac@intel.com>
Date: Mon, 16 Dec 2019 11:26:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191215183756.GB14038@localhost>
Subject: Re: Should patchtest warn on Upstream-Status: Pending ?
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
X-List-Received-Date: Mon, 16 Dec 2019 11:26:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/12/2019 18:37, Adrian Bunk wrote:
> I am wondering whether patchtest should send warning emails on
>     Upstream-Status: Pending
> 
> In practice patches are usually forwarded upstream either at submission
> or never.[1]
> 
> Not upstreamed OE-only patches create a technical debt that often makes
> recipe upgrades a pain.

I tend to agree with Alex.  In review if I see a patch that clearly 
should be something else (submit this trivial fix upstream now please, 
or mark as inappropriate) I'll do that, but otheriwse we don't want 
*more* barriers.

Ross

