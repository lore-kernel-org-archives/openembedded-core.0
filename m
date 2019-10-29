Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B82977FA8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 12:30:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 05:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="399769732"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2019 05:30:14 -0700
To: openembedded-core@lists.openembedded.org
References: <f6132fd4-18d0-aba5-96d5-c259928a113d@mailbox.org>
	<15b9c8e2-4ccc-1564-af19-fe60f049cf2e@intel.com>
	<b0c45158-fad5-d6fe-c772-d7f853d0587d@mailbox.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1592d873-29e7-acdd-4fd3-1d22f6dd4fff@intel.com>
Date: Tue, 29 Oct 2019 12:30:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b0c45158-fad5-d6fe-c772-d7f853d0587d@mailbox.org>
Subject: Re: GStreamer 1.0 meson build transition
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
X-List-Received-Date: Tue, 29 Oct 2019 12:30:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 28/10/2019 23:01, Carlos Rafael Giani wrote:
> Hm, true. Alright, I'll do that. For discussions about the recipe 
> changes, should I create a fork of oe-core and place them there, just 
> like how one would prepare merge requests? To me, it sounds more 
> efficient than posting the patches in the mailing list for discussing them.

You can create a fork to ease merging, but review happens by patches 
sent to this list.

> And speaking of upgrades, my changes are against 1.16.1, so the 1.16.0 
> -> 1.16.1 upgrade needs to make it into master-next in first.

Queued in ross/mut already.

Ross

