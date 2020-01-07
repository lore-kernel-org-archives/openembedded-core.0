Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6597FC1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 12:16:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2020 04:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; d="scan'208";a="253734155"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2020 04:16:47 -0800
To: openembedded-core@lists.openembedded.org, khem Raj <raj.khem@gmail.com>
References: <cover.1578360245.git.raj.khem@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <a4b6a364-7799-f497-6183-53bac35e1ea2@intel.com>
Date: Tue, 7 Jan 2020 12:16:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <cover.1578360245.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/1] Revert "tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags"
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
X-List-Received-Date: Tue, 07 Jan 2020 12:16:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/01/2020 02:58, Khem Raj wrote:
> -D__USE_TIME_BITS64 is already added to musl internally now
> so its not needed to be added externally to compiler cmdline

Can you put this in the actual commit message?

Ross

