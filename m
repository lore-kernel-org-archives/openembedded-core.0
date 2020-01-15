Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6732D7F98F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 16:30:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jan 2020 08:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="256830890"
Received: from jmmarti7-mobl1.amr.corp.intel.com (HELO rburton-mac01.local)
	([10.252.51.74])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2020 08:30:49 -0800
To: openembedded-core@lists.openembedded.org, Saloni.Jain@kpit.com
References: <1579103247-31173-1-git-send-email-Saloni.Jain@kpit.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5b486535-37df-28d0-76fd-34c325c8e8db@intel.com>
Date: Wed, 15 Jan 2020 16:30:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579103247-31173-1-git-send-email-Saloni.Jain@kpit.com>
Subject: Re: [poky][master][PATCH] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Wed, 15 Jan 2020 16:30:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/01/2020 15:47, Saloni Jain wrote:
> From: Sana Kazi <Sana.Kazi@kpit.com>
> 
> Added patch for CVE-2019-12900 as backport from upstream.
> Fixes out of bound access discovered while fuzzying karchive.
> 
> Tested by: Sana.Kazi@kpit.com
> 
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>

Need a S-o-b in the patch itself alongside a CVE tag, but also why not a 
backport for Warrior and Thud?

Ross


