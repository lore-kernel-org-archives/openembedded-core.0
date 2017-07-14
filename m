Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5D51978224
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 15:27:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 08:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="126725898"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2017 08:27:04 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<0ba0ca75258dc5f62b1c79a7b87f85c136ca8ab7.1499803885.git.anibal.limon@linux.intel.com>
	<1499843714.20211.117.camel@intel.com>
	<ec785117-31c8-db37-cfbe-b7bd34ce007f@linux.intel.com>
	<1500024902.21921.35.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <322463d4-7543-2782-649e-d8bdaf69d976@linux.intel.com>
Date: Fri, 14 Jul 2017 10:27:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1500024902.21921.35.camel@intel.com>
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/30] oeqa/selftest/cases: runqemu enable thraded runs
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
X-List-Received-Date: Fri, 14 Jul 2017 15:27:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/14/2017 04:35 AM, Patrick Ohly wrote:
> On Wed, 2017-07-12 at 10:01 -0500, Aníbal Limón wrote:
>>> Add also a wrapper for runqemu and we can get rid of "from
>>> oeqa.utils.commands import" completely.
>>
>> Yes we can after the refkit and other selftest are adapted.
> 
> My proposal wasn't to remove oeqa.utils.commands, only the "import"
> statements for it in selftest test cases. There might be legitimate uses
> for oeqa.utils.commands outside of selftests.

Agree,
Anibal
> 

