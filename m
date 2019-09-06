Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 71F267CE22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 09:03:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Sep 2019 02:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; d="scan'208";a="267303272"
Received: from fwan32-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.38.244])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2019 02:03:15 -0700
To: Mikko.Rapeli@bmw.de
References: <20190905230706.31765-1-ross.burton@intel.com>
	<20190906080244.GQ3040@hiutale>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <08bbe1da-daa8-cd05-b684-befb79353dbb@intel.com>
Date: Fri, 6 Sep 2019 10:03:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906080244.GQ3040@hiutale>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: ensure reproducible builds by clearly exposing the time epoch support
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
X-List-Received-Date: Fri, 06 Sep 2019 09:03:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/09/2019 09:02, Mikko.Rapeli@bmw.de wrote:
> Could this be enabled automatically when local.conf has INHERIT += "reproducible_build" ?

The default behaviour is to respect that if enabled, otherwise use the 
upstream default of the build time.  If the recipe followed the 
reproducble_build inherit then if a user wants reproducible builds but 
doesn't want the epoch then they won't be able to disable it (after all, 
an epoch of 0 is reproducible).

Ross

