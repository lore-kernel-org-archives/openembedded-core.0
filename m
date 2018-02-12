Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD396093C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 14:26:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 06:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17822735"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 06:26:02 -0800
To: openembedded-core@lists.openembedded.org, John <maxin.john@intel.com>,
	Maxin <maxin.john@intel.com>
References: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
	<1518444986-25886-3-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3c2e005c-2a1b-5656-4794-54ce2c34109a@linux.intel.com>
Date: Mon, 12 Feb 2018 16:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518444986-25886-3-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH 3/4] fontconfig: fix upstream version check
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
X-List-Received-Date: Mon, 12 Feb 2018 14:26:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/12/2018 04:16 PM, Maxin B. John wrote:
> In the case of fontconfig, version x.x.9x are release candidates
> for next version.
> +UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.[^9]\d*).tar.gz"

This will incorrectly exclude x.x.9 which is not a release candidate. 
You need to exclude "9 followed by one or more digits", not just 9 alone.

Also, "." in .tar.gz means "any character", if you want to match literal 
"." it should be "\."

This is a good place to practice:
http://regex101.com


Alex

