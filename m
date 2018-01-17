Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 78F19786EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:59:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 06:00:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,372,1511856000"; d="scan'208";a="166821293"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 17 Jan 2018 05:59:58 -0800
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Andre McCurdy <armccurdy@gmail.com>
References: <20180117004018.21928440002@auh.yoctoproject.org>
	<CAJ86T=X=KXEZ9BxNkkKcdbwNyqwNktwjohOenKdurt9u8ZfOTA@mail.gmail.com>
	<CAP9ODKq6hf=OChy2p4OP2T=mS1ZvZ4GyzL1cvn8LuFmvyQSsxw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1f683220-01a2-c3ad-f5b0-47fe4e9abdc3@linux.intel.com>
Date: Wed, 17 Jan 2018 16:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq6hf=OChy2p4OP2T=mS1ZvZ4GyzL1cvn8LuFmvyQSsxw@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-01-16
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
X-List-Received-Date: Wed, 17 Jan 2018 13:59:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/17/2018 01:53 PM, Otavio Salvador wrote:

> An important aspect is to analyze the errors in the upgrade process. I
> went through all the upgrades and:
> 
>   - go-dep is confusing. It failed but I essentially bumped the SRCREV
> so I don't know why it failed
> 
>   - cmake has multiple errors:
> 
>     - added checksums in cmake_${PV}.bb instead of cmake.inc
>     - removal of non-patch files by mistake
>     - did not handled the -native recipe

Note that the actual upgrade is performed via 'devtool upgrade'/'devtool 
finish' sequence. Devtool can amend the recipes in strange ways, 
particularly when the recipes are structured in a way that is not 
commonly used. Most of the time, from my experience, it does the right 
thing though.

You can replicate the failures and dig deeper into them if you have 
time, or just take those emails as imperfect update reminders :)

Alex

