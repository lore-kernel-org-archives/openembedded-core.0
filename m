Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B5A867E66A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:53:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2019 12:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,549,1559545200"; d="scan'208";a="189764161"
Received: from arokiasx-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.54.158])
	by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2019 12:53:19 -0700
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190924140118.6651-1-Trevor.Gamblin@windriver.com>
	<0807ede6-ed1e-2068-6004-22fd947a51ef@intel.com>
	<bc706caa-9fd8-faf9-b0a4-26d3f4d1fbf9@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <2a9d99ed-8a58-7784-1ab8-183cf30ef8e7@intel.com>
Date: Wed, 25 Sep 2019 20:53:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bc706caa-9fd8-faf9-b0a4-26d3f4d1fbf9@windriver.com>
Subject: Re: [PATCH] nativesdk-dnf: ensure installed systemd files are shipped
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
X-List-Received-Date: Wed, 25 Sep 2019 19:53:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 25/09/2019 20:17, Trevor Gamblin wrote:
> On 9/24/19 12:15 PM, Ross Burton wrote:
> 
>> On 24/09/2019 15:01, Trevor Gamblin wrote:
>>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>
>>> "bitbake nativesdk-dnf" throws a QA warning if the contents of
>>> ${base_libdir}/systemd/system/ are not shipped, so add them.
>>
>> Looks like a bug in systemd.bbclass, not this recipe.  For example if 
>> I enable nativesdk for acpid:
> 
> Can you clarify what you meant? Did you mean that the class should be 
> doing the cleanup of the systemd service files?

If the intention is that unit files don't get installed/managed/etc in 
nativesdk, then yes the class should be removing them.

Ross

