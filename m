Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB877827F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 09:31:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 27 Oct 2017 02:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="168328777"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Oct 2017 02:31:26 -0700
To: Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-core@lists.openembedded.org
References: <1509069613-5005-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <55404668-8486-9529-34d1-96fdfd4fba16@linux.intel.com>
Date: Fri, 27 Oct 2017 12:31:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1509069613-5005-1-git-send-email-fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH] curl: update to 7.56.1
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
X-List-Received-Date: Fri, 27 Oct 2017 09:31:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/27/2017 05:00 AM, Fan Xin wrote:
> 3. Delete the do_install_append() due to the curl/curlbuild.h have been removed.
> -do_install_append() {
> -	oe_multilib_header curl/curlbuild.h
> -}
> -

In this case you should investigate further, and summarize your findings 
in the commit message. Why did the upstream remove the header? Did they 
replace it with something else? Most importantly, does the replacement 
need processing or patching too?

The answers are all here:
https://github.com/curl/curl/commit/73a2fcea0b4adea6ba342cd7ed1149782c214ae3

Alex

