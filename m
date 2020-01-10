Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3444B7FD69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 23:27:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2020 15:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="212412913"
Received: from lipu-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.168])
	by orsmga007.jf.intel.com with ESMTP; 10 Jan 2020 15:27:58 -0800
To: openembedded-core@lists.openembedded.org
References: <20200110220306.13780-1-pkj@axis.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <fabf0714-f1be-16a9-6b47-b065f0f7eaed@intel.com>
Date: Fri, 10 Jan 2020 23:27:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110220306.13780-1-pkj@axis.com>
Subject: Re: [master][zeus][PATCHv2] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Fri, 10 Jan 2020 23:27:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/01/2020 22:03, Peter Kjellerstedt wrote:
> Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
> part of the code licensed as GPL-3.0, and which is normally packaged
> separately in cairo-perf-utils). By disabling this, we can adapt the
> licenses for cairo-dbg and cairo-src so that they do not include
> "GPLv3+" when trace is disabled and thus they can be used also when,
> e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.

The shortlog makes no mention of trace at all.  Can this be split into 
two commits, one for trace and one for the license mangling.

The license mangling is quite ugly but I'm not sure if there's a better 
solution...

Ross


