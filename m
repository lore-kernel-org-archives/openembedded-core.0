Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 34F1360119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 13:50:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 06:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,338,1498546800"; d="scan'208";a="887434886"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2017 06:50:57 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
	<41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
	<1502110800.18633.220.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d6c76558-21f5-c41d-9f47-2677644e4087@linux.intel.com>
Date: Mon, 7 Aug 2017 16:47:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502110800.18633.220.camel@linuxfoundation.org>
Subject: Re: Meson support in oe-core
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
X-List-Received-Date: Mon, 07 Aug 2017 13:50:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/07/2017 04:00 PM, Richard Purdie wrote:

> Thanks for looking at this. Whilst some project still have some support
> for both, could we get timings of do_{configure|compile|install} for
> autotools vs. meson?

So far there's just one recipe that I can test, json-glib, which is 
fairly small, and so there's not a lot of difference between 
compile+install steps. configure however is vastly faster:

autotools with gtk-doc

configure 16.53
compile 12.56
install 1.94
total 31.03

meson with gtk-doc

configure 2.04
compile 4.87
install 9.16
total 16.07

autotools without gtk-doc
configure 16.26
compile 5.49
install 1.59
total 23.34

meson without gtk-doc
configure 1.95
compile 5.04
install 2.26
total 9.25


Alex

