Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EF6B97DD6C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:01:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 06:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="212931495"
Received: from kdobros-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.194])
	by fmsmga008.fm.intel.com with ESMTP; 18 Dec 2019 06:01:09 -0800
To: openembedded-core@lists.openembedded.org
References: <20191218001609.3750899-1-alejandro.delcastillo@ni.com>
	<20191218003219.2273.58863@do>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <669c8a0d-8d50-1162-97c1-04022275276b@intel.com>
Date: Wed, 18 Dec 2019 14:01:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218003219.2273.58863@do>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wa2cgJiBvcGtnLXV0aWxzIHVwZGF0ZSB0byAwLjQuMg==?=
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
X-List-Received-Date: Wed, 18 Dec 2019 14:01:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/12/2019 00:32, Patchwork wrote:
> == Series Details ==
> 
> Series: opkg & opkg-utils update to 0.4.2
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/21659/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at 23d38b2ad6)

This was due to the patches being CRLF and the patch being LF.  Worked 
around locally.

Ross

