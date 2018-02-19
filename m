Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 34B456093A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 09:23:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 01:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="202161990"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 19 Feb 2018 01:23:40 -0800
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4cd35773-feed-d8ee-b34c-02a1662cc1dc@linux.intel.com>
Date: Mon, 19 Feb 2018 11:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH 00/27] replace freedesktop.org pkg-config with pkgconf
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
X-List-Received-Date: Mon, 19 Feb 2018 09:23:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/19/2018 10:36 AM, Maxin B. John wrote:
> Reasons behind this patch set:
> 
> 1. pkgconf is actively maintained
> 2. pkgconf has better cross-compiling support (According to the author of
> pkgconf, it was created as he got tired of patching .pc files to add ${pc_sysrootdir})
> 3. oe-core can drop a number of work-around patches that deals with pkg-config

Thanks! I too was getting tired of all those workaround patches.

pkg-config is still better than the too clever by half discovery macros 
of autoconf :)

Alex

